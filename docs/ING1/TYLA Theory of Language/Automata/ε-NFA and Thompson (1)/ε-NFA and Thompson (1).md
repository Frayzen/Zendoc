---
title: ε-NFA and Thompson (1)
Owner: Tim Pearson
---
(non-deterministic finite automata with ε-transitions)
- EXERCISE: find a ε-NFA for (a* + bc*)b
    
    ![[Untitled 122.png|Untitled 122.png]]

    
  
## Thompson Algorithm
![[Untitled 1 88.png|Untitled 1 88.png]]

![[Untitled 2 63.png|Untitled 2 63.png]]

- + ⇒ 4 ε
- x ⇒ 1 ε
- * ⇒ 4 ε
- to find the number of states after Thompson algorithm, we take n as the number of occurrences of ε, ∅, +, ∗, and letters in Σ and there will be exactly 2n states
  
## The Backward Removal Algorithm
![[Untitled 3 47.png|Untitled 3 47.png]]

==forward removal ⇒ ε is in front so we skip==
![[Untitled 4 34.png|Untitled 4 34.png]]

![[Untitled 5 24.png|Untitled 5 24.png]]

![[Untitled 6 16.png|Untitled 6 16.png]]

  
### Method
![[Untitled 7 14.png|Untitled 7 14.png]]

1. steps table
    - states vertical and repeat steps until we get equivalent results
    - we add the state itself and any states reachable by a ε edge
    - for the next step rewrite prev step and for each number, add all other states that number has E transitions to
    - repeat
2. skipping
  
### Thompson ⇒ DFA
![[600497C4-F823-4162-8C1A-328DA5DFBAD8.jpeg]]

- remember all states that include final states become final
- remove any states that are useless
- when doing backwards removal, include ==ε →ε→a== and also loops with two states