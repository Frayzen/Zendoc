---
title: "Distributions to remember"
---
Last edited time: May 27, 2024 6:45 PM

# Discrete

## Bernoulli

- models the number of successes in a fixed number of independent Bernoulli trials
- only two possible outcomes : success or failure
- parameters:
    - number of trials `n`
    - probability of success `p`

$$
\begin{aligned}

&\forall k \in \{0,1\}, \ P(X = k) = p^k (1 - p)^{1 - k} \\
&E[X] = p \\
&\text{Var}(X) = p(1 - p)
\end{aligned}

$$

## **Binomial**

- Models the number of successes in a fixed number of independent Bernoulli trials.
- Only two possible outcomes: success or failure.
- Parameters:
    - Number of trials `n`
    - Probability of success `p`

$$
\begin{aligned}

&\text{For } k = 0, 1, 2, \ldots, n: \\
&P(X = k) = \binom{n}{k} p^k (1 - p)^{n - k} \\
&E[X] = np 
\\
&\text{Var}(X) = np(1 - p)
\end{aligned}
$$

## Geometric

- Models the number of trials needed until the first success in a sequence of independent Bernoulli trials.
- Only two possible outcomes: success or failure.
- Parameter:
    - Probability of success `p`

$$
\begin{aligned}
&\text{For } k = 1, 2, 3, \ldots:\\
&P(X = k) = (1 - p)^{k - 1} p \\
&E[X] = \frac{1}{p} \\
&\text{Var}(X) = \frac{1 - p}{p^2}

\end{aligned}
$$

# Continuous

## Uniform

- models outcomes where each value in the range is equally likely.
- Outcomes: Any value within a specified range.
- Parameters:
    - Lower bound `a`
    - Upper bound `b`

$$
\begin{aligned}&\text{For } x \in [a, b]: \\&P(X = x) = \frac{1}{b - a} \\&E[X] = \frac{a + b}{2} \\&\text{Var}(X) = \frac{(b - a)^2}{12}\end{aligned}
$$

## Normal

- models continuous random variables with a symmetric bell-shaped curve.
- Outcomes: Any real number.
- Parameters:
    - Mean `μ`
    - Standard deviation `σ`

$$
\begin{aligned}&\text{For } x \in \mathbb{R}: \\&P(X = x) = \frac{1}{\sqrt{2\pi}\sigma} e^{-\frac{(x - \mu)^2}{2\sigma^2}} \\&E[X] = \mu \\&\text{Var}(X) = \sigma^2\end{aligned}
$$

## Exponential

- models the time until an event occurs in a Poisson process.
- Outcomes: Non-negative real numbers.
- Parameter: Rate parameter `λ`

$$
\begin{aligned}&\text{For } x \geq 0: \\&P(X = x) = \lambda e^{-\lambda x} \\&E[X] = \frac{1}{\lambda} \\&\text{Var}(X) = \frac{1}{\lambda^2}\end{aligned}
$$
