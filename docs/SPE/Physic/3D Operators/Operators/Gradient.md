---
title: Gradient
Input:
  - scalar-valued
Example Input: 3x + y - z
Example output: (3, 1, -1)
Infos: derivative
Output:
  - vector
---
# Principle

> [!important] Takes a
> 
> **scalar-valued** function and returns a **vector**
$grad(v) = d/dx , d/dy, d/dz$
$E = -grad(v) \implies v = grad(E)$
We end up with a **vector**
Used to describe the rate of change of a scalar or vector quantity with respect to position
The electric potential is a scalar quantity that describes the electric field in space
## Example
$\begin{aligned}  
\vec{E} &= -\nabla V \\  
V(x,y,z) &= x^2 + y^2 + z^2 \\  
\nabla V &= (2x)\textbf{i} + (2y)\textbf{j} + (2z)\textbf{k} \\  
\vec{E}(x,y,z) &= -\nabla V = -((2x)\textbf{i} + (2y)\textbf{j} + (2z)\textbf{k}) = (-2x)\textbf{i} - (2y)\textbf{j} - (2z)\textbf{k} \\  
\vec{E}(1,2,3) &= (-2)(1)\textbf{i} - (2)(2)\textbf{j} - (2)(3)\textbf{k} = -2\textbf{i} - 4\textbf{j} - 6\textbf{k}  
\end{aligned}$