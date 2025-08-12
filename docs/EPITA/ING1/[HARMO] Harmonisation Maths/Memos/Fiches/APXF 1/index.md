---
title: "APXF 1"
---

# Metric space

## Distance

![Untitled](../../Remediation/Approximation%20of%20functions/Lecture%201/Untitled.png)

## Norm

![Untitled](../../Remediation/Approximation%20of%20functions/Lecture%201/Untitled%201.png)

# Convergence

## Simple

$$
Let\ x\in I, \lim_{n\to+\infty} f_n(x) = f(x)
$$

## Uniform

### Method 1 ✅

$$
Sup_{x \in I} | fn - f | = a_n\\\lim_{n\to+\infty}a_n =0
$$

<aside>
💡 If a_n doesn’t converge to 0, then it doesn’t converge uniformly

</aside>

### Method 2✅

$$
| fn - f | \leq a_n\\\lim_{n\to+\infty}a_n =0
$$

<aside>
💡 a_n doesn’t depend on x

</aside>

### Method 3 ❌

We can find a sequence Xn in I so that

$$
\lim_{n\to\infty}(f_n(X_n)-f(X_n)) \neq 0
$$

### Method 4 ❌

We prove f_n is continuous but the limit of f is not continuous
