---
title: README
aliases: README
linter-yaml-title-alias: README
date created: Thursday, May 14th 2026, 10:22:05 pm
date modified: Tuesday, May 19th 2026, 1:35:34 am
---

<!-- @format -->

## cslectureseries

Document class for academic lecture series, built on `book` with boxed chapter headers, automatic indexing, and draft/final annotation modes.

### Usage

```latex
\documentclass[options]{cslectureseries}
```

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

### Options

#### Fonts

- `kpf`: (Default) KP Fonts.
- `bsk`: Baskervaldx with math integration.

#### Mode

- `draft`: (Default) enables broken reference markers and collaborative annotations.
- `final`: suppresses all annotations and markers.

### API

#### Metadata

- `\coursetitle{text}`: title for the cover and headers.
- `\maketitle`: full-page formal title cover.

#### Theorem environments

`theorem`, `lemma`, `proposition`, `definition`, `remark`, `example`, and the standard suite. Includes `solution` for exercise answers.

#### Revision tools (draft mode)

- `\todo{text}`, `\fixme{text}`, `\added{text}`, `\changed{text}`.
- `\newguymarker{cmd}{label}{color}`: define custom markers.

### Conflicts

- Loads `book` internally; do not pass another base class.
- LuaLaTeX recommended for best font results.

### License

LaTeX Project Public License v1.3c.
