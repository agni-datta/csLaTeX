---
title: README
aliases: README
linter-yaml-title-alias: README
date created: Thursday, May 14th 2026, 10:23:24 pm
date modified: Thursday, May 14th 2026, 10:24:28 pm
---

<!-- @format -->

## llncscrypto

Typography, theorem environments, author tooling, and optional cryptography support on top of the Springer LLNCS class.

### Requirements

- Document class: `llncs`.
- Do not load `amsthm` manually—this package manages it internally.

### Usage

```latex
\documentclass{llncs}
\usepackage[options]{llncscrypto}
```

### Options

| Option      | Default | Description                                                                          |
| ----------- | ------- | ------------------------------------------------------------------------------------ |
| `appendix`  | off     | Load the `appendix` package configured for LLNCS.                                    |
| `captions`  | off     | Load `caption` and `subcaption` with styled formatting.                              |
| `crypto`    | off     | Load `tcscrypto` (if present) and `orcidlink`.                                       |
| `draft`     | off     | Stamp each page with a dated “not for distribution” watermark.                       |
| `final`     | off     | Camera-ready mode: disables all notes and draft markers.                             |
| `libertine` | off     | Use Libertine/Biolinum with matching math.                                           |
| `nonotes`   | off     | Suppress author notes without enabling full `final` mode.                            |
| `preprint`  | off     | Eprint layout: letter paper, 1.15× spacing, centered page numbers. Expects `[11pt]`. |
| `theorems`  | off     | Replace LLNCS theorem environments with a full standardized set.                     |
| `tikz`      | off     | Load TikZ, PGFPlots, and tikz-cd with common libraries.                              |

### Theorem environments (`theorems` option)

LLNCS built-ins are torn down and replaced. `case` and `solution` are dropped.

**Bold heading, roman body** (numbered per section):

`theorem`, `assertion`, `assumption`, `axiom`, `claim`, `conclusion`, `conjecture`, `corollary`, `criterion`, `fact`, `folklore`, `hypothesis`, `lemma`, `observation`, `postulate`, `property`, `proposition`, `application`, `construction`, `convention`, `definition`, `experiment`, `notation`, `openproblem`, `problem`, `protocol`, `result`

**Small-caps heading, roman body** (numbered per section):

`commentary`, `exercise`, `example`, `motivation`, `notationabuse`, `note`, `question`, `remark`

**Sans-serif heading, roman body** (numbered per section):

`guideline`, `important`, `insight`, `keypoint`, `warning`

**Unnumbered:**

`claim*`, `corollary*`, `lemma*`, `theorem*`, `proof`

**Additional:**

`claimproof`—like `proof` but defaults to “Proof of Claim”. Accepts an optional heading override.

All numbered environments are registered with `cleveref`.

### Commands

#### Author notes (active unless `final` or `nonotes`)

- `\dtnote[author]{text}`—color-coded inline note with a sidebar marker and notes-list entry.
- `\dtcolornote[author]{color}{text}`—same with explicit color.
- `\newcomment{author}{color}{cmd}`—define a custom per-author shorthand.
- `\XXX[label]`—red inline flag; raises an error in `final`/`nonotes`.
- `\dtignore[label]{text}`—sidebar marker only; body is suppressed.
- `\printdtnotes`—print collected author notes as a section. No-op if none.
- `\missing{text}`—highlight missing content in red and add to the missing list.
- `\printmissing`—print collected missing-content entries as a section.

#### Paragraph headings

- `\parhead{text}`—bold inline heading; appends a period unless text ends with punctuation.
- `\parheadnoperiod{text}`—bold inline heading, no automatic punctuation.
- `\subparhead{text}`—small-caps inline heading with automatic punctuation.
- `\subparheadnoperiod{text}`—small-caps inline heading, no automatic punctuation.

These replace `\paragraph` and `\subparagraph`.

#### References

- `\fullref{label}`—hyperlinked reference combining `\autoref` and `\nameref`.

#### Text & math

- `\code{text}`—typewriter font.
- `\mathsc{text}`—small caps in math mode.
- `\textem{text}`—colored emphasis (default: `RoyalBlue`).
- `\sethighlightcolor{color}`—change the color used by `\textem`.

#### Footnotes

- `\footnotesymb{mark}{text}`—footnote with a custom mark. Empty first argument for no mark.

#### Links

- `\emailref{address}`—`mailto:` hyperlink.
- `\httpref{address}`—`http://` hyperlink.

#### Preprint mode

- `\preprint[left-header][right-header]`—set running headers. Call in the preamble after `\usepackage`.

### Environments

#### Lists

- `points`—itemize with en-dash bullets and tight spacing.
- `codelist`—enumerate with gray `[n]` labels.
- `checkbox`—itemize with `□` labels; use `\checked` for a `✓` item.
- `deflist`—description list with a fixed 33%-width label column.

#### Boxes (all accept an optional title)

- `constructionbox[title]`—framed box with a `points` list.
- `codelistbox[title]`—framed box with a `codelist`.
- `simplebox[title]`—framed box with free content.

#### Other

- `nestedbar[width]`—left vertical rule to demarcate a logical block (default: `\hsize`).
- `acknowledgment[heading]`—acknowledgment paragraph (default heading: “Acknowledgment”).

### License

LaTeX Project Public License v1.3c.
