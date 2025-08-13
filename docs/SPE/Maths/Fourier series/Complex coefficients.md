---
title: Complex coefficients
Owner: "Florian "
---
$e^{-i\theta} = cos(\theta) + isin(\theta)$
$c_n(x) = \frac{a_n(x)-ib_n(x)}{2}$
$c_{-n}(x) = \frac{a_n(x)+ib_n(x)}{2}$
$c_n(f) = \frac{1}{2\pi} \int_{-\pi}^{\pi} f(x)e^{-inx}dx$
$a_0 = \frac{1}{\pi} \int_{-\pi}^{\pi} f(x) dx\\  
a_n = \frac{1}{\pi} \int_{-\pi}^{\pi} f(x) \cos(nx) dx\\  
b_n = \frac{1}{\pi} \int_{-\pi}^{\pi} f(x) \sin(nx) dx$
$f(x) = \frac{a_0}{2} + \sum_{n=1}^{\infty} \left[ a_n \cos(nx) + b_n \sin(nx) \right]$
$f(x) = \frac{c_0}{2} + \sum_{n=1}^{\infty} c_ne^{inx}$
# Regular (regularised) functions
We say that a function is regular if we have
$\forall x \in I, f(x) = \frac{lim_{\epsilon \to 0^+} f(x+\epsilon) + lim_{\epsilon \to 0^-} f(x+\epsilon)}{2}$