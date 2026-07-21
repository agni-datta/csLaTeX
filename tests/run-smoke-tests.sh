#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACKAGE_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
BUILD_ROOT="$(mktemp -d /private/tmp/cslatex-smoke.XXXXXX)"
trap 'rm -rf "$BUILD_ROOT"' EXIT

export TEXINPUTS="$PACKAGE_ROOT//:${TEXINPUTS:-}"
export TEXMFVAR="$BUILD_ROOT/texmf-var"
export TEXMFCONFIG="$BUILD_ROOT/texmf-config"
export TEXMFHOME="$BUILD_ROOT/texmf-home"
mkdir -p "$TEXMFVAR" "$TEXMFCONFIG" "$TEXMFHOME"

run_smoke() {
	local engine="$1"
	local source="$2"
	local name
	name="$(basename "$source" .tex)"
	mkdir -p "$BUILD_ROOT/$engine-$name"
	(
		cd "$BUILD_ROOT/$engine-$name"
		if ! "$engine" -halt-on-error -interaction=nonstopmode "$SCRIPT_DIR/$source" >smoke.log 2>&1; then
			printf 'Smoke test failed for %s with %s.\n' "$source" "$engine" >&2
			tail -80 smoke.log >&2
			exit 1
		fi
		if ! "$engine" -halt-on-error -interaction=nonstopmode "$SCRIPT_DIR/$source" >>smoke.log 2>&1; then
			printf 'Second smoke-test pass failed for %s with %s.\n' "$source" "$engine" >&2
			tail -80 smoke.log >&2
			exit 1
		fi
	)
	printf 'passed %-10s %s\n' "$engine" "$source"
}

lua_documents=(
	smoke-codelines.tex
	smoke-csamsmath.tex
	smoke-csbook.tex
	smoke-csdeferproofs.tex
	smoke-csextras.tex
	smoke-cslecture.tex
	smoke-csletter.tex
	smoke-cspresentation.tex
	smoke-csresume.tex
	smoke-csthm.tex
	smoke-cstufte.tex
	smoke-cswhitepaper.tex
	smoke-eudoxus.tex
	smoke-llncscrypto.tex
	smoke-tcscrypto.tex
)

pdf_documents=(
	smoke-codelines.tex
	smoke-csamsmath.tex
	smoke-csdeferproofs.tex
	smoke-csextras.tex
	smoke-csthm.tex
	smoke-tcscrypto.tex
)

for source in "${lua_documents[@]}"; do
	run_smoke lualatex "$source"
done

for source in "${pdf_documents[@]}"; do
	run_smoke pdflatex "$source"
done

printf 'All csLaTeX smoke tests passed.\n'
