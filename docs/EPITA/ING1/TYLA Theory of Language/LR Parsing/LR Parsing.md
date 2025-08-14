---
title: LR Parsing
Owner: Tim Pearson
---
- Bottom up parser
- only rule (0) can use symbols Z and $ (Z → S$)
- input stream ends after symbol $.
- ⇒if the bottom up parser accepts, the last action is always a reduction for $
  
  
![[Untitled 52.png|Untitled 52.png]]

![[Untitled 1 31.png|Untitled 1 31.png]]

==**1) Build the DFA**==
![[Untitled 2 21.png|Untitled 2 21.png]]

**==2) all final states without the dot preceded by $ are REDUCE, otherwise ACCEPT. non final states are SHIFT==**
![[Untitled 3 17.png|Untitled 3 17.png]]

==**3) Create the table**==
## Reduce-Reduce Confict
![[Untitled 4 14.png|Untitled 4 14.png]]

## LR(0)
- L stands for the left to right scanning
- R stands for rightmost  derivation in reverse
- reduce-reduce and shift-reduce conflicts
- no two states can have a conflict (i.e. being a ==reduce and an accept action==)
- ==not the case for LR(1) ^==
  
## LR(1)
- uses one-symbol lookahead ⇒ helps in resolving conflicts and making more informed decisions
- more efficient and can handle more boarder class grammars
## SLR: Simple LR
uses a limited form of lookahead to make parsing decisions. It considers only the follow set of the non-terminals involved in the production rules.
- can solve shift-reduce conflict problems by entering ‘reduce’ corresponding to FOLLOW of LHS of production in the terminating state. This is called SLR(1)
  
[[More examples]]

