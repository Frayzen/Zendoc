---
Owner: "Florian "
---
# Definitions
- **DISCRETE VARIABLE:** The set of possible outcomes is either finite or infinite but countable.
- **CONTINUOUS VARIABLE:** The set of possible outcomes is an interval **without** defined points.
# Formulas
## Density
**Properties:**
- $f$ is positive
- The integral $\int_{-\infty}^{+\infty}f(t)dt$ converges and its value is 1
- $\forall [a,b]\subset \mathbb{R}, P(X\in[a,b])=\int_a^b f(t)dt$
## Density function
Let $X$ be a random variable and $F$ its cumulative distribution function.
If it exist, $f$ is a density function if it is of the form :
$F(x)=\int_{-\infty}^x f(t)dt$

> [!important] $P(X\in]a,b])=P(X\in[a,b])=\int_a^bf(t)dt$