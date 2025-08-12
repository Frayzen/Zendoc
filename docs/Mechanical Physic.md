---
title: "Mechanical Physic"
---
Last edited time: February 17, 2025 1:17 AM

[Lecture Collection | Classical Mechanics (Fall 2011)](https://www.youtube.com/playlist?list=PL47F408D36D4CF129)

# Lecture 1

## Common notations

$\vec x$ is the position of an object

$\dot {\vec x} = \vec v_x = \frac{\partial x}{\partial t}$ is the velocity of an object (on the x axis here)

$\ddot {\vec x} = \vec a_x = \frac{\partial x^2}{\partial t^2}$ is the acceleration of an object (on the x axis here)

<aside>
💡

The arrow can sometimes be omitted

</aside>

## Principles that govern physic

- A law of classical physic need to predict the future (given current state)
- A law of classical physic need to also predict the past (given current state)

<aside>
💡

In that sense, Aristotle's Laws of Motion are wrong as they do not predict past (among other imprecision).

</aside>

# Lecture 2

## Newton laws of motion

$m\vec{a} = \vec{F}$

We can consider $\vec F$ to be time dependent if we consider it dependent on $\vec x(t)$ which is time dependent.

<aside>
💡

$\vec{P}$ is the momentum and is equal to $m\vec{v}$

</aside>

Object exert an equivalent and opposite force on each others.

## Conservation laws

1. The total of the momentum of a system is conserved

## Energy

Energy is in essence, a **conserved quantity**. It represent a balance between potential energy and kinetic energy.

$E = T(x) + V(x)$

- where $T(x) =\frac 1 2 m v^2$ is the **Kinetic energy**
    - where $V(x)$ is the **Potential energy** of an object.

### Potential energy

$V(x)$ is the potential energy of an object.

**In a 1 dimension system:**

$\vec F(x) = -\frac {d V(x)}{d x} = m\vec a$

<aside>
💡

We can integrate $\vec F$ to find $V(x)$

</aside>

**In higher dimensions:**

$\vec F(x) = -\frac {d V(x)}{d x} = m\vec a$

### Proof of conservation

**In a 1 dimension system:**

If we take $\frac{\partial E}{\partial t} = m\dot x \ddot x + \frac{\partial V}{\partial x} \frac{\partial x}{\partial t} = \dot x [ m\ddot x + \frac{\partial V}{\partial x}] = 0$
 because $m\ddot x + \frac{\partial V}{\partial x} = 0$

**In higher dimensions:**

$\frac{\partial E}{\partial t} =  m(\dot x \ddot x+\dot y \ddot y + \dot z \ddot z) + \frac{\partial V}{\partial x} \frac{\partial x} {\partial t} + \frac{\partial V}{\partial y} \frac{\partial y} {\partial t} + \frac{\partial V}{\partial z} \frac{\partial z} {\partial t} = \sum_{c=x,y,z} m\dot c \ddot c + \frac{\partial V}{\partial c} \dot c = 0 = \sum_{c=x,y,z} \dot c [ m \ddot c + \frac{\partial V}{\partial c}] = 0$

Using the same trick, we can prove it for any number of dimensions.

<aside>
💡

We can even prove that conservation of energy is true for any $n$ number of particle by labeling each $(x,y,z)$ coordinates $(x_k, x_{k+1}, x_{k+2}), \forall k \in [0,n]$.

That would require us to consider $n$ different masses ($m_k$) but the proof remains identical

</aside>
