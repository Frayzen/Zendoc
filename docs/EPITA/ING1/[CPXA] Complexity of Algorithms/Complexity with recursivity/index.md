---
title: "Complexity with recursivity"
---
Last edited time: December 11, 2023 8:18 AM

# General Theorem

For the equation of the shape:

$$
T(n) = aT(\frac{n}{b}+O(1))+f(n)
$$

For $n ≥ n_0$ and  $T(n) = \theta(1)$

With $a \geq 1, b>1$

## Steps

**Compute** $l = log_b(a)$

1. If $f(n) = O(n^{l - \epsilon}), \epsilon > 0$
    - Then: $T(n) = \theta(n^{l})$
2. If $f(n) = \theta(n^{l})$
    - Then: $T(n) = \theta(n^{l}log(n))$
3. If $f(n) = \Omega(n^{l + \epsilon}), \epsilon > 0$ 
    - If $af(\frac{n}{b}) \leq 
    cf(n), c\lt1\ (\forall n > 0)$
    - Then: $T(n) = \theta(f(n))$
4. Otherwise, the theorem doesn’t apply
    - Either if the sub-requirement of the third case doesn’t apply
    - Or the first or the third case doesn’t work for any epsilon

<aside>
💡 In other word, we compute the work in the current call to the work made in the recursive calls and take the largest value as reference.
* If it is smaller, it is the 1st case
* If it is equal, it is the 2nd case
* If it is larger, it is the 3d case

</aside>

## Exercises

![Untitled](Complexity%20with%20recursivity/Untitled.png)

- **Answer**
    
    ![Untitled](Complexity%20with%20recursivity/Untitled%201.png)
    

![Untitled](Complexity%20with%20recursivity/Untitled%202.png)

- **Answer**
    
    ![Untitled](Complexity%20with%20recursivity/Untitled%203.png)
    

![Untitled](Complexity%20with%20recursivity/Untitled%204.png)

- **Answer**
    
    ![Untitled](Complexity%20with%20recursivity/Untitled%205.png)
    

![Untitled](Complexity%20with%20recursivity/Untitled%206.png)

- **Answer**
    
    ![Untitled](Complexity%20with%20recursivity/Untitled%207.png)
    
    ![Untitled](Complexity%20with%20recursivity/Untitled%208.png)
    

# Try Substitution

Get an idea of the solution by working out some easy values and taking a guess.

For example:

- It works for powers of 2
- It works when plotting it
- If we approximate, it works
- …

## Carreful !

<aside>
⛔ Do not substitute T.
For example, $T(n)=\theta(n)+2T(n/2)$.
We could be tempted to say $\theta(n)=\theta(n)+2\theta(n/2) = T(n)$ but **it doesnt work**
(to convince yourself, try with $\theta(n^2)$

</aside>

# General Case

## Example: Big O(f(n))

By definition: $\exists c > 0, \exists n_0 \ tq\ \forall n\geq n_0, |T(n)| \leq cf(n)$

<aside>
💡 The absolute part can go away if we know that T is always positive (often the case)

</aside>

**Induction:**

1. prove that $\exists c,|T_n| \leq cf(n)$
2. prove $H_(n_0),H_(n_0+1),H_(n_0+2),...$
3. prove that given $H_(n_0),H_(n_0+1),H_(n_0+2)$ implies $H_n$

![Untitled](Complexity%20with%20recursivity/Untitled%209.png)

![Untitled](Complexity%20with%20recursivity/Untitled%2010.png)

## If it doesnt work imediatly

![Untitled](Complexity%20with%20recursivity/Untitled%2011.png)

![Untitled](Complexity%20with%20recursivity/Untitled%2012.png)

## Then try with another function f

![Untitled](Complexity%20with%20recursivity/Untitled%2013.png)
