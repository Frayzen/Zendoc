---
title: "Junction Field Effect Transistor (JFET)"
---
Last edited time: May 7, 2023 11:39 PM

<aside>
💡 Also know as [**JFET**](https://en.wikipedia.org/wiki/JFET)

</aside>

# Cours

[kj_08_Field_effect_transistors_eng.pdf](Junction%20Field%20Effect%20Transistor%20(JFET)/kj_08_Field_effect_transistors_eng.pdf)

# Videos

[https://www.youtube.com/watch?v=7zPkJ2ifQcc](https://www.youtube.com/watch?v=7zPkJ2ifQcc)

[https://www.youtube.com/watch?v=2I_8YNVgbEw](https://www.youtube.com/watch?v=2I_8YNVgbEw)

# Notes

<aside>
⚠️ It is mandatory to understand [Dopage](../S3%20Elec/Dopage.md) before going any further

</aside>

### Formula

![Untitled](Junction%20Field%20Effect%20Transistor%20(JFET)/Untitled.png)

## N-Channel JFET

A N-channel JFET is made of 2 P-type material and 1 N-type material (see [Doping](Metal%20Oxyde%20Semiconductor%20Field%20Effect%20Transistor%20.md))

![Untitled](Junction%20Field%20Effect%20Transistor%20(JFET)/Untitled%201.png)

![Untitled](Junction%20Field%20Effect%20Transistor%20(JFET)/Untitled%202.png)

## P-Channel JFET

A N-channel JFET is made of 2 N-type material and 1 P-type material (see [Doping](Metal%20Oxyde%20Semiconductor%20Field%20Effect%20Transistor%20.md))

![Untitled](Junction%20Field%20Effect%20Transistor%20(JFET)/Untitled%203.png)

![Untitled](Junction%20Field%20Effect%20Transistor%20(JFET)/Untitled%204.png)

## How it works

<aside>
👀 We take the NFET as example

</aside>

![Untitled](Junction%20Field%20Effect%20Transistor%20(JFET)/Untitled%205.png)

On the following image, the red part represents the depletion region ([see dopage](../S3%20Elec/Dopage.md)).

The gate is connected to both region in order to have mirrored depletion regions.

![Untitled](Junction%20Field%20Effect%20Transistor%20(JFET)/Untitled%206.png)

Here, some voltage Vds is applied. Therefore, the electrons are attracted by the positive charge at D. A current is created from D to S.

![Untitled](Junction%20Field%20Effect%20Transistor%20(JFET)/Untitled%207.png)

As Vgs takes a negative value, the PN junction is in a [reversed bias](../S3%20Elec/Dopage.md). The lower Vgs is, the deeper the depletion region penetrates into the channel.

As an effect of Vgs increasing, the current Id (*drain current*) reduces as well.

In other words, Vgs controls the flow of Id.

### Pinch voltage

Vgs is always negative (in case of N-channel).

Since we apply a voltage between G and S as well as between D and S, the depletion region tends to be wider towards S (where the potential is maximal). Therefore, both Vgs and Vds are gonna control the depletion region. 

We often assume Vgs as constant and plot the curve of the current going through D in term of Vds. The current Id is proportional (in the ohmic region, see the graph under) to Vds. 

The value Vp is called the pinch voltage. It is the value taken by Vds for which the two depletion regions contact. The current is not zero at this point but instead remain constant no matter if we keep increasing Vds. It is the saturation region.

### Graph

![Untitled](Junction%20Field%20Effect%20Transistor%20(JFET)/Untitled%208.png)

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
