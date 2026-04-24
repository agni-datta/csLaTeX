---
title: README
aliases: README
linter-yaml-title-alias: README
date created: Sunday, April 12th 2026, 9:35:44 pm
date modified: Monday, May 11th 2026, 2:46:58 pm
---

<!-- @format -->

## llncscrypto

A LaTeX package providing typography, theorem environments, author tooling, and optional cryptography support on top of the Springer LLNCS document class.

### Requirements

- Document class: `llncs`
- Do not load `amsthm` manually—this package manages it internally.

### Usage

```latex
\documentclass{llncs}
\usepackage[options]{llncscrypto}
```

### Options

| Option      | Default | Description                                                                               |
| ----------- | ------- | ----------------------------------------------------------------------------------------- |
| `appendix`  | off     | Load the `appendix` package configured for LLNCS.                                         |
| `captions`  | off     | Load `caption` and `subcaption` with styled caption formatting.                           |
| `crypto`    | off     | Load `tcscrypto` (if present) and `orcidlink`.                                            |
| `draft`     | off     | Stamp each page with a dated “not for distribution” watermark.                            |
| `final`     | off     | Camera-ready mode: disables all notes and draft markers.                                  |
| `libertine` | off     | Use the Libertine/Biolinum font suite with matching math.                                 |
| `nonotes`   | off     | Suppress author notes without enabling full `final` mode.                                 |
| `preprint`  | off     | Eprint layout: letter paper, 1.15x line spacing, centered page numbers. Expects `[11pt]`. |
| `theorems`  | off     | Replace LLNCS theorem environments with a full standardized set.                          |
| `tikz`      | off     | Load TikZ, PGFPlots, and tikz-cd with common libraries.                                   |

#### Theorem Environments (`theorems` option)

When `theorems` is active, all LLNCS built-in environments are torn down and replaced. The LLNCS environments `case` and `solution` are dropped entirely.

**Bold heading, roman body** (numbered per section):

`theorem`, `assertion`, `assumption`, `axiom`, `claim`, `conclusion`, `conjecture`, `corollary`, `criterion`, `fact`, `folklore`, `hypothesis`, `lemma`, `observation`, `postulate`, `property`, `proposition`, `application`, `construction`, `convention`, `definition`, `experiment`, `notation`, `openproblem`, `problem`, `protocol`, `result`

**Small-caps heading, roman body** (numbered per section):

`commentary`, `exercise`, `example`, `motivation`, `notationabuse`, `note`, `question`, `remark`

**Sans-serif heading, roman body** (numbered per section):

`guideline`, `important`, `insight`, `keypoint`, `warning`

**Unnumbered:**

`claim*`, `corollary*`, `lemma*`, `theorem*`, `proof`

**Additional environment:**

`claimproof`—like `proof` but defaults to the heading “Proof of Claim”. Takes an optional argument to override the heading.

All numbered environments are registered with `cleveref`.

#### Commands

##### Author Notes

These commands are active unless `final` or `nonotes` is set.

- `\dtnote[author]{text}`—color-coded inline note with a sidebar marker and an entry in the notes list.
- `\dtcolornote[author]{color}{text}`—same but with an explicit color.
- `\newcomment{author}{color}{cmd}`—define a custom per-author shorthand for `\dtcolornote`.
- `\XXX[label]`—red inline flag; raises an error in `final`/`nonotes` mode.
- `\dtignore[label]{text}`—sidebar marker only, body is suppressed.
- `\printdtnotes`—print the collected author notes as a section. No-op if there are none.
- `\missing{text}`—highlight missing content in red and add it to the missing list.
- `\printmissing`—print the collected missing-content entries as a section.

##### Paragraph Headings

- `\parhead{text}`—bold inline heading; appends a period unless the text already ends with punctuation.
- `\parheadnoperiod{text}`—bold inline heading with no automatic punctuation.
- `\subparhead{text}`—small-caps inline heading with automatic punctuation.
- `\subparheadnoperiod{text}`—small-caps inline heading with no automatic punctuation.

These also replace `\paragraph` and `\subparagraph`.

##### References

- `\fullref{label}`—hyperlinked reference combining `\autoref` and `\nameref`.

##### Text & Math

- `\code{text}`—typewriter font.
- `\mathsc{text}`—small caps in math mode.
- `\textem{text}`—colored emphasis (default `RoyalBlue`).
- `\sethighlightcolor{color}`—change the color used by `\textem`.

##### Footnotes

- `\footnotesymb{mark}{text}`—footnote with a custom mark. Pass an empty first argument for a footnote with no mark.

##### Links

- `\emailref{address}`—`mailto:` hyperlink.
- `\httpref{address}`—`http://` hyperlink.

##### Preprint Mode

- `\preprint[left-header][right-header]`—set the running headers for preprint mode. Call in the preamble after `\usepackage`.

### Environments

#### Lists

- `points`—itemize with en-dash bullets and tight spacing.
- `codelist`—enumerate with gray `[n]` labels.
- `checkbox`—itemize with `□` labels; use `\checked` for a `✓` item.
- `deflist`—description list with a fixed 33%-width label column.

#### Boxes

All box environments accept an optional title argument.

- `constructionbox[title]`—framed box containing a `points` list.
- `codelistbox[title]`—framed box containing a `codelist`.
- `simplebox[title]`—framed box with free content.

#### Other

- `nestedbar[width]`—draws a left vertical rule to demarcate a logical block. Defaults to `\hsize`.
- `acknowledgment[heading]`—acknowledgment paragraph. Defaults to the heading “Acknowledgment.”

### License

Distributed under the LaTeX Project Public License v1.3c.
