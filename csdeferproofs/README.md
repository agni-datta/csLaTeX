<!-- @format -->

# csdeferproofs 3.0.2

In-memory deferred proofs for conference and full-version sources. Author: Agni Datta. License: LPPL v1.3c. Requires LaTeX 2022-06-01 or newer. It loads no theorem package, reference package, or external proof framework and writes no external proof-body file.

## One source, two modes

```latex
\usepackage{csmath} % or an independent theorem provider
\usepackage[appendix=true,commandref=ref]{csdeferproofs}
\NewDeferredThm{theoremE}{theorem}

\begin{document}
\section{Results}
\begin{theoremE}[Main theorem]
  \label{thm:main}
  The invariant holds.
\end{theoremE}
\begin{deferproof}{thm:main}
  Induction establishes the invariant.
\end{deferproof}

\IfDeferredProofsActive{%
  \appendix
  \section{Deferred proofs}
  \printDeferredProofs
}{}
\end{document}
```

With `appendix=true`, the statement stays in place and the proof is printed at the explicit print command. With `appendix=false`, the same proof appears inline and printing does nothing. Neither mode creates an appendix or section automatically.

For an intentionally shortened submission that omits collected proofs, explicitly select `unprinted=ignore` (or `warning`). The default error prevents accidental loss of full arguments.

## Options

Native kernel keys validate choices and reject unknown options. Repeated identical selections are harmless; contradictory repeated selections are errors. Blank text options retain their historical fallback defaults.

| Option       | Values                                                                   | Default           |
| ------------ | ------------------------------------------------------------------------ | ----------------- |
| `appendix`   | `true`, `false`; bare means true                                         | `true`            |
| `commandref` | Name of an available one-argument reference command, without a backslash | `cref`            |
| `proofname`  | Heading text                                                             | `Proof`           |
| `sketchname` | Heading text                                                             | `Proof Sketch`    |
| `category`   | Inert compatibility text                                                 | `defaultcategory` |
| `unprinted`  | `error`, `warning`, `ignore`                                             | `error`           |

`category` does not select queues or introduce a category-management system. The optional compatibility argument to the statement declaration is likewise retained and ignored.

## Complete command and environment API

| Interface                                                             | Signature and behavior                                                                                                                                                    |
| --------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `\NewDeferredThm[compatibility-options]{envE}{base-env}`              | Declare a statement wrapper in **both** modes. It accepts one optional theorem title and uses the base environment unchanged.                                             |
| `\NewDeferredThmAlias{envE}{base-env}`                                | Compatible spelling for the same declaration. An identical prior mapping is accepted; a different mapping or occupied environment name is an error.                       |
| `\begin{deferproof}{label}[heading] ... \end{deferproof}`             | Explicitly associated full proof. Default deferred heading: “Proof of <reference>”; default inline heading: proofname.                                                    |
| `\begin{deferproofsketch}{label}[heading] ... \end{deferproofsketch}` | Explicit sketch, with sketchname in its default heading.                                                                                                                  |
| `\begin{proofE}[heading] ... \end{proofE}`                            | Implicit full proof of the single pending wrapped statement. With no pending statement, requires a custom heading.                                                        |
| `\begin{proofEsketch}[heading] ... \end{proofEsketch}`                | Corresponding implicit sketch.                                                                                                                                            |
| `\printDeferredProofs[heading-prefix]`                                | Print and consume the collected queue in capture order. Default full-proof prefix is “Proof of”. Custom entry headings and default sketch headings retain their own text. |
| `\IfDeferredProofsActive{true-code}{false-code}`                      | Branch on appendix mode.                                                                                                                                                  |

The base theorem environment must exist when used. Wrappers do not declare, share, reset, or replace its theorem counters. Use numbered statement environments. Existing declarations through the older mode-specific API can remain; separate inline declarations are no longer necessary.

```latex
\NewDeferredThm{lemmaE}{lemma}
\begin{lemmaE}[Auxiliary lemma]
  The reduction is correct.
\end{lemmaE}
\begin{proofE}
  This shorthand is unambiguous because exactly one wrapped statement is pending.
\end{proofE}
```

## Association and duplicate policy

In appendix mode, a wrapped statement receives a private label and a unique identifier. Its ordinary or native zref labels are associated with that identifier while the current reference value/counter belongs to the statement. Labeled equations inside a statement do not become statement aliases. Private identifiers use their own integer and never step theorem counters.

- Exactly one pending statement permits implicit `proofE`/`proofEsketch`.
- Two or more pending statements are ambiguous, even with a custom heading. Use an explicit statement label.
- An explicit proof for an earlier statement consumes that statement only. Unrelated pending statements remain.
- A statement with no proof may remain pending; this does not count as a lost proof body. Later implicit association may consequently require an explicit label.
- A sketch consumes implicit association just as a proof does. Use the explicit statement label for a later full proof.
- One full proof and one sketch may be assigned to the same statement. Repeating either kind is an error.
- Wrapped-statement aliases share duplicate detection. For ordinary unwrapped statements, duplicate detection uses the supplied label spelling; the package cannot establish that unrelated external label names denote the same statement.
- Grouped statements retain their pending identities globally. Local body macros are a separate issue described below.

An explicit reference to an ordinary theorem works without a wrapper:

```latex
\begin{theorem}\label{thm:ordinary}The result holds.\end{theorem}
\begin{deferproof}{thm:ordinary}
  A proof of an ordinary labeled theorem.
\end{deferproof}
```

In inline mode, association is unnecessary: proofs print at their source location. The explicit label is retained for source sharing but does not create an appendix heading.

## Queue safety

Printing removes the current queue before typesetting it. Calling the print command again emits “No new deferred proofs to print” and produces no repeated body. An initially empty queue behaves the same way. Proofs collected later remain in the queue for a subsequent print. Recursive printing from a queued body is an error.

At document end, remaining captured bodies trigger the configured unprinted policy and report their count. This concerns captured proof bodies, not statements for which no proof was supplied. `appendix=false` does not collect bodies and produces no unprinted-proof diagnostic.

## References

The default `commandref=cref` does **not** load cleveref. Load its provider in the preamble, or choose `commandref=ref` for ordinary LaTeX references. `Cref` and custom one-argument commands are also supported. Command names may contain letters and `@`; pass the name without `\`.

A missing command is an explicit error when a generated deferred heading needs it. A custom heading needs no generated reference. Undefined labels retain the selected reference system's visible unresolved-label diagnostics; compile sufficiently many times to resolve forward references.

Native zref is a separate label store:

```latex
\usepackage{csmath}
\usepackage{hyperref}
\usepackage{zref-clever}
\zcsetup{labelhook=false} % demonstrate native labels explicitly
\usepackage[commandref=zcref]{csdeferproofs}
\NewDeferredThm{theoremE}{theorem}
% ...
\begin{theoremE}\zlabel{thm:native}The result holds.\end{theoremE}
\begin{deferproof}{thm:native}The argument.\end{deferproof}
\printDeferredProofs
```

`commandref=zref` works with zref-user. With zref-clever's normal label mirroring enabled, ordinary labels can also populate its store. The package writes private statement labels once in each available store, disabling mirroring locally for that private write to avoid duplication. It does not silently manufacture a zref label for an arbitrary external ordinary theorem label.

Modern llncscrypto keeps cleveref and zref-clever separate; use the selected provider’s proper label store and reference command. Codelines references can occur inside stored proofs without changing theorem association.

## Proof headings and end marks

When `proof` exists, both modes use that environment with the resolved optional heading. The active theorem system owns font, spacing and QED placement; csdeferproofs appends no extra mark. Its documented symbol setters remain effective. Display endings follow that provider's rules: with amsthm, use its `\qedhere` when a mark inside the display is wanted. No automatic amsthm display-placement extension is claimed.

Without a proof environment, a small local fallback uses `\parhead` if available, otherwise an italic run-in heading. It uses an available public proof symbol or a small drawn square. It does not redefine `\paragraph`, choose fonts, or alter page layout. The fallback's final mark is a paragraph-end mark, not an automatic display-equation placement system.

Independent usage:

```latex
\documentclass{article}
\usepackage{amsmath,amsthm}
\newtheorem{theorem}{Theorem}
\usepackage[commandref=ref]{csdeferproofs}
\NewDeferredThm{theoremE}{theorem}
```

Csthm, csmath and LNCS documents keep their existing proof environments.

## Body capture and limitations

Bodies and custom headings are retained as unexpanded tokens. Label names are expanded and frozen at capture time, so redefining a label-name macro cannot redirect a later proof heading. Displays, alignments, lists, equation labels, references, footnotes, formatting and tcscrypto notation execute when the proof prints. Footnotes, equation counters and embedded algorithm line counters therefore belong to the print location in appendix mode. Inline mode executes them at the source location.

Macro meanings are **not snapshotted**. Define delayed notation globally or keep its defining scope alive until printing. A later redefinition is observed by a captured body. Local definitions that have expired before printing cannot be recovered. Verbatim, catcode-dependent input and environments that require uncaptured source scanning are not supported inside these captured bodies. Both modes use the same capture interface, making this limitation consistent.

A queue can contain many or long proofs, subject to the TeX engine's ordinary memory limits. No serialization, shell escape, runtime Python, or external proof file is used.

## Migration from 2.0

The old implementation overwrote the previous pending statement, retained printed bodies, omitted unprinted bodies silently, and required an undocumented parhead provider. These are corrected. Unknown options now error. Declarations work in both modes, and identical alias declarations are harmless.

Deferred appendix typography now comes from the active proof environment instead of a manually assembled paragraph heading plus appended QED. This intentionally changes some spacing, heading fonts and display-end placement. Equivalent inline output is preserved. The old category option remains inert; no new category framework is introduced.
