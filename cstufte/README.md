# cstufte

A structural LaTeX package mimicking the Tufte aesthetic, optimized for clarity, side-notes, and elegant marginalia in academic and technical documents.

## Features

- **Tufte Aesthetic**: Focus on wide margins, side-notes, and a high-ratio of white space.
- **Lattice Notation Suite**: Specialized mathematical macros for lattice-based cryptography and complexity theory.
- **Integrated Sidebar Assets**: Commands for margin notes, side-citations, and danger markers.
- **Premium Box Styles**: Elegant tcolorbox implementations for theorems and remarks.

## Installation & Usage

### Loading the Package

```latex
\usepackage[options]{cstufte}
```

### Basic Example

```latex
\documentclass{article}
\usepackage[nicefonts, colorful]{cstufte}

\begin{document}
\section{Introduction}
This is a claim\cite{Agni2026}.
\mpar{This note appears in the margin.}
\end{document}
```

## Package Options

### Styling
- `colorful`: (Boolean) Enables a Blue/Steel color palette for boxes and titles.
- `framecolor`, `backcolor`: Manual color overrides.
- `rulerwidth`: Width of the elegant vertical bars (Default: `2pt`).

### Features (Booleans)
- `nicefonts`: Loads Baskervaldx and Biolinum.
- `mathoperators`: Loads a massive suite of TCS-related math operators.
- `latticenotation`: Loads standard symbols for lattice cryptography ($\Lattice, \Z, \R$, etc.).
- `draft`: Enables broken reference markers in the margins.

## API Reference

### Marginalia
- `\cite[offset][post]{key}`: Places a full citation in the side margin.
- `\mpar{text}`: Ragged-aligned footnote-style margin paragraph.
- `\danger`: Places a "danger" bend marker in the margin.

### Math & Symbols
- `\Lattice`, `\DualLattice`, `\basis`, `\SVP`, `\CVP`, `\LWE`, `\SIS`: Common lattice cryptography symbols.
- `\abs{}`, `\norm{}`, `\ip{,}`, `\set{}`: Paired delimiters using `mathtools`.

## Conflicts & Requirements

- **Geometry**: This package heavily modifies margins; ensure no other packages override the `geometry` layout.
- **biblatex**: Side-citations require a Biber-compatible bibliography setup.

## License

Everything in this repository is distributed under the **LaTeX Project Public License v1.3c**.
