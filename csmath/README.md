---
title: LaTeX Commands for Computer Scientists (`csmath.sty`)
linter-yaml-title-alias: LaTeX Commands for Computer Scientists (`csmath.sty`)
date created: Monday, March 25th 2024, 13:49:48
date modified: Friday, January 17th 2025, 18:54:49
aliases: [LaTeX Commands for Computer Scientists (`csmath.sty`)]
---

# LaTeX Commands for Computer Scientists (`csmath.sty`)

This LaTeX package provides a collection of custom commands and notations tailored for use in computer science documents. It includes commands for mathematical expressions, number theory, set notation, calculus, vectors, combinatorics, trigonometric functions, probability and statistics, logic, document structure and formatting, language, complexity classes, polynomial hierarchy, basic complexity theory notations, and cryptographic notation.

- **Author:** Agni Datta
- **Version:** 1.0
- **Date:** 2024/04/15

## Package Overview

The `csmath` package offers a comprehensive set of custom LaTeX commands designed specifically for computer scientists. It covers a wide range of mathematical expressions, number theory, set notation, calculus, vectors, combinatorics, trigonometric functions, probability and statistics, logic, document structure and formatting, language, complexity classes, polynomial hierarchy, basic complexity theory notations, and cryptographic notation. The package aims to enhance the readability and expressiveness of computer science documents by providing intuitive and consistent commands for frequently used symbols and notations.

## Usage

To use the `csmath` package, simply include the following line in the preamble of your LaTeX document:

```latex
\usepackage{csmath}
```

This will import the package and make its features available for use throughout your document.

## Contents

1. **Mathematical Notation**
   - `\mathify{…}`: Ensure math mode for the argument.
   - `\set{…}`: Format a set with curly braces.
   - `\floor{…}`: Format the floor function.
   - `\abs{…}`: Format the absolute value function.
   - `\intersection`: Format the intersection symbol.
   - `\union`: Format the union symbol.
   - `\xor`: Format the XOR symbol.
   - `\Xor`: Format the big XOR symbol.
   - `\eqdef`: Format the equality by definition symbol.
   - `\eqq`: Format the uncertain equality symbol.
   - `\inq`: Format the uncertain membership symbol.
   - `\paren{…}`: Format parentheses without automatic sizing.
   - `\Paren{…}`: Format parentheses with automatic sizing.

2. **Number Theory**
   - `\gcd`: Format the greatest common divisor command.
   - `\lcm`: Format the least common multiple command.
   - `\lcmset{…}`: Format the least common multiple set command.
   - `\jacobi{…}{…}`: Format the Jacobi symbol.
   - `\legendre{…}{…}`: Format the Legendre symbol.

3. **Set Notation**
   - `\N, \Z, \Q, \R, \C, \Zplus, \Znonneg, \Rplus, \Rnonneg, \Qplus, \Qnonneg, \F`: Set notations for various number sets.

4. **Calculus and Analysis**
   - `\dd`: Differential operator.
   - `\ddiff{…}{…}`: Differential quotient.
   - `\pdiff{…}{…}`: Partial derivative.
   - `\gradientd{…}`: Gradient.
   - `\Diff{…}`: Differential of order n.

5. **Vectors**
   - `\i, \j, \k`: Unit vectors.

6. **Combinatorics**
   - `\nPr{…}{…}`: Permutations.
   - `\nPrf{…}{…}`: Permutations with factorials.
   - `\nCr{…}{…}`: Combinations.
   - `\nCrf{…}{…}`: Combinations with factorials.

7. **Trigonometric Functions**
   - `\arcsin, \arccos, \arctan, \arccot, \arcsec, \arccsc`: Inverse trigonometric functions.

8. **Probability and Statistics**
   - `\Prob{…}, \Pr`: Probability notation.
   - `\Exp{…}`: Expectation notation.
   - `\half`: Half as a fraction.

9. **Logic**
   - `\true, \false`: True and false symbols.
   - `\var{…}`: Variable representation.

10. **Document Structure and Formatting**
	- `\figcaption{…}`: Custom figure caption command.
	- `\tabcaption{…}`: Custom table caption command.
	- `\head{…}`: Custom chapter heading command.

11. **Language**
	- `\Lang`: Language notation.

12. **Complexity Classes**
	- `\Pclass, \NPclass, \coNPclass, \BPPclass, \RPclass, \coRPclass, \ZPPclass, \IPclass, \PHclass, \PSPACEclass, \EXPclass, \NEXPclass`
	- `\SigmaP{…}, \PiP{…}, \DeltaP{…}`: Notations for polynomial hierarchy.

13. **Basic Complexity Theory Notations**
	- `\bigO, \bigo{…}, \negl, \notice, \poly, \ppt, \PPT, \ind`: Notations for basic complexity theory.

14. **Cryptographic Notation**
	- `\cipher, \hash, \mac, \prf, \prp, \prg, \sig, \vrfy, \enc, \dec, \keygen, \keyexchange, \protocol, \attack, \advantage, \securityparam, \indcpa, \indcca, \authint, \nmac, \sufcma, \ufcma, \eav, \cca, \cpa, \sk, \pk`
