---
title: "Fourier series"
---
Last edited time: November 7, 2023 5:15 PM

[Complex coefficients](Fourier%20series/Complex%20coefficients.md) 

# Related

[D Spaces](Fourier%20series/D%20Spaces.md)

[Parseval Theorem](Fourier%20series/Parseval%20Theorem.md)

[Lejeune-Dirichlet](Fourier%20series/Lejeune-Dirichlet.md)

# Definitions

## **Piece-wise continuous**

![Untitled](Fourier%20series/Untitled.png)

A function that admits a finite number of points where it is not continuous (possibly 0). Every points have to admit finite limits in both directions. 

## T-Periodic

$$
\forall t\in \R ,f(t + T) = f(t)
$$

## Fourier series

$$
f(x) = \frac{a_0}{2} + \sum_{n=1}^{\infty} \left[ a_n \cos\left(\frac{n\pi x}{L}\right) + b_n \sin\left(\frac{n\pi x}{L}\right) \right]
$$

$$
f(x) = \frac{a_0}{2} + \sum_{n=1}^{\infty} \left[ a_n \cos(nx) + b_n \sin(nx) \right]
$$

In case of 2 pi periodic functions

$$
a_0 = \frac{1}{L} \int_{-L}^{L} f(x) dx\\
a_n = \frac{1}{L} \int_{-L}^{L} f(x) \cos\left(\frac{n\pi x}{L}\right) dx\\
b_n = \frac{1}{L} \int_{-L}^{L} f(x) \sin\left(\frac{n\pi x}{L}\right) dx\\
$$

Here, L denotes the half of the period

$$
a_0 = \frac{1}{\pi} \int_{-\pi}^{\pi} f(x) dx\\
a_n = \frac{1}{\pi} \int_{-\pi}^{\pi} f(x) \cos(nx) dx\\
b_n = \frac{1}{\pi} \int_{-\pi}^{\pi} f(x) \sin(nx) dx\\
$$

In case of 2 pi periodic functions

<aside>
🔑 reminder: f(x) odd function ⇒ a_n = 0, f(x) even ⇒ b_n = 0

</aside>

# Lesson

[FicheGeneralitessecurisee.pdf](Fourier%20series/FicheGeneralitessecurisee.pdf)

# Exercises

[Ex01securise.pdf](Fourier%20series/Ex01securise.pdf)

## Correction

[CorEx01securise.pdf](Fourier%20series/CorEx01securise.pdf)

[Useful stuff](Fourier%20series/Useful%20stuff.md)
