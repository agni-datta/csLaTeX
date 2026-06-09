#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACKAGE_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
DEFAULT_REPOSITORIES_ROOT="$(cd "$PACKAGE_ROOT/../../.." && pwd)"

MODE="dry-run"
REPOSITORIES_ROOT="$DEFAULT_REPOSITORIES_ROOT"

usage() {
	printf '%s\n' \
		'Usage: bash scripts/sync-core-styles.sh [--dry-run | --apply] [--root PATH]' \
		'' \
		'Updates every existing vendored style whose basename matches a canonical csLaTeX package.' \
		'The canonical csLaTeX sources are never overwritten. The default mode is dry-run.'
}

while [[ $# -gt 0 ]]; do
	case "$1" in
		--dry-run)
			MODE="dry-run"
			shift
			;;
		--apply)
			MODE="apply"
			shift
			;;
		--root)
			if [[ $# -lt 2 ]]; then
				printf 'Missing path after --root.\n' >&2
				exit 2
			fi
			REPOSITORIES_ROOT="$2"
			shift 2
			;;
		-h|--help)
			usage
			exit 0
			;;
		*)
			printf 'Unknown argument %s.\n' "$1" >&2
			usage >&2
			exit 2
			;;
	esac
done

if [[ ! -d "$REPOSITORIES_ROOT" ]]; then
	printf 'Repositories root does not exist at %s.\n' "$REPOSITORIES_ROOT" >&2
	exit 1
fi
REPOSITORIES_ROOT="$(cd "$REPOSITORIES_ROOT" && pwd)"

CHECK_ROOT="$(mktemp -d /private/tmp/cslatex-sync.XXXXXX)"
trap 'rm -rf "$CHECK_ROOT"' EXIT
SOURCE_MANIFEST="$CHECK_ROOT/sources.txt"
TARGET_MANIFEST="$CHECK_ROOT/targets.txt"

while IFS= read -r relative_source; do
	[[ -n "$relative_source" ]] || continue
	source_file="$PACKAGE_ROOT/$relative_source"
	printf '%s\t%s\n' "$(basename "$source_file")" "$source_file" >>"$SOURCE_MANIFEST"
done < <(
	cd "$PACKAGE_ROOT"
	rg --files -g '*.sty' | sort
)

if [[ ! -s "$SOURCE_MANIFEST" ]]; then
	printf 'No canonical csLaTeX styles were found beneath %s.\n' "$PACKAGE_ROOT" >&2
	exit 1
fi
duplicate_names="$(cut -f1 "$SOURCE_MANIFEST" | sort | uniq -d)"
if [[ -n "$duplicate_names" ]]; then
	printf 'Canonical style basenames must be unique. Duplicates follow.\n%s\n' "$duplicate_names" >&2
	exit 1
fi

(
	cd "$REPOSITORIES_ROOT"
	rg --files -g '*.sty' | sort >"$TARGET_MANIFEST"
)

canonical=0
total=0
current=0
changed=0

canonical="$(wc -l <"$SOURCE_MANIFEST" | tr -d ' ')"

while IFS= read -r relative_target; do
	[[ -n "$relative_target" ]] || continue
	target="$REPOSITORIES_ROOT/$relative_target"
	style_name="$(basename "$target")"
	source_file="$(awk -F '\t' -v style_name="$style_name" '$1 == style_name { print $2 }' "$SOURCE_MANIFEST")"
	[[ -n "$source_file" ]] || continue

	if [[ "$target" == "$source_file" ]]; then
		continue
	fi
	if [[ -L "$target" ]]; then
		printf 'Refusing to overwrite symbolic link %s.\n' "$relative_target" >&2
		exit 1
	fi

	((total += 1))
	if cmp -s "$source_file" "$target"; then
		printf 'current      %s\n' "$relative_target"
		((current += 1))
		continue
	fi

	if [[ "$MODE" == "dry-run" ]]; then
		printf 'would update %s\n' "$relative_target"
	else
		cp "$source_file" "$target"
		if ! cmp -s "$source_file" "$target"; then
			printf 'Verification failed after updating %s.\n' "$relative_target" >&2
			exit 1
		fi
		printf 'updated      %s\n' "$relative_target"
	fi
	((changed += 1))
done <"$TARGET_MANIFEST"

printf '\nMode %s. Found %d canonical packages; checked %d vendored styles; %d current; %d %s.\n' \
	"$MODE" "$canonical" "$total" "$current" "$changed" \
	"$([[ "$MODE" == "dry-run" ]] && printf 'would change' || printf 'updated')"
while IFS=$'\t' read -r style_name source_file; do
	printf '%-24s %s\n' "$style_name" "$(shasum -a 256 "$source_file" | awk '{print $1}')"
done <"$SOURCE_MANIFEST"
