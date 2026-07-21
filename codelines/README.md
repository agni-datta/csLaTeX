---
title: "codelines"
aliases: "codelines"
linter-yaml-title-alias: "codelines"
date created: Thursday, May 14th 2026, 10:21:30 pm
date modified: 2026-07-21
---

<!-- @format -->

# codelines

A lightweight environment for line-numbered pseudocode and procedures. Nested `codelines` lists provide automatic indentation without floats, captions, or a separate keyword language.

## Requirements

No external dependencies beyond a standard TeX distribution. Internally uses `enumitem` for list geometry and `pgffor` for iteration internals.

## Usage

```latex
\usepackage{codelines}
```

## Basic Example

```latex
\begin{codelines}
    \item Initialize $x \gets 0$, $y \gets 1$.
    \item For each $e \in S$:
    \begin{codelines}
        \item Compute $f(e)$.
        \item If $f(e) > x$, set $x \gets f(e)$.
    \end{codelines}
    \item Return $x$.
\end{codelines}
```

Line numbers appear in the left margin. Nesting produces an extra indentation level per depth, up to 10 levels. The counter is continuous across multiple `codelines` environments in the same document by default, so a second algorithm block picks up where the first left off unless you reset manually.

## Starting Line Number

The environment accepts one optional argument: the starting line number for that block.

```latex
\begin{codelines}[5]
    \item This line is labeled 05.
    \item This line is labeled 06.
\end{codelines}
```

Line labels are zero-padded by default, so the first lines display as `00`, `01`, `02`, and so on.

## API

### Environment

- `codelines`: primary listing environment. Optional argument `[n]` sets the starting line number.

### Line number management

- `\codelinessetlinenr{n}`: set the next line label to $n$. Equivalent to using the optional argument but can be called outside the environment, e.g. between two blocks. The printed label is still zero-padded, so `\codelinessetlinenr{1}` displays `01`.
- `\codelinesresetlinenr`: reset the counter to 0. Use at the start of a new algorithm if you want numbering to restart at `00`.

### Layout within a line

- `\codelinesbox{width}{content}`: wraps `content` in a top-aligned `\parbox` of the given width. Use when a single numbered line contains multi-line content that must align with the line number rather than reflow freely. Useful for structured side-by-side annotations.
- `\codelinesrightalign{text}`: right-aligns `text` within the current line. The canonical use is running-time annotations such as `\codelinesrightalign{// $O(n)$}`.
- `\codelinescenteralign{text}`: centers `text` within the current line.
- `\codelinesplus`: increase indentation by one level without opening a nested `codelines` environment. Use when you want to visually indent a continuation without incrementing the nesting counter.
- `\codelinesminus`: decrease indentation by one level.

### Customization hooks

These are commands you redefine globally with `\renewcommand` to change appearance across the entire document:

- `\codelineslinenrformat`: font and color of line numbers. Default: `\normalfont\footnotesize\ttfamily\color{black!50}`. For example, to print line numbers in red: `\renewcommand{\codelineslinenrformat}{\footnotesize\color{red}}`.
- `\codelineslinenrdigits`: number of digits for zero-padding. Default `2` gives `00`, `01`, …, `99`. Set to `3` if your algorithm exceeds 99 lines.
- `\codelinesrefprefix`: prefix prepended to internal cross-reference anchors. Default is empty. Set a unique string per algorithm if you have multiple `codelines` blocks in the same document and need unambiguous `\ref` or `\label` targets.

## Cross-Referencing

Standard `\label`/`\ref` works on any `\item`. Place `\label{…}` immediately after `\item`:

```latex
\begin{codelines}
    \item \label{line:init} Initialize $x \gets 0$.
    \item \label{line:loop} For each $e \in S$, update $x$.
\end{codelines}

See line~\ref{line:init} for initialization.
```

## Caveats

- The environment is intentionally not a float. It appears exactly where placed in the source. Wrap in a `figure` or a custom float if you need a caption or want LaTeX to manage placement.
- Nesting beyond 10 levels is unsupported and will silently produce incorrect indentation.
- `\codelinesplus` and `\codelinesminus` modify a global indentation counter. Do not use them inside groups expecting them to be automatically reversed.
- Line numbers are rendered via `enumitem` internals: if you heavily customize `enumitem` globally, verify that `codelines` still renders correctly.

## License

LaTeX Project Public License v1.3c.

## Author

Agni Datta: [agni-datta/csLaTeX](https://github.com/agni-datta/csLaTeX)
