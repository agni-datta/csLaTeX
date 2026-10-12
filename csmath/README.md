<!-- @format -->

# csmath

A mathematical foundation with explicit font selection, theorem integration through `csthm`, and optional manuscript utilities. Author: Agni Datta. License: LPPL v1.3c. Version 1.2.1.

Requires LaTeX 2022-06-01 or newer, pdfLaTeX or LuaLaTeX, and `csthm` 4.2.1 or newer. Distribute **both** `csmath.sty` and `csthm.sty`. XeLaTeX is not supported. Documents select their own languages.

```latex
\documentclass{article}
\usepackage{csmath}
\begin{document}
\section{Introduction}
\parhead{Motivation}The invariant holds.
\begin{theorem}[Invariant]The state remains valid.\end{theorem}
\begin{proof}Induction on the number of steps.\end{proof}
\end{document}
```

## Defaults and modes

The defaults are `mode=article`, `font=inherit`, `font-policy=compatible`, `theorems=oldschool`, `numberwithin=section`, `equations=inherit`, `paragraphs=runin`, `cleveref=auto`, `compatibility=none`, `counters=independent`, `families=standard`, `starred=unnumbered`, `appearance=modern`, empty `family-style`, and **all feature options disabled**. An already-loaded `csthm` is inherited by default. Book and venue change the defaults indicated below.

| Mode         | Behavior                                                                                                                                                                                                                                                                                                                                |
| ------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `article`    | Mathematical foundation, oldschool theorems numbered by section, run-in paragraph headings. No margins, title/section style, or page-style changes by default.                                                                                                                                                                          |
| `manuscript` | Same minimal foundation and numbering as article; explicitly usable with article-based classes. No chapter or book infrastructure implied.                                                                                                                                                                                              |
| `book`       | Requires both `\chapter` and its counter. Defaults to chapter theorem numbering. Run-in paragraphs; class title, TOC, sections and page layout remain until `layout` is enabled.                                                                                                                                                        |
| `venue`      | Inherits class theorem and paragraph ownership. No `csthm` load by default. Font defaults to inherit. No publisher-specific formatting. Explicit feature and font selections still take effect. With references, class hyperlink colors and structural reference names are retained. With caption, class caption settings are retained. |

```latex
% Ordinary article:
\usepackage[mode=article]{csmath}
% Article-based full version, with selected conveniences:
\usepackage[mode=manuscript,font=palatino,theorems=normal,table,caption,float]{csmath}
% Chapter-based class, retaining its page layout:
\usepackage[mode=book,font=libertine,theorems=oldschool]{csmath}
% Class-owned theorem and paragraph systems:
\usepackage[mode=venue]{csmath}
```

## Complete option reference

Every selection is validated. Repeated identical values are harmless; contradictory values, unknown keys, invalid choices, and values on bare font aliases are errors. Options cannot reinitialize an already loaded package.

| Option                | Accepted values                                                                                      | Default / effect                                                                    |
| --------------------- | ---------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- |
| `mode`                | `article`, `manuscript`, `book`, `venue`                                                             | `article`; see above                                                                |
| `font`                | `inherit`, the eight names below                                                                     | `inherit`; initialized once                                                         |
| Bare font name        | `baskervaldx`, `concrete`, `garamond`, `gfsdidot`, `kpfonts`, `latinmodern`, `libertine`, `palatino` | Alias for `font=name`; no value allowed                                             |
| `font-policy`         | `compatible`, `strict`                                                                               | `compatible` warns on the four documented pdfLaTeX fallbacks; strict errors instead |
| `theorems`            | `normal`, `fancy`, `oldschool`, `none`, `inherit`                                                    | `oldschool`, except venue or a preloaded csthm default to inherit                   |
| `numberwithin`        | `section`, `chapter`, `none`                                                                         | `section`; book defaults to `chapter`; explicit requests must match preloaded csthm |
| `equations`           | `inherit`, `section`, `chapter`, `none`                                                              | `inherit`; independent of theorem numbering; chapter requires chapter counter       |
| `paragraphs`          | `runin`, `inherit`                                                                                   | `runin`, except venue inherits                                                      |
| `cleveref`            | `auto`, `true`, `false`; bare means true                                                             | `auto`; references makes auto immediate; preloaded csthm policy is respected        |
| Feature options below | Bare, `=true`, `=false`                                                                              | All false                                                                           |
| `draft`               | Bare, `=true`, `=false`                                                                              | false; true also enables annotations                                                |
| `final`               | Bare only                                                                                            | Selects draft=false; does not disable an explicitly enabled annotations feature     |
| `sanshdr`             | Bare, `=true`, `=false`                                                                              | false; true implies layout and makes title/section/paragraph fonts bold sans        |
| `lastpage`            | Bare, `=true`, `=false`                                                                              | false; true implies layout; book header displays page/last-page                     |

`numberwithin` configures csthm-owned theorems; it does not alter a class-owned theorem system under `theorems=inherit`. `lastpage` changes only the optional book header. `draft,annotations=false` and `lastpage,layout=false` are contradictory requests.

## Selective feature loading

```latex
\usepackage[table,caption,float]{csmath}
\usepackage[references,lists,boxes]{csmath}
\usepackage[mode=book,layout,index,microtype,font=palatino]{csmath}
```

| Feature       | Direct packages / configuration                                                                                                                                                                                                                        |
| ------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `table`       | `xcolor[dvipsnames,table,x11names]`, `array`, `booktabs`, `tabularx`, `longtable`, `multirow`, `makecell`, `threeparttable`, `tabularray`. Professional rules, flexible-width and multipage tables, cells, notes, and `tblr`. Does not imply captions. |
| `caption`     | `caption`, `subcaption`. Includes `subfigure`/`subtable`. Outside venue: roman small text, small-caps labels, period separator, 5pt skip, justified captions.                                                                                          |
| `float`       | `floatrow`; provides `\ffigbox`, `\ttabbox`, float layouts. It loads `caption3` and `rotating` transitively but does not imply the caption feature. Use floatrow's interface, not a conflicting float implementation.                                  |
| `graphics`    | `graphicx`, `adjustbox`. No TikZ or PGFPlots.                                                                                                                                                                                                          |
| `lists`       | `enumitem`, `paralist[oldenum,olditem]`; compact lists. Enumerate labels `(1)`, `(i)`, `(I)`; book uses `(a)` at level two. Itemize uses bullet/circle/star. No list setting changes without the feature.                                              |
| `references`  | `hyperref`, `nameref`, `xurl`, `xr`; immediate `cleveref` unless false. SteelBlue4 links and section-sign structural references outside venue. Existing hyperref and cleveref are reused without additional load options.                              |
| `layout`      | `geometry[margin=1in]`, `titlesec`, `titling`, `authblk[auth-sc]`, `setspace`, `emptypage`, `moresize`, `multicol`. Book adds `fancyhdr`, `etoc`, `tocbibind[nottoc]`; `lastpage` adds its package in book. No implicit layout in any mode.            |
| `microtype`   | `microtype`; legacy protrusion/expansion settings, factor 1500 and stretch/shrink 30.                                                                                                                                                                  |
| `index`       | `imakeidx[makeindex,noautomatic]`; two-column index included in TOC. Run `makeindex` yourself; LaTeX compilation never requires shell escape.                                                                                                          |
| `annotations` | Named `xcolor` colors, `marginnote`, `ulem[normalem]`; inline annotations and margin stars in draft mode.                                                                                                                                              |
| `boxes`       | `framed`; split-capable `nestedbar` and ordinary framed environments. No tcolorbox or TikZ.                                                                                                                                                            |
| `quotes`      | `csquotes[autostyle=true,csdisplay=true]`, `dirtytalk`, `soul`, `ulem[normalem]`, `xspace`. Quotation and emphasis helpers. Does not load or select a language.                                                                                        |

A full-featured article example:

```latex
\documentclass{article}
\usepackage[mode=manuscript,font=palatino,theorems=normal,
  table,caption,float,graphics,lists,references,layout,microtype,
  index,boxes,quotes,draft]{csmath}
\docufont{parhead=boldsans,subparhead=smallcaps}
\title{Full version}\author{Author}\date{2026}
\begin{document}
\maketitle
\section{Introduction}
\parhead{Motivation}A \term{protocol} preserves the invariant.
\todo{Complete the bound.}
\begin{nestedbar}An explanatory block.\end{nestedbar}
\end{document}
```

## Fonts and mathematical alphabets

| Requested font | pdfLaTeX effective configuration                     | LuaLaTeX effective configuration                                                      |
| -------------- | ---------------------------------------------------- | ------------------------------------------------------------------------------------- |
| `inherit`      | Class/user fonts; no font initialization             | Class/user fonts; no fontspec or unicode-math initialization                          |
| `baskervaldx`  | Baskervaldx text, newtxmath; Biolinum/Inconsolata    | Baskervaldx text and math letters; KP Math base; Libertinus Sans/Inconsolata          |
| `concrete`     | **Warning + Latin Modern**, or strict error          | CMU Concrete text, Euler Math; New Computer Modern sans/mono                          |
| `garamond`     | **Warning + Latin Modern**, or strict error          | Garamond Libre text and math letters; Garamond Math base                              |
| `gfsdidot`     | **Warning + Latin Modern**, or strict error          | GFS Didot text and regular/bold math letters; KP Math base                            |
| `kpfonts`      | **Warning + Latin Modern**, or strict error          | `kpfonts-otf[nosf,noDcommand,fakedscripts]`; Libertinus Sans/Inconsolata text         |
| `latinmodern`  | `lmodern` and AMS mathematics                        | Latin Modern text, sans, mono and Math                                                |
| `libertine`    | Libertine Roman with newtxmath; Biolinum/Inconsolata | Libertinus Serif text and math letters over Pagella Math; Libertinus Sans/Inconsolata |
| `palatino`     | `mathpazo[sc,noBBpl]`; Biolinum/Inconsolata          | TeX Gyre Pagella X text and Pagella Math; Libertinus Sans/Inconsolata                 |

The common named-font loader uses `fontenc[T1]`, `sansmath` and `bm` with pdfLaTeX; LuaLaTeX uses `fontspec`, `sansmath`, `mathtools` and `unicode-math`. The inherited configuration initializes none of these font packages.

All named configurations retain lining/tabular numeral requests. OpenType faces are resolved through fontspec by distributed filenames, with an explicit missing-file error and no unrelated substitution. KP Fonts uses its native loader. Files must be installed in the TeX distribution; local OS font names are not assumed. `\CsmathSelectedFont` and `\CsmathEffectiveFont` expose the distinction between a request and its realized configuration.

Named fonts use CM calligraphic for Latin Modern/Concrete, STIX calligraphic for the other families, STIX blackboard alphabets (BBOLDX upright for Palatino), and Dutch script. Public alphabets are `\mathcal`, `\mathbfcal`, `\mathbb`, `\mathbfbb`, `\mathbbi`, `\mathbfbbi`, `\mathscr`, `\mathbfscr`, `\mathsf`, and `\mathtt`. Palatino has STIX italic blackboard forms as well as its established BBOLDX upright forms. Under inherit, existing alphabets are left intact; using an unavailable extended alphabet produces an explanatory error instead of silently selecting a different font.

pdfLaTeX loads `bm` after font setup, with `bmmax=0`, `hmmax=0` if not already supplied. Local math-family reuse is disabled (`localmathalphabets=0`) because nested matrices can otherwise change earlier glyphs in a formula. Bold calligraphic, script and blackboard helpers reuse their declared bold versions through `\boldsymbol`; `\mathbf` uses `\boldsymbol{\mathrm{...}}`. This also bolds Greek input, unlike traditional pdfTeX's Latin-only `\mathbf`. pdfTeX still has a hard 16-family limit; documents using further custom alphabets may need LuaLaTeX. LuaLaTeX uses unicode-math bold facilities. The Concrete profile requires an Euler Math font containing mathematical italic Greek. The KP profile requires a `kpfonts-otf` release providing its `fakedscripts` option. Euler, Latin Modern, Garamond and Pagella math bases retain the legacy synthetic bold/slant settings where no separate bold math face is selected; KP Math uses its supplied bold face. Mathematical sans/mono settings retain the original per-font choices; KP Fonts retains its native mathematical sans/mono alphabets. Latin Modern uses its actual bold sans/mono faces; LuaLaTeX mono bold uses `lmmonolt10-bold.otf` and its bold oblique companion.

A named selection is authoritative. The resolver executes once; `\docufont` cannot switch body or mathematics fonts. Later font packages can of course override a document's fonts, so load them deliberately. `inherit` is the safest choice for classes with their own font policy.

## Theorems and references

`normal` is ruled, `fancy` uses colored headers and tinted frames, and `oldschool` is unframed. `normal` and `fancy` load mdframed's TikZ backend; oldschool does not. See [csthm](../csthm/README.md) for theorem environments and symbol settings.

`theorems=none` loads csthm in auxiliary mode: proof, case, accent and symbol controls remain, but no named theorem families or extra proof helpers are declared. `theorems=inherit` does not load csthm and leaves a class/user theorem system untouched. A preloaded csthm defaults to inheritance; explicit incompatible styles, numbering, or cleveref policies are rejected. With no preloaded csthm, the default defines all 45 csthm families, starred variants, `proofsketch`, `proofidea`, and `proofofclaim`. Ordinary `\ref` needs no optional reference feature. The legacy inline `\qedhere` helper is supplied when csthm is active; it places the current QED at the right margin and suppresses the automatic mark. It is not the full amsthm display-placement implementation.

```latex
\usepackage[oldschool]{csthm}
\usepackage{csmath} % inherits that configuration
```

`cleveref=auto` loads cleveref at `begindocument/before` only if hyperref is present. `true` makes its commands available during the preamble; load hyperref first if it will be used. `false` prevents implicit cleveref loading. The references feature loads hyperref before theorem setup and makes auto immediate. Existing cleveref options remain untouched. Use `\hypersetup` to change link settings. csthm registers theorem names independently; lowercase `\cref` and title-case `\Cref` are distinct.

Supported orders include hyperref → csmath, csmath → hyperref → cleveref, and amsmath → hyperref → cleveref → csmath. cleveref before amsmath or hyperref after cleveref is diagnosed. References does not force bibliography backreferences, metadata, PDF version, or a language. If the caller enables hyperref's pagebackref, the legacy “Cited on p./pp.” callbacks are configured. Use `\hypersetup` for document metadata.

**Numbering migration:** modern defaults use independent counters, while both legacy packages shared `theorem` and reset by section, including in books. Use `compatibility=legacy-article` or `compatibility=legacy-book` for historical theorem semantics. These profiles also reproduce the 42 numbered, stepping starred aliases; ordinary modern stars remain unnumbered and non-stepping. Seven restored families are available through `families=extended`.

## Theorem settings

These options control theorem numbering and appearance.

| Option          | Values/default                                      | Effect                                                                            |
| --------------- | --------------------------------------------------- | --------------------------------------------------------------------------------- |
| `compatibility` | `none` (default), `legacy-article`, `legacy-book`   | The theorem bundle below; contradictory explicit choices fail.                    |
| `counters`      | `independent` (default), `shared`                   | Forward to csthm; shared adds `aliascnt` only.                                    |
| `families`      | `standard` (default), `extended`                    | 45 or 52 family pairs.                                                            |
| `starred`       | `unnumbered` (default), `legacy`                    | Non-stepping stars, or the historical 42 numbered/stepping stars.                 |
| `appearance`    | `modern` (default), `legacy-article`, `legacy-book` | Group fonts/symbols/membership; article requires oldschool, book requires normal. |
| `family-style`  | Empty; nested group settings                        | `head-font`, `body-font`, `start-symbol`, `end-symbol` through csthm.             |

`legacy-article` selects `mode=article,theorems=oldschool,numberwithin=section,counters=shared,families=extended,starred=legacy,appearance=legacy-article`. `legacy-book` selects the same policies with `mode=book,theorems=normal,appearance=legacy-book`. Book still requires a chapter-capable class. Neither selects the historical Latin Modern font default or eager feature dependencies. Select the required font and features explicitly.

```latex
\usepackage[compatibility=legacy-article,font=latinmodern]{csmath}
% Or select only modern shared numbering:
% \usepackage[counters=shared,numberwithin=none]{csmath}
\docufont{theoremhdr=bold,definitionbody=normal}
\CsthmSetupFamily{definition}{start-symbol=\CsthmStartMark}
```

Preloaded csthm settings are inherited unless explicitly requested. Conflicting counter/family/star/appearance/numbering/reference/style requests fail. Without csthm ownership, theorem-specific settings fail rather than changing a class’s theorem system. `family-style` is passed before new theorem declarations; a preloaded csthm receives only preamble typography updates through its public API.

## Retired wrappers

`csamsmath` and `csbook` have been removed. Load `csmath` directly and select
its article or book mode. Do not load the old wrappers together with csmath.

```latex
% Article with selected document features:
\usepackage[mode=article,font=palatino,references,layout]{csmath}
% Book with selected document features:
\usepackage[mode=book,font=palatino,theorems=normal,
  references,layout,index]{csmath}
```

To retain historical theorem numbering and appearance, use one of these
profiles and add the font and features the document needs:

```latex
\usepackage[compatibility=legacy-article,font=latinmodern,
  equations=section,references,layout,lists]{csmath}
% For a chapter-capable class:
\usepackage[compatibility=legacy-book,font=latinmodern,
  equations=section,references,layout,lists,index]{csmath}
```

These alternatives belong in separate documents. They preserve the selected
historical theorem profile without automatically enabling every convenience.
The wrappers' tcolorbox libraries, xpatch, verbatim and timestamp footer are
no longer loaded automatically; documents using them load those packages
explicitly. Use `\SetTheoremEndSymbol{...}` in place of the wrapper aliases
`\thmendsymb` or `\commonsymb`, and `\SetTheoremStartSymbol{...}` in place of
`\commonstartsymb`.

## Paragraphs, structure and public helpers

`\parhead{title}` gives a bold run-in heading; `\subparhead{title}` uses small caps. Both begin a paragraph with a small vertical skip, add a period unless the purified title ends in `.`, `?`, `!`, or `:`, and insert 0.30em before following text. Expandable title macros and ordinary formatting commands such as `\textbf` are handled; the original title is typeset once. Opaque, non-expandable custom commands may need explicit punctuation outside the command.

In runin mode, `\paragraph` and `\subparagraph` accept starred and optional-short-title forms; their titles are unnumbered run-in text and the short title is ignored. `paragraphs=inherit` preserves class behavior while keeping parhead/subparhead available. Venue inherits by default.

`\docufont{keys}` is preamble-only. It supports `parhead`, `parheadfont`, `subparhead`, `subparheadfont`; with layout, also `section`, `sections`, `subsection`, and `subsubsection`. Values are font switches or `normal`, `roman`, `bold`, `italic`, `italics`, `smallcaps`, `sans`, `boldsans`. Partial calls retain omitted settings. The theorem keys `theoremhdr`, `theorembody`, `definitionhdr`, `defintionhdr` (historical spelling), `definitionbody`, `remarkhdr`, `remarkbody`, `highlighthdr`, and `highlightbody` call csthm’s public group styling API. They require theorem ownership. In legacy book appearance, replacing `definitionhdr` also clears its diamond, matching the historical combined header macro; direct `\CsthmSetupFamily` keeps font and symbol independent.

Core `\Pr` intentionally uses `\mathop{\mathsf{Pr}}`. It is set during package loading, so later `tcscrypto` may replace it with that package's operator and limit policy. `\annotation{text}` is a plain footnote and retains the native footnote interface. Unicode math aliases `\leadsto` and `\square` are bound at begin-document when unicode-math is loaded, after its symbols have initialized.

With boxes, `\begin{nestedbar}[width] ... \end{nestedbar}` supports nesting and page splits (default width `\hsize`). With index, `\term{text}` writes an index entry and italicizes the text. These do not load their dependencies on first use; term diagnoses a disabled feature.

With layout, the retained font-setting commands are `\partfont`, `\partlabelfont`, `\chapterfont`, `\chapterlabelfont`, `\sectionfont`, `\sectionnumfont`, `\subsectionfont`, `\subsubsectionfont`, `\titlefont`, `\subtitlefont`, `\authorfont`, `\institutefont`, and `\datefont`. They accept font switches. `\subtitle` and `\institute` store text displayed on the optional title; `\goldenunit` controls book-title spacing. Book layout applies ruled part/chapter headings, small-caps section/TOC typography, running headers and the legacy title design. Article/manuscript layout uses the legacy article section/title conventions. Chapter/part controls affect the book design; title and section controls affect their respective layouts. Avoid layout with classes whose heading system must remain authoritative.

With annotations, `\added`, `\changed`, `\missing`, `\removed`, `\citelater`, `\fixme`, `\notes`, `\query`, and `\todo` accept one argument. Arguments may contain paragraphs. Draft shows colored text and margin stars; removed content has a colored “Removed” label, supporting mathematics and paragraphs without fragile strikeout processing. **Final retains the argument of `\added` and `\changed` as accepted text.** `\changed` has one mandatory argument, not old/new arguments. Removed content and other editorial commands disappear. `\XXX[label]` shows a flag in draft and errors in final. `\newguymarker{name}{initials}{color}` accepts a command name with or without a backslash and creates an author annotation. Disabled annotation commands explain which feature to enable. Margin notes remain subject to normal narrow-margin/float placement constraints.

## Loading with other packages

Load csmath before tcscrypto and csextras. Use `theorems=inherit` with a class or package that already defines its theorem environments. Eudoxus provides a separate mathematical framework and cannot be loaded with csmath.

`\CsmathConfiguration{key}` returns a resolved option. `\CsmathCheckConfiguration{options}` checks requested settings against an existing configuration; cslecture uses these commands when csmath is already loaded.
