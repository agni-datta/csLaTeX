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

sed -n '/^% Fonts$/,/^% Graphics, tables, and captions$/p' "$CSAM" | sed -E 's/csam/cscore/g; s/^[[:space:]]+//' >"$CHECK_ROOT/csamsmath-fonts.txt"
sed -n '/^% Fonts$/,/^% Graphics, tables, and captions$/p' "$CSBK" | sed -E 's/csbk/cscore/g; s/^[[:space:]]+//' >"$CHECK_ROOT/csbook-fonts.txt"
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
	if rg -q -F '\RequirePackage{thmtools}' "$package_file"; then
		printf 'thmtools must not be loaded by %s.\n' "$package_file" >&2
		exit 1
	fi
	if ! rg -q -F '\RequirePackage[amsmath,amsthm,hyperref,thmmarks]{ntheorem}' "$package_file"; then
		printf 'The self-contained ntheorem backend is missing from %s.\n' "$package_file" >&2
		exit 1
	fi
	if ! rg -q -F '\RequirePackage[sc,noBBpl]{mathpazo}' "$package_file"; then
		printf 'The pdfLaTeX Palatino branch must load mathpazo with small caps and without its blackboard alphabet in %s.\n' "$package_file" >&2
		exit 1
	fi
	if ! rg -q -F '\RequirePackage[type1,scaled=1.085]{biolinum}' "$package_file"; then
		printf 'The pdfLaTeX Palatino branch must load Biolinum in %s.\n' "$package_file" >&2
		exit 1
	fi
	if ! rg -q -F '\SetMathAlphabet{\mathsf}{normal}{T1}{LinuxBiolinumT-TLF}{m}{n}' "$package_file"; then
		printf 'The pdfLaTeX sans-serif math alphabet must use Biolinum in %s.\n' "$package_file" >&2
		exit 1
	fi
	if ! rg -q -F '\RequirePackage[scaled=1.03]{inconsolata}' "$package_file"; then
		printf 'The pdfLaTeX font branch must load Inconsolata in %s.\n' "$package_file" >&2
		exit 1
	fi
	if ! rg -q -F '\SetMathAlphabet{\mathtt}{normal}{T1}{zi4}{m}{n}' "$package_file"; then
		printf 'The pdfLaTeX monospaced math alphabet must use Inconsolata in %s.\n' "$package_file" >&2
		exit 1
	fi
	if ! rg -q -F '\let\openbox\relax' "$package_file"; then
		printf 'The self-contained theorem backend must release openbox in %s.\n' "$package_file" >&2
		exit 1
	fi
	if ! rg -q -F 'cslatex@ntheoremendmarkpatched' "$package_file"; then
		printf 'The self-contained theorem backend must retain the TeX Live 2026 end-mark correction in %s.\n' "$package_file" >&2
		exit 1
	fi
done

if rg -n -F '\RequirePackage{thmtools}' "$PACKAGE_ROOT" -g '*.sty' -g '*.cls'; then
	printf 'A package or class still has a direct thmtools dependency.\n' >&2
	exit 1
fi

ntheorem_files=(
	"$PACKAGE_ROOT/csamsmath/csamsmath.sty"
	"$PACKAGE_ROOT/csbook/csbook.sty"
	"$PACKAGE_ROOT/cslecture/cslecture.sty"
	"$PACKAGE_ROOT/cslectureseries/cslectureseries.cls"
	"$PACKAGE_ROOT/csthm/csthm.sty"
	"$PACKAGE_ROOT/cstufte/cstufte.sty"
	"$PACKAGE_ROOT/cswhitepaper/cswhitepaper.sty"
)
for package_file in "${ntheorem_files[@]}"; do
	if ! rg -q -F '\RequirePackage[amsmath,amsthm,hyperref,thmmarks]{ntheorem}' "$package_file"; then
		printf 'The self-contained ntheorem loader is missing from %s.\n' "$package_file" >&2
		exit 1
	fi
	if ! rg -q -F 'cslatex@ntheoremendmarkpatched' "$package_file"; then
		printf 'The TeX Live 2026 ntheorem correction is missing from %s.\n' "$package_file" >&2
		exit 1
	fi
done

if ! rg -q -F '\RequirePackage{amsthm}' "$PACKAGE_ROOT/eudoxus/eudoxus.sty"; then
	printf 'eudoxus must use plain amsthm.\n' >&2
	exit 1
fi
if [[ "$(rg -l -F '\RequirePackage{amsthm}' "$PACKAGE_ROOT" -g '*.sty' -g '*.cls' | wc -l | tr -d ' ')" -ne 1 ]]; then
	printf 'Only eudoxus may load plain amsthm.\n' >&2
	exit 1
fi
if rg -q -F '\RequirePackage[amsmath,amsthm,hyperref,thmmarks]{ntheorem}' "$PACKAGE_ROOT/eudoxus/eudoxus.sty"; then
	printf 'eudoxus must not load ntheorem.\n' >&2
	exit 1
fi
if rg -n -e '\\declaretheorem' -e '\\declaretheoremstyle' "$PACKAGE_ROOT" -g '*.sty' -g '*.cls'; then
	printf 'A package or class still uses the thmtools declaration API.\n' >&2
	exit 1
fi
if rg -n -e 'AnonymousPro' -e 'Anonymous Pro' "$PACKAGE_ROOT" -g '*.sty' -g '*.cls' -g '*.tex' -g '*.md'; then
	printf 'An Anonymous Pro font reference remains in the repository.\n' >&2
	exit 1
fi
if rg -n -F 'csntheorem' "$PACKAGE_ROOT" -g '*.sty' -g '*.cls' -g '*.tex' -g '*.md'; then
	printf 'The removed csntheorem helper is still referenced.\n' >&2
	exit 1
fi

for package_file in "$CSAM" "$CSBK" "$PACKAGE_ROOT/eudoxus/eudoxus.sty"; do
	if ! rg -q -F '\RequirePackage{dirtytalk}' "$package_file"; then
		printf 'dirtytalk is missing from %s.\n' "$package_file" >&2
		exit 1
	fi
done
if ! rg -q -F '\RequirePackage[sc,noBBpl]{mathpazo}' "$PACKAGE_ROOT/eudoxus/eudoxus.sty"; then
	printf 'eudoxus must use mathpazo small caps without its blackboard alphabet.\n' >&2
	exit 1
fi
if rg -q -e '\\RequirePackage.*\{ntheorem\}' -e '\\RequirePackage.*\{thmtools\}' "$PACKAGE_ROOT/llncscrypto/llncscrypto.sty"; then
	printf 'llncscrypto must leave theorem ownership to the Springer class.\n' >&2
	exit 1
fi

while IFS= read -r font_file; do
	if ! kpsewhich "$font_file" >/dev/null; then
		printf 'TeX cannot resolve font file %s.\n' "$font_file" >&2
		exit 1
	fi
done < <(rg -o --no-filename '[A-Za-z0-9][A-Za-z0-9_-]*\.(otf|ttf)' "$CSAM" "$CSBK" | sort -u)

printf 'csamsmath and csbook font and internal-command parity passed.\n'
