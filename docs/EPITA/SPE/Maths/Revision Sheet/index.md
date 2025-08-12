---
title: "Revision Sheet"
---
Last edited time: May 5, 2023 4:47 PM

# Hilbert Space

## Bilinear form

a bilinear form checks all of this properties:

$$
\varphi(u+v,w) = \varphi(u,w)+\varphi(v,w)
$$

$$
\varphi(w,u+v) = \varphi(w, u) +\varphi(w,v)
$$

$$
\varphi(\lambda u,v) = \lambda\varphi(u,v)=\varphi(u, \lambda v)
$$

## Symmetric

a symmetric form check this property:

$$
\varphi(u,v) = \varphi(v,u)
$$

## Inner product

An inner product checks all of this properties

$$
Bilinear
$$

$$
Symmetric
$$

$$
\varphi(v,v) \geq0
$$

$$
if \langle v,v \rangle =0 \implies v = 0_E
$$

## Length

$$
\|u\| = \sqrt{\langle u,u\rangle}
$$

## Cauchy Schwartz Theorem

$$
|\langle x,y\rangle | \leq \|x\|.\|y\|
$$

## Minkowski Theorem

$$
\|\langle x+y,x+y\rangle \| \leq \|x\|.\|y\|
$$

## Norm

$$
u=\frac{v}{\|v\|}
$$

## Distance

$$
dist(u,v) = \|u-v\|
$$

# Sequence of function

## Supremum

for a function to admit a supremum, the function needs to be upper bounded

$$
f\ is\ M\ upper\ bounded \implies \exists M : \forall x \in I, f(x) \leq M
$$

<aside>
ℹ️ The supremum of a function is the **unique lowest upper bound**

</aside>

## Pointwise convergence

$$
f_n(x)\ converges\ pointwise\ to\ f\implies f_n(x) \underset{n\to+\infty}{\longrightarrow} f(x)
$$

Also written as

$$
\forall x \in I, \forall \epsilon > 0,\exists N \in \N \forall n \in \N\ (n \ge N \implies |f_n(x)-f(x)| < \epsilon)
$$

## Uniform convergence

In simple words, saying that a function converges uniformly is the same as saying:

> for any small value there is a value N where the difference between any of the functions where n is greater than N and the function f is below the given small value
> 

In a more proper way:

$$
\forall \epsilon > 0, \exists N \in \N, \forall n \in \N : (n \ge N \implies \forall x \in I |f_n(x) - f(x)| <\epsilon)
$$

a function converges uniformly to f if:

$$
The\ function\ converges\ pointwisely\ to\ f(x)\newline \underset{x\in I}{Sup}|f_n(x) - f(x)| \underset{n \to + \infty}{\longrightarrow} 0
$$

# Useful

![8C5EF46B-02A8-4C27-85E2-D38605DBC1EB.jpeg](Revision%20Sheet/8C5EF46B-02A8-4C27-85E2-D38605DBC1EB.jpeg)
