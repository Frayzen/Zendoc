---
title: "Convolution"
---
Last edited time: January 7, 2024 11:36 AM

$$
(f∗g)(\tau)=∫ _{-\infty}^{\infty} f(t)g(\tau−t)dt
$$

### **Commutativity**

$$
f \ast g = g \ast f
$$

### **Associativity**

$$
(f \ast g)\ast h = f \ast (g \ast h)
$$

### **Distributive**

$$
f∗(g+h)=(f∗g)+(f∗h)
$$

### Convolution with the [Delta funciton](Dirac%20Delta.md)

$$
f∗δ(t)=f(t)
$$

### Convolution Theorem

$$
\mathscr{F}(f∗g)=\mathscr{F}(f)⋅\mathscr{F}(g)
$$

- The convolution of two functions in the time domain is equivalent to the multiplication of their Fourier transforms in the frequency domain
- this is useful because we can calculate the convolution using the Fourier Transform

$$
(f∗g)=\mathscr{F}^{-1}(\mathscr{F}(f)⋅\mathscr{F}(g))
$$
