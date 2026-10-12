<!-- @format -->

# eudoxus 2.0.1

Eudoxus is an independent mathematical-writing package for **pdfLaTeX producing PDF**, with article, amsart, and the modern SIAM journal class. It does not load csmath or csthm. LuaLaTeX and XeLaTeX fail before options, fonts, mathematics, or layout initialize. Do not combine it with csmath or the lecture framework. Direct csthm co-loading is also rejected in both orders.

Use csmath for the shared csLaTeX framework. Use eudoxus for a separate amsthm-based mathematical article, or as a restrained extension of SIAM's native theorem system. No language, citation system, PDF version, or external build program is selected.

```latex
\documentclass[11pt]{article}
\usepackage{eudoxus}
\title{A mathematical note}
\author{A. Author}
\date{October 2026}
\begin{document}
\maketitle
\section{An estimate}
\begin{theorem}\label{main}
For every real number $x$, $x^2\geq0$.
\end{theorem}
\begin{proof}A square is nonnegative.\end{proof}
See Theorem~\ref{main}.
\end{document}
```

## Defaults

| Setting             | article                               | amsart         | siamart                               |
| ------------------- | ------------------------------------- | -------------- | ------------------------------------- |
| `layout=auto`       | balanced                              | inherit        | inherit                               |
| `font=auto`         | latinmodern                           | latinmodern    | inherit                               |
| `theorems=auto`     | extended                              | extended       | inherit                               |
| `numberwithin=auto` | section                               | section        | inherit                               |
| `equations=auto`    | section                               | section        | inherit                               |
| `paragraphs=auto`   | runin for a preset; inherit otherwise | inherit        | inherit                               |
| References          | none requested                        | none requested | class already loads hyperref/cleveref |
| Bibliography        | inherit                               | inherit        | inherit                               |

All feature flags are false except `math=true`. The named fonts and theorem presentation are independent of page-layout inheritance. For complete class ownership, select `font=inherit,theorems=inherit,equations=inherit` as well.

`layout=inherit` leaves geometry, native section/paragraph commands, title, paragraph spacing, bibliography, captions, and floats untouched. Explicit typography options can override that choice under article/amsart; SIAM rejects conflicting options. No geometry, titlesec, sectsty or setspace is loaded in inheritance mode. No default TikZ, PGFPlots, mdframed, professional tables, enhanced references, or annotation infrastructure is loaded.

## Options

Native kernel keys require LaTeX 2022-06-01 or newer. Unknown keys, invalid choices, and contradictory explicit selections error. Repeating the same selection is harmless. Boolean feature keys accept a bare option or `true`/`false`.

| Key                | Values / meaning                                                                   | Default         |
| ------------------ | ---------------------------------------------------------------------------------- | --------------- |
| `layout`           | auto, inherit, balanced, compact, spacious, legacy                                 | auto            |
| `font`             | auto, inherit, latinmodern, pazobiolinum                                           | auto            |
| `math`             | Load AMS mathematics; false implies no added theorems, TCS, or font initialization | true            |
| `theorems`         | auto, extended, inherit, none                                                      | auto            |
| `numberwithin`     | auto, section, none, inherit; eudoxus-owned shared theorem counter                 | auto            |
| `equations`        | auto, section, none, inherit                                                       | auto            |
| `references`       | none, hyperref, cleveref, zref, both, legacy                                       | none            |
| `paragraphs`       | auto, inherit, runin; runin is article-only                                        | auto            |
| `bibliography`     | inherit, compact, legacy                                                           | inherit         |
| `margin`           | Geometry dimension; requires an explicit non-inherited layout                      | preset          |
| `line-stretch`     | Positive factor, e.g. 1.05                                                         | preset or class |
| `paragraph-indent` | TeX dimension                                                                      | preset or class |
| `paragraph-skip`   | TeX skip                                                                           | preset or class |
| `display-breaks`   | inherit or AMS levels 0–4                                                          | inherit         |
| `ragged-bottom`    | Explicit ragged-bottom pages                                                       | false           |
| `ams-addresses`    | amsaddr's footnote addresses; amsart only                                          | false           |
| `tags`             | inherit or right; right is an explicit AMS compatibility setting                   | inherit         |
| `titlepatch`       | Bold sans title/section/explicit run-in heading fonts; article only                | false           |
| `hacks`            | Historical spacing bundle described below                                          | false           |
| `siam`             | Validate a real SIAM class; not needed for automatic detection                     | false           |
| Feature keys below | Explicit conditional package groups                                                | false           |

`theorems=inherit` and `none` both avoid declarations; neither removes environments already owned by a class/document. On article, inherited numbering for a newly declared counter means continuous numbering; to retain an existing theorem system, select `theorems=inherit`. SIAM numbering must be selected through its class options.

### Layout presets

Values apply to the document's selected paper size. Geometry dimensions are margins around the text block; headers/footers retain their class definitions.

| Preset   | Horizontal margins | Vertical margins | Line stretch | Section before / after  |
| -------- | ------------------ | ---------------- | ------------ | ----------------------- |
| balanced | 1.25 in            | 1.10 in          | 1.04         | 1.30 / .55 baselines    |
| compact  | 1.00 in            | 1.00 in          | 1.00         | 1.00 / .40 baselines    |
| spacious | 1.50 in            | 1.20 in          | 1.08         | 1.50 / .70 baselines    |
| legacy   | 1.00 in            | 1.00 in          | 1.00         | native class sectioning |
| inherit  | native             | native           | native       | native                  |

Balanced/compact/spacious are article-only. They use bold large section headings, bold normal-size subsections, 1.5 em paragraph indentation, zero paragraph skip with .3 pt stretch, conservative widow/orphan penalties, 1 em emergency line-breaking stretch, and theorem spacing of .45 baselines. Normal-size displays use 9 pt above/below with 3 pt stretch and 4 pt shrink; short-display spacing is 0/5 pt. The restrained title renderer reduces the article title/abstract gap while leaving `\maketitle`'s author footnotes, two-column handling, and cleanup to the class. It does not draw colored ornaments.

The three presets intentionally differ in text width and density. They are design choices, not publisher specifications. Very long unbreakable formulas still require author line breaking. Explicit margin/stretch/paragraph keys override preset values. `hacks` sets stretch 1.075, indent 1.75 em, paragraph skip zero, emergency stretch 2 em, display-break level 2, and ragged bottom; explicit individual keys take precedence. `layout=legacy` is available for article/amsart, but no layout option implicitly changes bibliography typography.

## Fonts and mathematical alphabets

`font=latinmodern` loads Latin Modern text/math and preserves the historical CM calligraphic, BBOLDX blackboard, Dutch Calligraphic script, and Zapf Chancery alphabets. `font=pazobiolinum` loads `mathpazo[sc,noBBpl]`, Type 1 Biolinum scaled 1.085 and Inconsolata scaled 1.03; calligraphic mathematics uses STIX. All are TeX Live fonts, with no private system-font dependency.

Both named configurations provide `\mathbb`, `\mathbfbb`, `\mathcal`, `\mathbfcal`, `\mathscr`, `\mathbfscr`, `\mathpzc`, and the standard fraktur/sans/typewriter alphabets. Bold blackboard/calligraphic/script use the corresponding bold math version without allocating three additional permanent families. To customize them, set the regular alphabet’s bold version with `\SetMathAlphabet`, or redefine the public bold alias; the aliases themselves are no longer separately allocated NFSS alphabets. Nested matrices retain live alphabet assignments. `\boldsymbol` comes from AMS mathematics; `\bm` requires `math-tools`. The old eager bm package also replaced `\boldsymbol`; select `math-tools` to retain that exact legacy operator spacing. The minimal AMS implementation can produce slightly different spacing in compound bold expressions, while retaining the same glyph faces.

`font=inherit` changes none of these alphabets and creates no replacement for an absent script/bold alphabet. Load the desired font provider yourself. pdfTeX still has a 16-family limit: adding many external symbol/alphabet packages can exhaust it; select only the symbol facilities you use. Adding `bbm,vectors,upright-greek` and using every alphabet in the same document can raise the explicit “Too many math alphabets” error; no glyph is silently substituted. The optional bbm font may be Type 3, while the named-font core uses Type 1 fonts.

## Theorems, proofs and numbering

Article/amsart use amsthm-compatible declarations. All 51 historical numbered families share `theorem`, normally reset by section. The family declarations in `eudoxus.sty` include theorem, lemma, definition, remark, criterion, informaltheorem, metatheorem, solution, discussion and syntax.

Exactly nine historical unnumbered, non-stepping forms are supplied on the amsthm path: `theorem*`, `lemma*`, `corollary*`, `hypothesis*`, `claim*`, `conjecture*`, `informaltheorem*`, `openproblem*`, `syntax*`. Optional titles remain supported. Headers are small caps with a 1.75 em indent; theorem-like bodies are italic, definition/remark bodies upright. Inherited/legacy layout retains the old 2.5 pt theorem spacing.

`proof` remains backend-owned. `proofsketch[optional suffix]`, `proofidea[optional suffix]`, and `proofofclaim[optional suffix]` reuse it. `\setqedsymbol{...}` and `\SetQEDSymbol{...}` change its active public symbol. With amsthm, use `\qedhere` for a suitable display ending; no extra automatic QED is inserted.

The preamble helpers `\edxnewtheoremsection{name}{Heading}`, `\edxnewtheoremsibling{name}{Heading}`, and `\edxnewtheoremstar{name}{Heading}` remain. On amsthm, these helpers honor the active `\theoremstyle`; duplicate names are errors. Custom singular/plural reference spelling can be supplied through the selected provider's public commands. Occupied theorem names error rather than being deleted; use `theorems=inherit` for document-owned declarations.

SIAM owns its five native families, shared counter, proof implementation, and typography. `theorems=extended` adds only missing families with `\newsiamthm`/`\newsiamremark`. Native ntheorem automatically creates starred companions; **those retain SIAM's stepping behavior**, unlike the nine amsthm stars. Their use emits a warning explaining this distinction. No native SIAM environment is redeclared. Use class `onethmnum` for continuous numbering, rather than eudoxus reset options. SIAM's native definition body remains italic. `\SetQEDSymbol` targets the active ntheorem proof symbol only when explicitly called.

## References

Ordinary `\label`/`\ref` need no optional provider. The reference selector loads hyperref only when requested; existing options, colors and PDF metadata are preserved.

```latex
\usepackage[references=cleveref]{eudoxus}
% In the document:
\begin{lemma}\label{lem:a}A statement.\end{lemma}
See \cref{lem:a}; \Cref{lem:a} begins a sentence.
```

Native zref labels are a separate store:

```latex
\usepackage[references=zref]{eudoxus}
\zcsetup{labelhook=false} % demonstrate independent stores explicitly
% In the document:
\begin{lemma}\label{lem:a}\zlabel{zlem:a}A statement.\end{lemma}
Ordinary value \ref{lem:a}; native value \zref{zlem:a}; \zcref{zlem:a}.
```

`references=both` supports both systems. No cleveref facade is installed. Shared-counter family types are registered through public provider APIs. For the shared theorem families, hyperlink identities are distinct from displayed numbers; a heading target stays with its statement at page boundaries. Recompile external-reference partners after migrating anchor names. Reference packages retain their own loading-order rules (AMS mathematics before cleveref; hyperref before cleveref). Caller reference names set after eudoxus win; pre-existing cleveref names and explicit zref type names are retained. English zref names are language defaults, without selecting a document language; configure other languages through zref-clever’s public language/type interface.

`references=legacy` selects zref-clever/vario, capitalized names, section-sign names, breakcites and page backreferences, including historical `\backref`/`\backrefalt` rendering. It does not restore forced colors or metadata. Use `\texorpdfstring{mathematics}{plain text}` for mathematical titles/bookmarks rather than relying on broad global PDF-string substitutions.

## Paragraphs, titles and bibliography

`\parhead{...}` and `\subparhead{...}` explicitly start small-caps run-in headings. A final period is added only when the purified heading does not end in `.`, `?`, `!`, or `:`. Original tokens are typeset once; formatting, expandable macros and mathematics are supported. Opaque nonexpandable macros may require explicit punctuation. The following text is not consumed.

Article presets select these renderers for `\paragraph`/`\subparagraph`. Their star/optional arguments are accepted for source tolerance; these convenience renderers do not create numbered/TOC paragraph entries. Choose `paragraphs=inherit` for full native sectioning. AMS/SIAM always retain native paragraph commands; explicit parhead helpers remain available.

`titlepatch` is separate from layout. Renewable hooks are `\edxsectionheadingfont`, `\edxdocumenttitlefont`, `\edxparheadingfont`, and `\edxsubparheadingfont`. It is article-only. Native titlepage classes keep their titlepage renderer. Author-supplied long unbreakable title/author material may need explicit line breaks.

`bibliography=compact` selects small bibliography text and compact list spacing. `legacy` additionally selects line stretch 1.075, independently of geometry. SIAM requires inheritance. Neither selects citations or a bibliography processor. Native BibTeX/natbib/biblatex workflows remain document-owned; inheritance is the least intrusive choice. Use the bibliography setup required by your class.

## Optional dependency groups

These are exact direct requests; transitive dependencies belong to their providers. A class may already load some packages independently.

| Selection                           | Direct packages                                                                          |
| ----------------------------------- | ---------------------------------------------------------------------------------------- |
| Core mathematics                    | amsmath, amssymb (which loads amsfonts); amsthm for owned theorems                       |
| Latin Modern                        | lmodern                                                                                  |
| Pazo/Biolinum                       | fontenc[T1], mathpazo[sc,noBBpl], biolinum[type1,scaled=1.085], inconsolata[scaled=1.03] |
| Non-inherited layout                | geometry                                                                                 |
| `math-tools`                        | mathtools, bm (no extra preallocated bold families), braket                              |
| `bbm` / `vectors` / `upright-greek` | bbm / esvect / upgreek[Symbol] respectively                                              |
| `graphics`                          | graphicx, adjustbox, afterpage, placeins, wrapfig                                        |
| `table`                             | array, booktabs, colortbl, hhline, makecell, multicol, multirow, tabularray, tabularx    |
| `caption`                           | subcaption (loads caption)                                                               |
| `float`                             | floatrow                                                                                 |
| `lists`                             | enumitem                                                                                 |
| `boxes`                             | framed, mdframed with its ordinary backend                                               |
| `diagrams`                          | tikz                                                                                     |
| `plots`                             | pgfplots (compat=1.18)                                                                   |
| `annotations`                       | marginnote, todonotes, xargs                                                             |
| `microtype`                         | microtype                                                                                |
| `quotes`                            | dirtytalk                                                                                |
| `typography`                        | ulem[normalem], moresize, relsize, soul, titlecaps, xspace, xurl                         |
| `verbatim`                          | comment, fancyvrb, verbatim                                                              |
| `epigraph`                          | epigraph; historical right-aligned italic quotation/small-caps attribution               |
| `ams-addresses`                     | amsaddr[foot]                                                                            |
| `tcs`                               | tcscrypto[notoc], explicitly required to be available                                    |
| `references=hyperref`               | hyperref if absent                                                                       |
| `references=cleveref`               | hyperref, cleveref if absent                                                             |
| `references=zref`                   | hyperref, zref-user, zref-clever                                                         |
| `references=both`                   | all three providers above                                                                |
| `references=legacy`                 | hyperref, zref-user, zref-clever, zref-vario, breakcites, backref[hyperpageref]          |

Todonotes loads TikZ, so annotations are intentionally optional. No bespoke accepted/deleted-text commands are added: eudoxus historically exposed third-party note facilities, not the csmath revision-command API. The package never discards mathematical body arguments in final mode.

## Updating older documents

All 19 source-defined aliases remain recognized:

| Historical spelling          | Translation / correction                                                            |
| ---------------------------- | ----------------------------------------------------------------------------------- |
| nomath                       | math=false; implies inherited fonts/equations and no added theorems/TCS             |
| notheorems                   | theorems=none                                                                       |
| fonts, nofonts               | font=latinmodern, font=inherit                                                      |
| pazobiolinum, nopazobiolinum | font=pazobiolinum, font=latinmodern                                                 |
| tcs, notcs                   | tcs=true/false                                                                      |
| nolayout                     | layout=inherit                                                                      |
| epigraph, noepigraph         | epigraph=true/false                                                                 |
| hacks, nohacks               | hacks=true/false                                                                    |
| amshacks, noamshacks         | ams-addresses=true/false and tags=right/inherit                                     |
| siam, nosiam                 | validate SIAM / no explicit validation; automatic class ownership is never disabled |
| titlepatch, notitlepatch     | titlepatch=true/false                                                               |

Conflicting font aliases give errors. `nomath,fonts` is contradictory. The `tcs` option requires tcscrypto. SIAM's `AM` front-matter environment is preserved; TCS class notation is available as `\ComplexityAM`. Load tcscrypto through `tcs` or after eudoxus, not before its mathematical alphabet initialization.

Historical `\ifeudox...` conditional queries remain resolved snapshots. Their true/false setters now reject late reconfiguration; use package options. `\EudoxusConfiguration{key}` expands to a resolved selector or Boolean value. For dimension/stretch overrides it reports the explicit input, which is empty when the class or layout preset supplies the effective value. Undocumented punctuation-parser helpers are replaced, while `\edxappendpunct`, `\edxeatnewline` and `\edxoriginalepigraph` retain their public call shapes.

Named fonts include their script alphabets; with `font=inherit`, load a script font separately if needed. Supported classes are article, amsart and siamart.

## Class examples

AMS, preserving class formatting and fonts:

```latex
\documentclass[reqno]{amsart}
\usepackage[font=inherit,layout=inherit,references=cleveref]{eudoxus}
\title{An AMS note}\author{A. Author}
\begin{document}\maketitle
\section{Result}\begin{theorem}A statement.\end{theorem}
\begin{proof}An argument.\end{proof}
\end{document}
```

SIAM, with its official class files supplied according to the publisher's distribution terms:

```latex
\documentclass[final,hidelinks]{siamart251216}
\usepackage{eudoxus} % automatic class ownership; no siam alias required
\title{A SIAM note}\author{A. Author}
\begin{document}\maketitle
\section{Result}\begin{theorem}\label{main}A statement.\end{theorem}
\begin{proof}An argument.\end{proof}
See \cref{main}.
\end{document}
```

A complete mathematical-paper example:

```latex
\documentclass[11pt]{article}
\usepackage[layout=balanced,font=pazobiolinum,
  math-tools,graphics,table,lists,microtype,references=both]{eudoxus}
\title{Finite averaging}\author{A. Author}\date{}
\begin{document}
\maketitle
\begin{abstract}A short, self-contained mathematical example.\end{abstract}
\section{An estimate}
\begin{definition}\label{def:average}
For $x_1,\ldots,x_m\in\mathbb{R}^n$, put
$\bar x\coloneqq m^{-1}\sum_i x_i$.
\end{definition}
\begin{theorem}\label{thm:bound}\zlabel{zthm:bound}
The average satisfies $\|\bar x\|^2\leq m^{-1}\sum_i\|x_i\|^2$.
\end{theorem}
\begin{proof}Apply convexity of the squared Euclidean norm.\end{proof}
\parhead{A matrix example}Consider
\[A=\begin{pmatrix}1&0\\0&\lambda\end{pmatrix},\qquad0\leq\lambda\leq1.\]
\begin{figure}[tb]\centering\fbox{A portable schematic}
\caption{A finite averaging domain.}\end{figure}
\begin{table}[tb]\centering
\begin{tabular}{lr}\toprule Operator&Rank\\\midrule
Identity&2\\Projection&1\\\bottomrule\end{tabular}
\caption{Two examples.}\end{table}
Both \cref{thm:bound} and \zcref{zthm:bound} refer to the estimate.
\appendix\section{Notes}See also~\cite{example}.
\begin{thebibliography}{1}
\bibitem{example}A. Example, \emph{Finite-dimensional averaging}, 2026.
\end{thebibliography}
\end{document}
```

## Installation

Vendor `eudoxus.sty` beside the main source. Use pdfLaTeX with shell escape disabled; include ordinary PDF/PNG/JPG figures and all nonstandard styles. For BibTeX, include the generated `.bbl` along with the source bibliography. Include `.ind` if your document independently uses indexing. Eudoxus performs no network access, external conversion, shell command, Python/Lua execution, or automatic bibliography/index generation.

Author: Agni Datta. License: LPPL 1.3c. Independently maintained within [csLaTeX](https://github.com/agni-datta/csLaTeX).
