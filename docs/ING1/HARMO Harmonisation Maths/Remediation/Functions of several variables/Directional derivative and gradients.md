---
title: Directional derivative and gradients
Owner: "Florian "
---
# Definition
We talk about directional derivate when we compute the derivate of a function using a derivate of the form:
$D_uf = \frac{\delta f}{\delta x}u_1+\frac{\delta f}{\delta y} u_2$
$u = u_1i + u_2j$
Where u is a unit vector ( || u ||= 1)
- If D_u f = 0 then f is a constant in the direction u
- if D_u f > 0 then f is getting steeper in the direction u
## Gradient
It is usual to express directional derivatives using gradient
$\nabla{f} = (f_x, f_y)^\top$
$Then: D_uf = \nabla f.u$
- If u and ∇f are colinear then:  
    
$u = \frac{\nabla f}{\|\nabla f\|}$

> [!important] The gradient formulation possess the advantage of not
> 
>   
> referring to any specific coordinates system.
## Exemple
If f is a function of x, y then is also a function of the time t. It then makes sense to compute its rate of change
df/dt = f’(t) wich is ∇f . v
_where v is the speed vector associated to the point (x, y)_
If we introduce a position parameter s along the path,  
then the slope with respect to this path is given by
df/ds = ∇f . T
_The T vector is normalised and tangent to the trajectory. It is defined by_
T = v / ∥v∥
  
## Hessian
the hessian matrix associated to f is given by:
  
$H = \begin{pmatrix}  
f_{xx} & f_{xy} \\  
f_{yx} & f_{yy} \\  
\end{pmatrix}$