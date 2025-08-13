---
Owner: Tim Pearson
---
- start with two classes initial and not initial
- for each state in he set:
    - for each letter in Σ, put the child state with all its predecessors
    - if any of the predecessors are not in the class we have a conflict and split the class with the predecessors for that child state
- repeat until no confilcts
  
![[Untitled 123.png|Untitled 123.png]]
![[Untitled 1 89.png|Untitled 1 89.png]]
here we can see that 5 has parents 5, 2 and 4 with letter b
since 2 and 4 are not in the current class, we remove 5 from the class
![[Untitled 2 64.png|Untitled 2 64.png]]
here 5 has parents 5 and 1 with letter a
since 5 is not in the current class we remove 1 from the class
![[Untitled 3 48.png|Untitled 3 48.png]]