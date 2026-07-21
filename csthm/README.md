---
title: "csthm"
aliases: "csthm"
linter-yaml-title-alias: "csthm"
date created: Thursday, May 14th 2026, 10:22:38 pm
date modified: 2026-07-21
---

<!-- @format -->

# csthm

A standalone theorem suite for theoretical computer science. Its `normal`, `fancy`, and `oldschool` modes share configurable accent colors, proof helpers, and `cleveref` names.

## Requirements

- Load `hyperref` **before** `csthm`. Because `csthm` loads `cleveref` internally, and `cleveref` must come after `hyperref`, you must load `hyperref` first. If you load `csthm` before `hyperref`, cross-reference capitalization and PDF bookmarks may not work correctly.
- Do not load `thmtools` manually with conflicting style options: `csthm` configures it internally.

## Usage

```latex
\usepackage[mode]{csthm}
```

Exactly one mode option should be passed. If none is given, `normal` is the implicit default.

## Minimal Example

```latex
\documentclass{article}
\usepackage{hyperref}
\usepackage[fancy]{csthm}

\begin{document}

\begin{theorem}[Cook--Levin]
    \label{thm:cook-levin}
    SAT is NP-complete.
\end{theorem}

\begin{proof}
    Reduce every NP Turing machine to a polynomial-size circuit and encode
    the computation as a satisfiability instance.
\end{proof}

By \cref{thm:cook-levin}, every NP problem reduces to SAT.

\end{document}
```

## Options

Exactly one of the following:

- `normal`: ruled headers with standard serif body. Clean, suitable for most research papers. Theorem headers appear in bold with a horizontal rule above and below the statement.
- `fancy`: colored left-bar designs with tinted backgrounds. Each theorem category gets a distinct color derived from the accent color. Visually distinctive; good for lecture notes and textbooks where theorems need to stand out.
- `oldschool`: classic LaTeX formatting with small-caps headers and no decorative rules. Closest to the look of AMSLaTeX without any visual additions.

## API

### Accent color

- `\SetAccentColor{color}`: sets the global accent color used by theorem markers, left bars, and `fancy` mode backgrounds. Accepts any color name known to `xcolor`. Default: `black`. Change this once in the preamble; avoid calling it mid-document.

```latex
\SetAccentColor{RoyalBlue}
```

### Utility

- `\emailid{address}`: renders a formatted, clickable `mailto:` hyperlink. Use in author blocks or correspondence notes.

## Theorem Environments

All environments are numbered per section and registered with `cleveref`. Every environment accepts an optional title argument.

**Theorem-like** (bold/colored header, emphasized body):

`theorem`, `lemma`, `corollary`, `proposition`, `claim`, `conjecture`, `fact`, `assertion`, `hypothesis`

**Definition-like** (bold/colored header, roman body):

`definition`, `protocol`, `problem`, `construction`, `application`, `notation`, `convention`

**Remark-like** (smaller header, roman body, less visual weight):

`remark`, `note`, `example`, `exercise`, `observation`, `notationabuse`, `openproblem`

**Highlight-like** (strong visual weight, used for warnings and key points):

`guideline`, `important`, `insight`, `warning`

**Proof and case structure:**

- `proof`: reimplemented with consistent QED markers that respect the current accent color.
- `proofsketch`: unnumbered proof-style environment headed “Proof (Sketch)”.
- `proofidea`: unnumbered proof-style environment headed “Proof (Idea)”.
- `proofofclaim`: unnumbered proof-style environment headed “Proof of Claim”; the optional argument is rendered as “Proof of Claim (id)”.
- `\setqedsymbol{symbol}`: changes the proof-end symbol. `\SetQEDSymbol{symbol}` is kept as a compatibility alias.
- `\settheoremendsymbol{symbol}`: changes the theorem-end marker used by theorem styles that display one. `\SetTheoremEndSymbol{symbol}` is kept as a compatibility alias.
- `case`: list environment for enumerating proof cases. Items are labeled **Case 1:**, **Case 2:**, etc. in bold. Accepts an optional label override per item.

```latex
\begin{proof}
    \begin{case}
        \item When $n$ is even, ...
        \item When $n$ is odd, ...
    \end{case}
\end{proof}
```

**Unnumbered variants:** append `*` to any environment name for an unnumbered version: `theorem*`, `lemma*`, `definition*`, etc.

## cleveref Integration

Every numbered environment is registered with `cleveref` with both lowercase and capitalized names. Use `\cref` for mid-sentence references and `\Cref` at the start of a sentence:

```latex
\cref{thm:cook-levin}   % → "Theorem 1.1"
\Cref{thm:cook-levin}   % → "Theorem 1.1" (same here, already capitalized)
\cref{lem:key}          % → "Lemma 2.3"
\cref{def:circuit}      % → "Definition 1.2"
```

## Caveats

- Load `hyperref` before `csthm`. This is the single most common mistake. If cross-references appear as plain numbers without hyperlinks, or if PDF bookmarks are garbled, this is the cause.
- The `fancy` mode uses `mdframed` for framed boxes. If you also use `tcolorbox` in the same document, load it with the `most` compatibility option: `\usepackage[most]{tcolorbox}`.
- `\SetAccentColor` should be called once in the preamble. Calling it mid-document changes the color for all subsequent theorem declarations but does not retroactively recolor earlier ones: the color is baked in at declaration time for some modes.
- All environments are declared with `thmtools`. Do not use `\newtheorem` to declare environments with the same names, and do not load `amsthm` independently before this package.

## License

LaTeX Project Public License v1.3c.

## Author

Agni Datta: [agni-datta/csLaTeX](https://github.com/agni-datta/csLaTeX)
