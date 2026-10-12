<!-- @format -->

# llncscrypto 4.0.2

Research-paper conveniences for the Springer **LNCS** class. Camera-ready mode is the default: the package inherits the class and document's fonts, layout, headings, theorem counters, captions, bibliography, title and running heads. It does **not** load a mathematical suite, font package, reference provider or formatting dependency by default.

Use this package with the Springer `llncs` class and the fonts specified by your template. Requires LaTeX 2022-06-01 or newer. Install the class separately.

## Minimal publisher template

```latex
\documentclass[runningheads]{llncs}
\usepackage[T1]{fontenc}
\usepackage{newtxtext}
\usepackage[varvw]{newtxmath}
\usepackage{graphicx}
\usepackage{llncscrypto}
```

The font lines belong to the document. `llncscrypto` neither selects nor resets them. The untouched three-page official sample and the same sample with this package have identical page rasters, text and font listings under pdfLaTeX and LuaLaTeX. The same comparison is made with optional hyperref loaded.

## Options and dependencies

Bare boolean options mean `true`. Repeated identical selections are allowed; contradictory selections, unknown keys and invalid values are errors. No option silently changes the class options.

| Key                | Default / accepted values                      | Effect and direct dependencies                                                                                                                               |
| ------------------ | ---------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `format`           | `camera-ready`; `preprint`                     | Preprint loads `geometry`, `setspace`, `fancyhdr`; camera-ready loads none.                                                                                  |
| `preprint`         | bare alias                                     | `format=preprint`.                                                                                                                                           |
| `draft`, `final`   | `final`                                        | Editorial status, independent of layout. Draft enables local annotations unless `nonotes` is selected.                                                       |
| `annotations`      | `false`; boolean                               | Together with `draft`, loads `xcolor`, `marginnote` and shows notes. Final mode hides editorial notes even if the facility was requested.                    |
| `nonotes`          | bare alias                                     | `annotations=false`; does not change layout.                                                                                                                 |
| `theorems`         | `inherit`; `extended`                          | Bare `theorems` means `extended`. Adds missing class-style families; no theorem package.                                                                     |
| `references`       | `none`; `hyperref`, `cleveref`, `zref`, `both` | Loads hyperref and the selected enhanced providers only when absent. Bare means `cleveref`.                                                                  |
| `reference-names`  | `inherit`; `legacy`                            | Inherit provider conventions and explicit caller names; legacy explicitly requests historical capitalized family names and section symbols.                  |
| `proof-headings`   | `native`; `complete`                           | Native optional proof title is parenthesized. Complete treats it as the entire heading; useful for `csdeferproofs`.                                          |
| `proof-qed`        | `false`; boolean                               | Opt-in automatic end marks for proof helpers and native proofs; explicit `\qed`/`\qedhere` suppress a second mark.                                           |
| `lists`            | `false`; boolean                               | `enumitem`; local `points`, `checkbox`, `deflist`, `codelist`.                                                                                               |
| `boxes`            | `false`; boolean                               | `framed`; breakable `simplebox`, `nestedbar`. Existing compatible environments win.                                                                          |
| `subfigures`       | `false`; boolean                               | `subfig[caption=false,font=small]` and its caption3 support; preserves the main LNCS caption renderer. Uses `\subfloat`, independently of caption restyling. |
| `captions`         | `false`; boolean                               | **Preprint only:** `caption`, `subcaption`, historical small-caps labels and spacing.                                                                        |
| `colorlinks`       | `false`; boolean                               | **Preprint only:** hyperref if absent; explicitly sets blue links. Otherwise caller hyperlink settings are untouched.                                        |
| `libertine`        | `false`; boolean                               | **Preprint only:** delegates to `csmath[mode=venue,font=libertine,theorems=inherit,paragraphs=inherit]`. No second font resolver.                            |
| `microtype`        | `false`; boolean                               | **Preprint only:** `microtype`, without global warning suppression.                                                                                          |
| `draft-footer`     | `false`; boolean                               | **Draft preprint only:** `scrtime`, `prelim2e`; dated preliminary-distribution footer.                                                                       |
| `preprint-margin`  | `1in`                                          | A geometry dimension, used only in preprint mode.                                                                                                            |
| `preprint-spacing` | `1`                                            | Positive line-spacing multiplier, used only in preprint mode.                                                                                                |

`subfigures` and `captions` select incompatible subfigure providers and cannot be combined. Camera-ready subfigures use `\subfloat[Panel caption]{content}`; the main caption stays native.

Disabled list/box interfaces give a feature-specific error at use; they do not load packages while typesetting. Standard LaTeX lists remain unchanged. Named xcolor palettes are not forced; request a palette explicitly before loading xcolor if a historical color name needs it.

The Springer class manual recommends avoiding some packages used by the optional csLaTeX stack, notably `enumitem` and `mathtools`. Their explicit use remains an author/venue decision. Preserving rendered LNCS formatting does not establish production acceptance of every dependency.

## Mathematical integration and loading order

```latex
\documentclass[runningheads,envcountsame]{llncs}
\usepackage[T1]{fontenc}
% csmath 1.1.1 needs AMS symbols. Load them before NewTX to avoid
% the existing Bbbk collision; newtxmath itself supplies amsmath.
\usepackage{amssymb}
\usepackage{newtxtext}
\usepackage[varvw]{newtxmath}
\usepackage{graphicx}
\usepackage[
  mode=venue,font=inherit,theorems=inherit,
  paragraphs=inherit,cleveref=false
]{csmath}
\usepackage[
  theorems=extended,references=cleveref,
  proof-headings=complete,proof-qed
]{llncscrypto}
\usepackage[notoc]{tcscrypto}
\usepackage[number-color=black,comment-color=black]{codelines}
\usepackage[appendix=false,commandref=cref]{csdeferproofs}
\NewDeferredThm{theoremE}{theorem}
\NewDeferredThm{lemmaE}{lemma}
```

The required order is **csmath → llncscrypto → tcscrypto**. Codelines and csdeferproofs are independently optional. The camera-ready example explicitly selects black code-line numbers and comments; llncscrypto does not override codelines settings. Loading csmath later is rejected before it redefines shared public helpers. Loading tcscrypto first is rejected because its generic `\keywords` fallback would preempt LNCS's delayed definition. The package temporarily reserves that name, then lets the class install its original command at begin-document; user replacements are retained.

Use `tcscrypto[notoc]`, without `venuestyle`: the latter changes caption spacing and the former avoids default TOC/bibliography changes. Camera-ready mode checks those choices. It also rejects known incompatible csmath mode, font, theorem, paragraph, equation, layout, caption, float, global-list and microtype selections. Select those settings on csmath before loading llncscrypto.

Loading csthm before this package already fails on LNCS's `case` environment, and csmath's `layout` feature can fail inside titlesec before llncscrypto is reached. Use the inherited configuration above; a later package cannot diagnose an error that has already stopped initialization.

No `csthm`, `ntheorem`, `amsthm` or `thmtools` may compete for LNCS theorem ownership. Article full versions use csmath directly, without llncscrypto. `font=inherit` keeps the selected font provider's alphabets; specialized csmath alphabets still require a provider that defines them. The package never undefines or recreates mathematical alphabets.

## Theorems and proofs

`theorems=inherit` leaves native environments untouched. The class supplies numbered `theorem`, `case`, `conjecture`, `corollary`, `definition`, `example`, `exercise`, `lemma`, `note`, `problem`, `property`, `proposition`, `question`, `solution`, `remark`; **native `claim` and `proof` are unnumbered**.

The class default uses independent counters. Select the class option `envcountsame` explicitly for a shared native sequence. `envcountsect` adds sectional numbers/resets, and `envcountreset` resets without the prefix. For `envcountreset`, the package also records the class’s existing section-reset relationship for alias counters through `\counterwithin*`, so enhanced reference lists distinguish repeated displayed numbers. These are class choices, not recommendations to override the current author instructions, which show continuous numbering.

`theorems=extended` adds only missing names through `\spnewtheorem`, sharing the `theorem` counter. It covers all 51 historical family names plus native `case`; existing class families keep their typography and counters. There are 51 numbered families and the unnumbered native claim, 52 non-stepping starred forms, and the nine retained aliases:

`uclaim`, `uconjecture`, `ucorollary`, `uhypothesis`, `uinformaltheorem`, `ulemma`, `uopenproblem`, `usyntax`, `utheorem`.

The complete family/name mapping is declared in `llncscrypto.sty`. Added numbered/starred families have bold headings and italic bodies. Native unnumbered claims retain their numbering policy.

`proofsketch`, `proofidea`, `proofofclaim` accept an optional parenthesized title. `claimproof[Full heading]` accepts a complete heading. The native proof remains unchanged by default. `proof-headings=complete` adapts only its optional-heading entry, without replacing the class renderer or environment end.

`\setqedsymbol{...}` and `\SetQEDSymbol{...}` set the class's public square renderer. `\qedsymbol` exposes it; `\qedhere` places the native mark. Native proofs have **no automatic QED** unless `proof-qed` is selected. An ending display may put the automatic mark on a following line; this is not amsthm's equation-tag placement.

## Paragraph conveniences

The package **never redefines `\paragraph` or `\subparagraph`**. Use:

```latex
\parhead{Motivation} Text starts here.
\subparhead{Proof strategy?} Text starts here.
\parheadnoperiod{Custom heading:} Text starts here.
\subparheadnoperiod{Subordinate heading} Text starts here.
```

Ordinary forms add a period only when the purified heading lacks terminal `.`, `:`, `?` or `!`. Formatting and expandable text macros are supported; use a noperiod form for headings with punctuation hidden inside an unexpandable macro. The noperiod forms are the escape hatch. Bold and small-caps run-in conveniences do not change native sectioning. Csmath's existing compatible `parhead` and `subparhead` definitions win.

## References and hyperlinks

No enhanced reference system is mandatory. `references=none` does not disable providers independently loaded by the document. For ordinary references, use `\label` and `\ref`. For cleveref, select `references=cleveref` or load it explicitly after hyperref. For zref-clever, select `references=zref` and use **native labels**:

```latex
\begin{theorem}
  \label{thm:ordinary}\zlabel{thm:native-zref}
  The statement.
\end{theorem}
\ref{thm:ordinary}; \zcref{thm:native-zref}.
```

`references=both` supports `\cref`, `\Cref` and `\zcref` together. There is no global cleveref-over-zref facade. `\crefrange` and `\cpageref` belong to genuine cleveref; use the native zref counterparts for zref labels. The historical optional zref keys on `\cref[...]` must migrate to `\zcref[...]`.

`\llncsrefname{type}{Singular}{Plural}` explicitly configures both installed providers. `\llncssetrefnames{type/Singular/Plural,...}` accepts grouped fields. Default cleveref registration preserves existing names. Zref receives English language defaults, below caller `\zcRefTypeSetup` settings in its precedence; no document language is imposed. Other languages can supply type names explicitly. `reference-names=legacy` intentionally overrides with capitalized historical names (including “Important point”) and section symbols. Later caller settings win.

`\fullref{ordinary-label}` prints number and name using a single outer hyperlink when hyperref is available. It does not use a zref label or nest links. Unlike the former facade it does not synthesize a theorem-type prefix. Native LNCS theorem labels may store the enclosing section name in nameref rather than the optional theorem title. `\LlncsCheckReferences{label,...}` is an explicit **ordinary-label final-pass check**: enable it after rerunning LaTeX until labels resolve. Normal LaTeX diagnostics remain active. No margin stars or citation/reference internal patches are installed.

Theorem destinations use distinct stable identities, independent of printed numbers. Theorem links point to the first paragraph of the statement. Appendix links use the corresponding appendix heading. Recompile both documents when using external references to old anchor names. Codelines owns its own unique line targets and provider registration.

Hyperref options, PDF metadata, URL style and bookmarks are caller-owned. The explicit preprint `colorlinks` request is the sole link-color override. Use `\texorpdfstring{mathematics}{plain bookmark text}` for complex mathematical headings; no package can infer a useful plain-language matrix bookmark automatically.

## Notes and accepted content

Annotation commands behave as follows:

| Interface                                           | Draft with notes enabled       | Final / nonotes |
| --------------------------------------------------- | ------------------------------ | --------------- |
| `\added{body}`                                      | Green accepted body            | Body retained   |
| `\changed{body}`                                    | Blue accepted body             | Body retained   |
| `\removed{body}`                                    | Marked `[Removed: ...]`        | Omitted         |
| `\todo`, `\fixme`, `\query`, `\notes`, `\citelater` | Labeled editorial text         | Omitted         |
| `\XXX[label]`                                       | Visible flag                   | Hard error      |
| `\missing{body}`                                    | Collected missing-content note | Omitted         |

Bodies accept paragraphs, mathematics and footnotes. Removed material is marked with a labeled bracket rather than fragile strikeout across displays. Accepted content is never silently discarded by this package.

Collected-note interfaces retain their signatures:

- `\dtnote[author]{body}`, `\dtcolornote[author]{color}{body}`.
- `\newcomment{author}{color}{\command}` creates a collected-note command.
- `\newguymarker{command}{label}{color}` accepts a bare name or control sequence and creates an uncollected marker.
- `\dtignore[label]{body}` hides the body and records an “Ignored passage” marker.
- `\printdtnotes`, `\printmissing` print stored unexpanded note bodies with page references.
- `\sidenote{body}` is an explicit marginal note, including in narrow/boxed contexts; authors must avoid collisions between marginal notes.

When csmath already owns common annotation commands, its feature/status choices remain authoritative: request `annotations` there and choose matching `draft`/`final` settings. Llncscrypto-specific collected notes remain separate. It does not overwrite a user's existing public command. Collected note bodies are typeset at their call and again in the collection; keep label-creating commands and other one-shot side effects out of them. Deferred note bodies share ordinary token-capture limitations: no verbatim/catcode-dependent content, and local definitions must remain available when the collection is printed.

## Lists, boxes and utilities

With `lists`, use `points`, `checkbox` (`\checked` starts a checked item), `deflist`, and `codelist`. Their optional arguments are enumitem settings. Four local nesting levels are supported. `codelist` is a simple numbered list, not an alias for the separately loaded codelines package.

With `boxes`, `simplebox[Title]` is breakable and `nestedbar[width]` supplies a left bar. They respect local width and do not load TikZ or mdframed. `\llncsboxtitle[Title]` remains available. An existing compatible `nestedbar` is reused.

`acknowledgment[Heading]` uses the class's credits facility where available, with a local small-text fallback on older classes. `\code{...}`, `\mathsc{...}` and `\textem{...}` are small standalone conveniences. Camera-ready `textem` uses ordinary emphasis. `\highlightcolor` defaults to black; `\sethighlightcolor{color}` requires preprint mode and explicitly loaded xcolor. `\footnotesymb{symbol}{body}` uses a local optional footnote number; an empty symbol is allowed, and the ordinary counter is not advanced. Empty-symbol footnotes retain native class indentation instead of patching its footnote renderer.

`\emailref{address}`, `\httpref{host/path}`, `\webpage{host/path}` use existing hyperref if present, otherwise plain typewriter text. No link helper loads a package during document execution.

## Preprint and full versions

```latex
\documentclass[runningheads]{llncs}
\usepackage[preprint,libertine,draft,lists,boxes,
  references=cleveref,colorlinks,draft-footer]{llncscrypto}
\preprint[Working paper][Author copy]
```

Preprint uses a one-inch margin and single spacing unless explicitly changed. It does not force paper size, require an unsupported 11pt class option, or replace the title block. Headers are set by `\preprint[left][right]`; page numbers are centered in the footer. Headers use footnotesize text; include `\textsc{...}` in their contents if desired. Font selection delegates to csmath. If csmath is preloaded, select the matching font there; reinitialization is rejected.

For shared conference/full-version content:

```latex
\usepackage[proof-headings=complete,proof-qed,references=cleveref]{llncscrypto}
\usepackage[appendix=true,commandref=cref]{csdeferproofs}
\NewDeferredThm{theoremE}{theorem}
\begin{theoremE}\label{thm:main}Statement.\end{theoremE}
\begin{deferproof}{thm:main}Complete proof.\end{deferproof}
% At the desired full-version location:
\appendix
\section{Complete proofs}
\printDeferredProofs
```

Use `appendix=false` for inline proofs. A short submission deliberately omitting captured proofs must explicitly select `unprinted=ignore` (or warning); the default error prevents silent loss. Article manuscripts use csmath and the same mathematical body. Metadata adapters belong in the preamble: for example, a `FigureDescription` alias can call LNCS's `\Description`, while an article chooses its own accessibility provider. Tcscrypto's unrelated notation command with that name must not be used as an article alt-text command.
