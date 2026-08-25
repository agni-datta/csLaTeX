---
title: README
aliases: [README, 'README, "csbook"']
linter-yaml-title-alias: README
date created: Thursday, May 14th 2026, 10:21:45 pm
date modified: Tuesday, August 25th 2026, 6:44:56 pm
---

<!-- @format -->

## csbook

A framework for `book` and `report` documents that configures fonts, sectioning, draft annotations, and reference diagnostics. It can stand alone or supply the document layer beneath `csamsmath`.

### Requirements

- Requires a document class that supports `\chapter`: use `book` or `report`. Loading with `article` will cause `titlesec` chapter formatting to fail.
- Do not load `amsthm` manually. The actual `amsthm.sty` package conflicts with `ntheorem`; `csbook` loads `ntheorem` with its `amsthm` compatibility option.
- Loads `babel` without language options. Choose document languages through the class options or load `babel` explicitly before `csbook`.

### Usage

```latex
\usepackage[options]{csbook}
```

### Minimal Example

```latex
\documentclass{book}
\usepackage[libertine, draft]{csbook}

\begin{document}
\chapter{Introduction}
\section{Motivation}
Here is a broken reference: \cref{thm:doesnotexist}.
\end{document}
```

In `draft` mode the broken reference prints “??” in the text and a margin note indicating the undefined label. In `final` mode it prints “??” silently, as standard LaTeX does.

### Options

#### Font Options (Mutually Exclusive)

Pass exactly one font option, or omit it to use Latin Modern. LuaLaTeX supports every option listed below. pdfLaTeX supports only `latinmodern`, `baskervaldx`, `libertine`, and `palatino`; any other selection produces a package warning and falls back to Latin Modern.

- `latinmodern`: (default) Latin Modern, the standard Computer Modern successor. Reliable cross-platform rendering.
- `libertine`: LuaLaTeX uses Libertinus text with a Pagella Math base and matching Libertinus letterforms; pdfLaTeX uses Libertine with `newtxmath`.
- `gfsdidot`: GFS Didot. LuaLaTeX loads the four OpenType faces directly and uses KP Math as the mathematical foundation.
- `concrete`: CMU Concrete text with Euler Math, loaded directly from the OpenType files. Suitable for lecture notes and informal documents.
- `baskervaldx`: LuaLaTeX uses Baskervaldx with KP Math; pdfLaTeX uses Baskervaldx with `newtxmath`.
- `kpfonts`: KP Fonts OpenType.
- `garamond`: Garamond Libre with Garamond Math under LuaLaTeX.
- `palatino`: LuaLaTeX loads TeX Gyre Pagella X and TeX Gyre Pagella Math directly from their OpenType files; pdfLaTeX loads `mathpazo[sc]`, scaled Type 1 Biolinum, and scaled Inconsolata.

#### Mode Options

- `draft`: shows todos, fixmes, and margin annotations. Broken `\ref` and `\cite` targets are flagged in the margin.
- `final`: (default) suppresses all annotations and margin markers.

#### Engine and Mathematics Policy

- Every LuaLaTeX branch except `kpfonts` loads explicit OTF or TTF files. The `kpfonts` branch uses `kpfonts-otf` as its native loader.
- Every branch requests lining, tabular figures. Inconsolata supplies monospaced text and the explicit `\mathtt` alphabet in branches that use the shared mono helper; Latin Modern and Concrete retain their matching mono families. Biolinum supplies `\mathsf` in the non-Latin-Modern pdfLaTeX branches.
- The pdfLaTeX Latin Modern branch loads `amssymb` and `mathtools`. Baskervaldx and Libertine load `mathtools` after their math packages.
- The pdfLaTeX Palatino branch loads `mathpazo[sc,noBBpl]`, scaled Type 1 Biolinum, and scaled Inconsolata; it declares the STIX/BBOLDX/Dutch math alphabets directly and explicitly assigns Biolinum to `\mathsf` and Inconsolata to `\mathtt`.
- `bm` loads after the complete pdfLaTeX math configuration. LuaLaTeX relies on `unicode-math` bold alphabets.

### API

#### Paragraph Headings

- `\parhead{text}`: bold inline heading. Appends a period automatically unless `text` already ends with punctuation. Use in place of `\paragraph`.
- `\subparhead{text}`: small-caps inline heading with the same punctuation handling.

When `csamsmath` is also loaded, its `\docufont` keys `parhead`/`parheadfont` and `subparhead`/`subparheadfont` update these two heading fonts. Omitted keys retain their package defaults.

#### Sectioning

`csbook` redefines `\part`, `\chapter`, `\section`, `\subsection`, `\subsubsection` via `titlesec` to apply consistent typographic spacing and font choices. Do not redefine these after loading the package.

#### Broken-reference tracking (draft mode)

`csbook` patches `\@setref` so that any `\ref`, `\cref`, or `\cite` that resolves to an undefined label prints a margin note naming the missing label. This is strictly a visual aid during writing: it has no effect on the compiled output in `final` mode.

#### Proof Environments

`proofsketch`, `proofidea`, and `proofofclaim` are available as unnumbered proof-style environments when the theorem layer is active. `proofofclaim` accepts an optional claim identifier, rendered as “Proof of Claim (id)”. Use `csamsmath` alongside `csbook` for the full theorem and mathematics API.

`\setqedsymbol{symbol}` changes the proof-end symbol, and `\settheoremendsymbol{symbol}` changes theorem-end markers where those markers are used. The capitalized forms remain available as compatibility aliases.

The package contains its own `ntheorem` load and TeX Live 2026 end-mark correction, using the `amsmath`, `amsthm`, `hyperref`, and `thmmarks` options. The `amsthm` option supplies AMS-compatible styles and proofs without loading the conflicting `amsthm.sty` package. `mdframed` retains the ruled book design around the theorem families.

#### Table of contents

`\tableofcontents` is patched for consistent formatting. Avoid overriding it with external TOC packages after loading `csbook`.

### Compatibility and Conflicts

- Requires `book` or `report` class. Will silently misformat or error on `article` because `titlesec` chapter definitions reference `\chapter`.
- Uses `mdframed` internally for certain framed environments. If you also use `tcolorbox`, load it with the `most` library for compatibility: `\usepackage[most]{tcolorbox}`.
- Do not load `amsthm.sty` or `thmtools` with this package.
- Do not redefine `\tableofcontents` externally: the patched version handles `csbook`‘s own formatting.
- Font options must match between `csbook` and `csamsmath` if both packages are loaded. A mismatch raises a package error before either package can mix incompatible mathematics fonts.
- In the documented order, `csbook` followed by `csamsmath`, `csbook` defines the shared theorem environments and `csamsmath` reuses them. This order retains the ruled book style, and `\docufont` updates the shared theorem-family fonts.
- Under pdfLaTeX, only `latinmodern`, `baskervaldx`, `libertine`, and `palatino` are supported. The LuaLaTeX-only font options warn and fall back to Latin Modern rather than approximating the requested family with a different collection of Type 1 packages.

### Implementation Policy

Package-private commands whose names contain `@` use classic `\def`, `\newcommand`, `\renewcommand`, or `\providecommand` definitions. The document-command layer is reserved for public interfaces. Run `bash tests/check-cs-core-parity.sh` before deployment to verify this rule together with font parity.

### License

LaTeX Project Public License v1.3c.

### Author

Agni Datta: [agni-datta/csLaTeX](https://github.com/agni-datta/csLaTeX)
