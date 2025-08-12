---
title: "Binary relation"
---
Last edited time: September 13, 2023 5:26 PM

- We want to properly define relations between objects.
- Formally, a binary relation on a set E is a subset R ⊆ E × E.
- We associate it with the binary predicate ∼R such that x ∼R y is
true if and only if (x, y) ∈ R.

# Properties

## Symmetry

If ∀x, y ∈ E,(x ∼R y) ⇐⇒ (y ∼R x), then R is said to be symmetric.

<aside>
💡 3 | 6 but 6 ∤ 3.

</aside>

## Reflexivity

If ∀x ∈ E,(x ∼R x), then R is said to be reflexive

## Transitivity

If ∀x, y, z ∈ E,(x ∼R y) ∧ (y ∼R z) ⇒ (x ∼R z), then R is said to be
transitive.

# Equivalence relation

A binary relation R is said to be an equivalence relation if it is reflexive, symmetric, and transitive. We then use the notation ≡R instead of ∼R.

## Equivalence classes

- We want to gather similar elements according to ≡R.
- Given x ∈ E, we define x’s equivalence class according to ≡R as the set [x]R such that y ∈ [x]R ⇔ x ≡R y
- We can also write [x]R = {y ∈ E | x ≡R y}.
- The element x is called a representative of [x]R

**Properties:**

The following properties on equivalence classes hold ∀x, y ∈ E:

1. x ∈ [x]R always
2. If x ≡R y then [x]R ∩ [y]R = ∅
3. If x ≡R y then [x]R = [y]R.

# Partition of a set

A (possibly infinite) set of sets P is said to be a partition of E if it verifies
the following properties:

**Non-empty subset**. ∀X ∈ P, X ⊆ E and X ̸= ∅

**Disjointness**. ∀X, Y ∈ P,(X ̸= Y ) =⇒ (X ∩ Y = ∅).

**Coverage**. ∀x ∈ E, ∃X ∈ P, x ∈ X.

<aside>
💡 The last two properties yield the conclusion ∀x ∈ E, ∃!X ∈ P, x ∈ X.

</aside>

### Quotient space of ≡R

The set of equivalence classes of E according to ≡R is called the quotient space of E according to ≡R, and written E/≡R.

### The canonical partition of ≡

E/≡R forms a partition of E.

<aside>
💡 As an example, ≡ mod p defines a partition of Z, written Z/pZ.

</aside>
