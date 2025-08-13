---
title: Video- Espérance et Variance
Owner: "Florian "
---
[https://www.youtube.com/watch?v=y215smejbDg](https://www.youtube.com/watch?v=y215smejbDg)
# Expectation (fr: esperance)
## Discrete variable
![[Untitled 103.png|Untitled 103.png]]

**Discrete variable** admits an expectation $E(X) = \sum_{i\in I}x_iP(X=x_i)$.

> [!important] This limits needs to
> 
> [[ABS Convergence]][[SPE/Maths/Series of functions/Uniform Convergence/Uniform Convergence|Uniform Convergence]] otherwise it does not admit any expectation
## Variable with a density
![[Untitled 1 71.png|Untitled 1 71.png]]

**Variable with a density** admits an expectation $E(X) = \int_{-\infty}^{\infty}xf(x)dx$
## Interpretation
Let’s assume **K** independent outcomes. Let $x \in \N, K_i =$ number of outcomes of $x_i$.
$\frac{X_1+X_2+...+X_n}{K} = \sum_{i=1}^n x_i \times \frac{K_i}{K}=\sum_{i=1}^nx_iP(X=x_i) =E(X)$
Because $\frac{K_i}K$represents the probability of $X=x_i$ when K is large enough.
![[Untitled 2 52.png|Untitled 2 52.png]]

The **expectation** of the variable represents the mean of the outcomes when K is large.
In the examples, it can be seen that E(X) is shifted toward the most weighted values.
  
## Properties of the expectation
- For any [[ING1/SCHD Planning/Planning S6/Remediation]] $E(\phi(X)) = \int_{-\infty}^\infty \phi(x)f(x)dx$ where **f is a density** of X.
    
    - **Visual proof**
        
        ![[Untitled 3 38.png|Untitled 3 38.png]]

        
        It is easy to see here that when we shift the function by b, the expectation is shifted as well.
        
        ![[Untitled 4 29.png|Untitled 4 29.png]]

        
        It is also obvious that when we multiply the function by a, the expectation is mutliplied as well.
        
    
    > [!important] It only applies when the integrals converges absolutely, it does not admit an expectation otherwise.
    
- $\forall (a,b) \in \R^2, E(aX +b) = aE(X) + b$
- $\forall (X,Y), E(X+Y) = E(X) + E(Y)$
## Exercise
![[Untitled 5 22.png|Untitled 5 22.png]]

- Answer
    
    ![[Untitled 6 15.png|Untitled 6 15.png]]

    
    ![[Untitled 7 13.png|Untitled 7 13.png]]

    
    ![[Untitled 8 11.png|Untitled 8 11.png]]

    
      
    
# Variance
## Definition
$Var(X) = E((X-E(X))^2)$

> [!important] The standard deviation (fr
> 
> _: ecart type_) is noted as $\sigma=\sqrt{Var(X)}$

> [!important] $\forall (X,Y), Var(X+Y) = Var(X) + Var(Y)$
![[Untitled 9 9.png|Untitled 9 9.png]]

![[Untitled 10 8.png|Untitled 10 8.png]]

## Interpretation
Let’s assume **K** independent outcomes.
The Variance can be seen as the mean of all of the distances between the outcome and the expectation when **K** is large.
It is literally **a mean distance squared**.
The standard deviation is then a **mean distance**.
![[Untitled 11 8.png|Untitled 11 8.png]]

We often represent the standard deviation around the expectation.
![[Untitled 12 8.png|Untitled 12 8.png]]

If the same function is taken between -2 and 2, the standard variation is multiplied by 2 and the variance by 4.
![[Untitled 13 8.png|Untitled 13 8.png]]

Here, there’s more weight on values further from E(X). Therefore, its standard variation is larger.
![[Untitled 14 5.png|Untitled 14 5.png]]

Here, there’s more weight on values closer from E(X). Therefore, its standard variation is shorter.
## Properties
- $\forall (a,b) \in \R^2, Var(aX +b) = a^2E(X)$
    - **Visual proof**
        
        ![[Untitled 15 5.png|Untitled 15 5.png]]

        
        ![[Untitled 16 5.png|Untitled 16 5.png]]

        
- $\forall (X,Y), Var(X+Y) \neq Var(X) + Var(Y)$
- $Var(X) = E(X^2) - (E(X))^2$
## Tchebychev inequality

> **Theorem**  
> Let X be a random variable that admits a variance. Then:$\forall \epsilon > 0, P(|X - E(X)| > \epsilon) \le \frac{Var(X)}{\epsilon^2}$
![[Untitled 17 4.png|Untitled 17 4.png]]

## Exercise
![[Untitled 18 4.png|Untitled 18 4.png]]

- **Correction**
    
    ![[Untitled 19 4.png|Untitled 19 4.png]]

