---
title: Double Integral
Owner: "Florian "
---
# Intro
From a geometric POV, a double integral corresponds to the volume between the xy plane and the surface z = f(x,y) for a region R of the xy plane.
$\int\int_R{f(x,y)dA}$
It is an **algebric** volume that can be negative.
If the volume is under the xy axis it is count negatively.
The mesure dA represents and infinitesimal surface element in the xy plane. If we use the cartesian coordinates x and y we have dA = dxdy.
![[Untitled 156.png|Untitled 156.png]]
## Limit of a sum
Wa can also propose slicing of the previous volume in small columns which squared basis of area.
$\Delta A = \Delta x \Delta y$
And their height z = f(x,y)
Ce can fill approximatively the volume by summing on a finite number of column
$V \approx \sum_{i=0}^n{z_i\Delta A_i}$
![[Untitled 1 106.png|Untitled 1 106.png]]
$\int \int_R {f(x,y) dA} = lim_{n\rightarrow +\inf, \Delta x \rightarrow 0 \Delta y \rightarrow 0}\sum_{i=0}^n{f(x_i,y_i) \Delta A}$
![[Untitled 2 74.png|Untitled 2 74.png]]
## Exemple
![[Untitled 3 54.png|Untitled 3 54.png]]
![[Multiple_Integrals_fr.pdf]]