---
Owner: "Florian "
---
# Overview
Here, we aim to tackle the issue of having noise during the transmission of the code.
![[Untitled 105.png|Untitled 105.png]]
Therefore, we add more data (_codage_) to be able to figure out any missing or changed values in the code.

> [!important] **Codage**
> 
> in a nutshell, is about adding redundant information to detect and fix potential errors. We then obtain **code.**
# Definitions
## Binary word
A binary word is a set of 0 and 1. We define a message m to be part of the binary words set of size k like this $m \in F_2^k$
## Hamming distance
Given 2 binary words, we define the **Hamming distance** as the number of coordinates that differ.
**Example:**
![[Untitled 1 73.png|Untitled 1 73.png]]
## Linear code
- A linear code is a linear application: $m \in F_2^k \to c \in F_2^n$
- The space of the codes $\mathcal{C}$ is a vector sub-space of $F_2^n$ of dimension k.
- We call $G$ the $\mathcal{C}$ associated generative matrix of size k x n so that $mG = c$
    - The message is assumed to be written as row vector.
    - If the message is written as a column vector, $G^Tm = c$
    - The rows of $G$ compose a base of $\mathcal{C}$
- $\mathcal{C} = \{ mG\ |\ m\in F_2^k \}$

> [!important] The number of message (or word) is
> 
> $2^k$ and the number of code is $2^n$
We call $\mathcal{C}$ a $[n,k,d]$ code if the **minimum Hamming distance** between **2 distinct codes** is _d_.
# Codage solutions
## “Dum way”
![[Untitled 2 54.png|Untitled 2 54.png]]
Tripling the information is one of the way even tho it is heavily consuming data and therefore might not be the best.
An easy way to make sure the message is not changed in the transmission process is called the

> [!important] This method can also be applied to binary words and is then called “
> 
> **Repetition bit”**
## Parity bit
![[Untitled 3 40.png|Untitled 3 40.png]]
The parity bit is associated with the Binary word representation. One adds a zero or a one according to the number of 1 in the message to end up having an even number of 1 in the final code.