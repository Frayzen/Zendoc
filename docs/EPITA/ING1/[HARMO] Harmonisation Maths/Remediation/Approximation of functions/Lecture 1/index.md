---
title: "Lecture 1"
---
Last edited time: September 5, 2023 2:40 PM

# Up to now

For now, functions f: R → R have been analyzed:

- limit study
- compute derivative
- study of sign of f’
- variations of f
- study remarkable points

**Can we replace the study of f by the study of functions we know better ?** 

→ sequence of functions

# Functions more or less similar

functions sharing some variations on same interval + same inflection point are called similar

f: x → x²

g: x → 2x²

<aside>
🧠 **Inflexion point:** point where the SECOND derivative changes its sign

</aside>

## 3 types of approximations

- Linear approximations
**Exemple**

$$
ax+b
$$

- Polynomial approximation
**Exemple**

$$
ax^2+bx+c
$$

- Approximation for Taylor Series
**Exemple**

$$
cos(x) = 1 - \frac{x²}{2!} + \frac{x^4}{4!} -...
$$

**Why approximate functions ?**

⇒ Make it easy to study (*max, min, limits…*)

Distance is an applications d : E x E → R+

![Untitled](Lecture%201/Untitled.png)

# Vector space

A vector space has an intern law (+) and extern law (.)

Let E be a vector space and u,v,w belongs to it

Let a,b be scalars.

The **intern law** is an abelien group:

- commutative
- associative
- there exists a unique 0 element
- every element has a symmetric so that u+v = 0

The **extern law** (*multiplication by scalar)* ****is:

- associative u(vw) = (uv)w
- valid 1.u = u
- distributive from addition (a+b)u = au+bu
- distributive from intern law (u+v).w = u.w+v.w

## Norm on a vector space

The norm (*written || . ||* ) is a function from E → [0, +inf[ satisfying:

![Untitled](Lecture%201/Untitled%201.png)

<aside>
💡 As soon as we defined a **norm** we can define a **distance** by:
d(x,y) = N(x-y)
*This is the generalization of what we already do one R ⇒ d(x,y) = | x - y |*

</aside>

### When p < inf:

### When p  = inf:

![Untitled](Lecture%201/Untitled%202.png)

![Untitled](Lecture%201/Untitled%203.png)

![Untitled](Lecture%201/Untitled%204.png)

![Untitled](Lecture%201/Untitled%205.png)
