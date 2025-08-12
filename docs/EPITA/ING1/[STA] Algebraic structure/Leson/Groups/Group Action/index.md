---
title: "Group Action"
---
Last edited time: January 24, 2024 1:02 AM

# Group Action

The group $(G,\cdot)$ acts (on the left) on a set $X$ if $\exists \ \star : G \times X\rightarrow X$ such that :

- $\forall x\in X, e\star x=x$
- $\forall g,h\in G$ and $x\in X, g\star (h\star x)=(g\cdot h)\star x$

## Symetric Group

Let $n\geq1.$ The symetric group $S_n$ is the group of **bijections** on the set $\{ 1,...,n\}.$

# Orbit

Let $G$ be a group acting on a set $X$. The orbit of an element $x\in X$ is defined by :

$$
\mathcal{O} _x=\{ g\star x\ |\ \forall g\in G\}
$$

### Example:

For the action $\mathfrak{S} _3$ *on $W_3$*  by permuting letters we have that
$\mathcal{O} _ {abc}$ $= \{ abc, acb, bca, bac, cab, cba\}$.
$\mathcal{O} _ {abb}$ $= \{ abb, bab, bba\}$.

### Lemma

Let G be a left group action on a set X. $\forall x,y\in X, \mathcal{O} _x = \mathcal{O} _y$  or  $\mathcal{O} _x \bigcap \mathcal{O} _y = \emptyset$

## Stabilizer / Isotropy

Let $G$ be a left group action on a set $X$ and $x ∈ X$. The stabiliser of $x$ is
the subgroup of $G$:

$$
G_x = \{ g ∈ G\  |\  g * x = x\ \}
$$

# Isotropy

Let $G$ be a group acting on a set $X$. The isotropy subgroup $G_x$ of an element $x\in X$ is the subgroup of $G$ given by :

$$
⁍
$$

### Example:

For the action of $\mathfrak{S} _3$ on $W_3$ by permuting letters we have that
$G_{abc} = \{ id\}.$
$G_{abb} = \{ id, σ\},$ where $σ(1) = 1$, $σ(2) = 3$ and $σ(3) = 2$.

## Lemma

Let G be a left group action on a set X, $x ∈ X$, and $g, h ∈ G$. 

Then $g · x = h · x$ $\Rightarrow$ $h^{−1}g ∈ G_x$.
