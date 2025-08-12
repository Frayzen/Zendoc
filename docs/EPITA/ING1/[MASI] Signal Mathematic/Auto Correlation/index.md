---
title: "Auto Correlation"
---
Last edited time: January 7, 2024 11:54 AM

$$
\Gamma_{xx}(\tau) =  ⟨x(t), x(t − τ )⟩ = \int _{\mathbb{R}}
x(t) \overline{x(t − \tau)}dt
$$

![Untitled](Auto%20Correlation/Untitled.png)

## Some properties

- Any signal that has a [bounded support](Signal%20Classification.md) admits a finite auto correlation
    
    $\forall x \in \mathcal{L}^2({\mathbb{R}}), |\Gamma_{xx}(\tau)| < \infty$
    
- The value of the auto correlation in 0 is the [energy of the signal](Energy%20and%20Power.md)
    
    $\Gamma_{xx}(0) = E_x$
    
- The auto correlation is maximal in 0
