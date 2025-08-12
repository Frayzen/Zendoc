---
title: "Function comparison"
---
Last edited time: October 29, 2023 2:28 PM

<aside>
⚠️ All of the comparisons are assumed to be done as n goes to infinity

</aside>

# Summary

$$
l=lim_{n\to\infty}\frac{f(n)}{g(n)}\\f(n) \in
$$

![Untitled](Function%20comparison/Untitled.png)

# o (f < g)

$$
f(n) = o(g(n))\\
10n^2=o(n^3)\\
100n^3 \neq o(n^3)
$$

<aside>
💡 f (n) is negligible compared to g(n)

</aside>

# O (f ≤ g)

$$
f(n) = O(g(n))\\
10n^2=O(n^3)\\
100n^3=O(n^3)\\
100n^2\neq O(n)
$$

- maximum

<aside>
💡 f (n) is at worse proportional to g(n)

</aside>

![Untitled](Function%20comparison/Untitled%201.png)

# Θ (f = g)

$$
f(n) = \Theta(g(n))\\
100n^3=\Theta(n^3)\\
10n^2\neq\Theta(n^3)
$$

- Definitely

<aside>
💡 f (n) is proportional to / of the same order as g(n)

</aside>

![Untitled](Function%20comparison/Untitled%202.png)

# Ω (f ≥ g)

$$
f(n)=\Omega(g(n))\\
100n^3=\Omega(n^2)\\
10n^2\neq\Omega(n^3)\\

$$

<aside>
💡 f (n) is at least proportional to g(n)

</aside>

![Untitled](Function%20comparison/Untitled%203.png)

# Sums

![Untitled](Function%20comparison/Untitled%204.png)

## Equivalences

![Untitled](Function%20comparison/Untitled%205.png)
