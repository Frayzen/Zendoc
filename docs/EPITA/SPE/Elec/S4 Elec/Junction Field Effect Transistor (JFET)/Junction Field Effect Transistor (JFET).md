---
title: Junction Field Effect Transistor (JFET)
Owner: "Florian "
---
  

> [!important] Also know as
> 
> [**JFET**](https://en.wikipedia.org/wiki/JFET)
# Cours
  
![[kj_08_Field_effect_transistors_eng.pdf]]{ type=application/pdf }

  
# Videos
[https://www.youtube.com/watch?v=7zPkJ2ifQcc](https://www.youtube.com/watch?v=7zPkJ2ifQcc)
[https://www.youtube.com/watch?v=2I_8YNVgbEw](https://www.youtube.com/watch?v=2I_8YNVgbEw)
  
# Notes

> [!important] It is mandatory to understand
> 
> [[Dopage]]before going any further
### Formula
![[Untitled 23.png|Untitled 23.png]]

## N-Channel JFET
A N-channel JFET is made of 2 P-type material and 1 N-type material (see [[Metal Oxyde Semiconductor Field Effect Transistor (MOFSET)]])
![[Untitled 1 12.png|Untitled 1 12.png]]

![[Untitled 2 7.png|Untitled 2 7.png]]

## P-Channel JFET
A N-channel JFET is made of 2 N-type material and 1 P-type material (see [[Metal Oxyde Semiconductor Field Effect Transistor (MOFSET)]])
![[Untitled 3 7.png|Untitled 3 7.png]]

![[Untitled 4 5.png|Untitled 4 5.png]]

## How it works

> [!important] We take the NFET as example
![[Untitled 5 5.png|Untitled 5 5.png]]

On the following image, the red part represents the depletion region ([[Dopage]]).
The gate is connected to both region in order to have mirrored depletion regions.
  
![[Untitled 6 4.png|Untitled 6 4.png]]

Here, some voltage Vds is applied. Therefore, the electrons are attracted by the positive charge at D. A current is created from D to S.
![[Untitled 7 4.png|Untitled 7 4.png]]

As Vgs takes a negative value, the PN junction is in a [[Dopage]]. The lower Vgs is, the deeper the depletion region penetrates into the channel.
As an effect of Vgs increasing, the current Id (_drain current_) reduces as well.
In other words, Vgs controls the flow of Id.
### Pinch voltage
Vgs is always negative (in case of N-channel).
Since we apply a voltage between G and S as well as between D and S, the depletion region tends to be wider towards S (where the potential is maximal). Therefore, both Vgs and Vds are gonna control the depletion region.
We often assume Vgs as constant and plot the curve of the current going through D in term of Vds. The current Id is proportional (in the ohmic region, see the graph under) to Vds.
The value Vp is called the pinch voltage. It is the value taken by Vds for which the two depletion regions contact. The current is not zero at this point but instead remain constant no matter if we keep increasing Vds. It is the saturation region.
### Graph
![[Untitled 8 3.png|Untitled 8 3.png]]

**Explanations:**
This graph is divided in two part, the left and the right part.
### Left part
We compute the maximum current flowing toward D **in term of Vgs**.
In other words, we compute the value of Id at Vds = Vp for every value of Vgs.
Vgs is always negative, that’s why the left part of the graph is all about Vgs.
### Right part
We compute the current flowing toward D **in term of Vds**.
There is several curve displayed depending on the value of Vgs.
All of the curves can be splitted in two region, the ohmic region (when the JFET acts like a resistor) and the saturation region (when the current remains constant even after increasing Vds)