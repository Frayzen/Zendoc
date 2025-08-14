---
title: Lambda Calculus
Owner: Matcha
---
# What is it ?
Lambda calculus is a formal system in mathematical logic and computer science designed to represent computation based on function abstraction and application. ==It was introduced by mathematician Alonzo Church in the 1930s as a way to formalize the notion of effective computation.==
  
## Fundamental elements
### Variables : $x$
Denoted by letters, variables represent placeholders for values.
### Abstraction : $(\lambda x.M)$
Written as $\lambda$, abstraction allows the creation of functions. In $\lambda x.M$, "$x$" is a variable and "$M$" is an expression involving the variable. This represents a function that takes an argument "$x$" and produces the result specified by "$M$.”
### Application : $(MN)$
Application is the process of applying a function to an argument. In the expression $(\lambda x.M)\ N$, the function represented by $(\lambda x.M)$ is applied to the argument $N$.
  
  
## Operators
### $\alpha$-convention : $(\lambda x.M[x])\rightarrow(\lambda y.M[y])$
If you have a lambda abstraction $\lambda x.M[x]$, you can perform an $\alpha$-conversion by renaming the bound variable $x$ to $y$, resulting in $\lambda y.M[y]$. The purpose is to avoid naming conflicts with other variables.
  
### $\beta$-reduction : $((\lambda x.M)E)\rightarrow(M[x:=E])$
If you have an application of a function $\lambda x.M$ to an argument $E$, you can perform a beta reduction by substituting the argument $E$ for the bound variable $x$ in the body $M$, resulting in $M[x:=E]$. This operation represents the actual computation or evaluation of the function with the given argument.