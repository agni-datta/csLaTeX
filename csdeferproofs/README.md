---
title: README
aliases: README
linter-yaml-title-alias: README
date created: Monday, May 18th 2026, 8:30:22 pm
date modified: Tuesday, June 23rd 2026, 8:36:43 pm
---

<!-- @format -->

## csdeferproofs

Collects theorem proofs and flushes them to a “Missing Proofs” appendix in submission mode; proofs stay inline in eprint mode. No source changes needed between modes: flip one option.

Built on [proof-at-the-end](https://ctan.org/pkg/proof-at-the-end). Compatible with `csamsmath`, `csbook`, `cslecture`, `llncscrypto` (with `theorems`), `csthm`, and any package that declares a `proof` environment before `\begin{document}`.

### The idea

You declare a flagged variant of each theorem environment you want to defer (e.g. `theoremE` alongside `theorem`). You write your theorem statement inside `theoremE` and its proof inside `deferproof`. In submission mode the proof is collected silently and flushed at `\printDeferredProofs`, with each proof under its own `\subsection*` heading “Proof of Lemma 3.4”. In eprint mode `deferproof` behaves exactly like a plain `proof` and everything stays in place. Theorem statements are always typeset: only the proofs move.

### Requirements

- `proof-at-the-end` (CTAN): required when `appendix=true`.
- `kvoptions`: package-option parsing.
- `etoolbox`: used only in `appendix=true` mode for end-of-preamble integration.

### Usage

```latex
\usepackage[options]{csdeferproofs}
```

#### Typical two-mode preamble

```latex
\ifSubmission
  \usepackage[appendix=true]{csdeferproofs}

  % Declare a flagged wrapper for each theorem type you want to defer.
  % Second argument is the base environment from your theorem package.
  \NewDeferredThm{theoremE}{theorem}
  \NewDeferredThm{lemmaE}{lemma}
  \NewDeferredThm{corollaryE}{corollary}

\else
  \usepackage[appendix=false]{csdeferproofs}

  % In eprint mode, create transparent aliases so the same source compiles.
  \NewDeferredThmAlias{theoremE}{theorem}
  \NewDeferredThmAlias{lemmaE}{lemma}
  \NewDeferredThmAlias{corollaryE}{corollary}

\fi
```

#### In the paper body

```latex
\begin{theoremE}[My Title]
  \label{thm:main}
  Statement of the theorem.
\end{theoremE}

\begin{deferproof}{thm:main}
  Full proof here. Moved to appendix in submission mode; inline in eprint mode.
\end{deferproof}
```

#### In the appendix

```latex
\appendix
\IfDeferredProofsActive{%
  \section{Missing Proofs}
  \label{appx:missing-proofs}
  \printDeferredProofs
}{}
```

### Options

| Option       | Type                   | Default           | Description                                                             |
| ------------ | ---------------------- | ----------------- | ----------------------------------------------------------------------- |
| `appendix`   | `true`/`false`         | `true`            | Collect proofs into an appendix (`true`) or keep them inline (`false`). |
| `commandref` | `cref`/`autoref`/`ref` | `cref`            | Reference command used in proof headings.                               |
| `category`   | string                 | `defaultcategory` | proof-at-the-end category; useful for multiple independent proof lists. |
| `proofname`  | string                 | `Proof`           | Heading word for full proofs.                                           |
| `sketchname` | string                 | `Proof Sketch`    | Heading word for sketch proofs.                                         |

```latex
\usepackage[appendix=true, commandref=cref, sketchname={Proof Outline}]{csdeferproofs}
```

### API

#### `\NewDeferredThm[pratend-options]{envE}{base-env}`

Declares `envE` as a flagged wrapper around the existing environment `base-env`. In `appendix=true` mode the proof is deferred. In `appendix=false` mode this is a no-op: `envE` is not defined (use `\NewDeferredThmAlias` for dual-mode source). The optional first argument passes extra proof-at-the-end pgfkeys to the wrapper, used for sketch variants:

```latex
\NewDeferredThm{theoremE}{theorem}
\NewDeferredThm{lemmaE}{lemma}
\NewDeferredThm{corollaryE}{corollary}

% Sketch variants: proof heading reads "Proof Sketch of Lemma 3.4"
\NewDeferredThm[text proof only theorem]{lemmaEsketch}{lemma}
\NewDeferredThm[text proof only theorem]{theoremEsketch}{theorem}
```

#### `\NewDeferredThmAlias{envE}{base-env}`

Companion to `\NewDeferredThm` for dual-mode source files. Always call it after `\NewDeferredThm` (the two can appear in opposite branches of `\ifSubmission`).

- `appendix=true`: safe no-op; the wrapper already exists.
- `appendix=false`: defines `envE` as a transparent alias for `base-env`, passing the optional title through and ignoring proof-at-the-end options.

```latex
% Submission branch
\NewDeferredThm{theoremE}{theorem}

% Eprint branch
\NewDeferredThmAlias{theoremE}{theorem}
```

#### `\begin{deferproof}{label}[heading] … \end{deferproof}`

The main environment for deferred proofs. The mandatory `{label}` argument is the label of the theorem being proved (the `\label{…}` inside `theoremE` / `lemmaE` / etc.).

- `appendix=true`: proof is collected and flushed at `\printDeferredProofs`; no placeholder text is printed where the proof appears in the source.
- `appendix=false`: proof renders inline as a plain `proof` environment.
- Optional `heading` is forwarded to the underlying proof environment in both modes.

```latex
\begin{deferproof}{thm:main}
  Full proof here.
\end{deferproof}

\begin{deferproof}{thm:main}[Proof of the Main Theorem]
  Full proof here with an explicit heading.
\end{deferproof}
```

> **Note:** The `{label}` argument is required for source compatibility but does not control where the proof appears: that is determined entirely by the `appendix` option. The label is kept as a design hook for potential future cross-referencing.

#### `\begin{deferproofsketch}{label}[heading] … \end{deferproofsketch}`

Like `deferproof`, but renders with the sketch heading (default: “Proof Sketch”). Use this when you give only a proof sketch and omit the full proof. In the appendix the heading reads: _Proof Sketch of Lemma X.Y_.

```latex
\begin{deferproofsketch}{lem:key}
  The main idea is... Full details are routine.
\end{deferproofsketch}
```

#### `\begin{proofE}[options] … \end{proofE}`

Raw proof-at-the-end proof environment, exposed for advanced use. Useful when you need to pass proof-at-the-end options directly. Falls back to a plain `proof` when `appendix=false`.

#### `\begin{proofEsketch}[options] … \end{proofEsketch}`

Raw sketch proof environment.

#### `\printDeferredProofs[heading-prefix]`

Flushes all collected proofs at the call site. Each proof is typeset under a `\subsection*` heading of the form:

```
heading-prefix ~ <cref of the theorem>
```

Default heading-prefix is built from the `proofname` option, giving _Proof of Lemma 3.4_ when `proofname=Proof`.

```latex
\section{Missing Proofs}
\printDeferredProofs                       % → "Proof of Lemma 3.4"
\printDeferredProofs[Deferred proof of]    % → "Deferred proof of Lemma 3.4"
```

Call this exactly once in the appendix. In `appendix=false` mode it is a no-op, so wrapping it in `\IfDeferredProofsActive` (see below) prevents an empty section in eprint.

#### `\IfDeferredProofsActive{true-code}{false-code}`

Conditional on whether `appendix=true`. Use this to gate entire appendix sections, so they do not appear as empty sections in eprint mode.

```latex
\IfDeferredProofsActive{%
  \section{Missing Proofs}
  \printDeferredProofs
}{}
```

### Sketch proofs: complete example

```latex
% Preamble
\NewDeferredThm[text proof only theorem]{lemmaEsketch}{lemma}

% Body
\begin{lemmaEsketch}[Sensitivity Bound]
  \label{lem:sensitivity}
  For every Boolean function $f$, $\mathrm{bs}(f) \leq s(f)^2$.
\end{lemmaEsketch}

\begin{deferproofsketch}{lem:sensitivity}
  Each sensitive block witnesses a distinct sensitive coordinate...
\end{deferproofsketch}
```

Appendix heading: _Proof Sketch of Lemma 3.4_.

### Compatibility notes

#### llncscrypto

`llncscrypto` declares `proof` inside an `\AtEndPreamble` hook using LLNCS theorem declarations. Because `csdeferproofs` also uses `\AtEndPreamble` to load `proof-at-the-end`, load order matters: `csdeferproofs` must appear **after** `llncscrypto` so its hook is appended later in the queue.

```latex
\usepackage[theorems, ...]{llncscrypto}
\usepackage{tcscrypto}                  % optional, load explicitly if needed
\usepackage[appendix=true]{csdeferproofs}   % must come after
```

#### csamsmath / cslecture

Both declare `proof` at load time (not in a hook), so `csdeferproofs` can appear anywhere after them.

#### csbook / csthm

Work without any special treatment.

#### Direct Theorem Declarations

If you declare theorem environments yourself, `csdeferproofs` works as long as `proof` is defined before `\begin{document}`.

### Common mistakes

- **Using `theoremE` in eprint mode without `\NewDeferredThmAlias`.** In `appendix=false` mode `\NewDeferredThm` is a no-op and `theoremE` is never defined. If your source uses `theoremE` in eprint mode you must also call `\NewDeferredThmAlias{theoremE}{theorem}`.
- **Forgetting `\printDeferredProofs`.** If you set `appendix=true` but never call `\printDeferredProofs`, the collected proofs are silently dropped. Always include it in your appendix section.
- **Calling `\printDeferredProofs` more than once.** Each call flushes the current queue. Calling it twice produces every proof twice. Call it exactly once.
- **Loading `csdeferproofs` before `llncscrypto`.** This causes a load-order conflict. Always load `llncscrypto` first (see Compatibility notes above).
- **Passing `category` directly to `proof-at-the-end`.** The `category` key is a pgfkey inside `proof-at-the-end`, not a package load-time option. `csdeferproofs` handles this correctly via `\pratendSetGlobal`: do not pass it to `proof-at-the-end` yourself.
- **`\thmt@shortoptarg` undefined errors on theoremE/lemmaE/corollaryE in eprint mode.** This is a `thmtools` bug: the list-of-theorems tracking code writes `\thmt@shortoptarg` literally into the `.aux` file, but that command is only defined locally inside a running theorem environment. When the `.aux` is read back at `\begin{document}`, the command is undefined. The package pre-defines `\thmt@shortoptarg` to empty in `appendix=false` mode to prevent this. If you see this error with a different theorem package, add `\makeatletter\providecommand{\thmt@shortoptarg}{}\makeatother` to your preamble.

### Full working example (submission + eprint, single file)

```latex
\documentclass{article}
\newif\ifSubmission
\Submissiontrue   % change to \Submissionfalse for eprint

\ifSubmission
  \usepackage{csamsmath}
  \usepackage[appendix=true]{csdeferproofs}
  \NewDeferredThm{theoremE}{theorem}
  \NewDeferredThm{lemmaE}{lemma}
  \NewDeferredThm[text proof only theorem]{lemmaEsketch}{lemma}
\else
  \usepackage{csamsmath}
  \usepackage[appendix=false]{csdeferproofs}
  \NewDeferredThmAlias{theoremE}{theorem}
  \NewDeferredThmAlias{lemmaE}{lemma}
  \NewDeferredThmAlias{lemmaEsketch}{lemma}
\fi

\begin{document}

\begin{theoremE}[Main Result]
  \label{thm:main}
  $1 + 1 = 2$.
\end{theoremE}

\begin{deferproof}{thm:main}
  By definition of addition.
\end{deferproof}

\begin{lemmaEsketch}[Key Lemma]
  \label{lem:key}
  Every even number is divisible by $2$.
\end{lemmaEsketch}

\begin{deferproofsketch}{lem:key}
  Immediate from the definition of even numbers.
\end{deferproofsketch}

\appendix
\IfDeferredProofsActive{%
  \section{Missing Proofs}
  \printDeferredProofs
}{}

\end{document}
```

### License

LaTeX Project Public License v1.3c.
