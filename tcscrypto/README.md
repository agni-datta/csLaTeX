---
title: A LaTeX Package for Typesetting Theoretical CS and Cryptography (`tcscrypto.sty`)
linter-yaml-title-alias: A LaTeX Package for Typesetting Theoretical CS and Cryptography (`tcscrypto.sty`)
date created: Thursday, August 8th 2024, 15:30:01
date modified: Thursday, September 12th 2024, 15:50:56
aliases: [A LaTeX Package for Typesetting Theoretical CS and Cryptography (`tcscrypto.sty`)]
---

# A LaTeX Package for Typesetting Theoretical CS and Cryptography (`tcscrypto.sty`)

## Introduction

The `tcscrypto` package is designed to provide a comprehensive set of macros and commands for typesetting content related to theoretical computer science and cryptography in LaTeX. This package aims to enhance the readability and consistency of mathematical expressions, complexity notations, cryptographic primitives, and other specialized content commonly found in papers, presentations, and other technical documents.

## Key Features

1. **Cryptographic Notation**: The package provides a wide range of macros for common cryptographic elements, such as algorithms, security notions, mathematical objects, and operations. These macros help to maintain consistency and improve the visual representation of cryptographic concepts.
2. **Complexity Theory**: The package integrates with the `complexity` package to provide macros for common complexity classes, Landau notation, and other related concepts. This ensures a cohesive and standardized representation of complexity-theoretic ideas.
3. **Mathematical Typesetting**: The package defines a set of commands for various mathematical constructs, including vectors, matrices, sets, fields, and common mathematical functions. These commands ensure a uniform and visually appealing presentation of mathematical content.
4. **Formatting and Styles**: The package provides commands for consistent formatting of text, such as strike-through, italicization, and highlighting of keywords and citations. These features help to improve the overall aesthetic and readability of the document.
5. **Extensibility**: The package is designed to be extensible, allowing users to add their own custom macros and commands as needed to suit their specific requirements.

## Installation and Usage

To use the `tcscrypto` package, follow these steps:

1. **Installation**: Download the package files from the CTAN repository and place them in your LaTeX distribution’s package directory, or use your preferred package manager to install the package.
2. **Inclusion in the Document**: In your LaTeX document, add the following line to the preamble to load the package:

   ```latex
   \usepackage{tcscrypto}
   ```

3. **Usage**: Once the package is loaded, you can use the provided macros and commands throughout your document. For example, you can typeset a cryptographic primitive using the `\commit` command:

   ```latex
   The \commit scheme is a key component of many cryptographic protocols.
   ```

   Or, you can display a complexity class using the `\ComplexityFont` command:

   ```latex
   The problem is \ComplexityFont{NP}-complete.
   ```

## Supported Commands and Macros

The `tcscrypto` package provides a wide range of commands and macros for various purposes. The following sections outline the main categories and their usage.

### Cryptographic Notation

The package includes macros for commonly used cryptographic elements, such as algorithms, security notions, mathematical objects, and operations. Some examples include:

- `\Adv`: Adversary
- `\commit`: Commitment scheme
- `\gen`: Key generation function
- `\verify`: Verification function

### Complexity Theory

The package integrates with the `complexity` package to provide macros for complexity classes, Landau notation, and related concepts. Examples include:

- `\PSPACE`: PSPACE complexity class
- `\EXPpoly`: EXP with polynomial advice
- `\Omega`: Big Omega notation

### Mathematical Typesetting

The package defines commands for various mathematical constructs, such as vectors, matrices, sets, fields, and common mathematical functions. Examples include:

- `\avec`: Vector `a`
- `\bfA`: Boldface letter `A`
- `\bbR`: Blackboard bold `\mathbb{R}`
- `\ddiff`: Differential quotient

### Formatting and Styles

The package provides commands for consistent formatting and styling of text, such as:

- `\strike`: Strike-through text
- `\term`: Italicize and index a term
- `\keyword`: Format a keyword
- `\missingcitation`: Indicate a missing citation

### Miscellaneous

The package also includes various abbreviations and symbols, such as:

- `\eg`: “e.g.,”
- `\ie`: “i.e.,”
- `\vs`: “vs.”
- `\qed`: Quod Erat Demonstrandum symbol

## Customization and Extension

The `tcscrypto` package is designed to be easily customizable and extensible. Users can define their own macros and commands to suit their specific needs. For example, you can create new cryptographic primitives, complexity classes, or mathematical symbols by adding them to the package’s definitions.

To extend the package, you can create a new LaTeX file that loads the `tcscrypto` package and defines your custom macros and commands. Then, you can include this file in your LaTeX document, just like the main `tcscrypto` package.

## Compatibility and Requirements

The `tcscrypto` package requires the following packages to be installed:

- `ifthen`: For conditional checks
- `amsmath`, `amssymb`, `amsthm`: For mathematical typesetting
- `complexity`: For complexity theory macros
- `cryptocode`: For cryptographic notation macros

The package is compatible with standard LaTeX distributions, such as TeX Live and MiKTeX, and should work with most LaTeX document classes.

## Commands (re)Defined

### Cryptographic Elements and Functions

- `\Adv`: Adversary notation
- `\CRSGen`: Common Reference String Generation
- `\FS`: Fiat-Shamir transformation
- `\RO`: Random oracle
- `\accept`, `\reject`: Acceptance/rejection indicators
- `\accum`, `\acc`: Accumulation function/accumulator
- `\add`, `\delete`: Addition/deletion operations
- `\aux`: Auxiliary data
- `\batch`: Batch processing notation
- `\commit`, `\open`: Commitment scheme notations
- `\crs`: Common reference string
- `\environment`: Environment notation
- `\ep`: Pairing function symbol
- `\flag`: Flag indicator
- `\gen`: Key generation function
- `\groupgen`, `\group`: Group generator/symbol
- `\hashfunc`: Hash function symbol
- `\hidgrp`: Hidden group notation
- `\ideal`, `\real`: Ideal/real function or process
- `\len`: Length notation
- `\out`: Output function
- `\prove`, `\verify`: Proof generation/verification functions
- `\query`: Query operation
- `\reward`: Reward function
- `\sample`: Sampling function
- `\setup`: Setup algorithm
- `\state`: State indicator
- `\td`: Trapdoor information
- `\update`, `\updateproof`: Update operation/proof function
- `\view`: View or state representation
- `\witgen`, `\witupdate`: Witness generation/update functions

### Cryptographic Concepts and Problems

- `\AAE`, `\AE`, `\IBE`, etc.: Various encryption schemes
- `\CDH`, `\DDH`, `\SDH`: Diffie-Hellman problems
- `\DLP`, `\ECDLP`: Discrete Logarithm Problems
- `\FHE`, `\HE`: Homomorphic Encryption
- `\LPN`, `\LWE`: Learning problems
- `\MPC`, `\SMPC`: Multiparty Computation
- `\NIZK`, `\ZKP`: Zero-Knowledge Proofs
- `\OT`, `\ORAM`: Oblivious Transfer/RAM
- `\PKC`, `\PKE`: Public Key Cryptography/Encryption
- `\PRF`, `\PRP`: Pseudorandom Function/Permutation
- `\QNR`, `\QR`: Quadratic (non-)residue
- `\RSA`: RSA cryptosystem
- `\VC`: Vector Commitments

### Complexity Classes and Theory

- `\EXPTIME`, `\NEXPTIME`, `\NPpoly`, etc.: Various complexity classes
- `\IPP`, `\NIPP`, `\RIP`, etc.: Various proof systems
- `\CIRSAT`: Circuit satisfiability problem
- `\Lang`: Formal language notation
- `\NTM`: Non-deterministic Turing machine

### Mathematical Notation

- `\F`, `\GF`, `\N`, `\Q`, `\Z`, `\C`, `\R`: Number sets
- `\abs`, `\lcm`, `\gcd`: Basic operations
- `\floor`, `\ceil`: Floor/ceiling functions
- `\E`, `\Pr`, `\variance`: Probability and expectation
- `\grad`, `\div`, `\curl`, `\lap`: Vector calculus operators
- `\laplace`, `\fourier`, `\ztransform`, etc.: Transform notations
- `\arcsin`, `\arccos`, `\arctan`, etc.: Trigonometric functions
- Vector notations: `\avec`, `\bvec`, `\cvec`, etc.
- Font styles: `\bfa`-`\bfz`, `\rma`-`\rmz`, `\rmA`-`\rmZ`, `\bfA`-`\bfZ`, `\bbA`-`\bbZ`, `\calA`-`\calZ`, `\frakA`-`\frakZ`

### Abbreviations and Formatting

- Latin abbreviations: `\eg`, `\ie`, `\etc`, `\viz`, etc.
- English abbreviations: `\dr`, `\mr`, `\mrs`, etc.
- Academic titles: `\prof`, `\assocprof`, `\asstprof`, etc.
- Degrees: `\ba`, `\bsc`, `\ma`, `\phd`, etc.
- Time and date: `\ad`, `\bc`, `\am`, `\pmtime`
- Text formatting: `\code`, `\urlref`, `\strike`, `\keyword`, `\missing`, `\term`

## Reporting Issues and Contributing

If you encounter any issues or have suggestions for improvements, please feel free to open an issue on the package’s GitHub repository or contact the package maintainer. Contributions, such as bug fixes, new features, or documentation enhancements, are welcome and appreciated.

## Acknowledgments

The `tcscrypto` package is inspired by and builds upon the work of various researchers and developers in the fields of theoretical computer science and cryptography. The authors would like to acknowledge the contributions of the maintainers and contributors of the `complexity` and `cryptocode` packages, as well as the broader LaTeX community.
