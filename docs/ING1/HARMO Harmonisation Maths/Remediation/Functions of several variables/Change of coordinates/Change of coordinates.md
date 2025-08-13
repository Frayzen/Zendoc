---
title: Change of coordinates
Owner: "Florian "
---
![[Untitled 154.png|Untitled 154.png]]
The new coordinates uv result of the angle rotation alpha are then given by the linear relations
$u = xcos\alpha+ysin\alpha\\v = ycos\alpha-xsin\alpha$
The area of the square being invariant, we must have the integral being the same after the change.

> [!important] Careful, in general we have dxdy ≠ dudv. Here it can be done because it is an isometry
# Polar coordinates
We have important relations
$x = r cos \theta\\y= r sin\theta$
$r = \sqrt{x^2+y^2}\ and\ tan\theta = \frac{y}{x}$
Now we evaluate the elementary area dA = dxdy in the system r0. This take the form of a polar rectangle
- The (by far) easiest method is to make a **figure**
$\Delta A \approx \Delta r\times r\Delta \theta \Rightarrow dA = rdrd\theta = dxdy$

> [!important] Note that dxdy (_area_) ≠ dyd0 (_length_)
  
# Jacobian
For a change of variable form the cartesian system xy to an arbitrary coordinate system uv, we have
$\int\int_R{f(x,y)dxdy} = \int\int_{R'}{f(u,v)|J(u,v)|dudv}$
$\int\int\int_R{f(x,y,z)dxdydz} = \int\int\int_{R'}{f(u,v,w)|J(u,v,w)|dudvdw}$
We have introduced the Jacobian determinant J characterizing the deformation of the infinitesimal area dA = dxdy, defined by:
![[Untitled 1 105.png|Untitled 1 105.png]]
![[Untitled 2 73.png|Untitled 2 73.png]]
For this transformation to make sens, J ≠ 0 must be.