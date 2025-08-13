---
Owner: Tim Pearson
---
Suppose we have a vector $| \psi \rangle$ in the standard basis, and we want to represent it in two different basis:
$\{e_i\}$ and $\{f_i\}$
$| \psi \rangle = \sum _i\langle e_i | \psi \rangle | e_i \rangle$ in the first basis [1]
$| \psi \rangle = \sum _j\langle f_j | \psi \rangle | f_j \rangle$ in the second basis [2]
where $\langle e_i , \psi \rangle$ and $\langle f_i , \psi \rangle$ are the **coordinates** of $| \psi \rangle$ in the respective basis
each basis vector $| e_i \rangle$ can be rewritten in terms of the other basis:
$|e _ i \rangle = \sum _ j \langle f _ j | e _ i \rangle | f _i \rangle$ [3]
where $\langle f_ i | e _i \rangle$ are the **matrix elements** of thec hange of basis operator
if we substitute [3] in the expansion of $| \psi \rangle$ [1], we get:
$| \psi \rangle = \sum _ i \langle e_i | \psi \rangle | e_i \rangle$
$= \sum _ i \langle e _ i | \psi \rangle \sum _ j \langle f _ j | e_i \rangle | f_j \rangle$
$= \sum _k \left( \sum _ i \langle e_i | \psi \rangle \langle f_j | e_i \rangle \right) | f_j \rangle$
this tells us that the coeficients of $| \psi \rangle$ in the $\{|f_j \rangle\}$ basis are:
$\langle f_j | \psi \rangle = \sum _ i \langle f _ j | e_i \rangle \ \langle e_i | \psi \rangle$