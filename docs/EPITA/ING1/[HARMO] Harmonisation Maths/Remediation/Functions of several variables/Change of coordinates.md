---
title: "Change of coordinates"
---
Last edited time: September 19, 2023 12:45 PM

![Untitled](Change%20of%20coordinates/Untitled.png)

The new coordinates uv result of the angle rotation alpha are then given by the linear relations

$$
u = xcos\alpha+ysin\alpha\\v = ycos\alpha-xsin\alpha
$$

The area of the square being invariant, we must have the integral being the same after the change.

<aside>
⚠️ Careful, in general we have dxdy ≠ dudv. Here it can be done because it is an isometry

</aside>

# Polar coordinates

We have important relations

$$
x = r cos \theta\\y= r sin\theta
$$

$$
r = \sqrt{x^2+y^2}\ and\ tan\theta = \frac{y}{x}
$$

Now we evaluate the elementary area dA = dxdy in the system r0. This take the form of a polar rectangle

- The (by far) easiest method is to make a **figure**

$$
\Delta A \approx \Delta r\times r\Delta \theta \Rightarrow dA = rdrd\theta = dxdy
$$

<aside>
⚠️

Note that dxdy (*area*) ≠ dyd0 (*length*)

</aside>

# Jacobian

For a change of variable form the cartesian system xy to an arbitrary coordinate system uv, we have

$$
\int\int_R{f(x,y)dxdy} = \int\int_{R'}{f(u,v)|J(u,v)|dudv} 
$$

$$
\int\int\int_R{f(x,y,z)dxdydz} = \int\int\int_{R'}{f(u,v,w)|J(u,v,w)|dudvdw} 
$$

We have introduced the Jacobian determinant J characterizing the deformation of the infinitesimal area dA = dxdy, defined by:

![Untitled](Change%20of%20coordinates/Untitled%201.png)

![Untitled](Change%20of%20coordinates/Untitled%202.png)

For this transformation to make sens, J ≠ 0 must be.
