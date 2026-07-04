---
title: README
aliases: README
linter-yaml-title-alias: README
date created: Monday, June 22nd 2026, 7:29:06 pm
date modified: Tuesday, June 23rd 2026, 8:36:44 pm
---

<!-- @format -->

## eudoxus

General-purpose mathematics package for research papers and lecture notes. Bundles page layout, typography, color, graphics, tables, TikZ, a full theorem suite with small-caps styles, smart paragraph headings, and hyperlinked cross-references into a single load. Designed primarily around the `amsart` document class, but usable with any class via its option flags.

### Requirements

- `hyperref` is loaded internally. Do **not** load it again before `\usepackage{eudoxus}`.
- The `tcs` option requires `tcscrypto.sty` (from the `tcscrypto` package in this repository) to be on the TeX search path. If it is absent, `eudoxus` emits a warning and skips it.
- `geometry` is loaded under the default `layout` mode. If your class already sets page dimensions (e.g. `amsart` with custom geometry), pass `nolayout` to suppress it.
- Loads `babel` without language options. Choose document languages through the class options or load `babel` explicitly before `eudoxus`.

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
| `tcs`        | off     | Loads `tcscrypto` when `tcscrypto.sty` is available on the TeX input path.                    |
| `notcs`      | off     | Does not load `tcscrypto` even if the `tcs` flag is set.                                      |
| `nolayout`   | off     | Suppresses `geometry` and `setspace`; also disables the `amsart` bibliography patch.          |
| `titlepatch` | off     | Applies bold sans styling to titles, section headings, `\parhead`, and `\subparhead`.         |

### Theorem environments

All environments are numbered per section and use small-caps headers. Unnumbered variants are available by appending `*`.

**Theorem-like** (italic body):

`theorem`, `assertion`, `assumption`, `axiom`, `claim`, `conclusion`, `conjecture`, `corollary`, `criterion`, `fact`, `folklore`, `hypothesis`, `informaltheorem`, `lemma`, `metatheorem`, `observation`, `postulate`, `property`, `proposition`

**Definition-like** (roman body):

`application`, `construction`, `convention`, `definition`, `example`, `experiment`, `notation`, `problem`, `protocol`, `result`, `solution`, `step`

**Remark-like** (roman body, lighter weight):

`commentary`, `discussion`, `exercise`, `guideline`, `highlight`, `important`, `insight`, `keypoint`, `motivation`, `notationabuse`, `note`, `openproblem`, `question`, `recall`, `remark`, `summary`, `syntax`, `takeaway`, `tip`, `warning`

**Unnumbered theorem variants**:

`theorem*`, `lemma*`, `corollary*`, `hypothesis*`, `claim*`, `conjecture*`, `informaltheorem*`, `openproblem*`, `syntax*`

**Proof-style variants**:

`proof`, `proofsketch`, `proofidea`, `proofofclaim`

`\setqedsymbol{symbol}` changes the proof-end symbol. `\SetQEDSymbol{symbol}` is kept as a compatibility alias.

### Paragraph headings

`\parhead{Title}` and `\subparhead{Title}` produce bold and small-caps inline headings respectively, with automatic terminal punctuation. They replace `\paragraph` and `\subparagraph`.

With `titlepatch`, `\parhead` and `\subparhead` use bold sans fonts to match the patched section headings. The font commands are exposed as renewable hooks:

```latex
\renewcommand{\edxsectionheadingfont}{\sffamily\bfseries}
\renewcommand{\edxparheadingfont}{\sffamily\bfseries\boldmath}
\renewcommand{\edxsubparheadingfont}{\sffamily\bfseries}
\renewcommand{\edxdocumenttitlefont}{\sffamily\bfseries}
```

The same option also patches standard article-style titles and AMS title handling where the class hooks match.

### Cross-references

`\cref{label}` and `\Cref{label}` are powered by `zref-clever`. Section-type references use `§` / `§§` markers. `\crefrange` is also available.

### Caveats

- The bibliography patch (`\small\setstretch{1.075}`) is applied only when the document class is `amsart` **and** `nolayout` is not set. Under `article` or any other class the bibliography renders at its default size.
- `nolayout` suppresses `geometry`, `setspace`, and the bibliography patch together. Use it when your class or a wrapper package already controls page dimensions.
- The `tcs` option is off by default. Enable it with `\usepackage[tcs]{eudoxus}` to load `tcscrypto` when `tcscrypto.sty` is available on the TeX input path.
- Do not load `amsthm` independently before this package when theorems are enabled: `eudoxus` configures it internally via `\ifeudoxtheorems`.

### License

LaTeX Project Public License v1.3c.

### Author

Agni Datta: [agni-datta/csLaTeX](https://github.com/agni-datta/csLaTeX)
