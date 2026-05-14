---
title: README
aliases: README
linter-yaml-title-alias: README
date created: Thursday, May 14th 2026, 10:21:58 pm
date modified: Thursday, May 14th 2026, 10:24:27 pm
---

<!-- @format -->

## cslecture

Lecture-notes skeleton over the `article` class, tuned for high-density information with condensed typography and mathematical environments.

### Usage

```latex
\usepackage{cslecture}
```

```latex
\documentclass[12pt]{article}
\usepackage{cslecture}

\course{Computer Systems}
\lecturer{Dr. Agni Datta}

\begin{document}
\maketitle
\section{Pipelining}
\parhead{Hazard} A situation that prevents the next instruction from executing.
\end{document}
```

### Features

- Condensed spacing to eliminate gaps in long-form notes.
- `thmtools` theorem environments with ruled styles.
- Inline concept headings via `\parhead` and `\subparhead`.
- `nestedbar` environment for nested logical blocks or sub-lemmas.

### API

#### Metadata

- `\course{text}`—course name for the title block.
- `\lecturer{text}`—lecturer name for the title block.
- `\maketitle`—generates a custom boxed lecture header.

#### Sectioning

- `\parhead{text}`—bold inline heading with automated punctuation.
- `\subparhead{text}`—small-caps inline heading with automated punctuation.
- `nestedbar`—environment using vertical bars to demarcate nested content.

#### Theorem environments

`theorem`, `lemma`, `definition`, `remark`, `example`, and the standard suite.

### Conflicts

- Designed for the `article` document class.
- Redefining `\maketitle` externally breaks the integrated header.

### License

LaTeX Project Public License v1.3c.
