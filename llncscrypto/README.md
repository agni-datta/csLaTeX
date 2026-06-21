---
title: README
aliases: README
linter-yaml-title-alias: README
date created: Thursday, May 14th 2026, 10:23:24 pm
date modified: Tuesday, May 19th 2026, 1:35:35 am
---

<!-- @format -->

## llncscrypto

Typography, theorem environments, author tooling, and lightweight research-paper utilities on top of the Springer LLNCS class. The default mode stays close to LLNCS and keeps opinionated behavior behind explicit option flags: theorem replacement, caption styling, preprint layout, colored links, and draft notes are opt-in. Cryptographic notation, TikZ, and appendix tooling are document-level decisions and should be loaded explicitly by documents that need them.

### Requirements

- Document class must be `llncs`. This package is not designed for `article` or `book`.
- Do not load `thmtools` with this template. The `theorems` option uses the theorem mechanism provided by LLNCS itself, namely `\spnewtheorem` and its related internal declarations.
- Load `csdeferproofs` after this package if you use it, because `llncscrypto` registers its `proof` environment inside `\AtEndPreamble` and `csdeferproofs` must append its own hook later in the queue.

### Usage

```latex
\documentclass[runningheads, a4paper]{llncs}
\usepackage[options]{llncscrypto}
```

### Typical conference paper preamble

```latex
\documentclass[runningheads, a4paper, envcountsect]{llncs}
\usepackage[captions, draft, theorems]{llncscrypto}
\usepackage{tcscrypto}
\usepackage{tikz}
\usepackage[appendix=true]{csdeferproofs}
\NewDeferredThm{theoremE}{theorem}
\NewDeferredThm{lemmaE}{lemma}
```

### Options

| Option      | Default | Description                                                                                                |
| ----------- | ------- | ---------------------------------------------------------------------------------------------------------- |
| `captions`  | off     | Load `caption` and `subcaption` with styled figure and table formatting.                                   |
| `colorlinks`| off     | Use colored hyperlinks. Off by default so strict LLNCS output keeps neutral link rendering.                |
| `draft`     | off     | Stamp each page with a dated “not for distribution” watermark and enable author notes.                     |
| `final`     | off     | Camera-ready mode: disable all notes, draft markers, and `\XXX` flags. Incompatible with `draft`.          |
| `libertine` | off     | Use Libertine body font and Biolinum sans with matching math.                                              |
| `nonotes`   | off     | Suppress author notes without enabling full `final` mode. Useful for anonymous submission review copies.   |
| `preprint`  | off     | Eprint layout: letter paper, 1.15× line spacing, centered page numbers. Expects the `[11pt]` class option. |
| `theorems`  | off     | Redeclare LLNCS theorem environments with `\spnewtheorem` and upright body text.                           |

### Theorem environments (`theorems` option)

When `theorems` is passed, the theorem-like environments are redeclared through the LLNCS-supported `\spnewtheorem` mechanism. The resulting bodies are upright roman text, so theorem, lemma, definition, and related environments do not inherit the default italic LLNCS theorem body. The `case` environment from LLNCS is dropped; `solution` is redeclared as part of the package theorem suite.

**Bold heading, roman body** (numbered per section):

`theorem`, `assertion`, `assumption`, `axiom`, `claim`, `conclusion`, `conjecture`, `corollary`, `criterion`, `fact`, `folklore`, `hypothesis`, `informaltheorem`, `lemma`, `metatheorem`, `observation`, `postulate`, `property`, `proposition`, `application`, `construction`, `convention`, `definition`, `experiment`, `notation`, `openproblem`, `problem`, `protocol`, `result`, `solution`, `step`

**Small-caps heading, roman body** (numbered per section):

`commentary`, `discussion`, `exercise`, `example`, `motivation`, `notationabuse`, `note`, `question`, `remark`, `syntax`

**Sans-serif heading, roman body** (numbered per section):

`guideline`, `highlight`, `important`, `insight`, `keypoint`, `recall`, `summary`, `takeaway`, `tip`, `warning`

**Unnumbered:**

`claim*`, `conjecture*`, `corollary*`, `hypothesis*`, `informaltheorem*`, `lemma*`, `openproblem*`, `syntax*`, `theorem*`, `proof`

**Additional:**

- `claimproof`: like `proof` but defaults to “Proof of Claim” as the heading. Accepts an optional argument to override the heading text.

All numbered environments are registered with `zref-clever`. The package preserves the standard `\cref{label}` and `\Cref{label}` interfaces for automatic type-aware references.

### Cryptographic notation

`llncscrypto` does not load `tcscrypto`. This avoids hidden package coupling and keeps LLNCS compatibility easier to audit. For cryptographic notation, protocol boxes, complexity macros, sampling notation, proof-complexity commands, or other TCS-specific interfaces, load `tcscrypto` explicitly after `llncscrypto`:

```latex
\usepackage[theorems,draft]{llncscrypto}
\usepackage{tcscrypto}
```

### Commands

#### Author notes and annotation commands (active unless `final` or `nonotes`)

All annotation commands produce colored inline text plus a margin star `★` for quick visual scanning. In `final` or `nonotes` mode all of these become no-ops (except `\XXX`, which raises an error).

**Collaborative notes (tracked in a collected list):**

- `\dtnote[author]{text}`: color-coded inline note with a sidebar marker. The note is added to an internal list printed by `\printdtnotes`. If `author` is omitted, a default label is used.
- `\dtcolornote[author]{color}{text}`: same as `\dtnote` but with an explicit color override.
- `\newcomment{author}{color}{cmd}`: define a shorthand command `\cmd{text}` for a specific author. Call once per collaborator in the preamble. Example: `\newcomment{Agni}{RoyalBlue}{\agni}` creates `\agni{text}`.
- `\newguymarker{cmd}{label}{color}`: define a per-author annotation command `\cmd{text}` that renders the text in the given color with a “label” sidebar marker and margin star. Unlike `\newcomment`, it does not add to the `\printdtnotes` list: it is a simpler inline highlighter. In `final`/`nonotes` mode it becomes a no-op.
- `\dtignore[label]{text}`: places a sidebar marker but suppresses the body text entirely. Use to mark a passage for later attention without rendering its content.
- `\printdtnotes`: prints all collected author notes as a section. Produces no output if there are no notes. Call at the end of the document for a consolidated review list.

**Inline drafting markers:**

- `\todo{text}`: action item in dark red. Use for things that must be done before submission.
- `\fixme{text}`: renders as `[Fix-me: text]` in orange-red. Use for broken or placeholder content.
- `\query{text}`: renders as `[Query: text]` in purple. Use for open questions between co-authors.
- `\notes{text}`: renders as `[Note: text]` in forest green. Use for informational remarks during drafting.
- `\added{text}`: renders the text in olive green. Use to mark newly added passages for co-author review.
- `\changed{text}`: renders the text in pine green. Use to mark revised passages.
- `\removed{text}`: renders the text with a strikethrough in periwinkle. Use to mark passages proposed for deletion without actually removing them yet.
- `\citelater{text}`: renders `[text]` in wild strawberry. Use as a citation placeholder when you know a reference is needed but have not looked it up yet.
- `\XXX[label]`: bold red inline flag for severe issues. The optional label defaults to `XXX`. In `final` or `nonotes` mode this raises a LaTeX error, forcing you to clear all flags before submission. Never leave `\XXX` in a document you send to a venue.

**Missing-content tracking:**

- `\missing{text}`: highlights missing content in red, adds it to an internal list, and (if notes are enabled) also appends it to the `\printdtnotes` list with page-back reference.
- `\printmissing`: prints all collected missing-content entries as a section with page references. Call near the end of the document during drafting.

#### Broken-reference tracking (always active)

Whenever a `\ref`, `\cref`, or `\cite` target does not exist yet, a red star `★` appears in the margin at that point in the text. This fires unconditionally (no `draft` mode required), so undefined labels are immediately visible without having to search the log. The markers disappear as soon as the labels are defined on the next compile. This is separate from annotation commands: it cannot be suppressed by `final` or `nonotes` because its purpose is to catch real compilation problems, not to clean up draft remarks.

#### Paragraph headings

These replace `\paragraph` and `\subparagraph` with typographically consistent alternatives:

- `\parhead{text}`: bold inline heading. Appends a period automatically unless `text` already ends with punctuation (`.`, `!`, `?`, `:`).
- `\parheadnoperiod{text}`: bold inline heading with no automatic punctuation.
- `\subparhead{text}`: small-caps inline heading with automatic punctuation.
- `\subparheadnoperiod{text}`: small-caps inline heading with no automatic punctuation.

#### References

- `\fullref{label}`: hyperlinked reference that combines `zref-clever`’s type-aware reference text with `\nameref` into a single clickable span.

#### Text and math

- `\code{text}`: inline typewriter-font code span.
- `\mathsc{text}`: small caps inside math mode. Use for complexity classes, problem names, and named entities that should not be italicized.
- `\textem{text}`: colored emphasis, default color `RoyalBlue`. Use for key terms being introduced or highlighted.
- `\sethighlightcolor{color}`: change the color used by `\textem` for the rest of the document.

#### Footnotes

- `\footnotesymb{mark}{text}`: footnote with a custom symbol mark instead of the default number. Pass an empty first argument `{}` for no mark (anonymous footnote).

#### Links

- `\emailref{address}`: renders a `mailto:` hyperlink. Use in author blocks and correspondence notes.
- `\httpref{address}`: renders an `http://` hyperlink.
- `\webpage{address}`: compatibility alias for `\httpref{address}`, defined only if no earlier class or package has already defined it.

#### Preprint mode

- `\preprint[left-header][right-header]`: sets running headers for eprint-style layout. Call in the preamble after `\usepackage{llncscrypto}`. Both arguments are optional; defaults to title and author.

### Environments

#### Lists

- `points`: itemize with en-dash bullets and tight vertical spacing. Use for theorem hypothesis lists and enumerated steps.
- `codelist`: enumerate with gray `[n]` labels. Use for numbered algorithm steps or protocol descriptions.
- `checkbox`: itemize with `□` bullet labels. Use `\checked` on an item to render `✓` instead of `□`. Useful for requirement checklists.
- `deflist`: description list with a fixed 33%-width label column. Use for notation tables and term definitions.

#### Boxes

- `simplebox[title]`: framed box with free content. Use for game definitions, experiments, or any block that needs visual separation.

The box backend uses `mdframed` with its default frame method, so loading `llncscrypto` does not implicitly load TikZ.

#### Other

- `nestedbar[width]`: draws a left vertical rule for the duration of the environment. Default width is `\hsize`. Use to demarcate a sub-proof, a nested argument, or a logical block within a long proof.
- `acknowledgment[heading]`: formats an acknowledgment paragraph with the given heading (default: “Acknowledgment”). Use at the end of the paper before the bibliography.

### Caveats

- Do not load `thmtools` with this template. It is not part of the LLNCS-supported theorem mechanism and is intentionally not used by `llncscrypto`.
- The `theorems` option redeclares LLNCS theorem environments. Do not define theorem-like environments with the same names before loading `llncscrypto` with `theorems`, as those definitions will be overwritten.
- `\XXX` raises a hard error in `final`/`nonotes` mode intentionally. If compilation fails after switching to `final`, search the source for `\XXX` and remove or resolve every occurrence before resubmitting.
- The `preprint` option changes page geometry and expects the `[11pt]` class option on `\documentclass`. Using it with `[10pt]` will produce lines that are too wide.
- If you use `csdeferproofs`, always load `llncscrypto` first and enable the `theorems` option. The proof environment must exist before `csdeferproofs` hooks into it.
- `crypto`, `appendix`, `backref`, and `tikz` are not `llncscrypto` options. Load `tcscrypto`, `orcidlink`, `appendix`, `tikz`, `pgfplots`, or related packages directly in the document when needed.
- The broken-reference tracking patches `\@setref` and `\G@refundefinedtrue` at load time. Margin stars on first compile of a new document indicate genuine missing labels, not a bug. They clear on the next compile once labels are defined.
- The unified annotation commands (`\todo`, `\fixme`, `\added`, `\changed`, `\removed`, etc.) require `ulem` for `\removed`’s strikethrough rendering. The package loads `ulem` automatically with the `[normalem]` option so that `\emph` is not affected.
- `\notes` is a newly added command that may shadow any `\notes` you defined yourself in the preamble. Rename your own definition if there is a conflict.
- `\missing` has richer behavior than the csamsmath version: it page-indexes every occurrence and integrates with `\printdtnotes`. If you switch a document from csamsmath to llncscrypto, `\missing` will behave differently, as it now also accumulates entries and shows page references when `\printmissing` is called.

### License

LaTeX Project Public License v1.3c.

### Author

Agni Datta: [agni-datta/csLaTeX](https://github.com/agni-datta/csLaTeX)
