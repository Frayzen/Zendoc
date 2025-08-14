---
title: Convolution
Owner: Tim Pearson
---
$(f∗g)(\tau)=∫ _{-\infty}^{\infty} f(t)g(\tau−t)dt$
### **Commutativity**
$f \ast g = g \ast f$
### **Associativity**
$(f \ast g)\ast h = f \ast (g \ast h)$
### **Distributive**
$f∗(g+h)=(f∗g)+(f∗h)$
### Convolution with the [[Dirac Delta]]

$f∗δ(t)=f(t)$
### Convolution Theorem
$\mathscr{F}(f∗g)=\mathscr{F}(f)⋅\mathscr{F}(g)$
- The convolution of two functions in the time domain is equivalent to the multiplication of their Fourier transforms in the frequency domain
- this is useful because we can calculate the convolution using the Fourier Transform
$(f∗g)=\mathscr{F}^{-1}(\mathscr{F}(f)⋅\mathscr{F}(g))$