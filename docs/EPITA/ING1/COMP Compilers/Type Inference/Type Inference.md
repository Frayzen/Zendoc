---
title: Type Inference
Owner: Matcha
---
### What is it ?
Process of filling in missing type information

> [!important] It is different from type checking, but they are often used interchangeably!
  
# Inference Rule
Progressively type expressions
Types do not need to be explicit to have static typing. With inference rules, we can infer  
types.
Given a proper notation we can check the accuracy of the rules  
Given a proper notation, we can easily translate it into programs.
### Example
The statement :
$(e_1: Int ∧ e_2: Int) \Longrightarrow e1 + e2: Int$
Is a special case of :
$(Hypothesis_1: Int ∧ . . . ∧ Hypothesis_n: Int) \Longrightarrow Conclusion$
# Notation
$\frac{\vdash Hyp_1\ \ ...\ \ \vdash Hyp_n}{Conclusion}$
$\vdash$ means is provable that
### Example
Detect the type of a variable:
$\frac{\vdash i \ \ is\ an\ integer}{\vdash \ i:int}$
Detect the type of an expression:
$\frac{\vdash e_1 :int\ \ \vdash e_2 : int}{\vdash e_1 + e_2 : int}$
  
# In Tiger
## if-then-esle
Rule 1
$\frac{\Gamma \vdash c:\text{int}\ \ \ \Gamma \vdash e_1:\text{int}\ \ \Gamma \vdash e_2:\text{int}}{\Gamma \vdash \text{if} \ c\ \text{then}\ e_1\ \text{else}\ e_2:\text{int}}$
Rule 2
$\frac{\Gamma \vdash c:\text{int}\ \ \ \Gamma \vdash e_1:\text{string}\ \ \Gamma \vdash e_2:\text{string}}{\Gamma \vdash \text{if} \ c\ \text{then}\ e_1\ \text{else}\ e_2:\text{string}}$
To handle user-defined types we need generalisation
$\frac{\Gamma \vdash c:\text{int}\ \ \ \Gamma \vdash e_1:\text{T}\ \ \Gamma \vdash e_2:\text{T}}{\Gamma \vdash \text{if} \ c\ \text{then}\ e_1\ \text{else}\ e_2:\text{T}}$
## if-then
$\frac{\Gamma \vdash c:\text{int}\ \ \ \Gamma \vdash e_1:\text{Void}}{\Gamma \vdash \text{if} \ c\ \text{then}\ e_1:\text{Void}}$
## Assignment :=
$\frac{\Gamma \vdash c:\text{T}\ \ \ \Gamma \vdash e_1:\text{T}}{\Gamma \vdash \text{if} \ c\ \text{then}\ e_1:\text{Void}}$
## let-in-end
$\frac{\Gamma \vdash s_1:\text{?}\ \ \ \Gamma \vdash s_2:\text{?}\ \Gamma \vdash e_1:\text{T}}{\Gamma \vdash \text{let in} \ s_1; s_2;e_1\ \text{end}:\text{T}}$
We **cannot** type checking $s_1$ and $s_2$
### Steps
1. Visit the headers of all types in the block.
2. Visit the bodies of all types in the block
  

> [!important] For loops are Void type but the type checker shall ensure
> 
> **loop index variables are read-only**.
  
# Type Checking in practice
### Steps
1. break down expressions into their subexpressions
2. type-check the subexpressions
3. ensure that the top-level compound expression can then be given a type itself
Throughout the process, a type environment is maintained which records the types of all variables in the expression.
```C
let a := 1 in a + 3 end
```
![[Untitled 95.png|Untitled 95.png]]

Step 1. Fill Gamma. $\Gamma :\{a:int\}$
Step 2. Apply type inference :
$\frac{\frac{\Gamma \vdash a:\text{ int }\ \vdash 3:\text{ int}}{\Gamma\vdash a+3:\text{ int}}}{\Gamma\vdash\ \text{let}\ a:=1\text{ in }a+3\text{ end}:\text{int}}$