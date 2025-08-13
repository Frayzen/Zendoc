---
title: Limits and continuity
Owner: "Florian "
---
# Limit of a two vaiable functions
## Neighborhood
We use the notion of disk _(delta)_ to define the neighborhood of a point **a** = (a,b)
$\{x\in\R²\ : \|x-a\|<\delta\}$

> [!important] _See [[Distance]]_
From that, we can establish a **first definition** of the limit allowing to build fundamental **properties**

> [!important] Une différence notable, par rapport au cas à 1D, c’est que
> 
>   
> l’on peut désormais approcher un point par plusieurs  
> directions ou chemins (en fait une infinité...).
## Interior point and boundary point
![[Untitled 169.png|Untitled 169.png]]
- An interior point is a point that has a disk fully contained inside of the domain
- A boundary point has a disk which can lands outside of the domain
It raises a **problem**: the limit cannot be defined by a simple disk considering the boundary points
## Continuity of two variables functions
We say that f(x) is continuous in x0 if
$(1) f(x_0)\ exists  
\newline  
(2)\lim_{x\rightarrow x_0}f(x)\ exists  
\newline  
(3) \lim_{x\rightarrow x_0}f(x)\ = f(x_0)  
\newline$
# Function of 3 variables and more
Going from dim2 to dim3 or more is easy by generalizing the formula using the Euclidean norm (_for example_).
$\| x - a \| = \sqrt{\sum_{i=1}^{n} (x_i-a_i)²}$

> [!important] There exists several norms and we can consider different way to compute “distance”.
## Partial derivative
In order to obtain some information about variation of the surface, we can derivative in respect of one of the variables.
**Exemple:**
$f_x = \delta f/\delta x$

> [!important] We consider the other variables as constant
### Context
We can study f(x,y0) or f(x0,y) to study the function in a specific direction at a given point.
![[Untitled 1 115.png|Untitled 1 115.png]]
## Saddle Point

> [!important] We call a saddle point the value (x0,y0,…) which validates:
> 
>   
> fx = fy = … = 0
![[Untitled 2 82.png|Untitled 2 82.png]]
For a function of two variables, we compute 4 derivate: fxy, fyx, fxx and fyy
In most of the case, fxy is fyx are the same (_See Schwarz theorem_)
## Hessienne matrix
We call Hessienne matrix the matrix H defined as
$H = \begin{pmatrix}  
f_{xx}& f_{xy} \\  
f_{yx}& f_{yy}  
\end{pmatrix}$