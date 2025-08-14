---
title: Divergence
Input:
  - vector
Example Input: (a, b, c)
Example output: a’ + b’ + c’
Infos: dot product with gradient
Output:
  - scalar-valued
---
> [!important] Takes a
> 
> **vector** and returns a **scalar-valued**
A measure of how much the electric or magnetic field "flows out" of a given point in space.
(negative in a sink and positive in a source)
Dot product of the gradient operator and the vector field
Vector filed as input and output a scalar
$\mathrm{div}(\vec{\mathbf{F}}) = \nabla \cdot \vec{\mathbf{F}} = \frac{\partial F_x}{\partial x} + \frac{\partial F_y}{\partial y} + \frac{\partial F_z}{\partial z}$
## Example
$\mathbf{F}(x, y, z) = xz^2 \mathbf{i} + xy^2 \mathbf{j} + z^3 \mathbf{k}, \space find\space the \space divergence \space of \space \mathbf{F}.\\Divergence \space of \space \mathbf{F}:  
\operatorname{div}(\mathbf{F}) = \frac{\partial F_x}{\partial x} + \frac{\partial F_y}{\partial y} + \frac{\partial F_z}{\partial z}\\Therefore, \operatorname{div}(\mathbf{F}) = z^2 + 2xy + 3z^2 = 4z^2 + 2xy.$
Gauss's law, which relates the electric field to the distribution of electric charges in space:
$\begin{equation}  
\nabla \cdot E = \frac{\rho}{\epsilon_0} (\rho \space is \space charge \space density)  
\end{equation}$
$\nabla \cdot \mathbf{B} = 0$