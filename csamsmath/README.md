---
title: README
aliases: README, 'README, "csamsmath"'
linter-yaml-title-alias: README
date created: Thursday, May 14th 2026, 10:21:39 pm
date modified: Tuesday, August 18th 2026, 10:56:17 am
---

<!-- @format -->

## csamsmath

The mathematical foundation for research papers and course notes. It combines font selection, `thmtools` theorem environments, proof helpers, annotations, and reference diagnostics for LuaLaTeX and pdfLaTeX.

### Requirements

- Optimized for LuaLaTeX. pdfLaTeX supports Latin Modern, Baskervaldx, Libertine, and Palatino; every other font option warns and falls back to Latin Modern.
- Do not load `amsthm` manually before this package: it loads and configures `amsthm` internally via `thmtools`. Loading it again afterward is harmless but loading it before will cause option conflicts.
- Loads `babel` without language options. Choose document languages through the class options or load `babel` explicitly before `csamsmath`.

### Usage

```latex
\usepackage[options]{csamsmath}
```

### Minimal Example

```latex
\documentclass{article}
\usepackage[libertine, draft]{csamsmath}

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

#### Font Options (Mutually Exclusive)

Pass exactly one font option, or omit it to use Latin Modern. LuaLaTeX supports every option listed below. pdfLaTeX supports only `latinmodern`, `baskervaldx`, `libertine`, and `palatino`; any other selection produces a package warning and falls back to Latin Modern.

- `latinmodern`: (default) Latin Modern, the standard Computer Modern successor. Reliable cross-platform rendering.
- `libertine`: LuaLaTeX uses Libertinus text with a Pagella Math base and matching Libertinus letterforms; pdfLaTeX uses Libertine with `newtxmath`.
- `gfsdidot`: GFS Didot. LuaLaTeX loads the four OpenType faces directly and uses KP Math as the mathematical foundation.
- `concrete`: CMU Concrete text with Euler Math, loaded directly from the OpenType files. Suitable for lecture notes and informal documents.
- `baskervaldx`: LuaLaTeX uses Baskervaldx with KP Math; pdfLaTeX uses Baskervaldx with `newtxmath`.
- `kpfonts`: KP Fonts OpenType.
- `garamond`: Garamond Libre with Garamond Math under LuaLaTeX.
- `palatino`: LuaLaTeX loads TeX Gyre Pagella X and TeX Gyre Pagella Math directly from their OpenType files; pdfLaTeX uses the integrated `newpx` text-and-math package with tabular lining figures.

#### Mode Options

- `draft`: enables margin notes, todo markers, annotation rendering, and broken-reference markers. Use during writing.
- `final`: (default) suppresses all annotations. Use for submission.

#### Heading Options

- `sanshdr`: typesets the document title, section headings through `\subsubsection`, `\parhead`, and `\subparhead` in bold sans serif while leaving the body font unchanged.

#### Engine and Mathematics Policy

- Every LuaLaTeX branch except `kpfonts` loads explicit OTF or TTF files. The `kpfonts` branch uses `kpfonts-otf` as its native loader.
- Every branch requests lining, tabular figures. The monospaced figure feature is expressed as `Monospaced` in OpenType configuration.
- The pdfLaTeX Latin Modern branch loads `amssymb` and `mathtools`. Baskervaldx and Libertine load `mathtools` after their math packages.
- The pdfLaTeX Palatino branch loads the integrated `newpx` package with `theoremfont,trueslanted,largesc,tighter,t,lf,amsthm,vvarbb`; it does not load `amssymb` or `mathtools`.
- `bm` loads after the complete pdfLaTeX math configuration. LuaLaTeX relies on `unicode-math` bold alphabets.

### API

#### Theorem-Like Environments (Numbered per Section)

`theorem`, `lemma`, `corollary`, `proposition`, `conjecture`, `fact`, `claim`

All accept an optional title argument: `\begin{theorem}[My Title]`.

#### Definition-Like Environments

`definition`, `notation`, `protocol`, `problem`, `construction`

#### Remark-Like Environments

`remark`, `note`, `example`, `observation`, `openproblem`

All environments are declared via `thmtools` and registered with `cleveref`, so `\cref{thm:fermat}` produces “Theorem 1.1” automatically.

#### Proof Environments

`proof`, `proofsketch`, `proofidea`, and `proofofclaim` are unnumbered proof-style environments. `proofofclaim` defaults to “Proof of Claim” and accepts an optional claim identifier, typeset as “Proof of Claim (id)”.

- `\setqedsymbol{symbol}`: changes the symbol used at the end of proofs.
- `\settheoremendsymbol{symbol}`: changes the symbol used by theorem-style end markers.
- `\SetQEDSymbol{symbol}` and `\SetTheoremEndSymbol{symbol}` are compatibility aliases.

#### Annotation Commands (Active in `draft` Mode Only)

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

#### Broken-Reference Tracking (Always Active)

Whenever a `\ref`, `\cref`, or `\cite` target does not exist yet, a red star `★` appears in the margin at that point. This works without any special option: it fires unconditionally so you notice missing labels immediately. The markers disappear as soon as the labels are defined (on the next compile). This is distinct from annotation commands: it cannot be suppressed by `final` mode because the purpose is to catch real compilation problems, not to clean up draft remarks.

### Compatibility and Conflicts

- Do not load `amsthm` before this package. Loading it after is fine.
- This package loads `thmtools`, `cleveref`, `hyperref` (if not already present), and several font packages. If you load any of these independently, do so after `csamsmath` or verify there are no option conflicts.
- Font options must match between `csamsmath` and `csbook` if both packages are loaded. A mismatch raises a package error before either package can mix incompatible mathematics fonts.
- Under pdfLaTeX, only `latinmodern`, `baskervaldx`, `libertine`, and `palatino` are supported. The LuaLaTeX-only font options warn and fall back to Latin Modern rather than approximating the requested family with a different collection of Type 1 packages.
- Language selection is document-level. If a document needs non-default Babel languages, pass them through the class options or load `babel` explicitly before `csamsmath`.
- The broken-reference tracking patches `\@setref` and `\G@refundefinedtrue` at load time. It will fire on every undefined `\ref`, `\cref`, and `\cite` target throughout the document. If you see unexpected margin stars on first compile of a new document, they indicate real missing labels, not a bug in the package.
- `\XXX` in `final` mode raises a hard `\@latex@error`. This is intentional. If your build pipeline uses `-interaction=nonstopmode` and you accidentally have `\XXX` in the source, the PDF will still be produced but the error will appear in the log. You must resolve it before submission.

### Implementation Policy

Package-private commands whose names contain `@` use classic `\def`, `\newcommand`, `\renewcommand`, or `\providecommand` definitions. The document-command layer is reserved for public interfaces. Run `bash tests/check-cs-core-parity.sh` before deployment to verify this rule together with font parity.

### License

LaTeX Project Public License v1.3c.

### Author

Agni Datta: [agni-datta/csLaTeX](https://github.com/agni-datta/csLaTeX)
