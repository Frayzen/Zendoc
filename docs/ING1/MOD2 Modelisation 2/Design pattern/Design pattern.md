---
Owner: "Florian "
---
# Introduction
A design pattern is an already-made solution to common problematic faced by software engineers (as well as other jobs).

> [!important] However, design pattern are
> 
> **not** an alternative to good-send or reflexion.
A design pattern can be expressed as:
- A context, problem, solution
- A problem, solution, consequences
A design pattern is subdivided in usage:
- Creation
- Structure
- Behavior
Or in abstraction:
- Architecture
- Conception
- Idiom
![[Untitled 100.png|Untitled 100.png]]
# Visitor design pattern (CPP)
![[Untitled 1 68.png|Untitled 1 68.png]]
This kind of representation has several issues:
- What if I want to add a new method ? I need to replicate it everywhere
- There is a lot of code duplicated
    
    ![[Untitled 2 49.png|Untitled 2 49.png]]
    
### Implementation
![[Untitled 3 36.png|Untitled 3 36.png]]
All of the object have to implement the accept method that has as only purpose to call the visitor appropriate visit method
![[Untitled 4 27.png|Untitled 4 27.png]]
It is really easy to add more visitor1
![[Untitled 5 20.png|Untitled 5 20.png]]
# Visitor design pattern (Lisp)
TODO