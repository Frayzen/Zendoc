---
title: "Euclidean Domain"
---
Last edited time: November 13, 2023 9:59 AM

## Euclidean function

$(A,+, \cdot)$ an **commutative ring**, $\delta:A^* \rightarrow\mathbb{N}$ is an Euclidean function on $A$ if :

- $\forall a,b \in A^*, \delta(a) \le \delta (ab)$
- $\forall (a,b) \in A\times A^*,\ \exists q,r \in A^* \ | \ a = bq + r,\ r = 0 \ \ or \ \ \delta(r) \lt \delta (b)$

<aside>
➡️ It is standard to extend a Euclidean function to all of $A$ by imposing $\delta (0)=- \infty$.
Then the second property of the previous definition becomes : $\\ \forall (a,b) \in A \times A^*,\ \exists q,r \in A \ | \ a = bq + r, \ \ \delta(r) \lt \delta (b)$

</aside>

# Euclidean domain

$A$ a **commutative ring** is an Euclidean domain if :

- $A$ is an **integral domain**
- $\exist \delta \in (A^*)^\mathbb{N}$  a **Euclidean function** on $A$

Under these conditions, $(A, +, \cdot)$ is said to be a Euclidean domain for the Euclidean function $\delta$.
