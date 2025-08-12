---
title: "Curl / Rotation"
---
Example Input: (a, b, c)
Example output: (dc/dy - db/dz  ,  da/dz - dc/dx  ,  db/dx - da/dy)
Infos: cross product with gradient
Output: vector

<aside>
💡 Takes a **vector** and returns a **vector**

</aside>

the curl or rotation of a vector field is used to describe the local rotation or circulation of the field. Specifically, it is used to describe the rotation of the electric and magnetic fields in space as they interact with each other and with charged particles.

![Untitled](Curl%20Rotation/Untitled.png)

clockwise = positive

anti-clockwise = negative

![Untitled](Curl%20Rotation/Untitled%201.png)

there is still a clockwise curl here

$$
\vec{curl}=\nabla \times \vec{E}
$$

cross product of gradient operator and the electric field expression
