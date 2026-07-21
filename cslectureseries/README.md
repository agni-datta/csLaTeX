---
title: "cslectureseries"
aliases: "cslectureseries"
linter-yaml-title-alias: "cslectureseries"
date created: Thursday, May 14th 2026, 10:22:05 pm
date modified: 2026-07-21
---

<!-- @format -->

# cslectureseries

A `book`-based class for lecture series with boxed chapter headings, indexing, and draft or final modes.

## Requirements

- Loads `babel` without language options. Choose document languages through the class options or load `babel` explicitly before `cslectureseries`.

## Usage

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

## Options

### Fonts

- `kpf`: (Default) KP Fonts.
- `bsk`: Baskervaldx with math integration.

### Mode

- `draft`: (Default) enables broken reference markers and collaborative annotations.
- `final`: suppresses all annotations and markers.

## API

### Metadata

- `\coursetitle{text}`: title for the cover and headers.
- `\maketitle`: full-page formal title cover.

### Theorem Environments

`theorem`, `lemma`, `proposition`, `definition`, `remark`, `example`, and the standard suite. Includes `solution` for exercise answers and `proofsketch`, `proofidea`, and `proofofclaim` for unnumbered proof variants.

`\setqedsymbol{symbol}` changes the proof-end symbol. `\SetQEDSymbol{symbol}` is kept as a compatibility alias.

### Revision tools (draft mode)

- `\todo{text}`, `\fixme{text}`, `\added{text}`, `\changed{text}`.
- `\newguymarker{cmd}{label}{color}`: define custom markers.

## Conflicts

- Loads `book` internally; do not pass another base class.
- LuaLaTeX recommended for best font results.

## License

LaTeX Project Public License v1.3c.
