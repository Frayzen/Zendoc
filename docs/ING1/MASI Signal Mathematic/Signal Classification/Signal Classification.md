---
title: Signal Classification
Files:
  - "[[classification_signaux_en.pdf]]"
Owner: Matcha
---
## Mathematical definition of a signal
A signal is defined as a function
$x : I \subseteq \mathbb{R} \to \mathbb{C} \newline t\ \mapsto\ x(t)$
that satisfies :
$\to x\ is\ bounded \ (in\ magnitude)\ :\ ∃ \ 0 < M < +∞ \ \ such\ that\ \ |x(t)| < M\ \ ∀t ∈ I  
\newline\to\ x\ is\ continuous\ or\ has\ a \ finite\ or\ countable \ infinity \ of\ discontinuities.$
![[Untitled 41.png|Untitled 41.png]]
  

> [!important] Remarks :
> 
> - We restrict ourselves to univariate and one-dimensional signals.
> - x can take complex values.
> - In general, I = $\mathbb{R}$.
> - By abuse of language, we will refer to t as the time variable.
> - The graph of x is called the time representation.
> - The set of signals is a vector space in which we can define a basis, inner product,  
>     and norm
  
- Example: Radar
    
    ![[Untitled 1 22.png|Untitled 1 22.png]]
    
    1. Emission of a reference signal $x_{ref}$ that propagates to the target.
    2. The echo returns to the receiver, which records $x_{echo}$ .
    3. Measurement of the echo delay ⇒ distance to the target.  
        ⇒ How to calculate the echo delay most reliably ?
    
    _Idea:_ Find the optimal translation factor to superimpose the pattern of $x_{echo}$ on$x_{ref}$ to maximize the similarity between these two signals.
    
      
    
## Integrability
  
![[Untitled 2 14.png|Untitled 2 14.png]]
  
## General definitions
- **Bounded support**
    
    $f(x) \text{ has bounded support on } [a,b] \Rightarrow f(x)= 0 \ \forall x < a \ and \ x > b$
    
- **Discrete signal**
    
    A discrete-time signal is _a sequence of values that correspond to particular instants in time_
    
  
  
### Analog signal
An analog signal varies in a continuous manner with respect to its input variables and in its output values — all measurable physical quantities.
### Digital signal
A digital signal varies in a discrete manner with respect to its input and output values. A discrete signal may be stored in finite memory to be manipulated by a computer.
  
![[Screenshot_from_2024-01-07_12-37-24.png]]
  
### Deterministic signal
A deterministic signal is perfectly clean, without external perturbations and without measurement noise.
### Stochastic signal
A stochastic signal, involving one or more random processes (noise), in addition to its normal behavior.
  
![[Screenshot_from_2024-01-07_12-40-01.png]]