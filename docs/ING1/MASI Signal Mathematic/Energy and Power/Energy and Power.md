---
Owner: Tim Pearson
---
# Energy of a signal
$E_x = ||x||^2$
- We usually use the **norm** $E_x = \int_I |x(t)|^2 dt$
- Any signal with [[Signal Classification]] has **finite energy**
- _Real life_ signals are always [[Signal Classification]] and have [[Signal Classification]]
  
- Example
    
    ![[Untitled 43.png|Untitled 43.png]]
    
### $L^{2}(I)$ Space
$\mathcal{L}^2(I) \text{ is the space of square-integrable functions with finite energy over I:} \\  
f \in \mathcal{L}^2(I) \implies  
\int_I|f (t)|^2dt < \infty$

> [!important] This space is a
> 
> **vector space** along with its vector product $\langle x, y \rangle = \int_I x(t)\overline{y(t)}dt$  
> In the context of real number, the vector product becomes $\langle x, y \rangle = \int_{\R} x(t)y(t)dt$
Any signal that do not admit a [[Signal Classification]] has **infinite energy**.
# Mean Power of a signal
The mean power of a signal x is the temporal average of its energy:
$P_x = \underset{T \rightarrow + \infty}{lim}\frac{1}{T}\int_{- \frac{T}{2}}^{\frac{T}{2}}|x(t)|^2dt$
It is used to have an equivalent measurement of energy for signals that do not admit a [[Signal Classification]].

> [!important] The mean power of Asin(2πt/T) or Acos(sπt/T) is always A^2/2
### $L^{pm}(I)$ Space
$\mathcal{L}^{pm}(I) \text{ is the space of functions with finite mean power over I:} \\  
x \in \mathcal{L}^{pm}(I) \implies  
\underset{T \rightarrow + \infty}{lim}\frac{1}{T}\int_{- \frac{T}{2}}^{\frac{T}{2}}|x(t)|^2dt < \infty$

> [!important] This space is a
> 
> **vector space** along with its vector product $\langle x, y \rangle = \frac{1}{T}\int_{- \frac{T}{2}}^{ \frac{T}{2}} x(t)\overline{y(t)}dt$  
> In the context of real number, the vector product becomes $\langle x, y \rangle = \frac{1}{T}\int_{- \frac{T}{2}}^{ \frac{T}{2}} x(t)y(t)dt$
$\mathcal{L}^{pm} \ \text{endowed with this dot product we have } \langle x,x \rangle = \|x\|^2 = P_x$
If x is T-periodic then:
$P_x = \frac{1}{T}\int_{- \frac{T}{2}}^\frac{T}{2}|x(T)|^2dt = \frac{1}{T} \int _0^T|x(t)|^2dt$

> [!important] The mean power is calculated over a
> 
> **single** period
# Relationship Energy / Mean Power
![[Untitled 1 23.png|Untitled 1 23.png]]
$E_x < + \infty \Rightarrow P_x = 0 \\ 0 < P_x < + \infty \Rightarrow E_x = + \infty$