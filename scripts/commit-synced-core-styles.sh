#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACKAGE_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
DEFAULT_REPOSITORIES_ROOT="$(cd "$PACKAGE_ROOT/../../.." && pwd)"
DEFAULT_MESSAGE='feat: add sanshdr option, improve font handling for LuaLaTeX, and refactor math package loading logic'

MODE="dry-run"
REPOSITORIES_ROOT="$DEFAULT_REPOSITORIES_ROOT"
COMMIT_MESSAGE="$DEFAULT_MESSAGE"

usage() {
	printf '%s\n' \
		'Usage: bash scripts/commit-synced-core-styles.sh [--dry-run | --apply] [--root PATH] [--message TEXT]' \
		'' \
		'Commits only changed styles whose basenames match canonical csLaTeX packages.' \
		'The default mode is dry-run. No remote operation is performed.'
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
		--message)
			if [[ $# -lt 2 ]]; then
				printf 'Missing text after --message.\n' >&2
				exit 2
			fi
			COMMIT_MESSAGE="$2"
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

CHECK_ROOT="$(mktemp -d /private/tmp/cslatex-commit.XXXXXX)"
trap 'rm -rf "$CHECK_ROOT"' EXIT
STYLE_MANIFEST="$CHECK_ROOT/styles.txt"
SOURCE_MANIFEST="$CHECK_ROOT/sources.txt"
REPOSITORY_MANIFEST="$CHECK_ROOT/repositories.txt"
MAPPING_MANIFEST="$CHECK_ROOT/mapping.txt"

while IFS= read -r relative_source; do
	[[ -n "$relative_source" ]] || continue
	printf '%s\t%s\n' "$(basename "$relative_source")" "$PACKAGE_ROOT/$relative_source" >>"$SOURCE_MANIFEST"
done < <(
	cd "$PACKAGE_ROOT"
	rg --files -g '*.sty' | sort
)
duplicate_names="$(cut -f1 "$SOURCE_MANIFEST" | sort | uniq -d)"
if [[ -n "$duplicate_names" ]]; then
	printf 'Canonical style basenames must be unique. Duplicates follow.\n%s\n' "$duplicate_names" >&2
	exit 1
fi

(
	cd "$REPOSITORIES_ROOT"
	rg --files -g '*.sty' | sort >"$CHECK_ROOT/all-styles.txt"
)

while IFS= read -r relative_style; do
	[[ -n "$relative_style" ]] || continue
	style_name="$(basename "$relative_style")"
	if ! awk -F '\t' -v style_name="$style_name" '$1 == style_name { found = 1 } END { exit !found }' "$SOURCE_MANIFEST"; then
		continue
	fi
	printf '%s\n' "$relative_style" >>"$STYLE_MANIFEST"
done <"$CHECK_ROOT/all-styles.txt"

while IFS= read -r relative_style; do
	[[ -n "$relative_style" ]] || continue
	absolute_style="$REPOSITORIES_ROOT/$relative_style"
	style_directory="$(dirname "$absolute_style")"
	if ! repository="$(git -C "$style_directory" rev-parse --show-toplevel 2>/dev/null)"; then
		printf 'No Git repository contains %s.\n' "$relative_style" >&2
		exit 1
	fi
	printf '%s\t%s\n' "$repository" "$absolute_style" >>"$MAPPING_MANIFEST"
	printf '%s\n' "$repository" >>"$REPOSITORY_MANIFEST"
done <"$STYLE_MANIFEST"
sort -u "$REPOSITORY_MANIFEST" -o "$REPOSITORY_MANIFEST"

checked=0
pending=0
committed=0

while IFS= read -r repository; do
	[[ -n "$repository" ]] || continue
	((checked += 1))
	style_paths=()
	while IFS= read -r absolute_style; do
		style_paths+=("${absolute_style#"$repository"/}")
	done < <(awk -F '\t' -v repository="$repository" '$1 == repository { print $2 }' "$MAPPING_MANIFEST")

	style_status="$(git -C "$repository" status --short -- "${style_paths[@]}")"
	if [[ -z "$style_status" ]]; then
		continue
	fi
	((pending += 1))
	printf '%s\n' "$repository"
	printf '%s\n' "$style_status" | sed 's/^/  /'

	if [[ "$MODE" == "dry-run" ]]; then
		continue
	fi

	git_directory="$(git -C "$repository" rev-parse --git-dir)"
	if [[ "$git_directory" != /* ]]; then
		git_directory="$repository/$git_directory"
	fi
	if [[ -f "$git_directory/MERGE_HEAD" || -f "$git_directory/CHERRY_PICK_HEAD" || -d "$git_directory/rebase-merge" || -d "$git_directory/rebase-apply" ]]; then
		printf 'Refusing to commit during an active Git operation in %s.\n' "$repository" >&2
		exit 1
	fi

	git -C "$repository" add -- "${style_paths[@]}"
	if git -C "$repository" diff --cached --quiet -- "${style_paths[@]}"; then
		printf 'No staged style changes remain in %s.\n' "$repository" >&2
		exit 1
	fi
	git -C "$repository" commit --only --no-gpg-sign -m "$COMMIT_MESSAGE" -- "${style_paths[@]}"
	if [[ -n "$(git -C "$repository" status --short -- "${style_paths[@]}")" ]]; then
		printf 'Style files remain uncommitted in %s.\n' "$repository" >&2
		exit 1
	fi
	printf '  committed %s\n' "$(git -C "$repository" rev-parse --short HEAD)"
	((committed += 1))
done <"$REPOSITORY_MANIFEST"

printf '\nMode %s. Checked %d repositories; %d had style changes; %d committed.\n' "$MODE" "$checked" "$pending" "$committed"
