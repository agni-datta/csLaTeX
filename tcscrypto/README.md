<!-- @format -->

# tcscrypto 3.9.0

Notation for complexity theory, cryptography and mathematical writing. The package includes complexity classes, computational problems, primitives, algorithms, probability notation, pseudocode keywords and protocol boxes.

```latex
\documentclass{article}
\usepackage{amssymb}
\usepackage[notoc]{tcscrypto}
\begin{document}
$\NP,\TFNP,\CLS;\quad\MCSP,\MKTP,\MKtP,\LWE$.
\MCSPProb and \MKTPProb.
\end{document}
```

Use pdfLaTeX or LuaLaTeX. Load csmath before tcscrypto when using both. For LNCS, select `notoc` and leave fonts and theorems to the class. Do not load `complexity.sty` alongside tcscrypto.

## Options

| Option       | Default | Effect                                                                         |
| ------------ | ------- | ------------------------------------------------------------------------------ |
| `classfont`  | `sansbold` | `sansbold`, `sans` or `bold` for complexity classes.                        |
| `small`      | false   | Smaller class, algorithm and problem-acronym lettering.                        |
| `noemph`     | false   | Sans-serif emphasis.                                                           |
| `toc`        | true    | Loads tocbibind and, outside LNCS, setspace; defines `\toc`.                   |
| `notoc`      | —       | Disables TOC setup.                                                            |
| `venuestyle` | false   | Omits appendix loading and adjusts venue spacing. Do not use with llncscrypto. |

Boolean options accept `=true` and `=false`. The package uses the document's fonts. Particular commands may need AMS symbols, color, graphics or reference packages; load these separately if the document does not use csmath.

## Classes and problems

Classes use bold upright sans serif through `\ComplexityClassStyle`; problem acronyms use plain sans serif through `\problemacronymstyle`. Their styles can be changed separately. Full problem names use small capitals through `\probstyle`.

```latex
\usepackage[classfont=sansbold]{tcscrypto}
```

| Class font | Appearance      |
| ---------- | --------------- |
| `sansbold` | Bold sans serif |
| `sans`     | Sans serif      |
| `bold`     | Bold serif      |

The setting applies to the whole class name, including `\psdNP`. It does not change `\MCSP`, `\MKTP` or `\LWE`.

```latex
\RenewDocumentCommand{\ComplexityClassStyle}{m}{\mathrm{#1}}
\RenewDocumentCommand{\problemacronymstyle}{m}{\ensuremath{\mathtt{#1}}}
```

`\MKtP` keeps its superscript `t`. Use `\MCSPProb`, `\MKTPProb` and the other `...Prob` commands for full names. For ambiguous abbreviations, descriptive names such as `\ClosestVectorProblem` and `\CircuitValueProblem` specify the problem.

## Defining notation

`\mbf{...}` and `\vec{...}` use upright bold for vectors and matrices, including Greek letters. With Unicode math they use `\symbfup`; legacy math uses upright Greek glyphs locally, without changing scalar lettering. Generated `\MatA`–`\MatZ` commands remain upright bold.

CSV entries take the form `Name/Display`. Use `Name*/{expression}` for a compound expression with its own styling. Braces protect commas inside a display.

```latex
\cryptoDefineProblemAcronymCSV{
  MyProblem/MyProblem,
  IndexedProblem/{X[2,1]},
  CompoundProblem*/{\problemacronymstyle{Gap}\!\problemacronymstyle{X}^{t}}
}
\cryptoDefineProbCSV{MyProblemProb/My-Full-Problem-Name}
```

| Constructor                       | Style                  |
| --------------------------------- | ---------------------- |
| `\cryptoDefineComplexityClassCSV` | `\ComplexityFont`      |
| `\cryptoDefineProblemAcronymCSV`  | `\problemacronymstyle` |
| `\cryptoDefineAlgoCSV`            | `\algostyle`           |
| `\cryptoDefineClassCSV`           | `\funcstyle`           |
| `\cryptoDefineSchemeCSV`          | `\schemestyle`         |
| `\cryptoDefineKeyCSV`             | `\keystyle`            |
| `\cryptoDefineOracleCSV`          | `\oraclestyle`         |
| `\cryptoDefineProbCSV`            | `\probstyle`           |

CSV constructors keep existing commands. `\newclass`, `\newlang` and `\newfunc` take a command and its display, for example `\newclass{\MyClass}{MyClass}`; their `\renew...` counterparts change an existing command. The alphabet constructors `\newbb`, `\newcal`, `\newscr` and `\newsf` take the same two arguments.

## Primitives and operations

Define primitive names and their operations by family:

```latex
\cryptoDefinePrimitiveCSV{MyFHE,MyMPC,OtherName/Display}
\cryptoDefinePrimitiveOperationsCSV{
  MyFHE/{Dec,Enc,Eval,Gen,Verify/Vrfy},
  MyMPC/{Eval,Setup},
  CustomInterface*/{\MyFHE}/{Send,Setup*/{\Setup}}
}
```

This defines `\MyFHEGen` as MyFHE.Gen. `Verify/Vrfy` gives a command suffix and a different printed operation name. `Family*/{prefix}/{operations}` uses a specified prefix; `Setup*/{\Setup}` uses an existing command for the operation. Add a star after the constructor name to require unused command names.

`\cryptoDefineExpressionCSV{Name/{expression}}` defines aliases or other complete expressions. It also accepts a starred form that rejects existing names.

OWF and PRF operations keep their F prefixes. PCP operations use `\ProbabilisticallyCheckableProof`, TM operations use `\TMFHE`, and DJ operations use `\DJScheme`, leaving LaTeX's `\DJ` letter available.

Some names have separate mathematical and cryptographic meanings:

| Command                        | Meaning                                                                          |
| ------------------------------ | -------------------------------------------------------------------------------- |
| `\MPC`, `\MPCClass`            | Complexity class                                                                 |
| `\MultiPartyComputation`       | Cryptographic primitive                                                          |
| `\PC`, `\PolynomialCommitment` | Polynomial commitment                                                            |
| `\PolyCalculus`                | Proof system                                                                     |
| `\SETH`                        | Hardness assumption                                                              |
| `\SETHHash`                    | Hashing primitive; prefix for `\SETHGen`, `\SETHEval`, `\SETHInv`, `\SETHTdEval` |
| `\IND`                         | Arithmetic induction                                                             |
| `\LFHE`                        | Leveled fully homomorphic encryption                                             |

## Adversaries and pseudocode

`\advA` through `\advZ` are calligraphic letters. The commands `\adv`, `\bdv`, `\cdv`, `\ddv` and `\zdv` are aliases for the corresponding letters. Derivative commands such as `\mdv`, `\odv` and `\pdv` keep their usual meanings.

`\pcfont` controls pseudocode keywords and input/output labels. For example:

```latex
\RenewDocumentCommand{\pcfont}{m}{\texttt{#1}}
```

`\proofsystem{Frege}` prints a sans-serif proof-system name. `\hybchange` and `\HybridChange` highlight text with `IndianRed1`.

`\indicator{event}` prints a bold one with square brackets. `\mbar` and `\ConditionalBar` give a spaced conditional bar inside `\left...\right`. Outside LuaLaTeX, `\emptyset` uses `\varnothing`.

## Boxes and document headings

`proofbox`, `openproblemframe` and `protocolbox` use mdframed and can split across pages. Pass mdframed settings in the first optional argument. A protocol title belongs in the second optional argument:

```latex
\begin{proofbox}[linecolor=black]
  Proof text.
\end{proofbox}

\begin{openproblemframe}
  An open problem.
\end{openproblemframe}

\begin{protocolbox}[linewidth=0.7pt][Key generation]
  Protocol text.
\end{protocolbox}
```

For a protocol title with default settings, use `\begin{protocolbox}[][Title]`. Older single-argument titles need the empty first argument.

`\keywords{alpha \and beta}` prints keywords with centered-dot separators. The heading uses the class's `\keywordname`, or bold “Keywords:” when the class has none. `aidisclosure` starts a paragraph headed “AI Disclosure and Provenance”; write the disclosure text inside the environment.

## Regression check for moving arguments

From this package directory, run:

```sh
TEXINPUTS="$PWD:" latexmk -cd -pdf -interaction=nonstopmode tests/moving-arguments.tex
```

The fixture checks bold class names in headings and captions, upright Latin/Greek vectors, and styled vector arguments with `bm` loaded. latexmk repeats compilation so the generated contents and figure lists are read back. The bold wrapper must remain protected in moving arguments; the original AMS implementation supplies the font handling, and PDF-string registration preserves class text in bookmarks.

## Finding a command

The definitions in `tcscrypto.sty` are grouped by topic:

1. General mathematics and text helpers.
2. Complexity classes, problems, algorithms, circuits and graphs.
3. Cryptographic primitives, operations, assumptions, security notions and protocols.
4. Proof systems, bounded arithmetic, Kolmogorov complexity, lattices and other specialized notation.
5. Document environments, game references, pseudocode and boxes.

`mycomplexity.sty`, when present on the TeX search path, is read between the class catalogue and the later notation. Put ordinary document customizations after `\usepackage{tcscrypto}`.

Author: Agni Datta. License: LPPL 1.3c.

### Class and codelines compatibility

`\DescriptionEncoding{...}` always supplies the mathematical encoding delimiters. The shorter `\Description` name remains available when a class does not already own it; ACM retains its figure-accessibility command. Similarly, `\StateVar` supplies the mathematical state variable while an existing class-owned `\state` remains intact.

When codelines is loaded, it owns the shared `\codecomment` callback. Both package-loading orders are supported.

## Protocol glyph and document headings

`\Prot` and `\Protocol` use the native upright sans-serif capital Pi. With pdfLaTeX, a dedicated OT1 math-symbol declaration keeps its Greek slot independent of T1 text/math alphabet choices. Indexed and superscripted protocols retain their math semantics; the Unicode branch remains available without changing global alphabet settings. Protected bold-symbol expansion prevents unsafe moving arguments from corrupting generated contents.

`\TcsDocumentHeading` centralizes document-level heading behavior. Changelog headings add a TOC entry when used; the package does not insert a Changelog into unrelated manuscripts. The Papers common prefix supplies full-version section formatting and compact venue conventions.
