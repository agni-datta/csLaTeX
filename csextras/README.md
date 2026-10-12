<!-- @format -->

# csextras 2.0

Explicit optional features for mathematical and TCS documents. Requires LaTeX 2022-06-01 or later. Supports pdfLaTeX and LuaLaTeX; XeLaTeX is rejected. Optional dependencies can require a newer kernel.

A blank `\usepackage{csextras}` loads only xcolor and supplies the historical
seven-color palette and `\SetExtraColor{name}{color}`. It selects no fonts,
theorems, layout, citation backend, reference provider, index or algorithm.
Standalone features do not require csmath.

```latex
\documentclass{article}
\usepackage[references,table,index]{csmath}
\usepackage{tcscrypto}
\usepackage[algorithm,extratables,index,siunitx,references=both]{csextras}
\begin{document}
\section{Procedure}
\begin{algorithm}
  \caption{A procedure}\label{alg:first}\zlabel{zalg:first}
  \begin{codelines}[1]
    \item\label{line:init}\zlabel{zline:init} Initialize $x=1$.
    \item Return $x$.\codecomment{The accepted result.}
  \end{codelines}
\end{algorithm}
See \cref{alg:first,line:init} and \zcref{zalg:first,zline:init}.
\end{document}
```

## Configuration

All Boolean options default to false. A bare name means true; `=false` disables
it. Identical repetitions work. Unknown keys, invalid/missing values,
contradictions and unavailable prerequisites produce errors. Explicit requests
never silently disappear. Third-party packages must be installed when selected.

Csmath must precede csextras for features depending on its resolved mode or
already initialized providers. Detection uses only `\CsmathConfiguration{mode}`
and `\CsmathCheckConfiguration{...}`. Article and manuscript both support the
article conveniences. Book features also require actual chapter support.
Lecture modes are recognized by their resolved csmath configuration.
A request cannot turn on a csmath feature after initialization: select `table`
or `index` on csmath first. Indexed article documents select `index=true`
on csmath, plus their required font and features. Csextras cannot change
the initialized configuration. No separate font/theorem resolver exists here.

Venue inheritance rejects layout, beautify, figureposition, footnotes,
informalheaders, titlepage, tocspacing, numbering, crazynumbering, tightcaptions,
parskip, indentfirst, tocbibind, abstract and epigraph. Independent utilities
remain available.

## Options and direct dependencies

The packages below are direct feature requests; those packages may load their
own dependencies. An existing compatible provider is reused. Default xcolor
applies to every row. No broad xcolor palette options are forced.

| Option                                            | Effect and direct packages                                                                                                                                                                                              |
| ------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `acknowledgements`                                | Both acknowledgement spellings; local heading fallback, existing environment preserved. No extra package.                                                                                                               |
| `algorithm`                                       | `newfloat`, `codelines`; optional algorithm float only.                                                                                                                                                                 |
| `algorithmtwoe`                                   | Explicit alternative: `algorithm2e[algonl,boxed,longend,vlined]`, historical styling. Conflicts with algorithm.                                                                                                         |
| `beautify`                                        | Caption label color/font; requires an already selected `caption` provider.                                                                                                                                              |
| `bibliography`                                    | BibTeX helpers; `setspace`. Conflicts with biblatex.                                                                                                                                                                    |
| `boxes`                                           | `mdframed`, ordinary backend when not already configured; five local box styles. No implicit TikZ.                                                                                                                      |
| `epigraph`                                        | `epigraph`; styled quotation and dedication. Quotation respects local width.                                                                                                                                            |
| `exercises`                                       | `exercises[exercisenumberformat=Roman]`; requires unoccupied exercise and solution names.                                                                                                                               |
| `extralists`                                      | `enumitem`; legacy mathematics uses `amssymb` if needed. Unicode mathematics uses its square and a local `pifont` checkmark (Garamond-Math lacks that glyph). Four local list types; document math fonts are unchanged. |
| `extramath`                                       | `nicefrac`, `mleftright`, `upgreek` (Symbol on pdfLaTeX), `bbm`, `bm`, `braket`, `esvect`; mathpzc/mathsc/mathbi helpers without replacing existing definitions.                                                        |
| `extratables`                                     | With csmath: validate table=true. Standalone: `array,booktabs,longtable,makecell,multirow,tabularx`. Both add `rotating[figuresright],ltxtable`.                                                                        |
| `figureposition`                                  | Float fractions .92/.82/.06/.78 and top/bottom/total counts 3/2/4. No package.                                                                                                                                          |
| `footnotes`                                       | `bigfoot`, `footnote`, `footmisc[bottom,multiple,hang]`; explicit global footnote presentation.                                                                                                                         |
| `forest`                                          | `forest[linguistics]`; diagrams only when selected.                                                                                                                                                                     |
| `glossary`                                        | `glossaries[acronym,toc]`; author runs makeglossaries explicitly.                                                                                                                                                       |
| `hyperrefcolors`                                  | `hyperref` if absent; explicitly set cite/link/URL color to accentcolor, retaining other settings. Does not force colorlinks.                                                                                           |
| `hyperxmp`                                        | Preamble-time `hyperref` then `hyperxmp`. Rejects native DocumentMetadata, which disables hyperxmp itself.                                                                                                              |
| `index`                                           | Csmath index=true or standalone `imakeidx[makeindex,noautomatic]`; never starts an external process.                                                                                                                    |
| `layout`                                          | Bare/true means balanced; false means none. See presets below.                                                                                                                                                          |
| `listings`                                        | `listings`; historical small monospaced, colored, numbered framed presentation.                                                                                                                                         |
| `loadmacros`                                      | Read settings.tex, macros.tex, commands.tex in the preamble with ordinary catcodes. All three must exist.                                                                                                               |
| `metadata`                                        | `datetime2`, `hyperref` if absent; `marginnote` only for a new standalone marker provider. Existing newguymarker remains authoritative.                                                                                 |
| `minted`                                          | Explicit `minted`, friendly style. Requires configured external latexminted support; never enables execution.                                                                                                           |
| `nowarning`                                       | Deprecated acknowledgment only; warns that diagnostics remain enabled.                                                                                                                                                  |
| `numbering`                                       | Section numbering depth 3 and TOC depth 2; no equation changes.                                                                                                                                                         |
| `orcid`                                           | `orcidlink`.                                                                                                                                                                                                            |
| `pdftools`                                        | `pdfpages`, `pdflscape`.                                                                                                                                                                                                |
| `siunitx`                                         | `siunitx`; mathematical units, separate uncertainties and single range units. Standalone.                                                                                                                               |
| `tcscrypto`                                       | Explicit local tcscrypto; uses notoc in venue mode. Load csmath first when used.                                                                                                                                        |
| `tikz`                                            | `tikz,tikz-cd,tikzscale,pgfplots` (compat=1.18); historical diagram libraries.                                                                                                                                          |
| `tocbibind`                                       | `tocbibind[nottoc]`.                                                                                                                                                                                                    |
| `verbatim`                                        | `verbatim,fancyvrb`; native line processing is preserved.                                                                                                                                                               |
| `watermark`                                       | `draftwatermark,prelim2e`; draftwarning and preliminary footer.                                                                                                                                                         |
| `zcref`                                           | Legacy alias selecting native zref; upgrades references=cleveref to both.                                                                                                                                               |
| `abstract`                                        | Article/manuscript csmath; explicit run-in abstract and TOC entry.                                                                                                                                                      |
| `amsaddr`                                         | Actual amsart/amsbook only; `amsaddr[foot]`.                                                                                                                                                                            |
| `informalheaders`                                 | Article/manuscript csmath; `titlesec`, colored sans-serif headings.                                                                                                                                                     |
| `titlepage`                                       | Article/manuscript csmath; `titling,authblk`. Conflicts with cslecture title ownership.                                                                                                                                 |
| `tocspacing`                                      | Article/manuscript csmath; `tocloft[titles]`, explicit fonts and spacing.                                                                                                                                               |
| `chapterabstract`                                 | Chapter-capable csmath book mode; quotation/TOC helper.                                                                                                                                                                 |
| `lettrine`                                        | Chapter-capable csmath book mode; `lettrine`, dropcap helper.                                                                                                                                                           |
| `crazybib`                                        | `natbib[round,sort,numbers,sectionbib]`, `chapterbib[sectionbib]`; reuses preloaded providers. Rejects cite and biblatex.                                                                                               |
| `crazynumbering`                                  | Section depth 5, TOC depth 6; conflicts with numbering.                                                                                                                                                                 |
| `indentfirst`                                     | `indentfirst`; explicit first-paragraph indentation.                                                                                                                                                                    |
| `nagmode`                                         | `nag[l2tabu,orthodox]`, `onlyamsmath[all,error]`; explicit strict diagnostics.                                                                                                                                          |
| `parskip`                                         | `parskip`; explicit global paragraph spacing.                                                                                                                                                                           |
| `tightcaptions`                                   | Historical belowcaptionskip=-8pt and float spacing 4pt with documented stretch/shrink in source; venue-rejected.                                                                                                        |
| `todonotes`                                       | `todonotes`, marginparwidth=2cm; requires unoccupied todo. Do not combine with csmath-owned annotations.                                                                                                                |
| `copyright=none\|footnote\|page`                  | Default none. Author/date notice or explicit copyright page. No license is assigned to the content.                                                                                                                     |
| `lipsum=none\|paragraph\|content`                 | Default none; `lipsum` or `duckuments`.                                                                                                                                                                                 |
| `references=none\|hyperref\|cleveref\|zref\|both` | Default none; hyperref as needed, cleveref and/or `zref-clever,zref-titleref`.                                                                                                                                          |
| `layout=none\|balanced\|legacy`                   | Default none; balanced loads geometry[margin=1in], retains paper size, line spread1.05. Legacy additionally sets emergencystretch2em, interfootnotelinepenalty10000, and allowdisplaybreaks when amsmath exists.        |

Layout refuses to overwrite an already loaded geometry provider. Neither preset
changes hbadness/vbadness/hfuzz/vfuzz, equation numbering or section depths.
The legacy preset intentionally excludes historical warning suppression.

## Commands

- Palette: accentcolor, bordercolor, figurecolor, backgroundcolor,
  diagrambackground, diagramborder, draftcolor; SetExtraColor changes a named color.
- Boxes: openproblemframe, questionbox, proofbox, diagramframe, figurebox;
  optional mdframed settings remain available. Defaults are unbroken boxes with
  square corners. Override `nobreak=false` for suitable multipage material.
- Lists: dashedlist, codelist, checkboxlist (with `\checked`), deflist. These do
  not change standard enumerate/itemize defaults or codelines numbering.
- Bibliography: `\printreferences[style]{files}`, default aomalpha;
  `\printnotereferences` requests abbrev0, crypto, references. Supply those files
  explicitly. Csextras does not supply a research bibliography.
- Metadata: `\Email{address}`, `\ORCID{id}`, `\NoteVersion{text}`,
  `\docversion`, `\workingnotethanks`, `\unstabledraftthanks{contact}`,
  `\genericnoteacknowledgement`, `\newguymarker{name}{label}{color}`,
  `\currenttime`. These helpers do not overwrite caller PDF title/author fields.
- Index: `\term{text}`, `\indexsee{entry}{target}`,
  `\indexseealso{entry}{target}`, ordinary-footnote `\annotation{text}` when
  not already provided. Run makeindex outside LaTeX and include the .ind when
  submitting a source bundle that cannot run it.
- Glossary: `\glossaryentry{label}{name}{description}` and native
  `\newacronym{label}{short}{long}`. Use the native glossaries formatter for acronym entries.
- Book/quotation: `\dropcap{initial}{rest}`, chapterabstract,
  `\epigraph{text}{source}`, quotation, dedication with two author-name
  arguments, acknowledgements and acknowledgement.
- Draft: `\draftwarning`, `\todoinline[options]{text}`,
  `\todofixed[options]{text}`. Existing csmath final-mode accepted-content
  semantics remain untouched. Standalone metadata markers are explicitly visible
  whenever that feature is requested; there is no separate csextras draft mode.
- Native references: `\Zcref[options]{labels}` is a capitalized zcref convenience,
  never an impersonation of cleveref's Cref.

## References, bibliography and execution

Ordinary labels and native zref labels are independent. Use both commands at the
same object if both stores are needed. Codelines owns every line reference type
and unique anchor. Csextras owns only the algorithm float type, and uses the
public csthm family iterator for native theorem names. Explicit provider-level
name overrides retain precedence; register cleveref overrides after its setup.
Enhanced providers load at the end of csextras initialization, after selected
mathematical facilities, still in the preamble. Load csmath before csextras when
combining them with enhanced references. Hyperref's existing options and metadata
are reused.

Biblatex works before or after csextras when bibliography/crazybib are disabled.
Actual conflicting backend features reject biblatex in either order. Ordinary
csextras never chooses a citation style. For BibTeX, run LaTeX, BibTeX and enough
LaTeX passes; for biblatex use the backend selected by the document.

Minted 3 can use an approved restricted latexminted executable; older versions
have different requirements. Csextras does not enable shell escape, invoke
external tools itself, or claim that every minted version works in a disabled
execution environment. With `-no-shell-escape`, its minted option errors clearly;
a document needing a frozen-cache workflow should configure minted directly.
Listings and codelines need no external execution.

## Installation

Select extra X11/DVIPS palettes at the first xcolor load. Boxes use the ordinary backend and square corners by default;
TikZ diagrams remain explicitly available. Table spacing stays caller-owned.

For an exercises-package workflow use standalone csextras or
`\usepackage[theorems=inherit]{csmath}` before selecting exercises. For ordinary
csmath exercises, omit the csextras exercises option. For a lecture title select
the cslecture title policy. For annotations use the existing csmath provider or
standalone todonotes, not both definitions of todo.

To install: csextras.sty alone suffices for independent installed-package
features. Algorithm additionally needs codelines.sty. Tcscrypto additionally
needs tcscrypto.sty. Csmath-dependent features need csmath.sty and csthm.sty; cslecture adds its own canonical closure. See
the required package files listed above.

Author: Agni Datta. Maintained under LPPL 1.3c or later; see repository LICENSE
and lppl.txt.
