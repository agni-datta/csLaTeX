---
title: README
aliases: README
linter-yaml-title-alias: README
date created: Thursday, May 14th 2026, 10:22:38 pm
date modified: Thursday, May 14th 2026, 10:24:27 pm
---

<!-- @format -->

## csthm

Theorem environment suite for TCS with three design modes, dynamic accent colors, and full `cleveref` integration.

### Usage

```latex
\usepackage[options]{csthm}
```

```latex
\documentclass{article}
\usepackage{hyperref}   % load before csthm
\usepackage[fancy]{csthm}

\begin{document}
\begin{theorem}[Agni's Theorem]
    $P \neq NP$
\end{theorem}
\end{document}
```

### Options

- `normal`—ruled headers with standard serif body.
- `fancy`—colorful left-bar designs with background tints.
- `oldschool`—classic LaTeX formatting with small-caps headers.

### API

#### Configuration

- `\SetAccentColor{color}`—global color for theorem markers and fancy bars.
- `\emailid{address}`—formatted clickable email.

#### Theorem-like environments

`theorem`, `lemma`, `proposition`, `claim`, `conjecture`, `fact`, and more.

#### Definition-like environments

`definition`, `protocol`, `problem`, `application`, and more.

#### Remark-like environments

`remark`, `note`, `example`, `exercise`, `notationabuse`.

#### Highlight-like environments

`guideline`, `important`, `insight`, `warning`.

#### Specialized blocks

- `case`—list environment for proof cases.
- `proof`—reimplemented with consistent QED markers.

### Conflicts

- Load `hyperref` **before** `csthm` for `cleveref` capitalization and links.
- Do not load `thmtools` with conflicting options.

### License

LaTeX Project Public License v1.3c.
