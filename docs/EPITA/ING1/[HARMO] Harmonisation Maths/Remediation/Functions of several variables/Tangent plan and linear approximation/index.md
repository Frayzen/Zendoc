---
title: "Tangent plan and linear approximation"
---
Last edited time: September 5, 2023 1:40 PM

# Definition

We can approximate an arbitrary surface, equation z = f(x,y) **LOCALY** by a base point (x0, y0) and the equation.

> For c = F(x,y,z) we can just say f = F - z to simply compute the following values
> 

The tangent plan is given as:

$$
z-z_0 = (\frac{\delta f}{\delta x})_0 (x-x_0) + (\frac{\delta f}{\delta y})_0 (y-y_0)
$$

<aside>
⚠️ (df/dx)0 means derivate f with respect to x and then, setting y and values as y0 and z0. Therefore, (df/dx)0 is actually a scalar. Similarly (df/dy)0 is a scalar as well

</aside>

$$
0 =(\frac{\delta F}{\delta x})_0 (x-x_0) + (\frac{\delta F}{\delta y})_0 (y-y_0) + (\frac{\delta F}{\delta z})_0 (z-z_0)
$$

The normal vector is given by:

$$
N = \begin{pmatrix}
(f_x)_0 \\ (f_y)_0 \\ -1
\end{pmatrix}
$$

$$
N = \begin{pmatrix}
(F_x)_0 \\ (F_y)_0 \\ (F_z)_0
\end{pmatrix}
$$

<aside>
💡 The normal vector is oriented to the outside for an enclosed surface

</aside>

 

## Small variations

If we say

$$
z-z_0 \approx dz = df

$$

$$
y-y_0 \approx dy = df

$$

$$
x-x_0 \approx dx = df

$$

In the equation of the tangent plan z = f(x,y) then:

$$
df = \frac{\delta f}{\delta x}dx +\frac{\delta f}{\delta y}dy
$$

Here, a very small variation of f is expressed (*linearly*) as function of the variations (*as well very small*) of parameters x and y

If we take the following equation, we can build the linear approximation of f at (x0,y0)

 

$$
df = f(x,y) - f(x_0,y_0)
$$

$$
f(x,y)\approx f(x_0,y_0)+(\frac{\delta f}{\delta x}) (x-x_0) + (\frac{\delta f}{\delta y}) (y-y_0)
$$

<aside>
💡 The term (x-x0)² and (y-y0)² are not squared because they are a priori smaller than the (x-x0) and (y-y0) equivalents.

</aside>

The approximation is worse and worse as we take x and y further from x0 and y0
