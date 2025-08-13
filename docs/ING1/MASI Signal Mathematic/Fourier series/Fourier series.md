---
title: Fourier series
Owner: Matcha
---
  
## Superposition principle
For a linear system, the response caused by the sum of several external excitations is the  
sum of the responses that would have been caused by each excitation taken individually.
_i.e : a complex vibrating phenomenon can be decomposed as a linear superposition of much simpler vibrating phenomena._
![[Untitled 42.png|Untitled 42.png]]

> [!important] It is the base of the Fourier seies
  
## Piecewise continuity
A signal x : t is piecewise continuous
  
## Fourier series
$f(x) = \frac{a_0}{2} + \sum_{n=1}^{\infty} \left[ a_n \cos\left(\frac{n\pi x}{L}\right) + b_n \sin\left(\frac{n\pi x}{L}\right) \right]$
$f(x) = \frac{a_0}{2} + \sum_{n=1}^{\infty} \left[ a_n \cos(nx) + b_n \sin(nx) \right]$
In case of $2\pi$ periodic functions
$a_0 = \frac{1}{L} \int_{-L}^{L} f(x) dx\\  
a_n = \frac{1}{L} \int_{-L}^{L} f(x) \cos\left(\frac{n\pi x}{L}\right) dx\\  
b_n = \frac{1}{L} \int_{-L}^{L} f(x) \sin\left(\frac{n\pi x}{L}\right) dx$
Here, $L$ denotes the half of the period
$a_0 = \frac{1}{\pi} \int_{-\pi}^{\pi} f(x) dx\\  
a_n = \frac{1}{\pi} \int_{-\pi}^{\pi} f(x) \cos(nx) dx\\  
b_n = \frac{1}{\pi} \int_{-\pi}^{\pi} f(x) \sin(nx) dx$
In case of $2\pi$ periodic functions
  
  

> [!important] reminder:
> 
> $f(x)$ odd function $\rightarrow\ a_n=0$, $f(x)$ even $\Rightarrow\ b_n=0$
  
  
## Gibbs Phenomenon
$\forall N\in \mathbb{N},\ S_N\ :\ t\mapsto\ a_0+\sum_{n=1}^{N}a_n.cos(2\pi \frac{n}{T}t)\ +\ \sum_{n=1}^{N}b_n.sin(2\pi \frac{n}{T}t)$is a continuous function
$\rightarrow$ $S_N$ is forced to have a discontinuous behavior next to $(t_0,x(t_0))$
$\rightarrow$ $S_N$ oscillates around $(t_0,x(t_0))$
- The overshoot reaches its minimum/maximum at $t_{N}^{\pm}=t_0\pm \frac{T}{2N}$
- $|x(t_{0}^{+})-S_N(t_{N}^{+})|\underset{n\to +\infty}{\longrightarrow} 0.009\Delta x(t_0)$ with $\Delta x(t_0)=|x(t_{0}^{+}-x(t_{0}^{-})|$ the height of the discontinuity
(same for $|x(t_0^-)-S_N(t_N^-)|$)
# To know by heart for the finals
- The shape of the coefficient $a_0$, $a_n$ and $b_n$ of Fourier (both real and imaginary)