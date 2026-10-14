---
title: README
aliases: README
linter-yaml-title-alias: README
date created: Monday, October 12th 2026, 12:22:57 am
date modified: Wednesday, October 14th 2026, 3:27:55 am
---

<!-- @format -->

## csthm 4.2.1

Standalone theorem environments for theoretical computer science, built on `ntheorem`. Requires LaTeX **2022-06-01** or later. Supports pdfLaTeX, LuaLaTeX and XeLaTeX.

### Quick start

```latex
\documentclass{article}
\usepackage[style=normal]{csthm}
\usepackage{hyperref}

\begin{document}
\section{Results}
\begin{theorem}[Cook--Levin]\label{thm:cook}
SAT is NP-complete.
\end{theorem}
\begin{proof}
Encode an accepting computation as a Boolean formula.
\end{proof}
By \cref{thm:cook}, SAT is NP-complete.
\end{document}
```

### Options and numbering

| Option                                           | Default   | Effect                                                                                          |
| ------------------------------------------------ | --------- | ----------------------------------------------------------------------------------------------- |
| `style=normal`, `style=fancy`, `style=oldschool` | No style  | Select the presentation for all theorem families.                                               |
| `normal`, `fancy`, `oldschool`                   | No style  | Bare aliases for the corresponding `style` value.                                               |
| `numberwithin=section`                           | `section` | Reset each environment’s counter at each section; prefix with `\thesection`.                    |
| `numberwithin=chapter`                           |           | Reset at each chapter; prefix with `\thechapter`. Requires a chapter counter.                   |
| `numberwithin=none`                              |           | Continuous, unprefixed numbering for each environment.                                          |
| `cleveref=auto`                                  | `auto`    | At the end of the preamble, load `cleveref` if `hyperref` is loaded and `cleveref` is absent.   |
| `cleveref=true` or bare `cleveref`               |           | Load `cleveref` immediately after theorem setup, making its commands available in the preamble. |
| `cleveref=false`                                 |           | Never load `cleveref` implicitly; still register names if the caller loads it.                  |

Repeated identical style selections are harmless. Contradictory styles are errors naming both selections. Unknown options, invalid values, missing required values, and values on bare style aliases (such as `normal=true`) are errors.

**No style means auxiliary-only loading**, not an implicit `normal` style. It provides `proof`, `case`, accent and symbol controls, but neither the 45 theorem environments nor `proofsketch`, `proofidea`, or `proofofclaim`.

By default, all 45 environment types have **independent counters**: a theorem and a lemma can both be 1.1. Number prefixes follow the class; for example, `book` includes the chapter in `\thesection`, while `amsbook` does not. A starred environment has no printed number and does not advance its numbered counterpart. Labels belong in numbered environments; starred forms have no theorem number to reference.

### Presentation

| Style       | Headers and bodies                                                                 | Frames and marks                                                                                   |
| ----------- | ---------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------- |
| `normal`    | Small-caps headers and roman bodies; highlights use sans-serif headers and bodies. | Top and bottom rules; end marks in all four families.                                              |
| `fancy`     | Colored sans-serif headers; roman bodies except sans-serif highlights.             | Colored left bars and tinted backgrounds; no theorem end marks.                                    |
| `oldschool` | Small-caps headers and roman bodies; highlights use sans-serif headers and bodies. | Unframed; definition, remark, and highlight families have end marks, theorem-like families do not. |

The fixed `fancy` header palette is `SeaGreen4` (theorems), `RoyalBlue2` (definitions), `Aquamarine4` (remarks), and `DeepPink4` (highlights). All fancy bars use `DeepPink4`; backgrounds use `DeepPink4!5`. Optional titles are printed in normal font. Proof QED marks are available in every configuration.

### Complete environment API

Each of these accepts an optional title and has an unnumbered `*` variant, for example `\begin{lemma}[Title]` and `\begin{lemma*}[Title]`.

| Family          | Environments                                                                                                                                                                       |
| --------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Theorem (15)    | `theorem`, `assertion`, `assumption`, `axiom`, `claim`, `conclusion`, `conjecture`, `corollary`, `fact`, `folklore`, `hypothesis`, `lemma`, `postulate`, `property`, `proposition` |
| Definition (10) | `application`, `construction`, `convention`, `definition`, `experiment`, `notation`, `openproblem`, `problem`, `protocol`, `result`                                                |
| Remark (10)     | `commentary`, `contribution`, `example`, `exercise`, `motivation`, `notationabuse`, `note`, `observation`, `question`, `remark`                                                    |
| Highlight (10)  | `guideline`, `highlight`, `important`, `insight`, `keypoint`, `recall`, `summary`, `takeaway`, `tip`, `warning`                                                                    |

`proof` accepts an optional heading, defaulting to “Proof”. When a style is selected, these wrappers also accept optional titles:

| Environment    | Without a title | With `[Title]`         |
| -------------- | --------------- | ---------------------- |
| `proofsketch`  | Proof (Sketch)  | Proof (Sketch Title)   |
| `proofidea`    | Proof (Idea)    | Proof (Idea Title)     |
| `proofofclaim` | Proof of Claim  | Proof of Claim (Title) |

`case` is a one-level `enumitem` list, with bold **Case 1:** labels by default. Its optional argument accepts ordinary `enumitem` settings; `\item[Custom label]` overrides an individual label. A case list can contain an ordinary list or appear inside one. Nesting a `case` list directly inside another `case` list is not supported.

```latex
\begin{proof}
  \begin{case}[start=2,label=Case~\Alph*:]
    \item First branch.
    \item Second branch.
  \end{case}
\end{proof}
```

### Accent and symbol controls

| Command                                                          | Effect                                                                           |
| ---------------------------------------------------------------- | -------------------------------------------------------------------------------- |
| `\SetAccentColor{color}`                                         | Set the global color of the default QED and theorem end marks. Default: `black`. |
| `\setaccentcolor{color}`                                         | Compatibility alias for `\SetAccentColor`.                                       |
| `\CsthmQED`                                                      | Render the default colored hollow square.                                        |
| `\CsthmEndMark`                                                  | Render the default colored lower-right corner.                                   |
| `\setqedsymbol{content}`, `\SetQEDSymbol{content}`               | Replace the proof QED symbol globally.                                           |
| `\settheoremendsymbol{content}`, `\SetTheoremEndSymbol{content}` | Replace the theorem end symbol globally.                                         |
| `\NoEndMark`                                                     | Suppress the current environment’s final mark (provided by `ntheorem`).          |

Accent changes can occur in the preamble or between environments and affect subsequent default marks. They do **not** recolor ruled frames, headers, or the fixed `fancy` palette. A replacement symbol controls its own color unless it explicitly uses a colored command. `fancy` still omits theorem end marks after global symbol customization; an explicit family `end-symbol` enables them. The `ntheorem` proof controls, including `\qed`, remain available; compile three times when checking marks after displays or lists.

### References and package order

Ordinary `\label`/`\ref` works without `hyperref` or `cleveref`. Both `\cref` and `\Cref` use capitalized singular/plural names for numbered environments: “Open Problem 1.1” and “Open Problems 1.1 and 1.2”. Irregular plurals include Hypotheses, Properties, Commentaries, and Important Points; Folklore is unchanged.

Supported orders include:

```latex
% Deferred automatic integration:
\usepackage{hyperref}
\usepackage[normal]{csthm}

% Explicit integration, including customization later in the preamble:
\usepackage[normal]{csthm}
\usepackage{hyperref}
\usepackage{cleveref}

% An existing cleveref installation:
\usepackage{amsmath}
\usepackage{hyperref}
\usepackage{cleveref}
\usepackage[normal]{csthm}

% Immediate integration:
\usepackage{hyperref}
\usepackage[normal,cleveref=true]{csthm}
\crefname{theorem}{Theorem}{Theorems}
```

With `auto`, `hyperref` may also be loaded after `csthm`. Deferred loading uses the kernel’s `begindocument/before` end-of-preamble hook; `\cref` is not available earlier unless `cleveref` was loaded explicitly. Automatic loads request `capitalize,nameinlink,noabbrev`. Existing cleveref options are never re-requested or changed. Name registration happens once when both packages are available, independently of the loading option; customize names afterward.

`cleveref` must follow `amsmath` and, when used, `hyperref`. `csthm` diagnoses reversed orders, including ones completed before it loads. With `cleveref=true`, load `hyperref` before `csthm` if hyperlinks are wanted. No `hyperref` is required for `cleveref=true`, and no warning is issued for documents without hyperlink integration. Broader `zref` integration is unchanged.

### Dependencies and font interactions

- All configurations load `amsmath`, `ntheorem` with `amsmath,amsthm,hyperref,thmmarks`, `enumitem`, and **`xcolor` with `dvipsnames,table,x11names`**. Named colors and table coloring are intentionally global facilities, even with no style. `amssymb` supplies symbols unless `unicode-math` is already loaded.
- Only `normal` and `fancy` load TikZ-backed `mdframed`. `oldschool` and auxiliary-only loading introduce neither `mdframed` nor TikZ. Other packages may load them independently.
- A preloaded `mdframed` must use `framemethod=TikZ` for framed styles. An incompatible backend is an error. A preloaded `ntheorem` must already have all four required options.
- Modern `xcolor` accepts subsequent options through native option processing. Older versions require `\usepackage[dvipsnames,table,x11names]{xcolor}` at the **initial** load, or `\PassOptionsToPackage{dvipsnames,table,x11names}{xcolor}` before whichever class/package first loads it. `csthm` neither patches xcolor internals nor conceals option clashes.
- `csthm` chooses no text or math font. LuaLaTeX/XeLaTeX support `unicode-math` before or after `csthm`; loading it first avoids `amssymb`. The default QED square uses the selected Unicode math font when available. Fonts must provide the selected small-caps/sans-serif faces and mathematical symbols.
- `article`, `book`, `amsart`, and `amsbook` are covered. AMS class theorem styles and proof commands are initialized for the `ntheorem` backend. Do not load a separate `amsthm` backend, redeclare the same environment names, or stack another complete theorem suite (such as a separately initialized theorem layer of `csmath`) on top of a selected `csthm` style.

### Counters and family settings

| Option                                           | Default       | Contract                                                                                                                                        |
| ------------------------------------------------ | ------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| `counters=independent\|shared`                   | `independent` | Independent family counters, or one physical `theorem` counter with distinct logical types.                                                     |
| `families=standard\|extended`                    | `standard`    | 45 or 52 environment pairs; extended requires a style.                                                                                          |
| `starred=unnumbered\|legacy`                     | `unnumbered`  | Ordinary non-stepping stars, or the explicitly requested historical numbered/stepping aliases.                                                  |
| `appearance=modern\|legacy-article\|legacy-book` | `modern`      | Modern presentation, historical article group styling with `oldschool`, or book group styling with `normal`. A contradictory style is an error. |
| `family-style={group={settings},…}`            | Empty         | Initial typography for `theorem`, `definition`, `remark`, or `highlight`.                                                                       |

Counter/reset/family/star/appearance configuration is fixed at initial package loading. Repeated identical selections are allowed; contradictory or late changes fail. `numberwithin` remains independent of counter sharing. For example:

```latex
\usepackage[oldschool,counters=shared,families=extended,
  numberwithin=chapter]{csthm}
```

Shared mode uses ntheorem’s native shared `theorem` counter, without aliascnt. Theorem, lemma, definition, and proposition print 1.1, 1.2, 1.3, 1.4 and reset together. Environment-scoped cleveref and zref-clever aliases retain each logical reference type. Hyperlinks use the master counter’s unique destinations; literal links to older type-prefixed anchors require regeneration. Nested environments restore the enclosing type. Section/chapter reset links are established before declarations; continuous numbering has no parent reset. This is supported in all documented reference loading orders.

The extended families are:

| Group      | Added environments                            | Reference names                                          |
| ---------- | --------------------------------------------- | -------------------------------------------------------- |
| Theorem    | `criterion`, `informaltheorem`, `metatheorem` | Criterion/Criteria, Informal Theorem(s), Meta Theorem(s) |
| Definition | `solution`, `step`                            | Solution(s), Step(s)                                     |
| Remark     | `discussion`, `syntax`                        | Discussion(s), Syntax/Syntaxes                           |

All have optional titles and starred forms. With `starred=legacy`, all 51 historical stars **print and advance** their counter except `claim*`, `conjecture*`, `corollary*`, `hypothesis*`, `informaltheorem*`, `lemma*`, `theorem*`, `openproblem*`, and `syntax*`. The modern-only `contribution*` also remains unnumbered. In the legacy book appearance, the 42 stepping stars remain unframed, matching the original aliases. Labels in those numbered stars work; do not label unnumbered stars as numbered statements.

Legacy appearances move `observation` into the theorem group, `example` into the definition group, and `openproblem` into the remark group. Article appearance uses bold theorem/definition headings, small-caps remarks, sans-serif highlight headings, roman bodies, and script-size corner marks throughout. Book appearance uses ruled frames, a definition-start diamond, corner end marks, and diamond proof QED. Neither appearance itself changes counter sharing, reset policy, family selection, or starred semantics: select those independently or use a csmath compatibility profile.

Preamble typography can also be changed without redeclaring environments:

```latex
\CsthmSetupFamily{definition}{head-font=bold,body-font=normal,
  start-symbol=\ensuremath{\diamond},end-symbol=\CsthmEndMark}
\CsthmSetupFamily{remark}{end-symbol={}}
```

The four settings are `head-font`, `body-font`, `start-symbol`, and `end-symbol`. Font values accept raw switches or `normal`, `roman`, `bold`, `boldsans`, `italic`, `italics`, `sans`, `smallcaps`; they retain the historical switch semantics. An empty symbol disables it. These are group settings, not individual-environment overrides. `\CsthmSetupFamily` is preamble-only and requires a selected theorem style. Start marks precede the heading, in its font, with a nonbreaking space. Optional titles retain the existing normal-font rendering. Fancy colors remain fixed unless an explicit custom header font overrides its color.

`\CsthmStartMark` renders a diamond; `\SetTheoremStartSymbol{content}` replaces it. It is used by the legacy book definition group, or when explicitly selected. Existing end/QED setters and `\NoEndMark` remain available. `\CsthmConfiguration{key}` expands to the resolved `style`, `numberwithin`, `cleveref`, `counters`, `families`, `starred`, or `appearance` value for integration checks (unknown query keys return empty).

Historical independent theorem suites must not be stacked with these declarations. Csmath integrates this theorem provider directly.

### License and author

LaTeX Project Public License v1.3c. Agni Datta: [agni-datta/csLaTeX](https://github.com/agni-datta/csLaTeX).

### Solutions and configuration queries

Use `solution=proof` for an unnumbered solution with a proof ending.

| Setting            | Contract                                                                                                                                                                                                                                              |
| ------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `solution=theorem` | Default. Extended families contain a numbered solution and its star.                                                                                                                                                                                  |
| `solution=proof`   | Exclude the numbered solution before declaration and provide an unnumbered proof-style `solution[complete heading]`, default heading small-caps Solution and a local diamond QED. No theorem counter is advanced. No `solution*` theorem is declared. |

Select counters, numbering, and family policies explicitly. Lecture documents

use the same theorem styles and unnumbered stars as other modern documents.

Counter, star, family, appearance and solution ownership are immutable after

initialization. `\CsthmSetupFamily`

continues to control preamble typography and symbols.

`\CsthmConfiguration{solution}` queries ownership.

`\CsthmMapFamilies{\Callback}` invokes `\Callback{environment}{singular}{plural}`

for every declared numbered family in metadata order. It excludes a proof-owned

solution and does nothing in auxiliary-only mode. This permits another reference

provider to register names without copying declaration lists; it does not declare

new environments or expose internal counters.

### Hyperlink targets

Call `\CsthmUseHeadingTargets` in the preamble to place theorem links at their headings. Cslecture enables this automatically. The command requires hyperref’s `\MakeLinkTarget`, `\LinkTargetOff` and `\LinkTargetOn` commands.

### Examples

The [examples](examples) cover the three styles, shared chapter numbering, and proof/case helpers. Copy `csthm.sty` beside an example before compiling it.
