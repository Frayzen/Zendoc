# ε-NFA and Thompson (1)

Owner: Tim Pearson

(non-deterministic finite automata with ε-transitions)

- EXERCISE: find a ε-NFA for (a* + bc*)b
    
    ![Untitled](NFA%20and%20Thompson/Untitled.png)
    

## Thompson Algorithm

![Untitled](NFA%20and%20Thompson/Untitled%201.png)

![Untitled](NFA%20and%20Thompson/Untitled%202.png)

- + ⇒ 4 ε
- x ⇒ 1 ε
- * ⇒ 4 ε
- to find the number of states after Thompson algorithm, we take n as the number of occurrences of ε, ∅, +, ∗, and letters in Σ and there will be exactly 2n states
- 

## The Backward Removal Algorithm

![forward removal ⇒ ε is in front so we skip](NFA%20and%20Thompson/Untitled%203.png)

forward removal ⇒ ε is in front so we skip

![Untitled](NFA%20and%20Thompson/Untitled%204.png)

![Untitled](NFA%20and%20Thompson/Untitled%205.png)

![Untitled](NFA%20and%20Thompson/Untitled%206.png)

### Method

![Untitled](NFA%20and%20Thompson/Untitled%207.png)

1. steps table
    - states vertical and repeat steps until we get equivalent results
    - we add the state itself and any states reachable by a ε edge
    - for the next step rewrite prev step and for each number, add all other states that number has E transitions to
    - repeat
2. skipping 

### Thompson ⇒ DFA

![600497C4-F823-4162-8C1A-328DA5DFBAD8.jpeg](NFA%20and%20Thompson/600497C4-F823-4162-8C1A-328DA5DFBAD8.jpeg)

- remember all states that include final states become final
- remove any states that are useless
- when doing backwards removal, include ε →ε→a and also loops with two states
