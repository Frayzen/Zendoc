---
title: "Field"
---
Last edited time: November 12, 2023 9:00 PM

# Field

$(A,+,\times)$ a commutative ring, is a field if : $A^\times=A\backslash\{0_A\}$

A field is a ***commutative ring*** in wich *every non null element is **invertible***

<aside>
<img src="https://www.notion.so/icons/potted-plant_green.svg" alt="https://www.notion.so/icons/potted-plant_green.svg" width="40px" /> Every field is an integral domain

</aside>

## Subfield

$(\mathbb{K},+,\times)$ a field and $\mathbb{L}\subset \mathbb{K}$, $\mathbb{L}$ is a subfield of $\mathbb{K}$ if :

- $\mathbb{L}$ is a subring of $\mathbb{K}$
- $\mathbb{L}$ is a field for the operations of $\mathbb{K}$

### Caracterisation of subfield

$( \mathbb{K},+,\times)$ a field and  $\mathbb{L}\subset \mathbb{K}$, $\mathbb{L}$ is a subfield of $\mathbb{K}$ if and only if :

- $1_ \mathbb{K} \in \mathbb{L}$
- $\mathbb{L}$ is a subgroup of $( \mathbb{K},+)$ i.e. $\forall x,y\in \mathbb{L}, x-y\in \mathbb{L}$
- $\mathbb{L}^*= \mathbb{L} \backslash \{0_ \mathbb{K}\}$  is a subgroup of $( \mathbb{K}^*,\times)$  i.e. $\forall x,y\in \mathbb{L}^*,\ xy^{-1}\in \mathbb{L}$

 $\mathbb{Q}$ is a subfield of  $\mathbb{R}$ which is a subfield of  $\mathbb{C}$ itself

---

# Field

To have a field, you start with a ring and then impose additional conditions. A field is a more structured algebraic system that is a special type of ring with the added property that every nonzero element has a multiplicative inverse. Here are the conditions you need to check to determine whether a given ring is also a field:

1. **Existence of Multiplicative Inverses**: For every nonzero element 'a' in the ring, there must exist another element 'b' in the ring (the multiplicative inverse of 'a') such that a * b = b * a = 1, where '1' is the multiplicative identity of the field.
2. **Commutativity of Multiplication**: The multiplication operation in the ring must be commutative. In other words, for all elements 'a' and 'b' in the ring, a * b = b * a.
3. **Non-Triviality**: The ring must not be the trivial ring. In other words, it should have at least two distinct elements, the additive identity (0) and the multiplicative identity (1), and there must be at least one nonzero element.

## Common examples

Common examples of fields include the field of real numbers (ℝ), the field of complex numbers (ℂ), and finite fields like the field of integers modulo a prime (𝔽_p) or the field of binary numbers modulo 2 (𝔽_2).

<aside>
⚠️ It's important to note that **not all rings** are fields

</aside>

For example, the ring of integers (ℤ) is a ring, but it is not a field because not every nonzero integer has a multiplicative inverse within ℤ. However, the rational numbers (ℚ) and the real numbers (ℝ) are examples of fields because they satisfy all the conditions mentioned above.
