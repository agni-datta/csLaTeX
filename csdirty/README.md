# csdirty

A comprehensive, modern academic framework that serves as a centralized preamble for LaTeX documents, managing fonts, mathematical environments, and document utilities in a single package.

## Features

- **Centralized Management**: Loads all necessary fonts and packages without scattering definitions.
- **Multi-Engine Optimization**: Optimized for LuaTeX with robust fallbacks for pdfTeX.
- **Feature Modularization**: Toggle specific suites (TikZ, Theorems, Crypto) via package options.
- **Revision Tracking**: Integrated API for collaborative drafting and annotations.

## Installation & Usage

### Loading the Package

```latex
\usepackage[options]{csdirty}
```

### Basic Example

```latex
\documentclass{article}
\usepackage[libertinus, draft, all]{csdirty}

\begin{document}
\section{Preliminaries}
\todo{Verify this section.}
...
\end{document}
```

## Package Options

### Font Families
- `lmodern` / `latinmodern` (Default), `libertinus`, `concrete`, `garamond` (LuaTeX only), `gfsdidot`, `palatino`.

### Feature Toggles
- `all`: (Default) Enables virtually all available capabilities.
- `comments`: Toggles the annotation API for revision tracking.
- `theorems`: Integrated theorem suites from `csthm`.
- `tikz`: Loads PGF/TikZ with common libraries pre-configured.
- `crypto`: Loads the `tcscrypto` package.
- `orcidlink`: Enables the `\orcidlink` command.
- `nomath`: Disables all mathematical fonts and amsthm features globally.

## API Reference

### Annotation Commands (Draft Mode)
- `\todo{text}`, `\fixme{text}`, `\added{text}`, `\changed{text}`, `\removed{text}`, `\missing{text}`.
- `\newcomment{name}{color}{cmd}`: Define custom inline comments.

### Layout Utilities
- `\fullref{label}`: Integrated hyperref + nameref combination.
- `\generateDedications{text}`: Centered dedication page for books/reports.

## Conflicts & Requirements

- **Engine Requirements**: Garamond and other OpenType features require LuaLaTeX.
- **Document Class**: Tested with `article`, `report`, and `book`.

## License

Everything in this repository is distributed under the **LaTeX Project Public License v1.3c**.
