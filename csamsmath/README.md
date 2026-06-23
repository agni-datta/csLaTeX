---
title: README
aliases: README
linter-yaml-title-alias: README
date created: Thursday, May 14th 2026, 10:21:39 pm
date modified: Tuesday, June 23rd 2026, 12:00:00 am
---

<!-- @format -->

## csamsmath

Mathematical backbone for STEM publications. Handles font selection, a full suite of `thmtools`-based theorem environments, collaborative annotation commands, and various typographic details that would otherwise require a dozen separate `\usepackage` lines. Designed for `article`, `report`, and `book` classes used in research manuscripts and course notes; works with both LuaLaTeX and pdfLaTeX.

### Requirements

- Optimized for LuaLaTeX. pdfLaTeX is supported with font fallbacks; some font options silently degrade or warn.
- Do not load `amsthm` manually before this package: it loads and configures `amsthm` internally via `thmtools`. Loading it again afterward is harmless but loading it before will cause option conflicts.
- Loads `babel` without language options. Choose document languages through the class options or load `babel` explicitly before `csamsmath`.

### Usage

```latex
\usepackage[options]{csamsmath}
```

### Minimal example

```latex
\documentclass{article}
\usepackage[palatino, draft]{csamsmath}

\begin{document}
\begin{theorem}[Fermat's Last Theorem]
    \label{thm:fermat}
    No three positive integers $a, b, c$ satisfy $a^n + b^n = c^n$ for $n > 2$.
\end{theorem}
\begin{proof}
    This margin is too narrow to contain it.
\end{proof}
\end{document}
```

### Options

#### Font options (mutually exclusive)

Pass exactly one font option, or omit for the default.

- `latinmodern`: (default) Latin Modern, the standard Computer Modern successor. Reliable cross-platform rendering.
- `libertine`: TeX Gyre Libertine with Libertinus Math. Stronger stroke weight; good for dense manuscripts.
- `gfsdidot`: GFS Didot. Classical Greek-inspired letterforms; best for humanities-adjacent TCS work.
- `concrete`: Knuth Concrete with Euler math. Suitable for lecture notes and informal documents.
- `palatino`: TeX Gyre Pagella with matching math. A common conference paper font.
- `baskervaldx`: Baskervaldx with newtxmath. A refined oldstyle serif.
- `kpfonts`: KP Fonts. Requires LuaLaTeX; on pdfLaTeX a fallback warning is issued and Latin Modern is used instead.
- `garamond`: TeX Gyre Termes (a Garamond-like face). Elegant for monographs.

#### Mode options

- `draft`: enables margin notes, todo markers, annotation rendering, and broken-reference markers. Use during writing.
- `final`: (default) suppresses all annotations. Use for submission.

### API

#### Theorem-like environments (numbered per section)

`theorem`, `lemma`, `corollary`, `proposition`, `conjecture`, `fact`, `claim`

All accept an optional title argument: `\begin{theorem}[My Title]`.

#### Definition-like environments

`definition`, `notation`, `protocol`, `problem`, `construction`

#### Remark-like environments

`remark`, `note`, `example`, `observation`, `openproblem`

All environments are declared via `thmtools` and registered with `cleveref`, so `\cref{thm:fermat}` produces “Theorem 1.1” automatically.

#### Proof environments

`proof`, `proofsketch`, `proofidea`, and `proofofclaim` are unnumbered proof-style environments. `proofofclaim` defaults to “Proof of Claim” and accepts an optional claim identifier, typeset as “Proof of Claim (id)”.

- `\setqedsymbol{symbol}`: changes the symbol used at the end of proofs.
- `\settheoremendsymbol{symbol}`: changes the symbol used by theorem-style end markers.
- `\SetQEDSymbol{symbol}` and `\SetTheoremEndSymbol{symbol}` are compatibility aliases.

#### Annotation commands (active in `draft` mode only)

All annotation commands produce colored inline text plus a margin star `★` so you can scan for open items in the margin without reading the body.

- `\todo{text}`: action item in dark red. Use for things that must be done before submission.
- `\fixme{text}`: renders as `[Fix-me: text]` in orange-red. Use for broken or placeholder content.
- `\query{text}`: renders as `[Query: text]` in purple. Use for open questions between co-authors.
- `\missing{text}`: highlights missing content in crimson. Use as a placeholder where a proof, figure, or section still needs to be written.
- `\notes{text}`: renders as `[Note: text]` in forest green. Use for informational remarks during drafting.
- `\added{text}`: renders the text in olive green. Use to mark newly added passages for co-author review.
- `\changed{text}`: renders the text in pine green. Use to mark revised passages.
- `\removed{text}`: renders the text with a strikethrough in periwinkle. Use to mark passages proposed for deletion without actually removing them yet.
- `\citelater{text}`: renders `[text]` in wild strawberry. Use as a citation placeholder when you know a reference is needed but have not looked it up yet.
- `\XXX[label]`: bold red inline flag for severe issues. The optional label defaults to `XXX`. In `final` mode this raises a LaTeX error, forcing you to clear all flags before submission. Never leave `\XXX` in a document you send to collaborators or a venue.
- `\newguymarker{cmd}{label}{color}`: define a custom per-author annotation command. For example: `\newguymarker{\agni}{Agni}{RoyalBlue}` creates `\agni{text}` that renders the text in `RoyalBlue` with an “Agni” sidebar marker. In `final` mode the command becomes a no-op.

#### Broken-reference tracking (always active)

Whenever a `\ref`, `\cref`, or `\cite` target does not exist yet, a red star `★` appears in the margin at that point. This works without any special option: it fires unconditionally so you notice missing labels immediately. The markers disappear as soon as the labels are defined (on the next compile). This is distinct from annotation commands: it cannot be suppressed by `final` mode because the purpose is to catch real compilation problems, not to clean up draft remarks.

### Compatibility and conflicts

- Do not load `amsthm` before this package. Loading it after is fine.
- This package loads `thmtools`, `cleveref`, `hyperref` (if not already present), and several font packages. If you load any of these independently, do so after `csamsmath` or verify there are no option conflicts.
- Language selection is document-level. If a document needs non-default Babel languages, pass them through the class options or load `babel` explicitly before `csamsmath`.
- On pdfLaTeX, `kpfonts` silently falls back to Latin Modern: this is intentional, not a bug.
- The broken-reference tracking patches `\@setref` and `\G@refundefinedtrue` at load time. It will fire on every undefined `\ref`, `\cref`, and `\cite` target throughout the document. If you see unexpected margin stars on first compile of a new document, they indicate real missing labels, not a bug in the package.
- `\XXX` in `final` mode raises a hard `\@latex@error`. This is intentional. If your build pipeline uses `-interaction=nonstopmode` and you accidentally have `\XXX` in the source, the PDF will still be produced but the error will appear in the log. You must resolve it before submission.

### License

LaTeX Project Public License v1.3c.

### Author

Agni Datta: [agni-datta/csLaTeX](https://github.com/agni-datta/csLaTeX)
