---
title: README
aliases: README
linter-yaml-title-alias: README
date created: Saturday, June 7th 2026, 12:00:00 am
date modified: Saturday, June 7th 2026, 12:00:00 am
---

<!-- @format -->

## eudoxus

General-purpose mathematics package for research papers and lecture notes. Bundles page layout, typography, color, graphics, tables, TikZ, a full theorem suite with small-caps styles, smart paragraph headings, and hyperlinked cross-references into a single load. Designed primarily around the `amsart` document class, but usable with any class via its option flags.

### Requirements

- `hyperref` is loaded internally. Do **not** load it again before `\usepackage{eudoxus}`.
- The `tcs` option requires `tcscrypto.sty` (from the `tcscrypto` package in this repository) to be on the TeX search path. If it is absent, `eudoxus` emits a warning and skips it.
- `geometry` is loaded under the default `layout` mode. If your class already sets page dimensions (e.g. `amsart` with custom geometry), pass `nolayout` to suppress it.

### Usage

```latex
\usepackage[options]{eudoxus}
```

Multiple options may be combined:

```latex
\usepackage[nolayout,notcs]{eudoxus}
```

### Minimal example

```latex
\documentclass{amsart}
\usepackage{eudoxus}

\title{A Short Note}
\author{Agni Datta}

\begin{document}
\maketitle

\begin{theorem}[Fermat]
  \label{thm:fermat}
  There are no positive integer solutions to $x^n + y^n = z^n$ for $n \geq 3$.
\end{theorem}

\begin{proof}
  Omitted.
\end{proof}

By \cref{thm:fermat}, the equation has no solutions.

\end{document}
```

### Options

| Option       | Default | Effect                                                                                        |
| ------------ | ------- | --------------------------------------------------------------------------------------------- |
| `nomath`     | off     | Disables all math packages (amsmath, amsthm, mathalpha, …) and implies `notheorems`, `notcs`. |
| `notheorems` | off     | Skips theorem environment declarations; math packages are still loaded.                       |
| `notcs`      | off     | Does not load `tcscrypto` even if the `tcs` flag is set.                                      |
| `nolayout`   | off     | Suppresses `geometry` and `setspace`; also disables the `amsart` bibliography patch.          |

### Theorem environments

All environments are numbered per section and use small-caps headers. Unnumbered variants are available by appending `*`.

**Theorem-like** (italic body):

`theorem`, `assertion`, `assumption`, `axiom`, `claim`, `conclusion`, `conjecture`, `corollary`, `criterion`, `fact`, `folklore`, `hypothesis`, `informaltheorem`, `lemma`, `metatheorem`, `observation`, `postulate`, `property`, `proposition`

**Definition-like** (roman body):

`application`, `construction`, `convention`, `definition`, `example`, `experiment`, `notation`, `problem`, `protocol`, `result`, `solution`, `step`

**Remark-like** (roman body, lighter weight):

`commentary`, `discussion`, `exercise`, `guideline`, `highlight`, `important`, `insight`, `keypoint`, `motivation`, `notationabuse`, `note`, `openproblem`, `question`, `recall`, `remark`, `summary`, `syntax`, `takeaway`, `tip`, `warning`

**Unnumbered variants** (declared with `\newtheorem*`):

`theorem*`, `lemma*`, `corollary*`, `hypothesis*`, `claim*`, `conjecture*`, `informaltheorem*`, `openproblem*`, `syntax*`

### Paragraph headings

`\parhead{Title}` and `\subparhead{Title}` produce bold and small-caps inline headings respectively, with automatic terminal punctuation. They replace `\paragraph` and `\subparagraph`.

### Cross-references

`\cref{label}` and `\Cref{label}` are powered by `zref-clever`. Section-type references use `§` / `§§` markers. `\crefrange` is also available.

### Caveats

- The bibliography patch (`\small\setstretch{1.075}`) is applied only when the document class is `amsart` **and** `nolayout` is not set. Under `article` or any other class the bibliography renders at its default size.
- `nolayout` suppresses `geometry`, `setspace`, and the bibliography patch together. Use it when your class or a wrapper package already controls page dimensions.
- The `tcs` option is off by default. Enable it with `\usepackage[tcs]{eudoxus}` (note: the internal flag name is `eudoxtcs`; the option keyword is `tcs` — but since no `tcs` option is declared, enable TCS support by removing `notcs` from the default or patching as needed; currently the package ships with `\eudoxtcsfalse` as default and the `notcs` option is a no-op when TCS is already off).
- Do not load `amsthm` independently before this package when theorems are enabled: `eudoxus` configures it internally via `\ifeudoxtheorems`.

### License

LaTeX Project Public License v1.3c.

### Author

Agni Datta: [agni-datta/csLaTeX](https://github.com/agni-datta/csLaTeX)
