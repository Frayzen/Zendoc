---
title: "Chain rules"
---
Last edited time: September 7, 2023 11:17 AM

<aside>
💡 delta means derivate with respect to one variable, d means derivate with respect to every variables

</aside>

<aside>
⚠️ df/dx * dx / df is NOT 1

</aside>

# Composition *f = f(g(x,y))*

$$
f_x = \frac{\delta f}{\delta x} = \frac{\delta g}{\delta g} \frac{\delta f}{\delta x} = \frac{\delta f}{\delta g} \frac{\delta g}{\delta x} = f'(g)g_x
$$

$$
f_y = f'(g)g_y
$$

# Dependance *f(x(t), y(t))*

$$
df = \frac{\delta f}{\delta x}dx + \frac{\delta f}{\delta y}d y \implies \frac{df}{dt} = \frac{\delta f}{\delta x} \frac{dx}{dt} + \frac{\delta f}{\delta y} \frac{dy}{dt}
$$

If t appear explicitly in f (there is actually the t term appearing anywhere)

$$
\frac{df}{dt} = \frac{\delta f}{\delta x} \frac{dx}{dt} + \frac{\delta f}{\delta y} \frac{dy}{dt} + \frac{df}{dt}
$$

# Dependance *f(x(t,u), y(t,u))*

- The partial derivatives are obtained in a similar way to the previous derivative f′(t), by replacing d by ∂, to wit
