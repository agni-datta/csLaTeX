#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACKAGE_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
CHECK_ROOT="$(mktemp -d /private/tmp/cslatex-parity.XXXXXX)"
trap 'rm -rf "$CHECK_ROOT"' EXIT

CSAM="$PACKAGE_ROOT/csamsmath/csamsmath.sty"
CSBK="$PACKAGE_ROOT/csbook/csbook.sty"
CSAM_README="$PACKAGE_ROOT/csamsmath/README.md"
CSBK_README="$PACKAGE_ROOT/csbook/README.md"

sed -n '/^% Fonts$/,/^% Graphics, tables, and captions$/p' "$CSAM" | sed 's/csam/cscore/g' >"$CHECK_ROOT/csamsmath-fonts.txt"
sed -n '/^% Fonts$/,/^% Graphics, tables, and captions$/p' "$CSBK" | sed 's/csbk/cscore/g' >"$CHECK_ROOT/csbook-fonts.txt"
diff -u "$CHECK_ROOT/csamsmath-fonts.txt" "$CHECK_ROOT/csbook-fonts.txt"

rg -o '\\ifcsam@(baskervaldx|concrete|garamond|gfsdidot|kpfonts|latinmodern|libertine|palatino)' "$CSAM" | sed 's/csam/cscore/g' >"$CHECK_ROOT/csamsmath-branches.txt"
rg -o '\\ifcsbk@(baskervaldx|concrete|garamond|gfsdidot|kpfonts|latinmodern|libertine|palatino)' "$CSBK" | sed 's/csbk/cscore/g' >"$CHECK_ROOT/csbook-branches.txt"
diff -u "$CHECK_ROOT/csamsmath-branches.txt" "$CHECK_ROOT/csbook-branches.txt"

sed -n '/^### Font Options/,/^### Mode Options/p' "$CSAM_README" >"$CHECK_ROOT/csamsmath-font-docs.txt"
sed -n '/^### Font Options/,/^### Mode Options/p' "$CSBK_README" >"$CHECK_ROOT/csbook-font-docs.txt"
diff -u "$CHECK_ROOT/csamsmath-font-docs.txt" "$CHECK_ROOT/csbook-font-docs.txt"

font_options=(baskervaldx concrete garamond gfsdidot kpfonts latinmodern libertine palatino)
for package_file in "$CSAM" "$CSBK"; do
	for font_option in "${font_options[@]}"; do
		if ! rg -q "^[[:space:]]*${font_option}[[:space:]]+\\.code:n" "$package_file"; then
			printf 'Missing font option %s in %s.\n' "$font_option" "$package_file" >&2
			exit 1
		fi
	done
done

if rg -ni '(erewhon|erowhon|erewon|fourier)' "$CSAM" "$CSBK" "$CSAM_README" "$CSBK_README"; then
	printf 'Removed font names remain in the core packages.\n' >&2
	exit 1
fi

if rg -n -P '\\(?:New|Renew|Provide)Document(?:Command|Environment)\{\\[^}]*@[^}]*\}' "$CSAM" "$CSBK"; then
	printf 'An internal command containing @ uses a document-command definition.\n' >&2
	exit 1
fi

for package_file in "$CSAM" "$CSBK"; do
	if [[ "$(rg -c -F '\RequirePackage{amssymb}' "$package_file")" -ne 1 ]]; then
		printf 'amssymb must occur only in the conditional helper in %s.\n' "$package_file" >&2
		exit 1
	fi
done

while IFS= read -r font_file; do
	if ! kpsewhich "$font_file" >/dev/null; then
		printf 'TeX cannot resolve font file %s.\n' "$font_file" >&2
		exit 1
	fi
done < <(rg -o --no-filename '[A-Za-z0-9][A-Za-z0-9_-]*\.(otf|ttf)' "$CSAM" "$CSBK" | sort -u)

printf 'csamsmath and csbook font and internal-command parity passed.\n'
