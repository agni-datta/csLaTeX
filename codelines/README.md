---
title: README
aliases: README
linter-yaml-title-alias: README
date created: Thursday, May 14th 2026, 10:21:30 pm
date modified: Thursday, May 14th 2026, 10:24:27 pm
---

<!-- @format -->

## codelines

Algorithmic listing environment with automated line numbering for pseudo-code and step-by-step procedures.

### Usage

```latex
\usepackage{codelines}
```

```latex
\begin{codelines}
    \item Initialize $x \gets 0, y \gets 1$.
    \item For each $e \in S$:
    \begin{codelines}
        \item Compute $f(e)$.
        \item If $f(e) > x$, set $x \gets f(e)$.
    \end{codelines}
    \item Return $x$.
\end{codelines}
```

### Features

- Up to 10 levels of nesting with automatic indentation.
- Continuous line numbering across environments; manually resettable.
- Adjustable line number style, digit count, and prefix.
- Boxed content and right/center alignment within lines.

### API

#### Environment

- `codelines`: Primary listing environment. Optional argument sets the starting line number.

#### Line number management

- `\codelinessetlinenr{n}`—set next line number to $n$.
- `\codelinesresetlinenr`—reset counter to 0.

#### Layout

- `\codelinesbox{width}{content}`—top-aligned parbox for multi-line annotations on a single numbered line.
- `\codelinesrightalign{text}`—right-align text within the line.
- `\codelinescenteralign{text}`—center text within the line.
- `\codelinesplus` / `\codelinesminus`—adjust indentation level incrementally.

#### Customization hooks

- `\codelineslinenrformat`—font/color of line numbers (default: `\normalfont\footnotesize\ttfamily\color{black!50}`).
- `\codelineslinenrdigits`—digit count for padding (default: `2`).
- `\codelinesrefprefix`—prefix for cross-references (default: empty).

### License

LaTeX Project Public License v1.3c.
