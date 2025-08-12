---
title: "Remediation"
---
Last edited time: September 28, 2023 10:05 AM

[Generalized Integral](Remediation/Generalized%20Integral.md)

[Approximation of functions](Remediation/Approximation%20of%20functions.md)

[Functions of several variables](Remediation/Functions%20of%20several%20variables.md)

[Formalisation Logique](Remediation/Formalisation%20Logique.md)

### Piece-wise continuity

basically we need this to be satisfied at all points of discontinuity:

$$
lim_{x \rightarrow c^-} f(x) \in \mathbb{R} \ \ and \ \ lim_{x \rightarrow c^+} f(x) \in \mathbb{R}
$$

[https://www.statisticshowto.com/types-of-functions/piecewise-function/](https://www.statisticshowto.com/types-of-functions/piecewise-function/)

- An important part of this definition is that the [**one-sided limits](https://www.statisticshowto.com/limit-of-functions/#onesided) have to exist.** As an example, the function sin(1/x) is *not* piecewise continuous because the one-sided limit f(0+) doesn’t exist. If a function has a [vertical asymptote](https://www.statisticshowto.com/calculus-definitions/asymptote-vertical-horizontal-oblique/#verticalA) like this, even at the end of an interval, then it isn’t piecewise continuous.
- Perhaps surprisingly, **nothing in the definition states that every point has to be defined.** A function could be missing, say, a point at x = 0. But as long as it meets all of the other requirements (for example, as long as the graph is continuous between the undefined points), it’s still considered piecewise continuous.
