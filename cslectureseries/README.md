# cslectureseries

A robust document class for academic lecture notes and course series, built upon the standard `book` class with a focus on structured typography and integrated reference management.

## Features

- **Boxed Chapter Headers**: Distinctive framed chapter titles for high visibility.
- **Integrated Indexing**: Automatic indexing of emphasized terms via a patched `\emph` command.
- **Reference Tracking**: Margin markers for broken or undefined references in draft mode.
- **Solution Environments**: Specialized environments for exercise solutions.

## Installation & Usage

### Loading the Class

```latex
\documentclass[options]{cslectureseries}
```

### Basic Example

```latex
\documentclass[kpf, draft]{cslectureseries}

\coursetitle{Introduction to Algorithms}
\author{Agni Datta}

\begin{document}
\maketitle
\chapter{Asymptotic Analysis}
\section{Big-O Notation}
...
\end{document}
```

## Package Options

### Fonts
- `kpf`: (Default) Uses KP-Fonts.
- `bsk`: Uses Baskervaldx with professional math integration.

### Mode Toggles
- `draft`: (Default) Enables broken reference markers and collaborative annotations.
- `final`: Suppresses all annotations and reference markers for production.

## API Reference

### Metadata & Frontmatter
- `\coursetitle{text}`: Sets the title for the cover and headers.
- `\maketitle`: Generates a full-page formal title cover.

### Theorem Environments
Standard suites included: `theorem`, `lemma`, `proposition`, `definition`, `remark`, `example`, etc.
Specialized: `solution` environment for exercise answers.

### Revision Tools (Draft Mode)
- `\todo{text}`, `\fixme{text}`, `\added{text}`, `\changed{text}`, etc.
- `\newguymarker{cmd}{label}{color}`: Define custom markers.

## Conflicts & Requirements

- **book**: This class loads the standard `book` class internally.
- **Engine**: Best used with engines supporting modern font features (LuaLaTeX recommended for best font results).

## License

Everything in this repository is distributed under the **LaTeX Project Public License v1.3c**.
