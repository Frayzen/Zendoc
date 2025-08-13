---
title: Operations
Owner: Tim Pearson
---
### Length
Given a word w over an alphabet Σ, its length |w| is equal to its total number of letters. In particular, |ε| = 0.
### Occurrences of a letter
Given a word w over an alphabet Σ and a letter a ∈ Σ, |w|a stands for the number of occurrences of a in w
$|w|_{a}= \text {n.o. occurances of the letter 'a' in the word}$
## Concatenation
$\text{\underline{lengths} :} \space \space \space \space \space |w_1 \cdot w_2| = |w_1| + |w_2| \newline \text{\underline{associative} :} \space \space \space \space \space (w_1 \cdot w_2) \cdot w_3= w_1 \cdot( w_2 \cdot w_3) \newline \text{\underline{definition} :} \space \space \space \space \space w_1 = abc, w_2 = def \newline w_1 \cdot w_2 = abcdef \newline \epsilon \space \text{is the neutral element} \newline \Rightarrow \varepsilon \cdot w = w$
## Exponent
$k \space \epsilon \space \aleph \newline w^k = w \cdot w \cdot w ...\text{(k times)} \newline \text{same rules as normal exponent in math}$
## Prefixes, suffixes, and factors
- each are sets of all possible
- x is a prefix of w if w = x · y. We then write x ∈ Pref(w)
- z is a suffix of w if w = y · z. We then write z ∈ Suff(w)
- y is a factor of w if w = x · y · z. We then write y ∈ Fact(w)
### To remember:
- ε ∈ ==Pref (w)==, ε ∈ ==Suff(w)==, ε ∈ ==Fact(w)==
- w ∈ ==Pref(w)==, w ∈ ==Suff(w)==, w ∈ ==Fact(w)==
- ==Pref(w)== ⊆ ==Fact(w)== and ==Suff(w)== ⊆ ==Fact(w)==
- ==Fact(w)== = ==Pref(====Suff(w)====)== = ==Suff(====Pref(w)====)==
- test
    
    ![[Untitled 55.png|Untitled 55.png]]
    
  
  
## Mirror
$w = abc \Rightarrow w^R = cba \newline w = w^R \Rightarrow \text{w is a palindrome}$
## Kleene Star
- Given a language L, we introduce L ∗ = L0 ∪ L1 ∪ L2 ∪ · · · = U n≥0 Ln , that is, the set of words than we can obtain by concatenating a finite number of words (possibly none) of L.
- In a similar manner, we define L+ = U n≥1 Ln as the set of words than we can obtain by concatenating at least one word of L.
- properties:
    - ε ∈ L∗, even if ε not ∈ L (does not apply for +)
  
### Set Operations
- we have normal and, or, subset, compliment
$A^c=\sum / A = \overline{A}$
- ==TEST==
    
    ![[Untitled 1 34.png|Untitled 1 34.png]]
    
![[Untitled 2 24.png|Untitled 2 24.png]]