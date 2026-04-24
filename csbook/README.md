# csbook

A robust macro framework for compiling complex textbooks, manuscripts, and reports, featuring specialized styling for large tables of contents, chapter/part headers, and reference management.

## Features

- **Redefined Sectioning**: Custom typography for `\part`, `\chapter`, `\section`, and `\paragraph`.
- **Dual Output Modes**: Seamless switching between collaborative `draft` and production `final` modes.
- **Reference Tracking**: Integrated `bxpdfver` compliance and broken reference detection on page margins.
- **High-End Typography**: Built-in support for multiple premium font families.

## Installation & Usage

### Loading the Package

```latex
\usepackage[options]{csbook}
```

### Basic Example

```latex
\documentclass{book}
\usepackage[concrete, draft]{csbook}

\begin{document}
\chapter{Introduction}
\section{Motivation}
...
\end{document}
```

## Package Options

### Fonts
- `latinmodern`, `libertine`, `gfsdidot`, `concrete`, `palatino`, `kpfonts`, `baskervaldx`, `garamond`.

### Rendering Mode
- `draft`: Shows todos, fixmes, and margin annotations for collaborative work.
- `final`: (Default) Suppresses all collaborative annotations for final production.

## API Reference

### Title Formatting
- `\parhead{text}`: Punctuated inline paragraph heading.
- Redefines standard LaTeX headers (`\part`, `\chapter`, etc.) using `titlesec`.

### Reference Tracking
- Patches `\@setref` to catch and display undefined citations in the margins.

## Conflicts & Requirements

- **Structural Class**: Must be used with document classes that support `\chapter` (e.g., `book`, `report`).
- **tocloft**: Strongly overwrites `\tableofcontents` logic; avoid external TOC overrides.
- **tcolorbox/mdframed**: Uses `mdframed` internally; use `most` compatibility for nested `tcolorbox` layouts.

## License

Everything in this repository is distributed under the **LaTeX Project Public License v1.3c**.
