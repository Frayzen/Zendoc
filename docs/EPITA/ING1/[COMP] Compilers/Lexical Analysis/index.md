---
title: "Lexical Analysis"
---
Last edited time: March 12, 2024 9:58 AM

## What is it for ?

- Break the input into individual words or tokens
- Remove noise
    
    ![Untitled](Lexical%20Analysis/Untitled.png)
    

## Lexical Token

### Definition

A sequence of character that can be treated as a unit in the grammar of the programming language

A **programming language classifies** lexical tokens into a finite set of **token types.**
Each token is represented by a **regular expression**. In other words, each token defines a language.

<aside>
⚠️ Order is important!
Usually, the first regular expression that matches determines the token type!

</aside>

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

![Untitled](Lexical%20Analysis/Untitled%201.png)
