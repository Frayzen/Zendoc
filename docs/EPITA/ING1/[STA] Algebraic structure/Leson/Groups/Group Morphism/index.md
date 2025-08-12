---
title: "Group Morphism"
---
Last edited time: January 24, 2024 8:33 AM

# Group Morphism

Let $(G,.)$ and $(H,\star)$ be two groups. We call group morphism between $G$ and $H$ every map

 $\varphi : G → H$ satisfying :

$$
⁍
$$

### Examples

The multiplication by $2$ defines a group morphism from $(Z, +)$ towards $(2Z, +)$.
The map $Z → Z/2Z$ defined by the map "modulo  $2$" is a group morphism from $(Z, +)$ to $(Z/2Z, +)$
The map $exp : R → R^*$ defines a group morphism from $(R, +)$ to $(R^∗, ×)$.
The map $det : GL_n(K) → K^∗$
 sending a matrix on its determinant is a group
morphism $(GL_n(K), ×)$ to $(K^∗, ×)$.

## Homomorphism

$f:G\rightarrow H$ between the groups $(G,\cdot )$ $(H,\star ) \ |\ \forall x,y\in G,\ f(xy)=f(x)\star f(y)$ and $(H,\star ) \ |\ \forall x,y\in G,\ f(xy)=f(x)f(y)$

<aside>
💫 $\forall$ homomorphism  $f:G\rightarrow H, f(e)=e$   and  $f(x^{-1})=f(x)^{-1}$

</aside>

# Auto/endo/iso-morphism

A homomorphism $f : G → H$ is called :

- an **endomorphism** if $G = H$
- an **isomorphism** if $f$ is **bijective**
- an **automorphism** if f is both an **endomorphism** and an **isomorphism**.

<aside>
🧠 AUTO = ENDO + ISO

</aside>

### Proposition

Let $(G,\cdot )$ be any group and $H$ its set of automorphisms $\Longrightarrow (H,\circ )$ is a group.

# Kernel

Let $\varphi : G → H$  be group morphism between $(G,.)$ and $(H,\star)$. The kernel of $\varphi$ is th subset of $G$ given by :

$$
Ker(\varphi )=\{ g\in G | \varphi (g)=e_H \}
$$

# Image

Let $\varphi : G → H$  be group morphism between $(G,.)$ and $(H,\star)$. The image of $\varphi$ is the subset of $H$ given by :

$$
Im(\varphi )=\{ h \in H\ |\  \exists g \in G, h=\varphi (h)\}
$$

<aside>
📌 $Ker(\varphi )$ is a subgroup of $G$ and $Im(\varphi )$ is a subgroup of $H$

</aside>

# Orthogonal Endomorphism

The endomorphism $f\in \mathcal{L} (\mathbb{R}^n)$ is said to be orthogonal if for all $x,y\in \mathbb{R}^n$

$$
\langle f(x),f(y) \rangle = \langle x,y\rangle
$$

## Properties

- The composition of two orthogonal endomorphisms is still an orthogonal endormorphism.
- The inverse of an orthogonal endormophism is orthogonal.
- The set of orthogonal endomorphisms of $R^n$ endowed with the composition of maps is a subgroup of the group of linear automorphisms of $R^n$.
- An endomorphism $f$ of $R^n$ is orthogonal iff its matrix M in the canonical basis satisfies $M^TM = I_n$.

I

# Orthogonal matrices Group

We writte $O(n)$ the subgroup of $GL_n(\mathbb{R})$ composed of the orthoginal matrices.

The orthogonal group $O(2)$ is composed of rotations and orthogonal symmetries.

$$
⁍
$$
