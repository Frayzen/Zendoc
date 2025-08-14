---
title: Chain rules
Owner: "Florian "
---
> [!important] delta means derivate with respect to one variable, d means derivate with respect to every variables

> [!important] df/dx * dx / df is NOT 1
# Composition _f = f(g(x,y))_
$f_x = \frac{\delta f}{\delta x} = \frac{\delta g}{\delta g} \frac{\delta f}{\delta x} = \frac{\delta f}{\delta g} \frac{\delta g}{\delta x} = f'(g)g_x$
$f_y = f'(g)g_y$
# Dependance _f(x(t), y(t))_
$df = \frac{\delta f}{\delta x}dx + \frac{\delta f}{\delta y}d y \implies \frac{df}{dt} = \frac{\delta f}{\delta x} \frac{dx}{dt} + \frac{\delta f}{\delta y} \frac{dy}{dt}$
If t appear explicitly in f (there is actually the t term appearing anywhere)
$\frac{df}{dt} = \frac{\delta f}{\delta x} \frac{dx}{dt} + \frac{\delta f}{\delta y} \frac{dy}{dt} + \frac{df}{dt}$
# Dependance _f(x(t,u), y(t,u))_
- The partial derivatives are obtained in a similar way to the previous derivative f′(t), by replacing d by ∂, to wit