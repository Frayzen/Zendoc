---
Owner: Matcha
---
## What is it for ?
- Break the input into individual words or tokens
- Remove noise
    
    ![[Untitled 86.png|Untitled 86.png]]
    
  
  
## Lexical Token
### Definition
A sequence of character that can be treated as a unit in the grammar of the programming language
  
A **programming language classifies** lexical tokens into a finite set of **token types.**  
Each token is represented by a **regular expression**. In other words, each token defines a language.

> [!important] ==Order is important!==
> 
>   
> Usually, the first regular expression that matches determines the token type!
  
## Finite automa
### Definition
A deterministic finite automaton is an automaton where no two edges leaving the same  
state have the same symbol
- One can then combine all automata and determinize the resulting automaton
- This DFA can be encoded as a transition matrix and used programmatically
  
## Existing lexical analyzer
- Flex
- Ragel
- re2c
- JFlex
- Annoflex
- PLY
  
  
![[Untitled 1 59.png|Untitled 1 59.png]]