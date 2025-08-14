---
title: Introduction
Owner: Matcha
---
### Predecessors
Flavors, Common Loops (portable)
  
# Characteristics (diff with classic approach)
### 3 Layers → flexible
1. API (syntactic = Macros and not functions → 90% access)
2. API (functional)
3. Implementation

> [!important] Everything is open (even the 3rd layer)
  
### Generic functions ($\neq$ sending messages)
- Natural extension of classic functions → ==makes it more expressive==
- Sending messages not adapted to the n operations
- Multi-methods
- Methods don’t exist, there is only functions
  
### Multiple inheritance
Classes can have multiple parents → more expressive
List of mother classes → order for hierarchy (oldest to latest)
  
### Method combination
To dynamic dispatch - when calling a method it will search the closest implementation (most specific) in hierarchy
Combine all possible methods to give the final result
  
### MOP - Meta Object Protocol
The object oriented layer of the program is itself implemented object oriented → meta circularity
meta object = generic functions, classes ect
1rst class = anonymous manipulation
Gives a great power of expressiveness
  
### Dynamic typing (it’s Lisp)
  
### No encapsulation or protection
No private, protected ect
Need to be cautious yourself, can build it yourself
Orthogonal to object oriented programming