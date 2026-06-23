---
title: README
aliases: README
linter-yaml-title-alias: README
date created: Thursday, May 14th 2026, 10:22:47 pm
date modified: Tuesday, June 23rd 2026, 8:36:44 pm
---

<!-- @format -->

## cstufte

Tufte-style layout package with wide margins, side-notes, lattice cryptography macros, and premium box styles. Redesigns the page geometry so that roughly one-third of the page width becomes a margin column used for citations, side-notes, and danger markers. Particularly suited to research monographs, expository notes, and course materials where you want marginal commentary alongside a dense main text. Includes a large library of lattice cryptography and TCS notation macros that are available whether or not you use the Tufte layout.

### Requirements

- Works with the `article` class. The margin geometry is not designed for `book` or `beamer`.
- Side-citations require a Biber-compatible bibliography setup (`biblatex` with `backend=biber`).
- The `nicefonts` option requires the Baskervaldx and Biolinum font packages.
- Do not load any package that overrides `geometry` after `cstufte`: the margin layout will break.
- Loads `babel` without language options. Choose document languages through the class options or load `babel` explicitly before `cstufte`.

### Usage

```latex
\usepackage[options]{cstufte}
```

### Minimal example

```latex
\documentclass{article}
\usepackage[nicefonts, colorful, latticenotation]{cstufte}

\begin{document}
\section{Lattice Problems}

The shortest vector problem\cite{Ajtai96} is believed to be hard.
\mpar{For a survey, see the margin note here.}

Let $\Lambda \subset \RR^n$ be a lattice with basis $\basis{B}$.
We want to find $\SVP(\Lambda)$.
\end{document}
```

### Options

#### Visual styling

- `colorful`: enables a blue/steel color palette for box titles, rules, and section headings. Without this option, everything renders in black and white.
- `framecolor`: manual override for the frame color of ruled boxes. Accepts any `xcolor` color name. Overrides the palette set by `colorful`.
- `backcolor`: manual override for the background color of tinted boxes.
- `rulerwidth`: width of the vertical left-bar decorations. Default: `2pt`. Pass a dimension, e.g. `rulerwidth=3pt`.

#### Feature flags (boolean options)

- `nicefonts`: loads Baskervaldx for body text and Biolinum for sans-serif headings. Without this option, Latin Modern is used.
- `mathoperators`: declares a set of TCS-related math operators (`\poly`, `\negl`, `\PPT`, etc.) as `\DeclareMathOperator` commands.
- `latticenotation`: loads the full lattice cryptography notation library (see API below).
- `draft`: enables broken-reference markers in the margins. Undefined `\ref` and `\cite` targets produce a marginal warning rather than silently printing “??”.

### API

#### Marginalia

- `\cite[offset][post]{key}`: full citation rendered in the side margin at the current baseline, optionally shifted by `offset` (a vertical dimension like `2ex`) and followed by `post` text. This replaces the standard `\cite` command. The bibliography entry appears in the margin; no footnote or in-text number is produced.
- `\mpar{text}`: margin paragraph in ragged-right small type. Use for editorial side-notes, clarifications, or cross-references that would interrupt the main text flow.
- `\danger`: places an Euler tombstone “danger bend” symbol in the margin at the current line. Use to flag a subtle point, a common mistake, or a non-obvious step that readers should slow down for.

#### Paired delimiters (via `mathtools`)

All delimiters auto-size with `\left`/`\right` semantics:

- `\abs{x}`: absolute value $|x|$.
- `\norm{x}`: norm $\|x\|$.
- `\ip{x, y}`: inner product $\langle x, y \rangle$.
- `\set{x}`: set braces $\{x\}$.
- `\ceil{x}`, `\floor{x}`: ceiling and floor.

#### Lattice cryptography notation (`latticenotation` option)

**Lattice objects:**

- `\Lattice`: lattice symbol $\Lambda$.
- `\DualLattice`: dual lattice $\Lambda^*$.
- `\basis{B}`: basis matrix, rendered in bold: $\mathbf{B}$.
- `\GS{B}`: Gram-Schmidt orthogonalization $\widetilde{B}$.

**Hard problems:**

- `\SVP`, `\CVP`, `\SIVP`, `\BDD`, `\GapSVP`: standard lattice problem abbreviations, each rendered as a small-caps math operator.

**Cryptographic assumptions:**

- `\LWE`, `\RLWE`, `\SIS`, `\RSIS`: Learning With Errors and Short Integer Solution variants.

**Distributions and sampling:**

- `\DLambda`: discrete Gaussian distribution $D_\Lambda$ over a lattice.
- `\Dzs`: discrete Gaussian $D_{\ZZ^n, s}$ over the integer lattice.

#### Proof environments

`proofsketch`, `proofidea`, and `proofofclaim` are available as unnumbered proof-style environments alongside the theorem suite. `proofofclaim` accepts an optional claim identifier, rendered as “Proof of Claim (id)”.

`\setqedsymbol{symbol}` changes the proof-end symbol. `\SetQEDSymbol{symbol}` is kept as a compatibility alias.

### Caveats

- The Tufte margin layout is set via `geometry` with fixed parameters. Any subsequent call to `\geometry{…}` or loading of a geometry package with different parameters will destroy the margin column. If you need to adjust margins, pass the change through `cstufte`‘s own options or patch the package.
- Side-citations via `\cite` produce output only in the margin: there is no in-text number. If you also want in-text citation numbers, use `\footcite` from `biblatex` for those entries.
- The `nicefonts` option requires both `baskervaldx` and `biolinum` packages to be installed. If either is missing, the package will error at font loading time.
- `\danger` uses a fixed-width margin box. If used inside a theorem environment or a box environment that has its own margin handling, the symbol may overflow or misalign. Place it at the outermost level of the text body when possible.

### License

LaTeX Project Public License v1.3c.

### Author

Agni Datta: [agni-datta/csLaTeX](https://github.com/agni-datta/csLaTeX)
