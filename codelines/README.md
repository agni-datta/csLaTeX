---
title: README
aliases: README
linter-yaml-title-alias: README
date created: Monday, May 11th 2026, 8:15:00 pm
date modified: Monday, May 11th 2026, 2:47:52 pm
---

<!-- @format -->

## codelines

A professional LaTeX package providing an algorithmic listing environment with automated line numbering, specifically designed for pseudo-code, step-by-step procedures, and technical documentation.

### Features

- **Nested Listings**: Support for up to 10 levels of nested algorithmic steps with automatic indentation adjustment.
- **Automated Line Numbering**: Continuous line numbering across multiple environments or manually resettable.
- **Customizable Formatting**: Easy adjustment of line number style, digit count, and prefixes.
- **Advanced Layouts**: Integrated support for boxed content and specialized alignment (right/center) within lines.

### Installation & Usage

#### Loading the Package

```latex
\usepackage{codelines}
```

#### Basic Example

```latex
\begin{codelines}
    \item Initialize variables $x \gets 0, y \gets 1$.
    \item For each element $e$ in $S$:
    \begin{codelines}
        \item Compute $f(e)$.
        \item If $f(e) > x$, then set $x \gets f(e)$.
    \end{codelines}
    \item Return the result $x$.
\end{codelines}
```

### API Reference

#### Environments

- `codelines`: The primary environment for listings. Supports an optional argument to set the starting line number (defaults to the current counter value).

#### Line Number Management

- `\codelinessetlinenr{n}`: Manually set the next line number to $n$.
- `\codelinesresetlinenr`: Reset the line counter to 0.

#### Layout & Alignment

- `\codelinesbox{width}{content}`: Places content in a top-aligned parbox of specified width, useful for multi-line logic or annotations within a single numbered line.
- `\codelinesrightalign{text}`: Aligns text to the right of the current line.
- `\codelinescenteralign{text}`: Centers text within the available space of the line.
- `\codelinesplus` / `\codelinesminus`: Incrementally adjust the indentation level for the current list depth.

#### Customization Hooks

- `\codelineslinenrformat`: Redefine this to change the font/color of line numbers (Default: `\normalfont\footnotesize\ttfamily\color{black!50}`).
- `\codelineslinenrdigits`: Redefine this to change the expected number of digits for padding (Default: `2`).
- `\codelinesrefprefix`: Prefix added to cross-references of line numbers (Default: empty).

### License

Everything in this repository is distributed under the **LaTeX Project Public License v1.3c**.
