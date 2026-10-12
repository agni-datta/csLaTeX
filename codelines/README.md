<!-- @format -->

# codelines 2.0.1

Ordinary LaTeX pseudocode, with numbered `\item` lines, ten nesting levels, and optional references. Author: Agni Datta. License: LPPL v1.3c. Requires LaTeX 2022-06-01 or later.

```latex
\usepackage{codelines}
\begin{codelines}
  \item Initialize $x\gets0$. \codecomment{Start with the empty state.}
  \item For each $v\in V$:
    \begin{codelines}
      \item Update $x$ using $v$. \label{line:update}
    \end{codelines}
  \item Return $x$.
\end{codelines}
See line~\ref{line:update}.
```

This prints logical lines 1, 2, 3, 4. A subsequent block continues at 5. The environment is not a float and introduces no caption machinery or specialized pseudocode language.

## Configuration

Use package options or locally scoped `\CodelinesSetup{keys}`. Repeated options follow ordinary sequential key-setting semantics. Unknown keys and invalid choices give errors. Dimension controls accept TeX dimensions; width, separation and indentation must be nonnegative.

Set body and geometry keys before opening a block. Comment settings are read by each comment, and number typography by each label; configure them before a block when uniform geometry is wanted. Font switches use the document's available faces and do not install replacement fonts or suppress font warnings.

| Key              | Values                                                      | Default                     |
| ---------------- | ----------------------------------------------------------- | --------------------------- |
| `number-family`  | `inherit`, `roman`, `sans`, `tt`                            | `tt`                        |
| `number-face`    | `normal`, `bold`, `italic`, `bolditalic`, `smallcaps`, `tt` | `normal`                    |
| `number-size`    | Size names below                                            | `footnotesize`              |
| `number-color`   | xcolor expression or `inherit`                              | `black!50`                  |
| `number-digits`  | `auto` or a positive integer                                | `auto` (minimum two digits) |
| `number-padding` | Boolean; bare means true                                    | `true`                      |
| `number-width`   | Minimum number-column dimension                             | `0pt` (measure the label)   |
| `number-sep`     | Number/body separation                                      | `.5em`                      |
| `indent`         | Additional body indentation per nested level                | `1em`                       |
| `body-family`    | `inherit`, `roman`, `sans`, `tt`                            | `inherit`                   |
| `body-size`      | Size names below                                            | `normal`                    |
| `body-color`     | xcolor expression or `inherit`                              | `inherit`                   |
| `comment-face`   | `normal`, `italic`, `bold`, `bolditalic`, `smallcaps`       | `italic`                    |
| `comment-size`   | Size names below                                            | `normal`                    |
| `comment-color`  | xcolor expression or `inherit`                              | `black!50`                  |
| `comment-prefix` | Arbitrary text tokens                                       | literal `**`                |
| `comment-space`  | TeX skip following the prefix                               | `.33333em`                  |
| `start`          | Nonnegative integer expression; initial/reset number        | `1`                         |

Size names are `normal`, `tiny`, `scriptsize`, `footnotesize`, `small`, `normalsize`, `large`, `Large`. Here `normal` preserves the surrounding size; `normalsize` explicitly selects the document's normal size. `number-face=tt` is a convenient family switch; use `number-family=tt,number-face=bold` to select both independently. Named colors beyond xcolor's base set require their provider to be loaded by the document.

```latex
\usepackage[number-family=tt,number-color=blue,
  number-digits=3,body-size=small,comment-face=italic]{codelines}
% Later, within a group:
{\CodelinesSetup{comment-prefix=NOTE,comment-color=red,comment-size=small}
 \codecomment{A local variation.}}
```

## Comments and typography scope

`\codecomment{Explanation}` prints **two text asterisks followed by a space and the explanation**, all italic grey at the surrounding size. It works within a sentence, after inline mathematics, inside a box, and in nested or wrapped lines. It does not call `\item`. Mathematical material in the argument retains its normal math fonts. Face, size and color changes are grouped and do not leak.

Body settings are local to a codelines environment. These commands control line labels and references:

| Hook                              | Contract                                                                                                                                    |
| --------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `\codelineslinenrformat`          | Number font/color switches. Its default reads the typography keys.                                                                          |
| `\codelineslinenrdigits`          | Expandable `auto` or positive digit count. Its default reads `number-digits`.                                                               |
| `\codelinesformatnumber{integer}` | Visual representation only; default pads to the chosen minimum. Keep this hook free of side effects.                                        |
| `\codelinesrefprefix`             | Prefix printed by references, not an anchor namespace. Define it expandably before the item; its value is frozen when that item is stepped. |

The public length registers `\codelineslinenrsymbolwidth`, `\codelineslinenrwidth`, `\codelineslinenrsep`, `\codelinescurrentboxwidth`, `\codelinesextraboxwidth` remain. The first two describe measured/reserved number geometry; the last two describe the local box, with extra width now zero.

## Numbering, nesting and width

- `\begin{codelines}[n]` and `\codelinessetlinenr{n}` set the **next** logical number to n. Arguments are TeX integer expressions with nonnegative results (including counter values).
- `\codelinesresetlinenr` selects the configured `start`, normally 1. Use `start=0` to reproduce historical zero-based starts/resets. A runtime `\CodelinesSetup{start=n}` changes the reset value; call the reset command to restart the current sequence.
- Every ordinary `\item` advances one shared sequence, including nested lines. Closing a nested block preserves its advancement.
- `\item[custom label]` is an unnumbered custom item and does not advance the sequence. Place numbered references on ordinary items.
- The public `codelineslinenr` counter contains the next number. The ten `clcodei` through `clcodex` counters remain the actual list counters.
- Ten codelines levels are supported; an eleventh produces a specific error. Ordinary list depth settings outside codelines are unchanged.

Padding affects labels only; a visual `0007` has reference value `7`. Digit count is a minimum, never a truncation limit. Its zero-glyph width is reserved even with `number-padding=false`; actual wider labels can enlarge that column. Auto width measures number labels and records one maximum width per outer block in the ordinary auxiliary file. It does not capture or re-typeset the algorithm. Rerun after a number grows beyond the prior estimate; on the first pass the right-aligned label may extend left of its reserved column, but is not clipped. With `\nofiles`, choose sufficient `number-digits` or `number-width` explicitly. Changes to block order or typography can require another run.

## References and hyperlinks

Ordinary `\label`/`\ref` needs no reference package. Load hyperref for links. Number resets do not reset destination identity: a private, never-reset reference counter supplies distinct `csCodeLine` destinations and comparison identities. Its printed representation is frozen to the logical line number. Spaced identities prevent false automatic range compression across resets; explicit range commands remain available. This also prevents cleveref from collapsing two different lines that both print as 1. No manual prefix is needed for uniqueness. Recompile references after upgrading; documents using external references to old anchor names should both be rebuilt.

```latex
\usepackage{codelines}
\usepackage{hyperref}
\usepackage{cleveref}
% ... \item Initialize.\label{line:init}
% \cref{line:init}; \Cref{line:init}; \cref{line:init,line:end}
```

All ten depths use cleveref's common `codeline` type: line/lines and Line/Lines. Pre-existing names for that type are preserved, and later customization wins:

```latex
\crefname{codeline}{step}{steps}
\Crefname{codeline}{Step}{Steps}
```

Native zref is independent:

```latex
\usepackage{codelines}
\usepackage{zref-user} % \zlabel and \zref
% ... \item Initialize.\zlabel{line:init}
% See line~\zref{line:init}.
```

For named, hyperlinked zref references:

```latex
\usepackage{hyperref}
\usepackage{zref-clever}
\usepackage{codelines}
\begin{document}
\begin{codelines}
  \item Initialize.\zlabel{line:init}
  \item Return.\zlabel{line:return}
\end{codelines}
\zcref{line:init}; \zcref[cap]{line:return};
\zcref{line:init,line:return}.
\end{document}
```

Codelines maps its reference counter and all ten list counters to zref-clever's built-in `line` type through public `\zcsetup` settings. The reference identity never resets, while the visible value follows the logical line number. It preserves localized and caller-configured names; customize with `\zcRefTypeSetup{line}{...}`. Zref-clever 0.5.1 requires LaTeX 2023-11-01 independently of codelines.

Cleveref and zref-clever can coexist. Zref-clever currently mirrors ordinary labels by default; native `\zlabel` also works with `labelhook=false`. If writing both stores explicitly under the same key, disable that mirror to avoid duplicate zref writes. No dual-label convenience wrapper is necessary.

Reference packages may precede or follow codelines in the preamble. Obey their own load-order rules (hyperref before cleveref). Names are registered by package hooks; codelines never loads cleveref or zref after document start. Csextras can select both providers with `references=both`.

## Layout helpers

- `\codelinesbox{width}{content}` is a top-aligned parbox using its **local width**, including inside nested lists, minipages and two-column pages. Use `\linewidth` for the currently available line.
- `\codelinesrightalign{content}` and `\codelinescenteralign{content}` add horizontal fill within that line; their content is grouped.
- `\codelinesplus` / `\codelinesminus` adjust subsequent item indentation and label separation by the configured indent. Assignments follow ordinary TeX grouping and end with the environment.

Unbreakable formulas can still exceed a narrow line; supply mathematical break points or a wider layout. No overflow warning is suppressed. Place labels on the intended numbered item, before stepping a different equation/theorem counter.

## Dependencies

Codelines requires enumitem and xcolor. Load hyperref, cleveref or zref-clever separately when using their reference commands.

The package owns the shared `\codecomment` callback and accepts an earlier definition from tcscrypto. Loading tcscrypto before or after codelines does not create a duplicate declaration.
