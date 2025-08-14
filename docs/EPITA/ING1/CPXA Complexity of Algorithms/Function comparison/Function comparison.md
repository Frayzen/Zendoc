---
title: Function comparison
Owner: "Florian "
---
> [!important] All of the comparisons are assumed to be done as n goes to infinity
# Summary
$l=lim_{n\to\infty}\frac{f(n)}{g(n)}\\f(n) \in$
![[Untitled 50.png|Untitled 50.png]]

# o (f < g)
$f(n) = o(g(n))\\  
10n^2=o(n^3)\\  
100n^3 \neq o(n^3)$

> [!important] f (n) is negligible compared to g(n)
  
# O (f ≤ g)
$f(n) = O(g(n))\\  
10n^2=O(n^3)\\  
100n^3=O(n^3)\\  
100n^2\neq O(n)$
- maximum

> [!important] f (n) is at worse proportional to g(n)
![[Untitled 1 30.png|Untitled 1 30.png]]

# Θ (f = g)
$f(n) = \Theta(g(n))\\  
100n^3=\Theta(n^3)\\  
10n^2\neq\Theta(n^3)$
- Definitely

> [!important] f (n) is proportional to / of the same order as g(n)
![[Untitled 2 20.png|Untitled 2 20.png]]

# Ω (f ≥ g)
$f(n)=\Omega(g(n))\\  
100n^3=\Omega(n^2)\\  
10n^2\neq\Omega(n^3)$

> [!important] f (n) is at least proportional to g(n)
![[Untitled 3 16.png|Untitled 3 16.png]]

# Sums
![[Untitled 4 13.png|Untitled 4 13.png]]

## Equivalences
![[Untitled 5 8.png|Untitled 5 8.png]]

