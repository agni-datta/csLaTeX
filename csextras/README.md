---
title: README
aliases: README
linter-yaml-title-alias: README
date created: Monday, June 22nd 2026, 12:00:00 am
date modified: Tuesday, June 23rd 2026, 8:36:43 pm
---

<!-- @format -->

## csextras

Optional extension and patch package for [`csamsmath`](../csamsmath/) and [`csbook`](../csbook/). Every feature is opt-in via a key-value option; nothing loads unless you ask.

### Power-User Warning

`csextras` is experimental, unsupported, and not systematically tested. It is provided without guarantees of stability, compatibility, correctness, or long-term maintenance.

Use it only if you are comfortable reading compilation logs, debugging package interactions, tracing macro expansions, and resolving low-level TeX and LaTeX failures. Users are expected to have a working knowledge of the LaTeX3 (`expl3`) programming layer, the LaTeX kernel, and modern package-development practices.

If you are unwilling or unable to diagnose package conflicts, compilation failures, or kernel-level problems, do not use this package.

The load-time warning is intentional. Advanced users who have accepted the risk may pass `nowarning` to suppress only this experimental-package warning.

### Requirements

- LaTeX2e ≥ 2020/10/01
- pdfLaTeX or LuaLaTeX (XeLaTeX triggers a `\PackageError`)
- biblatex must **not** be loaded—any attempt to load it alongside `csextras` raises a `\PackageError`
- Language selection and font/input encoding are document-level decisions. `csextras` does not load `inputenc`, `fontenc`, `luainputenc`, or pass language options to `babel`.

### Usage

```latex
% Article-style workflow
\usepackage{csamsmath}
\usepackage[layout, tikz, extramath, metadata]{csextras}

% Book-style workflow
\usepackage{csbook}
\usepackage[layout, index, lettrine, epigraph]{csextras}

% Patch-only (csamsmath or csbook already loaded)
\usepackage[layout, boxes, hyperrefcolors]{csextras}
```

### Options

All options are boolean (`key` or `key=true`) unless noted.

#### Base Package Detection

`csextras` does not load `csamsmath` or `csbook`. It detects whether either package is already loaded and enables dependent functionality accordingly. If an option requires one of those packages and the dependency is absent, `csextras` emits a warning and disables only that dependent feature.

#### Standard features

| Option             | Packages / Effect                                                                                                                                                           |
| ------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `acknowledgements` | `acknowledgements` / `acknowledgement` environment (article: `\parhead`; book: `\chapter*`)                                                                                 |
| `algorithm`        | `newfloat` + `codelines` (if present); declares `algorithm` float with cleveref names                                                                                       |
| `beautify`         | Activates color palette in `caption` labels; more hooks planned                                                                                                             |
| `bibliography`     | `\printreferences[style]{bibfile}` and `\printnotereferences` helpers                                                                                                       |
| `boxes`            | `mdframed[TikZ]` + five named environments: `openproblemframe`, `questionbox`, `proofbox`, `diagramframe`, `figurebox`                                                      |
| `epigraph`         | `epigraph` (styled), `quotation` (restyled), `dedication{First}{Last}` environment                                                                                          |
| `exercises`        | `exercises` package (resets csthm’s `exercise` env first; emits `\PackageWarning`)                                                                                          |
| `extralists`       | `enumitem`; adds `dashedlist`, `codelist`, `checkboxlist`, `deflist`, `\checked`                                                                                            |
| `extramath`        | `nicefrac`, `mleftright`, `upgreek[Symbol]` (pdfLaTeX) / `upgreek` (LuaLaTeX), `\mathpzc`, `bbm`, `bm`, `braket`, `esvect`, `\mathsc`, `\mathbi`                            |
| `extratables`      | `longtable`, `ltxtable`, `rotating`, `makecell`, `booktabs`, `multirow`, `tabularx`, `array`                                                                                |
| `figureposition`   | Tunes `\topfraction`, `\bottomfraction`, `\textfraction`, `\floatpagefraction`                                                                                              |
| `footnotes`        | `bigfoot`, `footnote`, `footmisc[bottom,multiple,hang]`                                                                                                                     |
| `forest`           | `forest[linguistics]`                                                                                                                                                       |
| `glossary`         | `glossaries[acronym,toc]`, `\makeglossaries`, `\acronymentry`, `\glossaryentry`                                                                                             |
| `hyperrefcolors`   | Sets `citecolor`, `linkcolor`, `urlcolor` to `SteelBlue4` in `hyperref` at `\begin{document}`                                                                               |
| `hyperxmp`         | `hyperxmp` loaded after `hyperref`; defers to `\AtBeginDocument` if `hyperref` not yet present                                                                              |
| `index`            | `imakeidx`, `\makeindex`, `\indexsee`, `\indexseealso`, `\term`, `\annotation`                                                                                              |
| `layout`           | `geometry` (letterpaper, 1 in margins), `linespread{1.05}`, `allowdisplaybreaks`, `numberwithin{equation}{section}`                                                         |
| `listings`         | `listings` with color-coded defaults (accent, figure, border palette)                                                                                                       |
| `loadmacros`       | Inputs `settings.tex`, `macros.tex`, `commands.tex` at `\begin{document}` if they exist                                                                                     |
| `metadata`         | `datetime2`, `marginnote`; `\Email`, `\ORCID`, `\NoteVersion`, `\workingnotethanks`, `\unstabledraftthanks`, `\genericnoteacknowledgement`, `\newguymarker`, `\currenttime` |
| `minted`           | `minted` (pdfLaTeX: `outputdir=.`), `\usemintedstyle{friendly}`, `\setminted` defaults. Requires `--shell-escape`.                                                          |
| `nowarning`        | Suppresses the experimental unsupported-package load-time warning only                                                                                                      |
| `numbering`        | `secnumdepth=3`, `tocdepth=2`                                                                                                                                               |
| `orcid`            | `orcidlink`                                                                                                                                                                 |
| `pdftools`         | `pdfpages`, `pdflscape`                                                                                                                                                     |
| `siunitx`          | `siunitx` with math mode, `detect-all`, separate uncertainty                                                                                                                |
| `tcscrypto`        | `tcscrypto`                                                                                                                                                                 |
| `tikz`             | `tikz`, `tikz-cd`, `tikzscale`, `pgfplots`, full tikzlibrary suite                                                                                                          |
| `tocbibind`        | `tocbibind[nottoc]`                                                                                                                                                         |
| `verbatim`         | `verbatim`, `fancyvrb`; strips trailing blank lines from verbatim environments                                                                                              |
| `watermark`        | `draftwatermark` (lightness 0.975, scale 0.875), `\draftwarning` command, `prelim2e` running footer if present                                                              |

#### Article-only features

These emit a `\PackageWarning` and no-op when used in book mode.

| Option            | Effect                                                                           |
| ----------------- | -------------------------------------------------------------------------------- |
| `abstract`        | Redefines `abstract` environment with TOC entry and `\parhead`                   |
| `amsaddr`         | `amsaddr[foot]` (only meaningful with `amsart`/`amsbook` class)                  |
| `informalheaders` | `titlesec`; section heads in `\sffamily\color{accentcolor}`                      |
| `titlepage`       | `titling`, `authblk`; custom flush-left title block                              |
| `tocspacing`      | `tocloft[titles]`; adjust section font and inter-entry spacing. **Discouraged.** |

#### Book-only features

These emit a `\PackageWarning` and no-op when used in article mode.

| Option            | Effect                                                                                      |
| ----------------- | ------------------------------------------------------------------------------------------- |
| `chapterabstract` | `chapterabstract` environment with TOC entry                                                |
| `lettrine`        | `lettrine`; `\LettrineFontHook` / `\LettrineTextFont` in accent color; `\dropcap{L}{etter}` |

#### Choice options

| Option      | Values                                   | Effect                                                                                            |
| ----------- | ---------------------------------------- | ------------------------------------------------------------------------------------------------- |
| `copyright` | `none` (default), `footnote`, `page`     | `footnote`: defines `\copyrightnotice`; `page`: defines `\makecopyrightpage` + `\copyrightnotice` |
| `lipsum`    | `none` (default), `paragraph`, `content` | `paragraph`: loads `lipsum`; `content`: loads `duckuments` (falls back to `lipsum`)               |

#### Discouraged options

These load but emit a loud `\PackageWarning`.

| Option           | Packages                                         | Why discouraged                                    |
| ---------------- | ------------------------------------------------ | -------------------------------------------------- |
| `algorithmtwoe`  | `algorithm2e[algonl,boxed,longend,vlined]`       | Legacy, poorly maintained; prefer `algorithm=true` |
| `crazybib`       | `natbib`, `chapterbib`, `cite`                   | Complex interactions; rarely needed                |
| `crazynumbering` |—| Sets `secnumdepth=5`, `tocdepth=6`                 |
| `indentfirst`    | `indentfirst`                                    | Non-standard in most CS venues                     |
| `nagmode`        | `nag[l2tabu,orthodox]`, `onlyamsmath[all,error]` | Errors on many harmless constructs                 |
| `parskip`        | `parskip`                                        | Often looks wrong with theorem environments        |
| `tightcaptions`  |—| Can violate venue guidelines                       |
| `todonotes`      | `todonotes`; `\todoinline`, `\todofixed`         | Must be removed before submission                  |

### Color palette

Seven colors are always defined (via `\providecolor`). Override after loading with `\SetExtraColor{name}{value}` or `\colorlet{name}{value}`.

| Name                | Default           |
| ------------------- | ----------------- |
| `accentcolor`       | `SteelBlue4`      |
| `figurecolor`       | `IndianRed4`      |
| `backgroundcolor`   | `LightSteelBlue1` |
| `bordercolor`       | `SteelBlue4`      |
| `diagrambackground` | `LightCyan3`      |
| `diagramborder`     | `CadetBlue4`      |
| `draftcolor`        | `Coral4`          |

### Key user-facing commands

| Command                            | Option                     | Description                                   |
| ---------------------------------- | -------------------------- | --------------------------------------------- |
| `\SetExtraColor{name}{value}`      | always                     | Reassign a palette color                      |
| `\printreferences[style]{bib}`     | `bibliography`             | Print bibliography with optional style        |
| `\printnotereferences`             | `bibliography`             | Shorthand for `aomalpha` + standard bib files |
| `\draftwarning`                    | `watermark`                | Draft notice text for `\thanks{}`             |
| `\Email{addr}`                     | `metadata`                 | Hyperlinked email paragraph                   |
| `\ORCID{id}`                       | `metadata`                 | Hyperlinked ORCID paragraph                   |
| `\NoteVersion{x.y}`                | `metadata`                 | Set `\docversion`                             |
| `\workingnotethanks`               | `metadata`                 | Standard working-note acknowledgement         |
| `\unstabledraftthanks{contact}`    | `metadata`                 | Unstable-draft acknowledgement                |
| `\newguymarker{cmd}{label}{color}` | `metadata`                 | Define a margin-note annotation command       |
| `\currenttime`                     | `metadata`                 | Current timestamp via `datetime2`             |
| `\dropcap{L}{etter}`               | `lettrine` (book)          | Drop-cap with 2 lines, in accent color        |
| `\term{word}`                      | `index`                    | Index entry + italic display                  |
| `\indexsee{a}{b}`                  | `index`                    | “see” cross-reference                         |
| `\acronymentry{lbl}{short}{long}`  | `glossary`                 | Define an acronym                             |
| `\glossaryentry{lbl}{name}{desc}`  | `glossary`                 | Define a glossary term                        |
| `\copyrightnotice`                 | `copyright=footnote\|page` | Copyright notice text                         |
| `\makecopyrightpage`               | `copyright=page`           | Insert copyright page                         |

### Engine and package compatibility

- **XeLaTeX**: blocked with `\PackageError`
- **biblatex**: blocked via `\@ifpackageloaded` + `\AddToHook{package/biblatex/before}`
- **upgreek Symbol option**: pdfLaTeX only; LuaLaTeX gets a warning and loads without `Symbol`
- **minted**: requires `--shell-escape` (pdfLaTeX adds `outputdir=.` automatically)
- **hyperxmp**: must follow `hyperref`; if `hyperref` is not yet loaded, deferred to `\AtBeginDocument`

### Future extensions

Patches welcome for: `subcaption=true` (subfigures), `complexity=true` (TCS class macros), `clrscode=true` (CLRS pseudocode).
