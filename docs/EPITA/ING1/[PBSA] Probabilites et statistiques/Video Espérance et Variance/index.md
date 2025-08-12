---
title: "Video: Espérance et Variance"
---
Last edited time: April 8, 2024 2:46 AM

[https://www.youtube.com/watch?v=y215smejbDg](https://www.youtube.com/watch?v=y215smejbDg)

# Expectation (fr: esperance)

## Discrete variable

![Untitled](Video%20Espe%CC%81rance%20et%20Variance/Untitled.png)

**Discrete variable** admits an expectation $E(X) = \sum_{i\in I}x_iP(X=x_i)$.

<aside>
⚠️ This limits needs to [converge](../../SPE/Maths/Series%20of%20functions/ABS%20Convergence.md) [**absolutely**](../../SPE/Maths/Series%20of%20functions/Uniform%20Convergence.md) otherwise it does not admit any expectation

</aside>

## Variable with a density

![Untitled](Video%20Espe%CC%81rance%20et%20Variance/Untitled%201.png)

**Variable with a density** admits an expectation $E(X) = \int_{-\infty}^{\infty}xf(x)dx$

## Interpretation

Let’s assume **K** independent outcomes. Let  $x \in \N, K_i =$ number of outcomes of $x_i$.

$$
\frac{X_1+X_2+...+X_n}{K} = \sum_{i=1}^n x_i \times \frac{K_i}{K}=\sum_{i=1}^nx_iP(X=x_i) =E(X)
$$

Because $\frac{K_i}K$represents the probability of $X=x_i$ when K is large enough.

![Untitled](Video%20Espe%CC%81rance%20et%20Variance/Untitled%202.png)

The **expectation** of the variable represents the mean of the outcomes when K is large.

In the examples, it can be seen that E(X) is shifted toward the most weighted values.

## Properties of the expectation

- For any [piece-wise continuous function](../%5BHARMO%5D%20Harmonisation%20Maths/Remediation.md) $E(\phi(X)) = \int_{-\infty}^\infty \phi(x)f(x)dx$   where **f is a density** of X.
    - **Visual proof**
        
        ![Untitled](Video%20Espe%CC%81rance%20et%20Variance/Untitled%203.png)
        
        It is easy to see here that when we shift the function by b, the expectation is shifted as well.
        
        ![Untitled](Video%20Espe%CC%81rance%20et%20Variance/Untitled%204.png)
        
        It is also obvious that when we multiply the function by a, the expectation is mutliplied as well.
        
    
    <aside>
    ⚠️ It only applies when the integrals converges absolutely, it does not admit an expectation otherwise.
    
    </aside>
    
- $\forall (a,b) \in \R^2, E(aX +b) = aE(X) + b$
- $\forall (X,Y), E(X+Y) = E(X) + E(Y)$

## Exercise

![Untitled](Video%20Espe%CC%81rance%20et%20Variance/Untitled%205.png)

- Answer
    
    ![Untitled](Video%20Espe%CC%81rance%20et%20Variance/Untitled%206.png)
    
    ![Untitled](Video%20Espe%CC%81rance%20et%20Variance/Untitled%207.png)
    
    ![Untitled](Video%20Espe%CC%81rance%20et%20Variance/Untitled%208.png)
    

# Variance

## Definition

$$
Var(X) = E((X-E(X))^2)
$$

<aside>
🧠 The standard deviation (fr*: ecart type*) is noted as $\sigma=\sqrt{Var(X)}$

</aside>

<aside>
🧠 $\forall (X,Y), Var(X+Y) = Var(X) + Var(Y)$

</aside>

![Untitled](Video%20Espe%CC%81rance%20et%20Variance/Untitled%209.png)

![Untitled](Video%20Espe%CC%81rance%20et%20Variance/Untitled%2010.png)

## Interpretation

Let’s assume **K** independent outcomes.

The Variance can be seen as the mean of all of the distances between the outcome and the expectation when **K** is large.

It is literally **a mean distance squared**.

The standard deviation is then a **mean distance**.

![Untitled](Video%20Espe%CC%81rance%20et%20Variance/Untitled%2011.png)

We often represent the standard deviation around the expectation.

![Untitled](Video%20Espe%CC%81rance%20et%20Variance/Untitled%2012.png)

If the same function is taken between -2 and 2, the standard variation is multiplied by 2 and the variance by 4.

![Untitled](Video%20Espe%CC%81rance%20et%20Variance/Untitled%2013.png)

Here, there’s more weight on values further from E(X). Therefore, its standard variation is larger.

![Untitled](Video%20Espe%CC%81rance%20et%20Variance/Untitled%2014.png)

Here, there’s more weight on values closer from E(X). Therefore, its standard variation is shorter.

## Properties

- $\forall (a,b) \in \R^2, Var(aX +b) = a^2E(X)$
    - **Visual proof**
        
        ![Untitled](Video%20Espe%CC%81rance%20et%20Variance/Untitled%2015.png)
        
        ![Untitled](Video%20Espe%CC%81rance%20et%20Variance/Untitled%2016.png)
        
- $\forall (X,Y), Var(X+Y) \neq Var(X) + Var(Y)$
- $Var(X) = E(X^2) - (E(X))^2$

## Tchebychev inequality

> **Theorem**
Let X be a random variable that admits a variance. Then:
$\forall \epsilon > 0, P(|X - E(X)| > \epsilon) \le \frac{Var(X)}{\epsilon^2}$
> 

![Untitled](Video%20Espe%CC%81rance%20et%20Variance/Untitled%2017.png)

## Exercise

![Untitled](Video%20Espe%CC%81rance%20et%20Variance/Untitled%2018.png)

- **Correction**
    
    ![Untitled](Video%20Espe%CC%81rance%20et%20Variance/Untitled%2019.png)
