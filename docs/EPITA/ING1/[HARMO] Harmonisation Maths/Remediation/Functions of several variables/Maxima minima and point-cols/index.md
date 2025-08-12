---
title: "Maxima minima and point-cols"
---
Last edited time: September 18, 2023 8:05 AM

# Extrema

the extrema of f(x,y) is characterized by

$$
\frac{\delta f}{\delta x} = 0\ and\ \frac{\delta f}{\delta y} = 0 
$$

<aside>
ℹ️ Those points are called **stationary points**

</aside>

<aside>
💡 * If partial derivate doesnt exist at a point, it is called **rough points**
* if a point is located at the frontier of its domain, it is called **end points**

</aside>

The nature of a stationary point is determined by its (*partial*) second derivative at this point

## Arbitrary dimension

In arbitrary dimension, the condition of stationarity is simply given by the relation ∇f = 0

## On the frontier

***Example*** : we want to minimise/maximise the following function

$$
f(x, y) = x² + xy + y² − x − y + 1, \forall\ y \leq 0
$$

The conditions fx = fy = 0 give the point (1/3, 1/3) which is clearly not in the research domain.

In that case we set before hand y = 0, i.e we are at the frontier of the research domain

The condition fx(x, 0) = 0 leads to an extremum located (on the frontier) at the point (1/2, 0).

<aside>
⚠️ The geometry of a domain frontier may be very complicated ...

</aside>

## Nature of stationary point

Let the quadratic equation:

$$
f(x, y) = r x² + 2s xy + ty²
$$

<aside>
❕ Depending on Monge parameters r, s, t, one can determine the nature of the point (0, 0).

</aside>

To show this, it suffices to write the function f(x, y) under canonical form or reduced form in function of its parameters.

![Untitled](Maxima%20minima%20and%20point-cols/Untitled.png)

![Untitled](Maxima%20minima%20and%20point-cols/Untitled%201.png)

![Untitled](Maxima%20minima%20and%20point-cols/Untitled%202.png)

**Then:**

- r is the second x derivate at point (x0, y0)
- s is the x derivate at point (x0, y0) (*or y x, either one*)
- t is the y derivate at point (x0, y0)
