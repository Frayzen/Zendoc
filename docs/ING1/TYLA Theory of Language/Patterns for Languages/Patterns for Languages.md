---
title: Patterns for Languages
Owner: Tim Pearson
---
![[Untitled 56.png|Untitled 56.png]]

### syntactic sugar
![[Untitled 1 35.png|Untitled 1 35.png]]

## Rational Languages
![[Untitled 2 25.png|Untitled 2 25.png]]

- Intuitively, a language is rational if and only if there exists a regular expression whose language is L.
- By inductive definition, union, + and * also rational but not intersection and complement
- **==undecidable languages not rational.==**
- The empty set ∅ is rational
- The set Σ ∗ of all words is also rational. Assuming Σ = (a1 + . . . + an ), it is described by the expression e = (a1 + . . . + an ) ∗ .
- Note that any language L (rational or otherwise) verifies ∅ ⊆ L ⊆ Σ ∗.
### Properties
- (for now) Any rational language is decidable.
- **==TEST==**
    - L 1 and L 2 be two languages such that L 1 ⊆ L 2 . If L 1 is  
        rational, is L 2 always rational? If L 2 is rational, is L 1 always rational?
        
        Both properties are false. ∅ and Σ ∗ are rational, H is not (since it is undecidable), and yet ∅ ⊆ H ⊆ Σ ∗ .
        
- e 1 ≡ e 2 if two regex are equivalent
- COMMON EQUIVALENTS
    
    ![[Untitled 3 19.png|Untitled 3 19.png]]

