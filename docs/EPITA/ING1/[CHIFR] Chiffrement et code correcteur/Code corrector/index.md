---
title: "Code corrector"
---
Last edited time: June 2, 2024 7:19 PM

# Overview

Here, we aim to tackle the issue of having noise during the transmission of the code.

![Untitled](Code%20corrector/Untitled.png)

Therefore, we add more data (*codage*) to be able to figure out any missing or changed values in the code.

<aside>
🧠 **Codage** in a nutshell, is about adding redundant information to detect and fix potential errors. We then obtain **code.**

</aside>

# Definitions

## Binary word

A binary word is a set of 0 and 1. We define a message m to be part of the binary words set of size k like this $m \in F_2^k$

## Hamming distance

Given 2 binary words, we define the **Hamming distance** as the number of coordinates that differ.

**Example:**

![Untitled](Code%20corrector/Untitled%201.png)

## Linear code

- A linear code is a linear application: $m \in F_2^k \to c \in F_2^n$
- The space of the codes $\mathcal{C}$ is a vector sub-space of $F_2^n$ of dimension k.
- We call $G$ the $\mathcal{C}$ associated generative matrix of size k x n so that $mG = c$
    - The message is assumed to be written as row vector.
    - If the  message is written as a column vector, $G^Tm = c$
    - The rows of $G$ compose a base of $\mathcal{C}$
- $\mathcal{C} = \{ mG\ |\ m\in F_2^k \}$

<aside>
🧠 The number of message (or word) is $2^k$ and the number of code is $2^n$

</aside>

We call $\mathcal{C}$ a $[n,k,d]$ code if the **minimum Hamming distance** between **2 distinct codes** is *d*.

# Codage solutions

## “Dum way”

![Untitled](Code%20corrector/Untitled%202.png)

Tripling the information is one of the way even tho it is heavily consuming data and therefore might not be the best.

An easy way to make sure the message is not changed in the transmission process is called the 

<aside>
🧠 This method can also be applied to binary words and is then called “**Repetition bit”**

</aside>

## Parity bit

![Untitled](Code%20corrector/Untitled%203.png)

The parity bit is associated with the Binary word representation. One adds a zero or a one according to the number of 1 in the message to end up having an even number of 1 in the final code.
