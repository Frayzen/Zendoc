---
title: Syntactic Analysis
Owner: Matcha
---
### What is it for ?
Check that a text (stream of token) is valid according to a given grammar
![[Untitled 88.png|Untitled 88.png]]
  
==We can’t just use regex==
  
### Language
**Def :** a set of strings, each string is a sequence of symbols from an **alphabet** → here the set of token types returned by the lexical analyzer
  
## Context-free Grammar
Set of recursive rules used to generate patterns of symbols.
  
A grammar has production rules of the form symbol → symbol symbol symbol  
Symbols can be:
terminal, meaning that this is a token from the alphabet.  
non-terminal, meaning that it appears on the left-hand side of some production
  
  
Derivations  
To detect if a sentence is in the expected language we can perform derivations:  
1 Start with a symbol  
2 Apply productions rules (Replace any non terminal by one of its right-hand side)  
3 Repeat until no more replacement  
There are many derivations:  
the leftmost non-terminal symbol is always expanded  
the rightmost non-terminal symbol is always expanded
  
## Ambiguous Grammar
If we can derive two different parse tree for a sentence
![[Untitled 1 61.png|Untitled 1 61.png]]
# Predictive parsing
Recursive descent parser which is able to predict which production rule is used to replace the input string.==⇒ each sub-expression must provide enough information to choose a production rule.==
  
  
![[Untitled 2 44.png|Untitled 2 44.png]]