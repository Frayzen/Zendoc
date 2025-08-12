---
title: "Limits and continuity"
---
Last edited time: September 8, 2023 11:06 AM

# Limit of a two vaiable functions

## Neighborhood

We use the notion of disk *(delta)* to define the neighborhood of a point **a** = (a,b)

$$
\{x\in\R²\ : \|x-a\|<\delta\}
$$

<aside>
👁️ *See [distance](../Approximation%20of%20functions/Distance.md)*

</aside>

From that, we can establish a **first definition** of the limit allowing to build fundamental **properties**

<aside>
💡 Une différence notable, par rapport au cas à 1D, c’est que
l’on peut désormais approcher un point par plusieurs
directions ou chemins (en fait une infinité...).

</aside>

## Interior point and boundary point

![Untitled](Limits%20and%20continuity/Untitled.png)

- An interior point is a point that has a disk fully contained inside of the domain
- A boundary point has a disk which can lands outside of the domain

It raises a **problem**: the limit cannot be defined by a simple disk considering the boundary points

## Continuity of two variables functions

We say that f(x) is continuous in x0 if

$$
(1) f(x_0)\ exists
\newline
(2)\lim_{x\rightarrow x_0}f(x)\ exists
\newline
(3) \lim_{x\rightarrow x_0}f(x)\ = f(x_0)
\newline
$$

# Function of 3 variables and more

Going from dim2 to dim3 or more is easy by generalizing the formula using the Euclidean norm (*for example*).

$$
\| x - a \| =  \sqrt{\sum_{i=1}^{n} (x_i-a_i)²}
$$

<aside>
💡 There exists several norms and we can consider different way to compute “distance”.

</aside>

## Partial derivative

In order to obtain some information about variation of the surface, we can derivative in respect of one of the variables.

**Exemple:**

$$
f_x = \delta f/\delta x
$$

<aside>
💡 We consider the other variables as constant

</aside>

### Context

We can study f(x,y0) or f(x0,y) to study the function in a specific direction at a given point.

![Untitled](Limits%20and%20continuity/Untitled%201.png)

## Saddle Point

<aside>
🧠 We call a saddle point the value (x0,y0,…) which validates:
fx = fy = … = 0

</aside>

![Untitled](Limits%20and%20continuity/Untitled%202.png)

For a function of two variables, we compute 4 derivate: fxy, fyx, fxx and fyy

In most of the case, fxy is fyx are the same (*See Schwarz theorem*)

## Hessienne matrix

We call Hessienne matrix the matrix H defined as

$$
H = \begin{pmatrix}
f_{xx}& f_{xy} \\
f_{yx}& f_{yy}
\end{pmatrix}
$$
