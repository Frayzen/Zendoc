---
title: "Matrix Calc"
---
Last edited time: March 5, 2024 5:30 PM

# Gradients

$$
\mathbb{R}^n \rightarrow \mathbb{R}^1
$$

The gradient of a function shows the director of steepest decent.

[https://www.youtube.com/watch?v=_-02ze7tf08](https://www.youtube.com/watch?v=_-02ze7tf08)

### Example

$$
f(x,y) = x^2 + cos(y) \\
\frac{\delta f}{\delta x} = 2x \\
\frac{\delta f}{\delta y} = -sin(y)  \\
\begin{bmatrix}
\frac{\delta f}{\delta x} \\
\frac{\delta f}{\delta y} 
\end{bmatrix} = 
\begin{bmatrix}
2x \\
-sin(y) 
\end{bmatrix}\\
\nabla f _{(x,y)} = \begin{bmatrix}
\frac{\delta f}{\delta x} \\
\frac{\delta f}{\delta y} 
\end{bmatrix}
$$

# Jacobians

$$
\mathbb{R}^n \rightarrow \mathbb{R}^m
$$

- carries all the partial derivatives of a function
- it is the matrix representing the best linear transformation at any given point (x, y)

$$
f(x,y) = \begin{bmatrix}
2x + y^3 \\
e^y -13x 
\end{bmatrix}\\ 
f_1 = 2x + y^3 \\ 
f_2 = e^y -13x \\
\frac{\delta f_1}{\delta x} = 2 \\
\frac{\delta f_1}{\delta y} = 3y^2 \\
\frac{\delta f_2}{\delta x} = -13 \\
\frac{\delta f_2}{\delta y} = e^y \\
J = \begin{bmatrix}
\frac{\delta f_1}{\delta x}& \frac{\delta f_1}{\delta y} \\
\frac{\delta f_2}{\delta x}& \frac{\delta f_2}{\delta y}
\end{bmatrix} = \begin{bmatrix}
2 & 3y^2 \\
-13 & e^y
\end{bmatrix} = \begin{bmatrix}
\nabla f_1^T  \\
\nabla f_2^T
\end{bmatrix}
$$

# Jacobian Chain Rule

$$
f(x,y) = \begin{bmatrix}
sin(x^2 + y)  \\
ln(y^3)
\end{bmatrix} \\
g =\begin{bmatrix}
x^2 + y\\
y^3
\end{bmatrix} 
F = \begin{bmatrix}
g_1  \\
g_2
\end{bmatrix} \\
\\
\frac{\delta \vec{g}}{\delta \vec{x} } = \begin{bmatrix} 
2x & 1 \\
0 & 3y^2
\end{bmatrix} \\ = \begin{bmatrix} 
2cos(g_1) & cos(g_1) \\
0 & \frac{3y^2}{g_2}
\end{bmatrix}

\frac{\delta \vec{f}}{\delta \vec{g} } = \begin{bmatrix} 
cos(g_1) & 0 \\
0 & \frac{1}{g2}
\end{bmatrix} \\
\frac{\delta \vec{f}}{\delta \vec{x} } = \frac{\delta \vec{f}}{\delta \vec{g} } \frac{\delta \vec{g}}{\delta \vec{x} } = 
\begin{bmatrix} 
cos(g_1) & 0 \\
0 & \frac{1}{g2}
\end{bmatrix}\begin{bmatrix} 
2x & 1 \\
0 & 3y\\
\end{bmatrix} = 
\begin{bmatrix} 
2cos(x^2 + y) & cos(x^2 + y) \\
0 & \frac{3}{y}\\
\end{bmatrix}
$$

if we have a function that doesn't not have an intermediate rule like:

$$
f_3 = xy^3
$$

we will have 

$$
g_3 = 1
$$
