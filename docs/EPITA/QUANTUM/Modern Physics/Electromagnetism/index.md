---
title: "Electromagnetism"
---
Last edited time: March 4, 2025 5:44 PM

## 1 Properties of electromagnetic waves

- in a vacuum (no electric charge or current) electric and magnetic fields are governed by:
    - Maxwell-Gauss: $\nabla \cdot E = 0$
    - Magnetic flux: $\nabla \cdot B = 0$
    - Maxwell-Faraday: $\nabla \land E = - \delta_tB$
    - Maxwell-Gauss: $\nabla \land B = \epsilon_0\mu_0\delta_tE$

where:

- $\mu_0$ is the **permeability of free space**
- $\epsilon_0$ is the **permittivity of free space**
- $\delta_t$ is the **time derivative** ($\frac{\delta}{\delta_t}$)

- the Maxwell equations are consequences of the following:
- the fields $E$ and $B$ **oscillate orthogonally**
- the vector $E \land B$ is **co-linear** to the speed vector $c$ of the **EM** wave, who is then a **traverse wave**
- the **EM** wave propagates with speed $x= \frac{1}{\sqrt{\epsilon_0\mu_0}}$
- the fields $E$ and $B$ are **in phase** and $B= \frac{E}{c}$
- in the **Cartesian system**:
    
    $E =\begin{bmatrix}
    E_x(x,y,z,t) \\
    E_y(x,y,z,t) \\
    E_z(x,y,z,t) \\
    \end{bmatrix}, B =\begin{bmatrix}
    B_x(x,y,z,t) \\
    B_y(x,y,z,t) \\
    B_z(x,y,z,t) \\
    \end{bmatrix}$
    
    $E = E_x(x,y,z,t)e_x + 
    E_y(x,y,z,t)e_y +
    E_z(x,y,z,t) e_z$
    
    $B = B_x(x,y,z,t)e_x + 
    B_y(x,y,z,t)e_y +
    B_z(x,y,z,t) e_z$
    
- **vector gradient:**
    
    $\nabla = \begin{bmatrix}
    \delta_x \\ \delta_y \\ \delta_z
    \end{bmatrix} = 
    \frac{\delta}{\delta_x}e_x + 
    \frac{\delta}{\delta_y}e_y +
    \frac{\delta}{\delta_z}e_z$
    
- **Divergence**:
    
    $\nabla \cdot A =
    \begin{bmatrix}
    \frac{\partial}{\partial x} \\
    \frac{\partial}{\partial y} \\
    \frac{\partial}{\partial z}
    \end{bmatrix}
    \cdot
    \begin{bmatrix}
    A_x \\
    A_y \\
    A_z
    \end{bmatrix}
    =
    \delta_xA_x + \delta_yA_y + \delta_zA_z$
    
- **Curl**:
    
    $\nabla \times A =
    \begin{bmatrix}
    \frac{\partial}{\partial x} \\
    \frac{\partial}{\partial y} \\
    \frac{\partial}{\partial z}
    \end{bmatrix}
    \times
    \begin{bmatrix}
    A_x \\
    A_y \\
    A_z
    \end{bmatrix}
    =
    \begin{vmatrix}
    \hat{e}_x & \hat{e}_y & \hat{e}_z \\
    \frac{\partial}{\partial x} & \frac{\partial}{\partial y} & \frac{\partial}{\partial z} \\
    A_x & A_y & A_z
    \end{vmatrix}  =
    \begin{bmatrix}
    \frac{\partial A_z}{\partial y} - \frac{\partial A_y}{\partial z} \\
    \frac{\partial A_x}{\partial z} - \frac{\partial A_z}{\partial x} \\
    \frac{\partial A_y}{\partial x} - \frac{\partial A_x}{\partial y}
    \end{bmatrix}$
    
- **Laplacian**:
    
    $\Delta = \nabla \cdot \nabla = \delta_x^2 +\delta_y^2 +\delta_z^2$ 
    
- In electromagnetism, reference is often made to the concept of the flow of an
electric or magnetic field across a given surface.
- In simple terms, the flow corresponds, for example, to the volume of water per
unit of time passing through a fishing net laid across a river.
- If $Q$ is the volume of water, $S$ the surface of a net, $v$ the constant speed of water at a point in $S$ and $\Delta t$ the duration:
    
    $Q=vS\Delta t$   or $\frac{Q}{\Delta t} = vS$
    
- the **flux** of the velocity field is given by $\Phi = vS$
- to generalize for a surface that is not **orthogonal** to the velocity vector:
    
    $d \Phi = v \cdot d S$,  $dS = \hat{n}dA$ where $\hat{n}$ is the normal to the surface and $dA$ is the magnitude
    
    $\Phi = \iint_Sv \cdot dS$
    

<aside>
🔑

$dS = dxdy$ in **Cartesian System**

</aside>

### Stokes Theorem

$\oint_{\mathcal{C}}A \cdot dl = \iint_S(\nabla \land A) \cdot dS$

- states that the total circulation along $\mathcal{C}$ is equal to the total ciculation in the closed surface
- this is because any curl inside the surface will be canceled out by another except for those on the red line

![image.png](Electromagnetism/image.png)

- $A$ is the vector field
- $\mathcal{C}$ is the red contour
- $dl = dxe_x +dye_y +dze_z$  = small line segment of $\mathcal{C}$
- $dS = ndA = n \ dx \ dy$ (n is the unit normal vector)

### Ostrogradsky Theorem

$\oiint_SA \cdot dS = \iiint_V(\nabla \cdot A)dV$

- the total outward flux of a vector field through a closed surface is equal to the total divergence of that field throughout the volume it encloses.

![image.png](Electromagnetism/image%201.png)

- $S$ is the surface of the sphere
- $A$ is the vector field
- $V$ is the volume of the sphere
- $dS = ndA = n \ dx \ dy$ (n is the unit normal vector)

## 1.1 Sinusoidal Plane Wave

![image.png](Electromagnetism/image%202.png)

$E = E_zk - E_msin(ky - wt)k \\E = B_xi - B_msin(ky - wt)i \\$

- $c = \lambda f = \frac{\omega}{k}$ with $\omega = 2 \pi f$

## 2 Speed of light and the Wave Equation

- In order to verify that Maxwell's equations do indeed lead to
the existence of EM waves, it must be shown that they allow
the wave (or propagation) equation to be obtained:
    
    $\delta ^2 _t f = v^2\Delta f$
    
- To simplify the task, we consider the one-dimensional case where the wave propagates (in a vacuum) along the x according to:
    
    $\delta ^2 _t f = c^2 \delta _t^2f$
    
    $v = c$ with the fields in the form:
    
    ![image.png](Electromagnetism/image%203.png)
    

## 2.1 Gauss Theorem

- indicates that the electric flux $\Phi_E$
    
    $\Phi_E = \oiint_S E \cdot dS = \frac{Q_{int}}{\epsilon _0}$
    
- If there is no charge in S there is therefore no field E
- We can also see this result as a consequence of
the **Maxwell-Gauss** equation in vacuum $\Delta \cdot E = 0$ since,
according to the **Green-Ostrogradski** theorem, we have:
    
    $\iiint_V \Delta \cdot  dV = 0 = \oiint_S E \cdot dS$
    
    where $V$ is the volume defined by $S$
    
- a similar result, for $B$, can be obtained but the equation of magnetic flux: $\Delta \cdot B = 0$

## 2.2 Faraday’s Law

- integration of the **Maxwell-Faraday** equation $\Delta \land E = - \delta_tB$, and with the **Stokes Theorem**, gives:
    
    $\oint E \cdot d\ell = - \iint \delta _t B \cdot dS$
    
- when S is rectangular and $E = E_zk$ and $B = B_xi$ gives:
    
    $\delta_yE_z = - \delta_tB_x$  (check course doc)
    
- The explicit expressions of $E_z$ and $B_x$ then lead to:
    - $E_m = \frac{\omega}{c}B_m = cB_m$
    
    where $c= 4.00 \times 10^8m.s^{-1}$ is the speed of propagation of the EM wave in a void
    
- the last relation indicates that if the **amplitude**  of **E** is known, that of **B** also, and vice-versa
- this relation shows that the magnetic and electric fields are in phase

## 2.3 Ampere-Maxwell Theorem and the Wave Equation

- the integration of the **Maxwell-Ampere** equation
 $\Delta \land B = \varepsilon_o \mu_0\delta_t E$, by the Stokes formula, allows us to obtain:
    
    $\oint B \cdot d \ell = \varepsilon _0 \mu_o \iint \delta _t E \cdot dS$
    
- evaluating the expression always having $E = E_zk$ and $B = B_xi$ along the perimeter of a rectangle (arbitrary) we obtain the expression (see course document)
$\delta_yB_x = -\varepsilon_o \mu_0 \delta _t E _ y$
- Using the relationship obtained previously we then obtain the wave equation
    
    $\delta_t^2f = c^2\delta _x ^2 f$
    
    where $f = E_z$or $f = B_x$ and $c = \frac{1}{\sqrt {\varepsilon _0 \mu _0}}$
    
- This shows that the electric and **magnetic fields propagate in vacuum at a speed c**. This relationship can be generalized to all components of these fields.

## 4 The Transported Energy by Light

- the average power per unite of surface is $I = \frac{P}{A}$ (in $W.m^{-2}$)
- For an isotropic point source, if the distance to the source is $r$, so $I = \frac{P_x}{4 \pi r^2}$ where $P_s$ is the power of the source
    - **definition of isotropic point source**
        
        **source that emits waves (such as light, sound, or electromagnetic waves) equally in all directions**.
        
        ### **Key Characteristics:**
        
        1. **Point Source**: It is considered a **single point** in space, meaning its size is negligible compared to the distances involved.
        2. **Isotropic Emission**: The energy is radiated **uniformly** in all directions, meaning there is no preferred direction.
        3. **Spherical Wavefronts**: Since the emission is equal in all directions, the waves form expanding **spheres** centered on the source.
- at a given point the **energy density** $u$ ****of an EM wave is
$u = u_E + u_B = \frac{\varepsilon _ 0}{2}E^2 + \frac{1}{2 \mu _0} B^2$
- the **irradience** is calulated by evaluating the eneger of the EM wave in a boxed section $A$ and a length $\Delta y$, we have (check course document)
    
    $I = \frac{U_ {avg}}{A \Delta t} = \varepsilon _0 c E _{avg} ^2 = \frac{\varepsilon _0 c}{2 \pi} \int ^ {2 \pi} _ 0 \sin ^2 \Phi d \Phi$ 
    then
    $I = \frac{ \varepsilon 0 c}{2} E_m^2 = \frac{E^2_n}{2 \mu _0 c}$
    
- The power carried by an EM wave therefore depends on the square of the amplitude of the associated electric field

## 5 Radiation Pressure

- Light carries energy, but also the amount of motion, so it can exert a force on objects.
- The radiation pressure, in the case of total absorption, is given by the expression (see course document)
    
    $P_{rad} \equiv \frac{F_{rad}}{A_{aff}} = \frac{I}{c}$
    
- int he case where the light is **completely refelected** we obtain
    
    $P_{rad} = \frac{2I}{c}$
    
- then we have the general expression
$P_{rad} = \left( \frac{1 + R}{c} \right) I$
    
    where $0 \le R \le 1$ is the **refelction coeficient** of an object
    

## 6 Polarization of Light

- the (specific) orientation of an electic field associated with an EMwave defines polarisation
- for example, if $E$ oscilates along the $O_z$ axis, we say the wave has a rectilinear polarizatoin alone $z$
- the word **rectilinear** indicates that the field is contain the $yz$ or $xz$ planes over time

![image.png](Electromagnetism/image%204.png)

- To evaluate polarization, it is necessary to be able to define a
specific orientation over time of the end of E.
- In the absence of such an orientation, the wave is non-polarized.
This is the case, most of the time, for natural light

Example of unpolarized light coming from the left and passing through a polarizing filter. Only the linearly polarized and vertical component is transmitted.

- Light can also be partially polarized if
there is a favored direction relative to the field E.
- When the end of the vector E describes a circle or an ellipse
during its rotation over time, we speak of circular or elliptical polarization.

![image.png](Electromagnetism/image%205.png)

- The simplest way to polarize light is to use a
polarizer.
- This works like a filter that absorbs a component
of the electric field in one direction and lets the perpendicular
component through.
- Such a filter can be made from long molecules
called polymers whose alignment direction corresponds to
the direction of polarization "allowed" by the polarizer.

 

![image.png](Electromagnetism/image%206.png)

## 6.1 Malus’ Law

- Suppose that a polarized light is incident on a
polarizer with an irradiance $I_0$.
- The transmission axis of the polarizer forms an angle $\theta$ with
the direction of polarization of the light.
- If $E_0$ is the amplitude of the incident electric field then
the **irradiance** of the incident wave is
    
    $I_0 = \frac{1}{2 \mu_0 c} E_0^2$
    
- in this case the aplitude of the transmitted electric field is then
$E = E_0 \cos \theta$
- the irradient $I$ of the  transmitted wave by the law of Malus is
$I = I_0 \cos ^2 \theta$
- When the light incident on a polarizer is not polarized, we must calculate the average of Malus' law for all possible orientations.
- Since the average value of $\cos ^2 \theta$ is equal to $1 / 2$, it follows that half of the incident irradiance is transmitted by the polarizer, i.e. $I_0 / 2$

![image.png](Electromagnetism/image%207.png)

- A polarizer is placed in front of a liquid crystal display. The angle between the polarization of the light and the transmission axis is a) $\theta = 0 ^{\circ}$, b) $\theta = 45 ^{\circ}$, c) $\theta = 90 ^{\circ}$

![image.png](Electromagnetism/image%208.png)

![image.png](Electromagnetism/image%209.png)
