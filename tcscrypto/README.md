---
title: README
aliases: README
linter-yaml-title-alias: README
date created: Thursday, May 14th 2026, 10:23:37 pm
date modified: Tuesday, June 23rd 2026, 12:00:00 am
---

<!-- @format -->

## tcscrypto

Mathematical notation and environment suite for Theoretical Computer Science and Cryptography. Provides a large, standardized library of symbols, operators, and macros covering probability and sampling, complexity classes, algebraic structures, circuit complexity, graph theory, proof complexity, Kolmogorov complexity, and cryptographic primitives. Also provides framed `protocolbox` and `algorithmbox` environments for protocol and algorithm descriptions. Designed to be loaded once and give you a consistent notation baseline across a whole research project: no more redefining `\getsr` in every paper.

### Requirements

- Loads the `complexity` package internally for complexity class macros. Do not load `complexity` separately with conflicting options.
- Uses `mdframed` for protocol and algorithm boxes. If you also use `tcolorbox`, load it with the `most` compatibility option.

### Usage

```latex
\usepackage{tcscrypto}
```

No options. The full library is always loaded.

### Minimal example

```latex
\documentclass{article}
\usepackage{tcscrypto}

\begin{document}

Let $\secparam$ be the security parameter and $\KeyGen$ be a PPT algorithm. The adversary $\Adv$ samples $k \getsr \KeyGen(1^\secparam)$.

\begin{protocolbox}[Encryption Scheme $\Pi$]
    $\KeyGen(1^\secparam)$: Sample $k \getsr \bits^\secparam$. Output $k$. \\
    $\Enc(k, m)$: Output $c \gets k \oplus m$. \\
    $\Dec(k, c)$: Output $m \gets k \oplus c$.
\end{protocolbox}

\end{document}
```

### API

#### Security and probability

- `\secparam`: security parameter $\lambda$ (or $\kappa$, depending on convention; check the macro definition if needed).
- `\negl`: negligible function $\negl(\cdot)$.
- `\poly`: polynomial function $\poly(\cdot)$.
- `\PPT`: probabilistic polynomial time, rendered in small caps.
- `\bits`: bit strings $\{0,1\}$.
- `\getsr`: random sampling arrow $\xleftarrow{\$}$. Use as $x \getsr S$ for “x sampled uniformly at random from S”.
- `\longsample`: longer variant of `\getsr` for display math.
- `\Pr`: probability operator $\Pr[\cdot]$ with correct spacing.

#### Number sets (blackboard bold)

`\NN`, `\ZZ`, `\QQ`, `\RR`, `\CC`, `\FF`: natural numbers, integers, rationals, reals, complex numbers, and a generic field.

#### Paired delimiters (auto-sizing)

- `\abs{x}`: $|x|$
- `\norm{x}`: $\|x\|$
- `\ip{x,y}`: $\langle x, y \rangle$
- `\set{x}`: $\{x\}$
- `\ceil{x}`, `\floor{x}`: ceiling and floor brackets

#### Circuit complexity

- `\CktClass{C}`: circuit class name in the standard format.
- `\Depth(C)`, `\Size(C)`, `\Width(C)`, `\Wires(C)`: circuit resource measures.
- `\Gates(C)`: gate count.
- `\fan`: fan-in/fan-out notation.

#### Graph theory

- `\Vertex(G)`, `\Edge(G)`: vertex and edge sets of graph $G$.
- `\Neighborhood(v)`: neighborhood of vertex $v$.
- `\degree(v)`: degree of vertex $v$.
- `\source`, `\Sink`: source and sink vertices.
- `\leaf`: leaf node.

#### Proof complexity and SAT

- `\Clauses(\phi)`: clause set of formula $\phi$.
- `\Tseitin(G)`: Tseitin formula for graph $G$.
- `\Axioms`: axiom set.
- `\proves`: provability relation $\vdash$.
- `\Restrict(\phi, \rho)`: restriction of formula $\phi$ under assignment $\rho$.

#### Kolmogorov complexity

- `\Kolmogorov(x)`: plain Kolmogorov complexity $K(x)$.
- `\Kt(x)`: time-bounded Kolmogorov complexity $Kt(x)$.
- `\KS(x)`: space-bounded variant.
- `\KPoly(x)`: polynomial-time variant.
- `\pKt(x)`: probabilistic variant.

#### Syntactic builders for algorithm and oracle suites

These macros define families of commands from a comma-separated list of `key/DisplayName` pairs. Use them once in the preamble to set up a consistent notation for a protocol suite.

- `\cryptoDefineAlgoCSV{KeyGen/KeyGen, Enc/Enc, Dec/Dec}`: defines `\algo{KeyGen}`, `\algo{Enc}`, `\algo{Dec}` rendering in the appropriate algorithmic style. Also defines shorthand commands `\KeyGen`, `\Enc`, `\Dec`.
- `\cryptoDefineOracleCSV{Reveal/Reveal, Corrupt/Corrupt}`: defines oracle-style macros with the appropriate formatting.
- `\cryptoDefineProbCSV{DL/DL, CDH/CDH}`: defines computational problem macros in small caps.

#### Semantic entities

- `\Adv`: adversary $\mathcal{A}$.
- `\Sim`: simulator $\mathcal{S}$.
- `\Distinguisher`: distinguisher $\mathcal{D}$.
- `\Experiment{E}`: experiment $\mathsf{Exp}_{E}$.
- `\Game{G}`: security game $\mathsf{Game}_{G}$.
- `\Simulator`: simulator entity (alternate rendering).

#### Framed environments

Both environments accept an optional title argument in square brackets.

- `protocolbox[title]`: framed box for protocol descriptions. Renders with a bold title bar and a ruled border. Use for defining encryption schemes, signature schemes, or multi-party protocols.
- `algorithmbox[title]`: framed box for algorithm descriptions. Same visual style as `protocolbox` but semantically distinct. Use for reduction algorithms, distinguishers, or sub-routines.

```latex
\begin{protocolbox}[Game $\mathsf{IND\text{-}CPA}_{\Pi,\Adv}$]
    \item $k \getsr \algo{KeyGen}(1^\secparam)$ \\
    \item $(m_0, m_1) \getsr \Adv(1^\secparam)$ \\
    \item $b \getsr \bits$; $c \getsr \algo{Enc}(k, m_b)$ \\
    \item $b' \getsr \Adv(c)$; output $[b = b']$
\end{protocolbox}
```

### Caveats

- `tcscrypto` loads `complexity` internally. If you load `complexity` yourself with different options (e.g., a different class for `\P` or `\NP`), you will get option clash errors. Let `tcscrypto` manage `complexity` entirely, or load `tcscrypto` first.
- The syntactic builders (`\cryptoDefineAlgoCSV` etc.) define commands at call time. If you call them twice with overlapping names, the second call overwrites the first. Define all your algorithm suites in one place at the top of the preamble.
- `\Pr` redefines the standard `\Pr` operator. If another package has already defined `\Pr` differently, load `tcscrypto` first to avoid conflicts.
- `mdframed` boxes (`protocolbox`, `algorithmbox`) do not break across pages. If a protocol description is very long, it will overflow into the bottom margin. Split it manually into two boxes if needed.

### License

LaTeX Project Public License v1.3c.

### Author

Agni Datta: [agni-datta/csLaTeX](https://github.com/agni-datta/csLaTeX)
