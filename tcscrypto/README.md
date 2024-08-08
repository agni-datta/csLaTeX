---
title: A LaTeX Package for Typesetting Theoretical CS and Cryptography (`tcscrypto.sty`)
linter-yaml-title-alias: A LaTeX Package for Typesetting Theoretical CS and Cryptography (`tcscrypto.sty`)
date created: Thursday, August 8th 2024, 15:30:01
date modified: Thursday, August 8th 2024, 15:35:35
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

| Command                         | Description                                         |
| ------------------------------- | --------------------------------------------------- |
| `\aew`                          | “Almost everywhere” abbreviation                    |
| `\aka`                          | “Also known as” abbreviation                        |
| `\Adv`                          | Adversary                                           |
| `\add`                          | Addition operation                                  |
| `\ap`                           | “Attention” abbreviation                            |
| `\arcsin`                       | Inverse sine                                        |
| `\arccos`                       | Inverse cosine                                      |
| `\arctan`                       | Inverse tangent                                     |
| `\arccot`                       | Inverse cotangent                                   |
| `\arcsec`                       | Inverse secant                                      |
| `\arccsc`                       | Inverse cosecant                                    |
| `\arsinh`                       | Hyperbolic inverse sine                             |
| `\arcosh`                       | Hyperbolic inverse cosine                           |
| `\artanh`                       | Hyperbolic inverse tangent                          |
| `\arcoth`                       | Hyperbolic inverse cotangent                        |
| `\arsech`                       | Hyperbolic inverse secant                           |
| `\arcsch`                       | Hyperbolic inverse cosecant                         |
| `\assocprof`                    | “Associate Professor” abbreviation                  |
| `\asstprof`                     | “Assistant Professor” abbreviation                  |
| `\bfa`, `\bfb`, …, `\bfz`       | Boldface letters                                    |
| `\bfA`, `\bfB`, …, `\bfZ`       | Boldface letters in math mode                       |
| `\Ba`, `\Bb`, …, `\Bz`          | Blackboard bold letters                             |
| `\ba`                           | Bachelor of Arts                                    |
| `\bbA`, `\bbB`, …, `\bbZ`       | Blackboard bold letters in math mode                |
| `\bsc`                          | Bachelor of Science                                 |
| `\batch`                        | Batch processing                                    |
| `\calA`, `\calB`, …, `\calZ`    | Calligraphic letters                                |
| `\cat`                          | Format for category names                           |
| `\CDH`                          | Computational Diffie-Hellman                        |
| `\ceil`                         | Ceiling function                                    |
| `\cf`                           | “Compare” abbreviation                              |
| `\commit`                       | Commitment scheme                                   |
| `\comp`                         | Company abbreviation                                |
| `\crs`                          | Common reference string                             |
| `\DDH`                          | Decisional Diffie-Hellman                           |
| `\delete`                       | Delete operation                                    |
| `\DLP`                          | Discrete Logarithm Problem                          |
| `\deptof`                       | “Department of” abbreviation                        |
| `\dept`                         | Department abbreviation                             |
| `\dr`                           | Doctor abbreviation                                 |
| `\eds`                          | Editors abbreviation                                |
| `\ed`                           | Editor abbreviation                                 |
| `\ECDLP`                        | Elliptic Curve Discrete Logarithm Problem           |
| `\eg`                           | “For example” abbreviation                          |
| `\eng`                          | Engineer abbreviation                               |
| `\etal`                         | “Et al.” abbreviation                               |
| `\etc`                          | “Et cetera” abbreviation                            |
| `\EXPTIME`                      | Exponential time complexity class                   |
| `\EXPpoly`                      | EXP with polynomial advice                          |
| `\extractor`                    | Extractor function                                  |
| `\fax`                          | Fax abbreviation                                    |
| `\FHEA`                         | Fully Homomorphic Encryption with Applications      |
| `\FHE`                          | Fully Homomorphic Encryption                        |
| `\frakA`, `\frakB`, …, `\frakZ` | Fraktur letters                                     |
| `\flag`                         | Flag                                                |
| `\floor`                        | Floor function                                      |
| `\FS`                           | Fiat-Shamir transformation                          |
| `\Game`                         | Game                                                |
| `\gcd`                          | Greatest common divisor                             |
| `\gen`                          | Key generation function                             |
| `\groupgen`                     | Group generator                                     |
| `\group`                        | Cryptographic group                                 |
| `\hardequivocate`               | Hard Equivocation                                   |
| `\hashfunc`                     | Hash function                                       |
| `\HEA`                          | Homomorphic Encryption Applications                 |
| `\HE`                           | Homomorphic Encryption                              |
| `\HIBE`                         | Hierarchical Identity-Based Encryption              |
| `\hidgrp`                       | Hidden group                                        |
| `\HRA`                          | Homomorphic Random Access                           |
| `\i`, `\j`, `\k`                | Unit vectors                                        |
| `\IBE`                          | Identity-Based Encryption                           |
| `\ie`                           | “That is” abbreviation                              |
| `\ideal`                        | Ideal                                               |
| `\inmathbb`                     | Blackboard Bold style                               |
| `\inmathbf`                     | Boldface style                                      |
| `\inmathcal`                    | Calligraphic style                                  |
| `\inmathfrak`                   | Fraktur style                                       |
| `\inmathrm`                     | Upright style                                       |
| `\inmathsf`                     | Sans-serif style                                    |
| `\IPP`                          | Proofs of Proximity                                 |
| `\isPrime`                      | Prime checking function                             |
| `\jd`                           | Juris Doctor abbreviation                           |
| `\jr`                           | Junior abbreviation                                 |
| `\kSDH`                         | k-Strong Diffie-Hellman                             |
| `\keyword`                      | Format a keyword                                    |
| `\LPN`                          | Learning Parity with Noise                          |
| `\lcm`                          | Least common multiple                               |
| `\lect`                         | Lecturer abbreviation                               |
| `\LWE`                          | Learning With Errors                                |
| `\ma`                           | Master of Arts                                      |
| `\mba`                          | Master of Business Administration                   |
| `\md`                           | Doctor of Medicine                                  |
| `\missingcitation`              | Indicate a missing citation                         |
| `\missing`                      | Highlight missing or problematic text               |
| `\mPCR`                         | Multiparty Computation                              |
| `\msc`                          | Master of Science                                   |
| `\mrs`                          | Missis abbreviation                                 |
| `\mr`                           | Mister abbreviation                                 |
| `\ms`                           | Miss abbreviation                                   |
| `\NEXPTIME`                     | Non-deterministic exponential time complexity class |
| `\NIPP`                         | Non-Interactive Proofs of Proximity                 |
| `\NPpoly`                       | NP with polynomial advice                           |
| `\nb`                           | “Note well” abbreviation                            |
| `\NIZKs`                        | Non-Interactive Zero-Knowledge (plural)             |
| `\NIZK`                         | Non-Interactive Zero-Knowledge                      |
| `\ORAM`                         | Oblivious RAM                                       |
| `\OT`                           | Oblivious Transfer                                  |
| `\open`                         | Opening of a commitment                             |
| `\paren`                        | Parentheses                                         |
| `\PKC`                          | Public Key Cryptography                             |
| `\PCE`                          | Public Key Encryption                               |
| `\PDH`                          | Probabilistic Decision Diffie-Hellman               |
| `\pdiff`                        | Partial derivative                                  |
| `\Pr`                           | Probability                                         |
| `\PRIMES`                       | Primality testing complexity class                  |
| `\PRF`                          | Pseudorandom Function                               |
| `\PRGs`                         | Pseudorandom Generators                             |
| `\PRPfs`                        | Pseudorandom Permutation function(s)                |
| `\PRP`                          | Pseudorandom Permutation                            |
| `\ph`                           | Phone abbreviation                                  |
| `\phd`                          | Doctor of Philosophy                                |
| `\prof`                         | Professor abbreviation                              |
| `\prove`                        | Proof generation                                    |
| `\PSPACE`                       | PSPACE complexity class                             |
| `\PSPACEpoly`                   | PSPACE with polynomial advice                       |
| `\qed`                          | Quod Erat Demonstrandum symbol                      |
| `\QNR`                          | Quadratic Non-Residue                               |
| `\QR`                           | Quadratic Residue                                   |
| `\qSDH`                         | q-Strong Diffie-Hellman                             |
| `\query`                        | Query                                               |
| `\RLWE`                         | Random Learning With Errors                         |
| `\RKA`                          | Redactable Key Agreement                            |
| `\RNG`                          | Random Number Generator                             |
| `\RPG`                          | Randomized Polynomial Games                         |
| `\RTP`                          | Randomized Test Protocols                           |
| `\rf`                           | Reference abbreviation                              |
| `\rma`, `\rmb`, …, `\rmz`       | Upright letters                                     |
| `\rmA`, `\rmB`, …, `\rmZ`       | Upright letters in math mode                        |
| `\reject`                       | Denotes rejection                                   |
| `\RO`                           | Random oracle                                       |
| `\sr`                           | Senior abbreviation                                 |
| `\SDH`                          | Strong Diffie-Hellman                               |
| `\SFE`                          | Secure Function Evaluation                          |
| `\SMPC`                         | Secure Multiparty Computation                       |
| `\setup`                        | Setup algorithm                                     |
| `\softcommit`                   | Soft Commitment                                     |
| `\softopen`                     | Soft Opening                                        |
| `\state`                        | State                                               |
| `\strike`                       | Strike-through text                                 |
| `\td`                           | Trapdoor information                                |
| `\tel`                          | Telephone abbreviation                              |
| `\term`                         | Italicize and index a term                          |
| `\updateproof`                  | Update Proof                                        |
| `\update`                       | Update Operation                                    |
| `\urlref`                       | Hyperlinked URLs                                    |
| `\VCs`                          | Vector Commitments (plural)                         |
| `\VC`                           | Vector Commitments                                  |
| `\verify`                       | Verification function                               |
| `\view`                         | View or state                                       |
| `\vs`                           | “Versus” abbreviation                               |
| `\wlog`                         | “Without loss of generality” abbreviation           |
| `\witgen`                       | Witness generation                                  |
| `\witupdate`                    | Witness update                                      |
| `\wrt`                          | “With respect to” abbreviation                      |
| `\with`                         | “With” abbreviation                                 |
| `\ZKPs`                         | Zero-Knowledge Proofs (plural)                      |
| `\zkps`                         | Zero-Knowledge Proofs (plural)                      |
| `\ZKP`                          | Zero-Knowledge Proof                                |
| `\zkp`                          | Zero-Knowledge Proof                                |
| `\ZK`                           | Zero-Knowledge                                      |

## Reporting Issues and Contributing

If you encounter any issues or have suggestions for improvements, please feel free to open an issue on the package’s GitHub repository or contact the package maintainer. Contributions, such as bug fixes, new features, or documentation enhancements, are welcome and appreciated.

## Acknowledgments

The `tcscrypto` package is inspired by and builds upon the work of various researchers and developers in the fields of theoretical computer science and cryptography. The authors would like to acknowledge the contributions of the maintainers and contributors of the `complexity` and `cryptocode` packages, as well as the broader LaTeX community.
