---
title: "Operational Amplifier (AOP)"
---
Last edited time: May 7, 2023 3:31 PM

<aside>
💡 Also know as **AOP**

</aside>

[Diode reminder](Operational%20Amplifier%20(AOP)/Diode%20reminder.md)

# Cours

[kj_10_1_Operational_Amplifiers_eng.pdf](Operational%20Amplifier%20(AOP)/kj_10_1_Operational_Amplifiers_eng.pdf)

# Video

[https://www.youtube.com/watch?v=fmRHDqcodS4](https://www.youtube.com/watch?v=fmRHDqcodS4)

# The Ideal Operational Amplifier

![Untitled](Operational%20Amplifier%20(AOP)/Untitled.png)

On this picture, it can be seen that:

- Vdd = -Vcc
- Epsilon = (V-) + (V+) wich is often very small (but the sign does matter)
- Vs the output of the amplifier
- Ac denotes the coefficient of amplification so that Vs = Ac*Epsilon

![Untitled](Operational%20Amplifier%20(AOP)/Untitled%201.png)

There is 2 domains: **Linear** and **Saturated** 

## Linear zone

Vs= Ac*ε . The differential amplification, Ac is very large so tending towards +∞. In this case, the OpAmp is said to be "ideal".

## Saturation zone

**Saturation zones**: Vs = ±Vcc sat according to the sign of ε. (The saturation voltages are very close to the supply voltage)

# Implementation of the operational amplifier

## Feedback

The principle of feedback is basically linking the output on an input.

If we connect Vs to the - pin, we stabilize the output. As we can see here:

![Untitled](Operational%20Amplifier%20(AOP)/Untitled%202.png)

If we connect Vs to the + pin, we leave the output increase or decrease to really high or low values. As we can see here:

![Untitled](Operational%20Amplifier%20(AOP)/Untitled%203.png)

<aside>
ℹ️ Once Vs reaches VCC or VDD, it stops to increase or decrease since they are the bounds of the possible values for Vs

</aside>

## Conclusion: Mode of study of OpAmp

### Negative feedback

Everytime there is a negative feedback, we consider epsilon as 0, then Vs = V+.

### Positive feedback

Everytime there is a positive feedback, we consider Vs = Vcc or Vdd
