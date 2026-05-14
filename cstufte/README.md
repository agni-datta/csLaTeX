---
title: README
aliases: README
linter-yaml-title-alias: README
date created: Thursday, May 14th 2026, 10:22:47 pm
date modified: Thursday, May 14th 2026, 10:24:28 pm
---

<!-- @format -->

## cstufte

Tufte-style layout package with wide margins, side-notes, lattice cryptography macros, and premium box styles.

### Usage

```latex
\usepackage[options]{cstufte}
```

```latex
\documentclass{article}
\usepackage[nicefonts, colorful]{cstufte}

\begin{document}
\section{Introduction}
This is a claim\cite{Agni2026}.
\mpar{This note appears in the margin.}
\end{document}
```

### Options

#### Styling

- `colorful`—Blue/Steel palette for boxes and titles.
- `framecolor`, `backcolor`—manual color overrides.
- `rulerwidth`—width of vertical bars (default: `2pt`).

#### Features (booleans)

- `nicefonts`—loads Baskervaldx and Biolinum.
- `mathoperators`—TCS-related math operators.
- `latticenotation`—lattice cryptography symbols.
- `draft`—broken reference markers in the margins.

### API

#### Marginalia

- `\cite[offset][post]{key}`—full citation in the side margin.
- `\mpar{text}`—ragged footnote-style margin paragraph.
- `\danger`—“danger” bend marker in the margin.

#### Math & symbols

- `\Lattice`, `\DualLattice`, `\basis`, `\SVP`, `\CVP`, `\LWE`, `\SIS`—lattice cryptography symbols.
- `\abs{}`, `\norm{}`, `\ip{,}`, `\set{}`—paired delimiters via `mathtools`.

### Conflicts

- Heavily modifies margins; do not let other packages override the `geometry` layout.
- Side-citations require a Biber-compatible bibliography setup.

### License

LaTeX Project Public License v1.3c.
