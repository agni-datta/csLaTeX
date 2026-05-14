---
title: README
aliases: README
linter-yaml-title-alias: README
date created: Thursday, May 14th 2026, 10:23:37 pm
date modified: Thursday, May 14th 2026, 10:24:28 pm
---

<!-- @format -->

## tcscrypto

Mathematical notation and environment suite for Theoretical Computer Science and Cryptography.

### Usage

```latex
\usepackage{tcscrypto}
```

```latex
\documentclass{article}
\usepackage{tcscrypto}

\begin{document}
Let $\secparam$ be the security parameter.
The adversary $\algo$ samples $x \getsr \bits^{\secparam}$.
\begin{protocolbox}[Encryption Scheme $\Pi$]
    1. $k \getsr \KeyGen(1^{\secparam})$ \\
    2. $ct \getsr \Enc(k, m)$
\end{protocolbox}
\end{document}
```

### Features

- Standardized symbols for probability, complexity classes, and algebraic structures.
- Circuit complexity and graph theory macros.
- Proof complexity and SAT macros.
- Kolmogorov complexity macros.
- Syntactic builders to define algorithm, oracle, and problem suites via CSV lists.
- Cryptographic primitives: sampling, negligible functions, security games.
- Framed environments for protocol and algorithm blocks.

### API

#### Mathematical symbols

- `\secparam`, `\negl`, `\poly`, `\Pr`, `\bits`—standard TCS constants.
- `\getsr`, `\longsample`—random sampling arrows.
- `\NN`, `\ZZ`, `\QQ`, `\RR`, `\FF`—blackboard bold sets.

#### Complexity & TCS domains

- **Circuit complexity**: `\CktClass`, `\Depth`, `\Size`, `\Gates`, `\Width`, `\Wires`
- **Graph theory**: `\Vertex`, `\Edge`, `\Neighborhood`, `\degree`, `\source`, `\Sink`, `\leaf`
- **Proof complexity**: `\Clauses`, `\Tseitin`, `\Axioms`, `\proves`, `\Restrict`
- **Kolmogorov complexity**: `\Kolmogorov`, `\Kt`, `\KS`, `\KPoly`, `\pKt`

#### Syntactic builders

- `\cryptoDefineAlgoCSV{KeyGen/KeyGen, …}`—define a list of algorithmic macros.
- `\cryptoDefineOracleCSV{Reveal/Reveal, …}`—define a list of oracle macros.
- `\cryptoDefineProbCSV{…}`—define a list of computational problems.

#### Semantic entities

- `\Adv`, `\Sim`, `\Distinguisher`—adversarial entities.
- `\Experiment`, `\Game`, `\Simulator`—structural entities for proofs.

### Conflicts

- Loads the `complexity` package internally.
- Uses `mdframed` for protocol boxes; avoid conflicting frame settings.

### License

LaTeX Project Public License v1.3c.
