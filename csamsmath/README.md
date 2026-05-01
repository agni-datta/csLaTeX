---
title: README
aliases: README
linter-yaml-title-alias: README
date created: Sunday, April 12th 2026, 9:33:57 pm
date modified: Friday, May 1st 2026, 11:23:02 pm
---

## csamsmath

A professional LaTeX package providing a mathematical backbone for STEM publications, specifically designed for layout geometry, typesetting properties, cross-referencing, and logic proofs.

### Features

- **Automated Theorem Numbering**: Per-section sibling counters for over 50 environment types.
- **Integrated Font Logic**: Multi-engine support (pdfTeX, LuaTeX, XeTeX) with automatic font fallbacks.
- **Collaborative Annotations**: Integrated margin notes and revision tracking for draft versions.
- **Theorem-Environment Suite**: Built on `thmtools` with consistent academic styling.

### Installation & Usage

#### Loading the Package

```latex
\usepackage[options]{csamsmath}
```

#### Basic Example

```latex
\documentclass{report}
\usepackage[palatino, draft]{csamsmath}

\begin{document}
\begin{theorem}
    Mathematical content goes here.
\end{theorem}
\end{document}
```

### Package Options

#### Font Options

- `latinmodern`: (Default) Modern Computer Modern configuration.
- `libertine`: Stronger rendering weight for visual readability.
- `gfsdidot`: GFS classical variants.
- `concrete`: Knuth Concrete rendering suitable for notes.
- `palatino`: High-quality TeX Gyre Pagella integration.
- `baskervaldx`: Professional Baskervaldx font integration.
- `kpfonts`: Enforces LuaLaTeX; triggers fallback warning on pdfLaTeX.

#### Mode Toggles

- `draft`: Enables collaborative margin notes and annotation rendering.
- `final`: (Default) Suppresses all annotations for publication drops.

### API Reference

#### Theorem-like Environments (Numbered)

- `theorem`, `lemma`, `corollary`, `proposition`, `conjecture`, `fact`, `claim`.

#### Definition & Remark Environments

- `definition`, `notation`, `protocol`, `problem`, `construction`.
- `remark`, `note`, `example`, `observation`, `openproblem`.

#### Annotation Commands (Draft Mode Only)

- `\todo{text}`, `\query{text}`, `\missing{text}`, `\notes{text}`.
- `\newguymarker{cmd}{label}{color}`: Define custom user markers.

### Conflicts & Requirements

- **amsthm**: Avoid loading `amsthm` manually before this package to prevent `thmtools` styling crashes.
- **Engine Rules**: Optimized for LuaLaTeX; pdfLaTeX is supported with fallback font configurations.

### License

Everything in this repository is distributed under the **LaTeX Project Public License v1.3c**.
