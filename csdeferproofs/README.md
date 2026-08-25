---
title: README
aliases: [README, 'README, "csdeferproofs"']
linter-yaml-title-alias: README
date created: Monday, May 18th 2026, 8:30:22 pm
date modified: Tuesday, August 25th 2026, 6:44:56 pm
---

<!-- @format -->

## csdeferproofs

Deferred-proof support for manuscripts with submission and eprint layouts. Submission mode captures selected proof bodies in an internal sequence and prints them in an appendix. Eprint mode leaves the same proofs inline.

The implementation is self-contained. It does not load an external deferred-proof framework or depend on a particular theorem declaration package, so it works with the repository’s native `ntheorem`, `amsthm`, and Springer LLNCS environments.

### Requirements

- LaTeX2e 2020/10/01 or later.
- A theorem layer that defines `proof` before the proof environments are used.
- The reference command selected by `commandref` must exist when `\printDeferredProofs` runs. The default is `\cref`.

### Usage

```latex
\usepackage[appendix=true]{csdeferproofs}
\NewDeferredThm{theoremE}{theorem}
\NewDeferredThm{lemmaE}{lemma}
```

Write the statement through its flagged wrapper and give the proof the statement label:

```latex
\begin{theoremE}[Main Result]
  \label{thm:main}
  The construction is secure.
\end{theoremE}

\begin{deferproof}{thm:main}
  Full proof here.
\end{deferproof}
```

Print the queue at the desired appendix location:

```latex
\appendix
\IfDeferredProofsActive{%
  \section{Deferred Proofs}
  \printDeferredProofs
}{}
```

### Options

Every option has a default, so `\usepackage{csdeferproofs}` is valid.

| Option | Type | Default | Effect |
| --- | --- | --- | --- |
| `appendix` | `true`/`false` | `true` | Capture proofs for later printing, or typeset them inline. |
| `commandref` | command name | `cref` | Reference command used in generated proof headings. |
| `proofname` | string | `Proof` | Default heading word for full proofs. |
| `sketchname` | string | `Proof Sketch` | Default heading for sketch proofs. |
| `category` | string | `defaultcategory` | Reserved compatibility option; retained so existing preambles continue to compile. |

Blank values revert to these defaults. Unknown options produce a package warning and are ignored.

### Dual-mode preamble

`\NewDeferredThm` creates statement wrappers only in appendix mode. Use `\NewDeferredThmAlias` in the eprint branch so that the same body source compiles in both modes.

```latex
\ifSubmission
  \usepackage[appendix=true]{csdeferproofs}
  \NewDeferredThm{theoremE}{theorem}
  \NewDeferredThm{lemmaE}{lemma}
\else
  \usepackage[appendix=false]{csdeferproofs}
  \NewDeferredThmAlias{theoremE}{theorem}
  \NewDeferredThmAlias{lemmaE}{lemma}
\fi
```

### API

#### `\NewDeferredThm[compatibility-options]{envE}{base-env}`

In `appendix=true` mode, declares `envE` as a transparent statement wrapper around `base-env`. The wrapper preserves the optional theorem title and leaves the statement at its source location. The optional first argument is retained for source compatibility and is otherwise ignored.

In `appendix=false` mode, this command is a no-op. Use `\NewDeferredThmAlias` in that branch.

#### `\NewDeferredThmAlias{envE}{base-env}`

In `appendix=false` mode, declares `envE` as a transparent alias for `base-env`, including its optional title. In appendix mode it is a safe no-op.

#### `\begin{deferproof}{label}[heading] … \end{deferproof}`

The main proof environment.

- With `appendix=true`, captures the body and later prints it under `heading`, when supplied, or under “Proof of <reference>”.
- With `appendix=false`, behaves as an ordinary `proof`; the optional heading is passed through.

The mandatory label determines the generated appendix reference.

#### `\begin{deferproofsketch}{label}[heading] … \end{deferproofsketch}`

The sketch counterpart. Its default appendix heading is “Proof Sketch of <reference>”; in inline mode it uses the configured `sketchname` as the proof heading.

#### `proofE` and `proofEsketch`

These lower-level environments capture a proof without a theorem label in appendix mode and act as ordinary proof environments in inline mode. Supply an explicit optional heading when collecting one, for example:

```latex
\begin{proofE}[Proof of the auxiliary claim]
  Proof body.
\end{proofE}
```

#### `\printDeferredProofs[heading-prefix]`

Prints every captured proof in source order. The default prefix is `Proof of`. Each entry receives an unnumbered subsection heading and the active proof-end symbol. The queue is retained after printing, so call this command exactly once unless repeated output is intentional.

#### `\IfDeferredProofsActive{true-code}{false-code}`

Selects code according to the `appendix` option. Use it to suppress an empty deferred-proof appendix in eprint mode.

### Compatibility

- `csamsmath`, `csbook`, `cslecture`, `csthm`, and `eudoxus` define `proof` during package loading and need no special ordering beyond loading the theorem package first.
- `llncscrypto` keeps Springer in control through the LLNCS `\spnewtheorem` mechanism. Load `llncscrypto` before `csdeferproofs`, then declare the wrappers after both packages.
- Custom theorem declarations work when their base environments and `proof` are available before the document uses a deferred wrapper.

### Common mistakes

- If `appendix=false`, define every flagged statement environment with `\NewDeferredThmAlias`.
- Call `\printDeferredProofs` once; omitting it drops the captured proof bodies from the output.
- Ensure that each label exists and that the selected `commandref` command is defined. Two LaTeX runs may be needed for resolved headings.
- Do not place verbatim material in a deferred proof body unless its environment supports capture inside an `xparse` body argument.

### License

LaTeX Project Public License v1.3c.

### Author

Agni Datta: [agni-datta/csLaTeX](https://github.com/agni-datta/csLaTeX)
