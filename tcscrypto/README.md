---
title: README
aliases: README
linter-yaml-title-alias: README
date created: Sunday, April 12th 2026, 9:36:49 pm
date modified: Friday, May 1st 2026, 11:23:03 pm
---

<!-- @format -->

## tcscrypto

A comprehensive mathematical notation and syntactic environment suite tailored for Theoretical Computer Science (TCS) and Cryptography proofs.

### Features

- **Standardized Notations**: Consistent symbols for probability, complexity classes, and algebraic structures.
- **Circuit & Graph Theory**: Explicit macros for circuit complexity (e.g., `\Depth`, `\Size`, `\Width`) and graph elements (e.g., `\node`, `\Edge`, `\degree`).
- **Proof Complexity & SAT**: Dedicated macros for clauses, Tseitin encodings, and proof derivations (e.g., `\Axioms`, `\Clauses`, `\proves`).
- **Kolmogorov Complexity**: Comprehensive macros for classical and resource-bounded Kolmogorov complexity (e.g., `\KS`, `\Kt`, `\rKS`).
- **Syntactic Builders**: Macros for defining entire suites of algorithms, variables, and oracles via CSV lists.
- **Cryptographic Primitives**: Specialized commands for random sampling ($\getsr$), negligible functions ($\negl$), and security games.
- **Protocol Layouts**: Framed environments for presenting cryptographic protocols and algorithm blocks.

### Installation & Usage

#### Loading the Package

```latex
\usepackage{tcscrypto}
```

#### Basic Example

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

### Package Options

- **None**. This package prioritizes deterministic syntax rules and logic.

### API Reference

#### Mathematical Symbols

- `\secparam`, `\negl`, `\poly`, `\Pr`, `\bits`: Standard TCS constants and operators.
- `\getsr`, `\longsample`: Random sampling arrows.
- `\NN`, `\ZZ`, `\QQ`, `\RR`, `\FF`: Standard blackboard bold sets.

#### Complexity & TCS Domains

- **Circuit Complexity**: `\CktClass`, `\Depth`, `\Size`, `\Gates`, `\Width`, `\Wires`
- **Graph Theory**: `\Vertex`, `\Edge`, `\Neighborhood`, `\degree`, `\source`, `\Sink`, `\leaf`
- **Proof Complexity**: `\Clauses`, `\Tseitin`, `\Axioms`, `\proves`, `\Restrict`
- **Kolmogorov Complexity**: `\Kolmogorov`, `\Kt`, `\KS`, `\KPoly`, `\pKt`

#### Syntactic Builders

- `\cryptoDefineAlgoCSV{KeyGen/KeyGen, …}`: Defines a list of algorithmic macros.
- `\cryptoDefineOracleCSV{Reveal/Reveal, …}`: Defines a list of oracle macros.
- `\cryptoDefineProbCSV{…}`: Defines a list of computational problems.

#### Semantic Entities

- `\Adv`, `\Sim`, `\Distinguisher`: Adversarial entities.
- `\Experiment`, `\Game`, `\Simulator`: Structural entities for proofs.

### Conflicts & Requirements

- **Complexity**: Loads the `complexity` package internally.
- **mdframed**: Used for protocol boxes; ensure no conflicting frame settings are loaded.

### License

Everything in this repository is distributed under the **LaTeX Project Public License v1.3c**.
