---
title: README
aliases: README
linter-yaml-title-alias: README
date created: Thursday, May 14th 2026, 10:21:58 pm
date modified: Tuesday, May 19th 2026, 1:35:34 am
---

<!-- @format -->

## cslecture

Lecture-notes skeleton for the `article` class. Condenses spacing throughout, supplies a custom boxed title block driven by `\course` and `\lecturer` metadata, and provides the standard suite of `thmtools` theorem environments with ruled styles. Designed for high-density mathematical notes where you want minimal whitespace waste and clean structure without building your own preamble from scratch.

### Requirements

- Use with the `article` document class. Behavior is undefined on `book` or `report`.
- Do not call `\maketitle` with a custom redefinition: the package replaces it with its own boxed header.
- Loads `babel` without language options. Choose document languages through the class options or load `babel` explicitly before `cslecture`.

### Usage

```latex
\usepackage{cslecture}
```

No options: the package is opinionated. Font, spacing, and theorem styles are fixed.

### Minimal example

```latex
\documentclass[12pt]{article}
\usepackage{cslecture}

\course{Computational Complexity}
\lecturer{Dr.\ Agni Datta}

\begin{document}
\maketitle

\section{Circuit Complexity}

\parhead{Definition} A circuit is a directed acyclic graph with labeled gates.

\begin{theorem}[Cook–Levin]
    \label{thm:cook-levin}
    SAT is NP-complete.
\end{theorem}

\begin{proof}
    Reduce every NP machine to a circuit and encode satisfiability.
\end{proof}
\end{document}
```

### API

#### Metadata commands (call before `\begin{document}`)

- `\course{text}`: course name printed in the title block header.
- `\lecturer{text}`: lecturer name printed in the title block.
- `\maketitle`: generates the custom boxed lecture header using the above metadata. Do not redefine this.

#### Sectioning

- `\parhead{text}`: bold inline heading with automatic period. Equivalent to a `\paragraph` but with consistent csLaTeX formatting. Use for named subsections within a proof, a definition breakdown, or a numbered case.
- `\subparhead{text}`: small-caps inline heading with automatic period. Use for finer-grained structure below `\parhead`.

#### Structural environments

- `nestedbar`: environment that draws a left vertical rule for the full width of the content. Used to visually demarcate a sub-lemma, a nested proof, or a logical block within a long argument. Accepts an optional `[width]` argument (default: `\hsize`).

```latex
\begin{nestedbar}
    \begin{lemma}
        Sub-lemma statement.
    \end{lemma}
    \begin{proof}
        Sub-lemma proof.
    \end{proof}
\end{nestedbar}
```

#### Theorem environments

All environments are numbered per section and registered with `cleveref`.

**Theorem-like:** `theorem`, `lemma`, `corollary`, `proposition`, `conjecture`, `fact`, `claim`

**Definition-like:** `definition`, `notation`, `protocol`, `problem`, `construction`

**Remark-like:** `remark`, `note`, `example`, `observation`, `openproblem`

**Proof-style:** `proof`, `proofsketch`, `proofidea`

All accept an optional title: `\begin{lemma}[Key Lemma]`.

### Caveats

- `cslecture` fixes spacing globally: it will override any `\setlength` or `\geometry` calls that come before it. Put custom geometry adjustments after `\usepackage{cslecture}`.
- The `\maketitle` replacement requires `\course` and `\lecturer` to be set. If either is missing, the header renders with an empty field rather than erroring.
- Designed for the `article` class. Running it on `book` or `report` will not error immediately but `\parhead` and theorem numbering will behave unexpectedly because `cslecture` assumes no `\chapter` counter.

### License

LaTeX Project Public License v1.3c.

### Author

Agni Datta: [agni-datta/csLaTeX](https://github.com/agni-datta/csLaTeX)
