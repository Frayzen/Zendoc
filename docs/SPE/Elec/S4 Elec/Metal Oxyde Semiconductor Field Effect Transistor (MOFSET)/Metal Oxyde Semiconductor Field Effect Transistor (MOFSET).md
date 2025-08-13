---
title: Metal Oxyde Semiconductor Field Effect Transistor (MOFSET)
Owner: "Florian "
---
# Vidéo
[https://youtu.be/rkbjHNEKcRw](https://youtu.be/rkbjHNEKcRw)
# Notes
## Definition
A MOSFET (metal-oxide-semiconductor field-effect transistor) is a type of transistor used for amplifying or switching electronic signals. It is a three-terminal device consisting of a source, a drain, and a gate. MOSFETs are widely used in electronic circuits for a variety of applications, including digital and analog circuits, power electronics, and microprocessors.
## Dopage

> [!important] It is mandatory to understand
> 
> [[Dopage]]before going any further
Electrons always flow from - to +. Therefore, a MOFSET is made from a semiconductor material, such as silicon.
## Two types of MOFSET
There are two types of MOSFET: the **enhancement mode MOSFET** and the **depletion mode MOSFET**. The enhancement mode MOSFET is normally off and requires a voltage to be applied to the gate to turn it on. The depletion mode MOSFET, on the other hand, is normally on and requires a voltage to be applied to the gate to turn it off. Both types of MOSFET have their own unique applications in electronic circuits.
Those two types are also divided in 2 other types: N-channel and P-channel. We only focus on N-channel MOFSET only.
### Enhancement mode MOFSET
![[Untitled 24.png|Untitled 24.png]]
Yellow region is N-type
Blue region is P-type
The ==_left_== _t_erminal is the **source**
The ==_right_== Highly Doped terminal is the **drain**

> [!important] The source and drain are
> 
> **interchangeable** (as the composents are symetrical).
In ==_between_== source and drain is attached the **gate**. The gate is isolated from the ==blue region==, as we want the gate to act as a **capacitor**.
The _==bottom==_ part of the composent is the **substrate or body** terminal.

> The source and the the body are connected internally, avoiding any current flowing from source to body as they are at the same potential.
![[Untitled 1 13.png|Untitled 1 13.png]]
Here, as we apply some positive charge to the gate, some electron from the ==blue region== get attracted to the gate’s plate. Therefore, a bridge is created between the source and the drain.

> [!important] The thickness of the channel can be controlled by changing the voltage of the gate.
The voltage at which the channel is formed is called **threshold voltage**. It is said that the MOFSET is working in its **ohmic zone**.
  
Conventionally, the flow of electrons goes from drain to source, but the current goes opposite direction (that’s why it is called drain and source).
![[Untitled 2 8.png|Untitled 2 8.png]]
As the current grows, the depletion area keeps growing and eventually, an equilibrium state can be reached. It is called **the saturation zone**. The current flowing from the source to the drain is called **saturation current**.
![[Untitled 3 8.png|Untitled 3 8.png]]
### Depletion mode MOFSET
![[Untitled 4 6.png|Untitled 4 6.png]]
The depletion mode MOSFET is originally on and requires a negative gate voltage to be turned off.
### MOFSET circuit symbol
![[Untitled 5 6.png|Untitled 5 6.png]]
  
![[kj_09_1_MOSFET_and_Logical_Gates_eng.pdf]]