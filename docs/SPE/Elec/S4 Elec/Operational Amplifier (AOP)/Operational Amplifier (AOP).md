---
title: Operational Amplifier (AOP)
Owner: "Florian "
---
> [!important] Also know as
> 
> **AOP**
[[Diode reminder]]
# Cours
![[kj_10_1_Operational_Amplifiers_eng.pdf]]
# Video
[https://www.youtube.com/watch?v=fmRHDqcodS4](https://www.youtube.com/watch?v=fmRHDqcodS4)
# The Ideal Operational Amplifier
![[Untitled 21.png|Untitled 21.png]]
On this picture, it can be seen that:
- Vdd = -Vcc
- Epsilon = (V-) + (V+) wich is often very small (but the sign does matter)
- Vs the output of the amplifier
- Ac denotes the coefficient of amplification so that Vs = Ac*Epsilon
![[Untitled 1 10.png|Untitled 1 10.png]]
There is 2 domains: **Linear** and **Saturated**
## Linear zone
Vs= Ac*ε . The differential amplification, Ac is very large so tending towards +∞. In this case, the OpAmp is said to be "ideal".
## Saturation zone
**Saturation zones**: Vs = ±Vcc sat according to the sign of ε. (The saturation voltages are very close to the supply voltage)
# Implementation of the operational amplifier
## Feedback
The principle of feedback is basically linking the output on an input.
If we connect Vs to the - pin, we stabilize the output. As we can see here:
![[Untitled 2 5.png|Untitled 2 5.png]]
If we connect Vs to the + pin, we leave the output increase or decrease to really high or low values. As we can see here:
![[Untitled 3 5.png|Untitled 3 5.png]]

> [!important] Once Vs reaches VCC or VDD, it stops to increase or decrease since they are the bounds of the possible values for Vs
## Conclusion: Mode of study of OpAmp
### Negative feedback
Everytime there is a negative feedback, we consider epsilon as 0, then Vs = V+.
### Positive feedback
Everytime there is a positive feedback, we consider Vs = Vcc or Vdd