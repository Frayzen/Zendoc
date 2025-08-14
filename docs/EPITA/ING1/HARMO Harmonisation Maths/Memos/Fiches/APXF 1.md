---
title: APXF 1
État: Done
---
# Metric space
## Distance
![[Untitled 166.png|Untitled 166.png]]

## Norm
![[Untitled 1 113.png|Untitled 1 113.png]]

# Convergence
## Simple
$Let\ x\in I, \lim_{n\to+\infty} f_n(x) = f(x)$
## Uniform
  
### Method 1 ✅
$Sup_{x \in I} | fn - f | = a_n\\\lim_{n\to+\infty}a_n =0$

> [!important] If a_n doesn’t converge to 0, then it doesn’t converge uniformly
### Method 2✅
$| fn - f | \leq a_n\\\lim_{n\to+\infty}a_n =0$

> [!important] a_n doesn’t depend on x
### Method 3 ❌
We can find a sequence Xn in I so that
$\lim_{n\to\infty}(f_n(X_n)-f(X_n)) \neq 0$
### Method 4 ❌
We prove f_n is continuous but the limit of f is not continuous