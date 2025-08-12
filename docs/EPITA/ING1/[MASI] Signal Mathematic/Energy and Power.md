---
title: "Energy and Power"
---
Last edited time: January 7, 2024 11:34 AM

# Energy of a signal

$$
E_x = ||x||^2
$$

- We usually use the **norm** $E_x =
\int_I
|x(t)|^2
dt$
- Any signal with [bounded support](Signal%20Classification.md) has **finite energy**
- *Real life* signals are always [discrete](Signal%20Classification.md) and have [bounded support](Signal%20Classification.md)

- Example
    
    ![Untitled](Energy%20and%20Power/Untitled.png)
    

### $L^{2}(I)$ Space

$$
 \mathcal{L}^2(I) \text{ is the space of square-integrable functions with finite energy over I:} \\
f \in \mathcal{L}^2(I) \implies
\int_I|f (t)|^2dt < \infty
$$

<aside>
🧠 This space is a **vector space** along with its vector product $\langle x, y \rangle = \int_I x(t)\overline{y(t)}dt$
In the context of real number, the vector product becomes $\langle x, y \rangle = \int_{\R} x(t)y(t)dt$

</aside>

Any signal that do not admit a [bounded support](Signal%20Classification.md) has **infinite energy**.

# Mean Power of a signal

The mean power of a signal x is the temporal average of its energy:

$$
P_x = \underset{T \rightarrow + \infty}{lim}\frac{1}{T}\int_{- \frac{T}{2}}^{\frac{T}{2}}|x(t)|^2dt
$$

It is used to have an equivalent measurement of energy for signals that do not admit a [bounded support](Signal%20Classification.md). 

<aside>
💡 The mean power of Asin(2πt/T) or Acos(sπt/T) is always A^2/2

</aside>

### $L^{pm}(I)$ Space

$$
 \mathcal{L}^{pm}(I) \text{ is the space of functions with finite mean power over I:} \\
x \in \mathcal{L}^{pm}(I) \implies
\underset{T \rightarrow + \infty}{lim}\frac{1}{T}\int_{- \frac{T}{2}}^{\frac{T}{2}}|x(t)|^2dt < \infty
$$

<aside>
🧠 This space is a **vector space** along with its vector product $\langle x, y \rangle = \frac{1}{T}\int_{- \frac{T}{2}}^{ \frac{T}{2}} x(t)\overline{y(t)}dt$
In the context of real number, the vector product becomes $\langle x, y \rangle = \frac{1}{T}\int_{- \frac{T}{2}}^{ \frac{T}{2}} x(t)y(t)dt$

</aside>

$$
\mathcal{L}^{pm}  \ \text{endowed with this dot product we have } \langle x,x \rangle = \|x\|^2 = P_x
$$

If x is T-periodic then:

$$
P_x = \frac{1}{T}\int_{- \frac{T}{2}}^\frac{T}{2}|x(T)|^2dt = \frac{1}{T} \int _0^T|x(t)|^2dt
$$

<aside>
🧠 The mean power is calculated over a **single** period

</aside>

# Relationship Energy / Mean Power

![Untitled](Energy%20and%20Power/Untitled%201.png)

$$
E_x < + \infty \Rightarrow P_x = 0 \\ 0 < P_x < + \infty \Rightarrow E_x = + \infty
$$
