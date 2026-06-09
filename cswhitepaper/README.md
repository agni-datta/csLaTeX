---
title: "cswhitepaper"
aliases: "cswhitepaper"
linter-yaml-title-alias: "cswhitepaper"
date created: Thursday, May 14th 2026, 10:22:54 pm
date modified: 2026-07-21
---

<!-- @format -->

# cswhitepaper

A style for collaborative white papers and technical reports. It combines ruled theorem formatting, author notes, revision markers, and draft or final modes.

## Requirements

- Works with `article` and `report` classes. Not designed for `book` or `beamer`.
- Do not load `amsthm` before this package.
- Loads `babel` without language options. Choose document languages through the class options or load `babel` explicitly before `cswhitepaper`.

## Usage

```latex
\usepackage[options]{cswhitepaper}
```

## Minimal Example

```latex
\documentclass{article}
\usepackage[draft]{cswhitepaper}
\documentaccentcolor{NavyBlue}

\begin{document}
\section{Introduction}

\todo{Expand this section before submission.}

\parhead{Methodology} We follow a standard reduction argument.

\begin{theorem}[Main Result]
    \label{thm:main}
    The construction is secure under the LWE assumption.
\end{theorem}

\begin{proof}
    \missing{Write the full reduction here.}
\end{proof}
\end{document}
```

## Options

- `draft`: (default) enables all annotations, revision highlights, and margin markers. Use this during writing and review.
- `final`: suppresses every annotation, highlight, and margin marker. The document body renders as if the annotation commands were never called. Use this for the final submitted or published version. Switching from `draft` to `final` is the only change needed to go from a working draft to a clean document.

## API

### Global configuration

- `\documentaccentcolor{color}`: sets the primary accent color used for ruled lines, section headings, theorem decorations, and hyperref links. Call once in the preamble. Accepts any color name known to `xcolor`. Default: `SteelBlue4`.

### Sectioning

- `\parhead{text}`: bold inline heading with automatic trailing period. Use in place of `\paragraph` for named steps, cases, or subsections that do not warrant a numbered heading.
- `\subparhead{text}`: small-caps inline heading with automatic trailing period. Use for finer-grained structure below `\parhead`.

### Annotation commands (active in `draft` mode; no-ops in `final`)

General annotations:

- `\todo{text}`: inline todo marker in a bright color with a margin flag. Use for items that must be addressed before submission.
- `\fixme{text}`: inline fixme marker, visually distinct from `\todo`. Use for known errors or broken content.
- `\query{text}`: question to be resolved, rendered in a different color. Use to flag something you are unsure about.
- `\notes{text}`: general inline note, lower priority than todo/fixme. Use for reminders and future improvements.
- `\missing{text}`: placeholder for content not yet written, rendered in a distinctive warning color. Use inside theorem bodies, proof skeletons, or section stubs.

Revision tracking:

- `\added{text}`: marks newly added text in green. Use when incorporating reviewer feedback or co-author additions.
- `\changed{text}`: marks revised text in orange. Use for sections that have been rewritten since a previous draft.
- `\removed{text}`: marks text to be deleted in red strikethrough. Use to propose a deletion for co-author review before committing it.

Per-author markers:

- `\newguymarker{cmd}{label}{color}`: defines a custom per-author annotation command `\cmd{text}` that renders `text` in the given color with a sidebar `[label]` marker. Use this once per collaborator in the preamble, then each author calls their own command throughout the document.

```latex
\newguymarker{\agni}{Agni}{RoyalBlue}
\newguymarker{\matteo}{Matteo}{BrickRed}

% In the document:
\agni{I think this proof needs another case.}
\matteo{Agreed, I will handle it.}
```

## Theorem Environments

`cswhitepaper` provides a complete theorem suite with ruled aesthetics controlled by `\documentaccentcolor`:

**Theorem-like:** `theorem`, `lemma`, `corollary`, `proposition`, `claim`, `conjecture`, `fact`

**Definition-like:** `definition`, `notation`, `protocol`, `problem`, `construction`

**Remark-like:** `remark`, `note`, `example`, `observation`, `openproblem`

**Proof-style:** `proof`, `proofsketch`, `proofidea`, `proofofclaim`

All environments are numbered per section, accept optional titles, and are registered with `cleveref`.

`\setqedsymbol{symbol}` changes the proof-end symbol, and `\settheoremendsymbol{symbol}` changes theorem-end markers where those markers are used. The capitalized forms remain available as compatibility aliases.

## Caveats

- The `final` option suppresses annotations entirely: it does not warn about unfilled `\missing{}` or unresolved `\todo{}` calls. Run a `draft` build and search the PDF for annotation markers before switching to `final`.
- `\newguymarker` defines a new command at call time. If two authors call it with the same command name, the second definition silently overwrites the first. Use distinct command names per author.
- Do not load `amsthm` before this package. Loading it after is harmless.
- Revision tracking commands (`\added`, `\changed`, `\removed`) render in `draft` mode only. In `final` mode, `\added` and `\changed` render their argument as plain text; `\removed` renders nothing. This means `\removed{text}` actually removes the text from the final output, which is intentional but requires care: do not use `\removed` for text you might want to keep.

## License

LaTeX Project Public License v1.3c.

## Author

Agni Datta: [agni-datta/csLaTeX](https://github.com/agni-datta/csLaTeX)
