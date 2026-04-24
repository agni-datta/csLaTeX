# cswhitepaper

A modern LaTeX style package designed for technical whitepapers, research reports, and collaborative academic drafting, featuring a premium ruled aesthetic and integrated annotation tools.

## Features

- **Collaborative Annotation**: Built-in system for `\todo`, `\fixme`, and marker-based comments.
- **Customizable Accent Colors**: Global color control via `\documentaccentcolor`.
- **Semantic Sectioning**: Custom `\parhead` and `\subparhead` commands for inline headings.
- **Premium Ruled Theorems**: Unified theorem and definition styling using elegant horizontal rules.

## Installation & Usage

### Loading the Package

```latex
\usepackage[options]{cswhitepaper}
```

### Basic Example

```latex
\documentclass{article}
\usepackage[draft]{cswhitepaper}
\documentaccentcolor{NavyBlue}

\begin{document}
\section{Abstract}
This is a new technical result.
\todo{Check citations here.}
\parhead{Methodology} We follow a standard approach.
\end{document}
```

## Package Options

### Mode Toggles
- `draft`: (Default) Enables collaborative annotations, revision highlights (`\added`, `\changed`), and margin markers.
- `final`: Suppresses all annotations and revision tracking for production output.

## API Reference

### Configuration
- `\documentaccentcolor{color}`: Sets the primary accent color for rules and headers.

### Annotation Commands (Draft Mode)
- `\todo{text}`, `\fixme{text}`, `\notes{text}`, `\query{text}`, `\missing{text}`.
- `\added{text}`, `\changed{text}`, `\removed{text}`: Revision tracking highlights.
- `\newguymarker{cmd}{label}{color}`: Define custom participant markers.

### Sectioning
- `\parhead{text}`: Bold inline heading with automated punctuation.
- `\subparhead{text}`: Small-caps inline heading with automated punctuation.

## Conflicts & Requirements

- **amsthm**: Avoid loading `amsthm` manually before this package to prevent `thmtools` styling conflicts.
- **Document Class**: Optimized for `article` and `report` classes.

## License

Everything in this repository is distributed under the **LaTeX Project Public License v1.3c**.
