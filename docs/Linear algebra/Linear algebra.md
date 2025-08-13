---
Owner: "Florian "
---
# **Matrix representation**
[https://youtu.be/kYB8IZa5AuE](https://youtu.be/kYB8IZa5AuE)
A linear transformation is determined by the mapping of its unit vectors.
For a matrix $\begin{matrix} a & b \\ c & d \end{matrix}$
That means that
$\begin{matrix} 1 \\ 0\end{matrix}$ is mapped to $\begin{matrix} a \\ c\end{matrix}$
$\begin{matrix} 0 \\ 1 \end{matrix}$ is mapped to $\begin{matrix} b \\ d\end{matrix}$
# **Matrix Multiplication**
[https://youtu.be/XkY2DOUCWMU](https://youtu.be/XkY2DOUCWMU)
Matrices can be combined to form a new transformation. Given $\mathcal{M}_1$ and $\mathcal{M}_2$ two linear transformation, applying first $\mathcal{M}_1$ and then $\mathcal{M}_2$ to a vector $\vec{v}$ is equivalent to:
$\mathcal{M}_2 ( \mathcal{M}_1 \vec{v} )$

> [!important] The application is done from **right to left**
  
# **Determinant**
[https://youtu.be/Ip3X9LOh2dk](https://youtu.be/Ip3X9LOh2dk)
![[image.png]]
- The **absolute value** of the determinant of a linear transformation defines how much the unit square area changes. In the new basis.
- The **sign** of the determinant defines if the space has been "inverted" as if the $\vec{x}$ is still on the right side ($< 180 \degree$) of $\vec{y}$. In three dimension, it check that the "**thumb rule**" still apply
It is defined as $a \times d + c \times d$.

> [!important] If the determinant is 0, a reduction of (at least 1) dimension is applied as the unit square is squished on a line (or a point).
$\begin{matrix} 0 \\ 1 \end{matrix}$ is mapped to $\begin{matrix} b \\ d\end{matrix}$
# **Inverse matrix and rank**
[https://youtu.be/uQhTuRlWMxw](https://youtu.be/uQhTuRlWMxw)
- The **ranking** of a transformation corresponds to the output dimension space. For example, if the output space is a line, **its rank is 1**.
- An inverse tranformation denoted as $\mathcal{M}^{-1}$ is the inverse operation applied by the transformation. Therefore, $\mathcal{M} \mathcal{M}^{-1} = \mathcal{I}$ (the identity matrix)
# **Dot products**
[https://youtu.be/LyGKycYT2v0](https://youtu.be/LyGKycYT2v0)
$\vec{u} \cdot \vec{v} = proj(\vec{u}) * \lvert \vec{v} \lvert$
Where the proj function means the scalar representing the projection of $\vec{u}_0$ onto $\vec{v}$
## **Eigen values and eigen vectors**
An **Eigen vector of** a linear transformation is just a vector which keeps the same direction (in other words no rotations) after the transformation.
In other words, that means that any coordinates of the origin based is just scaled by scalar after the transformation.
This scalar is called the **Eigen value.**
In other words, if we consider the complex coordinate system, the phase $\theta_0$ of an eigen vector $\vec{E}_0$ is identical forall $\vec{u} : \exists k \in \R\ |\ \vec{u} = \mathcal{M} ( k \times \vec{E}_0 )$
In other word $\mathcal{M} \vec{v} = \lambda \vec{v} \implies \mathcal{M} \vec{v} = (\lambda \mathcal{I}) \vec{v}$
Therefore, $(\mathcal{M} - \lambda \mathcal{I}) \vec{v} = \vec{0}$
$\begin{Bmatrix} a - \lambda & b \\ c & d - \lambda \end{Bmatrix} \vec{v} = \vec{0}$
A good visual clue of how to achieve that is by knowing that, as the transformation of the $\mathcal{M} - \lambda \mathcal{I}$ needs to map to a line, the rank of the matrix is 1 and the determinant must be 0
As an example, if you think about 3D rotation transformation, the eigen vector is basically the _axis of rotation_ associate with it. The eigen value would be 1 as a rotation does not stretch or squeeze anything.