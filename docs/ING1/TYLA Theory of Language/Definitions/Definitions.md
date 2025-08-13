---
title: Definitions
Owner: Tim Pearson
---
==(general)== ==**language**==: a set of sequences of elementary objects to  
which we ascribe meaning.
==**Alphabe**====t==: a finite set Σ of symbols. We call the elements of Σ letters. (a set is distinct)
==Word:== A word _w_ over an alphabet Σ is a (possibly empty) finite sequence of letters. The empty word is written ε
==The set of all words:== The set Σ∗ is the set of all words over Σ, and the set Σ+ = Σ∗ \ {ε}, the  
set of all non-empty words over Σ.
==(formal)== ==language==:
- A language L over an alphabet Σ is a set of words over Σ.
- L may be finite or infinite
- L is a subset of Σ ( i.e. L is a subset of all words)  
    
==**rational languages are decidable**==
## Decidable (recursive) languages
A language L over an alphabet Σ is said to be decidable (or recursive) if there exists an algorithm A such that, on any input w ∈ [Σ ∗](https://www.notion.so/4e9b8f42dea244f2b6746155c91dab30?pvs=21) :
- If w ∈ L, then A(w) answers true.
- If w not ∈ L, then A(w) answers false.
- Examples
    
    ![[Untitled 57.png|Untitled 57.png]]
    
    ![[Untitled 1 36.png|Untitled 1 36.png]]
    
- another definition:
    - the algorithm will reject words in L and reject words not in L
    - the algorithm will halt every time and give an answer (accepted or rejected) for all word inputs
  
## weaker decidable (recursively enumerable)
  
A language L over an alphabet Σ is said to be semi-decidable (or recursively enumerable) if there exists an algorithm A such that, on any  
input w ∈ Σ ∗ :
- If w ∈ L, then A(w) answers true.
- If w ̸∈ L, then A(w) answers false or does not end.
- another definition:
    - the algorithm will accept therefore halt for all words in L
    - it may or may not halt for words not in L
  
### ==RECURSIVE →RECURSIVELY ENUMERABLE==
  
### [Determinism](https://www.notion.so/4d1bf63a9b974e64b13b8ad5e70a8519?pvs=21) link
  
![[Untitled 2 26.png|Untitled 2 26.png]]