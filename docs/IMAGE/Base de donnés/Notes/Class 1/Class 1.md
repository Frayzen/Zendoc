---
Matière:
  - "[[Logique Formelle]]"
Type: Cours
Date du cours: 2025-05-20
Supports:
  - "[[lofo_slides_students_full-1-15.pdf]]"
---
# Synthax and semantics
### Syntax
The structural analysis of statements expressed as formulas.  
Truth is what we build using proofs.
### Semantics
Interpreting formulas according to a mathematical model.  
Truth is a pre-existing absolute meant to be discovered

> [!important] Those two notions are **NOT** equivalent.
  
# Properties of Propositional Formulas
## Of Induction
### Inductive definitions I

> Constructing arbitrarily complex objects from simpler ones through the means of fixed rules.
### Inductive definitions II
Inductive definition of a set $\mathcal{T}$
![[image 102.png|image 102.png]]
### Examples
1.
![[image 1 34.png|image 1 34.png]]
The exponent $^2$ stands for the arity of each rule. Depth $∞$ means that rules can be applied an unbounded but still finite number of times.
2.
![[image 2 34.png|image 2 34.png]]
## An inductive definition of depth
We can define functions on $\mathcal{T}$ such as depth inductively as well:
### Depth of a term
![[image 3 30.png|image 3 30.png]]
## Proof by structural induction
### Goal
Given an inductively defined set $\mathcal{T}$ and a predicate $\mathcal{P}$, prove that $∀x ∈ \mathcal{T} , \mathcal{P}(x)$ holds.
### Proof by structural induction.
![[image 4 28.png|image 4 28.png]]
### Exercice 1
Prove that an arithmetic expression (as defined inductively earlier) with $n$ operators always features $n + 1$ integers.
  
# Propositional Formulas
## An inductive definition
### Propositional formulas
The set $\mathcal{F}_0 = \mathcal{F}\{⊤,⊥,¬,∧,∨,⇒,⇔\}$ is defined inductively as follows:$\mathcal{A}. \mathcal{V} ∪ \{⊤, ⊥\}$ where $\mathcal{V}$ is a set of variables.
![[image 5 27.png|image 5 27.png]]
### Valuation
It is a function ν : V → {true, false}.
### Truth assignment function
Given a valuation ν, it is a function | |_ν: F0 → {true, false}.
## Semantics
### Tarski’s semantics
Defined inductively as follows:
![[image 6 25.png|image 6 25.png]]
C’est une definition inductible.
## Syntactic conventions and semantic properties
![[image 7 23.png|image 7 23.png]]
## Tautologies and antilogies
### Tautology
A propositional formula $φ$ such that for any valuation $ν$, $|φ|_ν = \text{true}$.
### Antilogy
A propositional formula $φ$ such that for any valuation $ν$, $|φ|_ν = \text{false}$.
### Satisfiable
A propositional formula $φ$ such that there exists a valuation $ν$ verifying $|φ|_ν = \text{true}.$
# Semantic Equivalence
## A proper definition
### Equivalence
![[image 8 21.png|image 8 21.png]]

> [!important] Any tautology is semantically equivalent to $⊤$, and any antilogy to $⊥$.
## An equivalence relation
![[image 9 21.png|image 9 21.png]]
## Sub-formulas
### A property of sub-formulas
![[image 10 20.png|image 10 20.png]]
It can be proven by structural induction on $φ$.

> [!important] This is a very useful property
### Property
![[image 11 19.png|image 11 19.png]]
It’s a consequence of Tarski’s semantics
  
# Properties of Propositional Formulas
## Truth Tables
### A definition
**Truth table of** $φ$
![[image 12 18.png|image 12 18.png]]
Conventionally, we write true := 1 and false := 0 in truth tables.
### The main operators
![[image 13 17.png|image 13 17.png]]
![[image 14 17.png|image 14 17.png]]
### Example
Prove that $ψ = P ⇒ Q ⇒ P$ is a tautology
![[image 15 17.png|image 15 17.png]]
### Exercice 2
Prove that $φ = A ∨ B ⇒ (A ⇒ C) ⇒ (B ⇒ C) ⇒ C$ is a tautology.
You have to be careful where you do the associativity.
Here : $φ = (A ∨ B) ⇒ ((A ⇒ C) ⇒ ((B ⇒ C) ⇒ C))$
![[image 16 17.png|image 16 17.png]]
### Equivalence
Property

> Two formulas with the same set of input variables are equivalent if and only  
> if they have the same truth table.
It is a direct consequence of the definition of truth tables.
  
## Properties of $\mathcal{F}_0$
### Distributivity
![[image 17 17.png|image 17 17.png]]
### De Morgan’s laws
![[image 18 17.png|image 18 17.png]]
### Double negation
![[image 19 17.png|image 19 17.png]]
### Material implication
![[image 20 16.png|image 20 16.png]]
### Double implication
![[image 21 15.png|image 21 15.png]]
### Law of the excluded middle
![[image 22 13.png|image 22 13.png]]
### Simplifying formulas
As a consequence of the previous properties:
**Theorem**
![[image 23 11.png|image 23 11.png]]
We can therefore **rewrite** formulas (here, by replacing $⇔$).
### Exercice 3
You’ve just met three people named Alice, Bob, and Carl.  
They make the following statements:
- Alice. “Exactly one of us is telling the truth.”
- Bob. “We are all lying.”
- Carl. “The other two are lying.”
Can you determine who’s lying, and who’s telling the truth?
  
# The Satisfiability Problem
## Introducing SAT
### A definition
**SAT**

> The satisfiafiability problem (also written SAT) consists in determining  
> whether a formula $φ ∈ \mathcal{F}_0$ is satisfiable, that is, whether there exists a  
> valuation ν such that$|φ|_ν = \text{true}$.
Programs meant to solve this problem are known as SAT **solvers**.
### Why SAT solvers?
SAT solvers can actually be used to solve a wide variety of problems.
### Exercice 1
$A, B, C, D,$ and $E$ all live in a house together. We want to find who is at home and who isn’t.
1. If $A$ is at home then so is $B$.
2. $D, E,$ or both are at home.
3. Either $B$ or $C$, but not both, are at home.
4. $D$ and $C$ are either both at home or both not at home.
5. If $E$ is at home then $A$ and $D$ are also at home.
Express this problem as a SAT instance.
### Exercice 2
Can a generic graph $\mathcal{G} = (V, E)$ be coloured using a set $C$ of 3 colours in such a manner two neighbouring vertices in $V$ do not share the same colour? Express this problem as a SAT instance.
![[image 24 10.png|image 24 10.png]]