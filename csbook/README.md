---
title: README
aliases: README, 'README, "csbook"'
linter-yaml-title-alias: README
date created: Thursday, May 14th 2026, 10:21:45 pm
date modified: Tuesday, August 18th 2026, 10:56:17 am
---

<!-- @format -->

## csbook

A framework for `book` and `report` documents that configures fonts, sectioning, draft annotations, and reference diagnostics. It can stand alone or supply the document layer beneath `csamsmath`.

### Requirements

- Requires a document class that supports `\chapter`: use `book` or `report`. Loading with `article` will cause `titlesec` chapter formatting to fail.
- Do not load `amsthm` before this package.
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
- `palatino`: LuaLaTeX loads TeX Gyre Pagella X and TeX Gyre Pagella Math directly from their OpenType files; pdfLaTeX uses the integrated `newpx` text-and-math package with tabular lining figures.

#### Mode Options

- `draft`: shows todos, fixmes, and margin annotations. Broken `\ref` and `\cite` targets are flagged in the margin.
- `final`: (default) suppresses all annotations and margin markers.

#### Engine and Mathematics Policy

- Every LuaLaTeX branch except `kpfonts` loads explicit OTF or TTF files. The `kpfonts` branch uses `kpfonts-otf` as its native loader.
- Every branch requests lining, tabular figures. The monospaced figure feature is expressed as `Monospaced` in OpenType configuration.
- The pdfLaTeX Latin Modern branch loads `amssymb` and `mathtools`. Baskervaldx and Libertine load `mathtools` after their math packages.
- The pdfLaTeX Palatino branch loads the integrated `newpx` package with `theoremfont,trueslanted,largesc,tighter,t,lf,amsthm,vvarbb`; it does not load `amssymb` or `mathtools`.
- `bm` loads after the complete pdfLaTeX math configuration. LuaLaTeX relies on `unicode-math` bold alphabets.

### API

#### Paragraph Headings

- `\parhead{text}`: bold inline heading. Appends a period automatically unless `text` already ends with punctuation. Use in place of `\paragraph`.

#### Sectioning

`csbook` redefines `\part`, `\chapter`, `\section`, `\subsection`, `\subsubsection` via `titlesec` to apply consistent typographic spacing and font choices. Do not redefine these after loading the package.

#### Broken-reference tracking (draft mode)

`csbook` patches `\@setref` so that any `\ref`, `\cref`, or `\cite` that resolves to an undefined label prints a margin note naming the missing label. This is strictly a visual aid during writing: it has no effect on the compiled output in `final` mode.

#### Proof Environments

`proofsketch`, `proofidea`, and `proofofclaim` are available as unnumbered proof-style environments when the theorem layer is active. `proofofclaim` accepts an optional claim identifier, rendered as “Proof of Claim (id)”. Use `csamsmath` alongside `csbook` for the full theorem and mathematics API.

`\setqedsymbol{symbol}` changes the proof-end symbol, and `\settheoremendsymbol{symbol}` changes theorem-end markers where those markers are used. The capitalized forms remain available as compatibility aliases.

#### Table of contents

`\tableofcontents` is patched for consistent formatting. Avoid overriding it with external TOC packages after loading `csbook`.

### Compatibility and Conflicts

- Requires `book` or `report` class. Will silently misformat or error on `article` because `titlesec` chapter definitions reference `\chapter`.
- Uses `mdframed` internally for certain framed environments. If you also use `tcolorbox`, load it with the `most` library for compatibility: `\usepackage[most]{tcolorbox}`.
- Do not redefine `\tableofcontents` externally: the patched version handles `csbook`‘s own formatting.
- Font options must match between `csbook` and `csamsmath` if both packages are loaded. A mismatch raises a package error before either package can mix incompatible mathematics fonts.
- Under pdfLaTeX, only `latinmodern`, `baskervaldx`, `libertine`, and `palatino` are supported. The LuaLaTeX-only font options warn and fall back to Latin Modern rather than approximating the requested family with a different collection of Type 1 packages.

### Implementation Policy

Package-private commands whose names contain `@` use classic `\def`, `\newcommand`, `\renewcommand`, or `\providecommand` definitions. The document-command layer is reserved for public interfaces. Run `bash tests/check-cs-core-parity.sh` before deployment to verify this rule together with font parity.

### License

LaTeX Project Public License v1.3c.

### Author

Agni Datta: [agni-datta/csLaTeX](https://github.com/agni-datta/csLaTeX)
