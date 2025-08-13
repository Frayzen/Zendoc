---
title: Quantum Mechanics
Owner: Tim Pearson
---
# Modern Physics: Quantum Mechanics
## 1. The Wave Function
- Light isn't just a wave, and electrons aren't just particles.
- At a very small scale, particles and waves are linked in wave-particle duality.
- **Newtonian mechanics** don't apply at the scale of atoms and electrons.
- **Quantum mechanics** is used to analyze matter waves and assess the probability of observing particles.
- Quantum mechanics allows us to understand phenomena at the atomic and molecular levels.
- With quantum mechanics we can explain the stability of atoms and how they bind to form molecules.
- Energy of an electron confined in a region is quantized, and the state of an electron is specified by integer numbers called **quantum numbers**.
- Electrons have an associated wave, as seen in the double-slit experiment.
- For electrons, the wave is described by the wave function $\Psi(x, y, z, t)$.
- Simplified models consider only the spatial part of the wave function, $\psi(x)$.
- Intensity in the double-slit experiment is proportional to the probability of detecting a particle.
- The wave function $\psi(x)$ represents the **probability amplitude**, and its square calculates the **probability density**.
- The probability of detecting a particle between $x$ and $x + dx$ is given by:$P(\text{between } x \text{ and } x + dx) = \Pi(x) dx = |\psi(x)|^2 dx$
- Where:
    - $P$ = Probability
    - $\Pi(x)$ = Probability density
    - $\psi(x)$ = Wave function
    - $x$ = Position
- The probability density is defined as:$\Pi(x) = |\psi(x)|^2$
- Where:
    - $\Pi(x)$ = Probability density
    - $\psi(x)$ = Wave function
- The wave function plays a role analogous to the electric field for a photon.
- Multiplying the wave function by -1 does not change the probability density.
- Only the probability density $|\psi(x)|^2$ has physical meaning, not the wave function itself.
---
## 1.1 Complex Numbers
- The wave function for a matter wave is generally a **complex function**.
- Complex numbers are represented on a complex plane with real (Re) and imaginary (Im) axes.
- A complex number $z$ is defined as:$z = a + ib$
- Where:
    - $z$ = Complex number
    - $a$ = Real part of z
    - $b$ = Imaginary part of z
    - $i$ = Imaginary unit ($i^2 = -1$)
- The conjugate of a complex number $z = a + ib$ is:$z^* = (a + ib)^* = a - ib$
- Where:
    - $z^*$ = Complex conjugate of z
    - $a$ = Real part of z
    - $b$ = Imaginary part of z
    - $i$ = Imaginary unit ($i^2 = -1$)
- Addition and subtraction of complex numbers:$(a + ib) \pm (c + id) = (a \pm c) + i(b \pm d)$
- Where:
    - $a + ib, c + id$ = Complex numbers
- Multiplication of complex numbers:$(a + ib) \times (c + id) = (ac - bd) + i(bc + ad)$
- Where:
    - $a + ib, c + id$ = Complex numbers
- Multiplying a complex number by its conjugate yields a real number:  
    $zz^* = (a + ib) \times (a - ib) = a^2 + b^2 = |z|^2$
- Where:
    - $z$ = Complex number
    - $z^*$ = Complex conjugate of z
    - $|z|$ = Modulus of z
- Division of complex numbers:  
    $\frac{a + ib}{c + id} = \frac{(a + ib)}{(c + id)} \times \frac{(c - id)}{(c - id)} = \frac{(ac + bd) + i(bc - ad)}{c^2 + d^2}$
- Where:
    - $a + ib, c + id$ = Complex numbers
- Polar form of a complex number:  
    $z = |z|\cos\theta + i|z|\sin\theta$
- Where:
    - $|z|$ = Modulus of z
    - $\theta$ = Argument of z
- Argument of a complex number:  
    $\theta = \arctan\left(\frac{\text{Im}(z)}{\text{Re}(z)}\right) = \arctan\left(\frac{b}{a}\right)$
- Where:
    - $\theta$ = Argument of z
    - $b$ = Imaginary part of z
    - $a$ = Real part of z
- Euler's formula:  
    $e^{i\theta} = \cos\theta + i\sin\theta$
- Where:
    - $\theta$ = Angle in radians
    - $i$ = Imaginary unit
- Complex number in polar coordinates:  
    $z = |z|e^{i\theta}$
- Where:
    - $|z|$ = Modulus of z
    - $\theta$ = Argument of z
---
## 1.2 Normalization of the Wave Function
- Probability of finding a particle between $x_1$ and $x_2$:  
    $P(\text{between } x_1 \text{ and } x_2) = \int_{x_1}^{x_2} |\psi(x)|^2 dx = \int_{x_1}^{x_2} \psi^*(x)\psi(x) dx$
- Where:
    - $P$ = Probability
    - $\psi(x)$ = Wave function
- The wave function is a complex function, but its modulus is a positive real number.
- The probability of finding the particle somewhere (between $x = -\infty$ and $x = +\infty$) must be equal to 1 (certainty).
- **Normalization condition**:  
    $\int_{-\infty}^{+\infty} |\psi(x)|^2 dx = \int_{-\infty}^{+\infty} \psi^*(x)\psi(x) dx = 1$
- Where:
    - $\psi(x)$ = Wave function
- Average value of a quantity (e.g., position $x$):  
    $\langle x \rangle = \int_{-\infty}^{+\infty} \psi^*(x) x \psi(x) dx$
- Where:
    - $\langle x \rangle$ = Average value of x
    - $\psi(x)$ = Wave function
- General formula for the average value of a function $f(x)$:  
    $\langle f(x) \rangle = \int_{-\infty}^{+\infty} \psi^*(x) f(x) \psi(x) dx$
- Where:
    - $\langle f(x) \rangle$ = Average value of function f(x)
    - $\psi(x)$ = Wave function
---
## 2. Schrödinger's Equation
- The wave function's physical interpretation: square of the modulus gives probability density.
- Need an equation to determine the wave function.
- The wave equation must be linear to ensure superposition.
- The wave equation must respect the de Broglie relation.
- The wave equation for a non-relativistic particle was discovered by Erwin Schrödinger in 1925.
- The **Schrödinger equation** in one dimension:  
    $i\hbar \frac{\partial \Psi(x, t)}{\partial t} = -\frac{\hbar^2}{2m} \frac{\partial^2 \Psi(x, t)}{\partial x^2} + U(x, t)\Psi(x, t)$
- Where:
    - $i$ = Imaginary unit
    - $\hbar$ = Reduced Planck's constant ($h/2\pi$)
    - $m$ = Mass of the particle
    - $U(x, t)$ = Potential energy function
    - $\Psi(x, t)$ = Wave function of the particle
- This equation gives the wave function associated with a matter wave for a non-relativistic particle.
- In operator form:  
    $i\hbar \frac{\partial \Psi}{\partial t} = H\Psi$
- Where:
    - $H$ = Hamiltonian operator
- The Hamiltonian operator is:  
    $H = -\frac{\hbar^2}{2m} \frac{\partial^2}{\partial x^2} + U \text{ (1D)}$  
    $H = -\frac{\hbar^2}{2m} \Delta + U \text{ (3D)}$
- Where:
    - $\Delta$ = Laplacian operator ($\frac{\partial^2}{\partial x^2} + \frac{\partial^2}{\partial y^2} + \frac{\partial^2}{\partial z^2}$)
---
## 2.1 The Free Particle
- Analysis of Schrödinger's equation for a free particle moving to the right along the x-axis.
- A free particle is not subject to any force, so $U(x, t) = 0$.
- Schrödinger's equation for a free particle:  
    $i\hbar \frac{\partial \Psi(x, t)}{\partial t} = -\frac{\hbar^2}{2m} \frac{\partial^2 \Psi(x, t)}{\partial x^2}$
- Where:
    - $i$ = Imaginary unit
    - $\hbar$ = Reduced Planck's constant ($h/2\pi$)
    - $m$ = Mass of the particle
    - $\Psi(x, t)$ = Wave function of the particle
- A sinusoidal wave isn't a direct solution.
- Consider a complex plane wave:  
    $\Psi(x, t) = A e^{i(kx - \omega t)}$
- Where:
    - $A$ = Amplitude
    - $k$ = Wave number
    - $\omega$ = Angular frequency
- Partial derivatives of the plane wave:  
    $\frac{\partial \Psi}{\partial t} = -i\omega A e^{i(kx - \omega t)}$  
    $\frac{\partial \Psi}{\partial x} = ikA e^{i(kx - \omega t)}$  
    $\frac{\partial^2 \Psi}{\partial x^2} = -k^2 A e^{i(kx - \omega t)}$
- Substituting into Schrödinger's equation:  
    $\frac{(\hbar k)^2}{2m} e^{i(kx - \omega t)} = \hbar \omega e^{i(kx - \omega t)}$
- Which implies:  
    $\frac{(\hbar k)^2}{2m} = \hbar \omega$
- For a matter wave, wavelength is related to momentum:  
    $\lambda = \frac{h}{p} = \frac{2\pi}{k} \implies p = \hbar k$
- Where:
    - $p$ = Momentum
    - $h$ = Planck's constant
- Wave frequency related to energy:  
    $E = hf = \hbar \omega$
- Where:
    - $E$ = Energy
- Substituting into the previous equation:  
    $\frac{p^2}{2m} = E$
- Where:
    - $p$ = Momentum
    - $m$ = Mass
    - $E$ = Energy
- This is the kinetic energy expressed in terms of momentum.
- A free particle is described by a complex plane wave:  
    $\Psi(x, t) = A e^{i(px - Et)/\hbar}$
- Where:
    - $p$ = Momentum
    - $E$ = Energy
- The Schrödinger equation is valid for a non-relativistic particle.
- A free particle isn't described by a single wave but by a wave packet.
---
## 2.2 Time-Independent Equation
- Considering situations where potential energy $U(x)$ doesn't depend on time.
- The wave function can be written as:  
    $\Psi(x, t) = \psi(x)e^{-iEt/\hbar}$
- Where:
    - $\psi(x)$ = Spatial part of the wave function
- The **time-independent Schrödinger equation**:  
    $E\psi(x) = -\frac{\hbar^2}{2m} \frac{\partial^2 \psi(x)}{\partial x^2} + U(x)\psi(x)$
- Properties of the wave function:
- Normalized: $\int_{-\infty}^{+\infty} \psi^*(x)\psi(x) dx = 1$
- $\psi(x)$ and $d\psi(x)/dx$ must be continuous.
- For $x \rightarrow \pm\infty$, the wave function must tend to 0.
---
## 3. Stationary States
- On a very long cord, it is possible to produce a wave having any wavelength $\lambda$.
- When a cord has length $L$, the boundary conditions impose certain values of wavelength for which we obtain a stationary wave.
- When a particle isn't confined to a region, it can have any wavelength value.
- When the particle is confined in a region, the matter wave must respect boundary conditions.
- The matter wave is a stationary wave with certain wavelength values only (stationary states).
- According to de Broglie, wavelength is related to momentum and kinetic energy.
- If wavelength can only take certain values, the same goes for energy.
- When a particle is confined in a certain region, the matter wave is a **stationary wave**.
- **The particle's energy is then quantized**.
---
## 4. Energy of a Particle Confined to One Dimension
- Start studying trapped particles by analyzing a particle in a box of width L.
- A particle (electron) is subject to a force confining it in a one-dimensional space of width L.
- Model this using a potential energy function called the **infinite potential well**.
- Potential energy:  
    $U(x) = \begin{cases} 0 & (0 \le x \le L) \\ \infty & (x < 0 \text{ or } x > L) \end{cases}$
- Where:
    - $U(x)$ = Potential energy
- Inside the potential well, the particle only has kinetic energy K.
- The particle cannot leave the region $0 \le x \le L$.
- Regions $x < 0$ and $x > L$ are called **forbidden regions**.
- Potential energy tends to infinity at $x = 0$ and $x = L$, so the matter wave must be zero at the well's ends.
- The matter wave must be a stationary wave with nodes at $x = 0$ and $x = L$.
- This is equivalent to stationary waves on a cord fixed at its ends.
- For matter waves, stationary waves are called **stationary states**.
- Wavelength of matter waves in an infinite well cannot take any value.
- For mode $n$, wavelength is:  
    $\lambda_n = \frac{2L}{n} \quad (n = 1, 2, ...)$
- Where:
    - $\lambda_n$ = Wavelength of mode n
- According to de Broglie, wavelength is related to momentum:  
    $p = \frac{h}{\lambda} = \frac{h}{2L}n$
- Where:
    - $p$ = Momentum
- Momentum is quantized.
- Calculate energy of mode $n$, knowing that $U = 0$ inside the well and $K = p^2 / (2m)$.
- $E = K + U = p^2 / (2m) + 0$
- Energy of the mode $n$:  
    $E_n = \frac{h^2}{8mL^2}n^2 = n^2 E_1$
- Where:
    - $E_n$ = Energy of mode n
- $n$ is a positive integer that represents the stationary wave's mode number.
- In quantum mechanics, $n$ is called the **quantum number**.
- **Energy of an electron, confined in an infinite potential well, is quantized**.
### Quantum Transitions
- In classical physics, a particle can have zero energy by being at rest.
- In quantum mechanics, when a particle is trapped, it must have a certain energy value.
- Represent stationary state energies in an **energy level diagram**.
- The system cannot have energy between two levels.
- State $n = 1$ is the state with the lowest energy, the **ground state**.  
    $E_1 = \frac{h^2}{8mL^2}$
- Where:
    - $E_1$ = Ground state energy
- The more a particle is confined to a narrow region, the greater its minimum energy.
- Other states are **excited states**.
- The ground state is the system's stable state because it has a minimum energy.
- To excite the system, supply energy $\Delta E$ so the electron goes to a higher $n$ state.
- For example, the electron can absorb a photon with energy $E_{\text{photon}} = \Delta E$.
- If the electron is initially at level $n_b$, it can rise to level $n_h$ if it absorbs energy $\Delta E$:  
    $\Delta E = E_{n_h} - E_{n_b} = \frac{hc}{\lambda}$
- Where:
    - $\lambda$ = Wavelength of the photon
- To be absorbed, a photon must have energy corresponding to the difference $\Delta E$ between two levels.
- When an electron is in an excited state $n_h$, it can descend to the lower level $n_b$ by emitting a photon whose energy is $E_{\text{photon}} = \Delta E$.
- The electron emits a photon for each transition.
---
## 5. Wave Function of a Particle Confined to One Dimension
- Energy states of an electron in an infinite well were obtained by applying de Broglie's equation to stationary waves.
- Now, obtain the wave function and energy of a trapped electron by explicitly solving Schrödinger's equation:  
    $E\psi(x) = -\frac{\hbar^2}{2m} \frac{\partial^2 \psi(x)}{\partial x^2} + U(x)\psi(x)$
- For the infinite potential well, with width $L$:  
    $U(x) = \begin{cases} 0 & (0 \le x \le L) \\ \infty & (x < 0 \text{ or } x > L) \end{cases}$
- When $x < 0$, the potential energy tends to infinity.
- For a finite energy $E$, Schrödinger's equation implies that $\psi = 0$.
- Same thing for $x > L$: $\psi(x) = 0$ for $x < 0$ and $x > L$
- The wave function must be continuous, implying that the wave function is zero at the ends.
- This gives the boundary conditions:  
    $\psi(0) = \psi(L) = 0$
- The wave function has nodes at the potential well's ends, like a cord fixed at both ends.
### 5.1 Solving Schrödinger's Equation
- For $0 \le x \le L$, Schrödinger's equation is:  
    $\frac{\partial^2 \psi(x)}{\partial x^2} = -\frac{2mE}{\hbar^2} \psi(x)$
- This equation has the same form as the simple harmonic motion equation.
- The solution is a sine or cosine function:  
    $\phi_1(x) = A\sin(kx), \quad \phi_2(x) = B\cos(kx)$
- Where:
    - $k$ = Wave number
    - $A, B$ = Integration constants
- $k$ (the wave number) is given by:  
    $k = \sqrt{\frac{2mE}{\hbar}}$
- Solutions $\phi_1(x)$ and $\phi_2(x)$ are independent.
- The general solution is the sum of these two solutions:  
    $\psi(x) = A\sin(kx) + B\cos(kx)$
- The wave function must respect the boundary conditions.
- For $x = 0$:  
    $\phi(0) = A\sin(0) + B\cos(0) = 0$
- This condition is respected only if $B = 0$.
- For $x = L$:  
    $\phi(L) = A\sin(kL) = 0$
- This equation corresponds to the condition for a node in the wave function at $x = L$, which produces energy quantization.
- The condition is respected when:  
    $kL = n\pi$  
    $k = \frac{n\pi}{L} \quad (n = 1, 2, ...)$
- Substituting:  
    $\sqrt{\frac{2mE}{h/(2\pi)}} = \frac{n\pi}{L}$
- Energy of the trapped electron is quantized:  
    $E = \frac{h^2}{8mL^2}n^2$
### 5.2 Normalization of the Wave Function
- The wave function of stationary state $n$ is:  
    $\psi_n(x) = A \sin\left(\frac{n\pi x}{L}\right)$
- The constant $A$ must be calculated to normalize the wave function.
- The normalization condition is:  
    $\int_{-\infty}^{+\infty} \psi_n(x)^*\psi_n(x) dx = 1$
- The wave function is zero for $x < 0$ and $x > L$, so the integral is calculated between $x = 0$ and $x = L$:  
    $\int_0^L A^2 \sin^2\left(\frac{n\pi x}{L}\right) dx = 1$  
    $A^2 \left[ \frac{x}{2} - \frac{\sin(2n\pi x/L)}{4n\pi/L} \right]_0^L = A^2 \frac{L}{2} = 1$  
    $A = \sqrt{\frac{2}{L}}$
- The normalization constant is the same for all states $n$.
- The wave function is:  
    $\psi_n(x) = \begin{cases} \sqrt{\frac{2}{L}} \sin\left(\frac{n\pi x}{L}\right) & (0 \le x \le L) \\ 0 & (x < 0 \text{ or } x > L) \end{cases}$
- The wave function is equivalent to a stationary wave on a cord.
- State $n$ has $n + 1$ nodes and $n$ antinodes.
---
## 6. Potential Wells in Two and Three Dimensions
- Before studying real situations, generalize potential well study to two and three dimensions.
- Need to express Schrödinger's equation for $\psi(x, y, z)$.
- For a particle of mass $m$ subject to potential energy $U(x, y, z)$, the time-independent equation generalizes:  
    $E\psi(x, y, z) = -\frac{\hbar^2}{2m} \left( \frac{\partial^2 \psi(x, y, z)}{\partial x^2} + \frac{\partial^2 \psi(x, y, z)}{\partial y^2} + \frac{\partial^2 \psi(x, y, z)}{\partial z^2} \right) + U(x, y, z)\psi(x, y, z)$
- The wave function is again associated with probability density, which becomes a probability per unit volume.
- Probability of finding the particle somewhere is calculated by a volume integral:  
    $P = \iiint |\psi(x, y, z)|^2 dV$
### 6.1 Infinite Well in Two Dimensions
- Analyze a particle confined to a rectangular region of length $L_x$ and width $L_y$.
- Corresponding potential energy:  
    $U(x, y) = U_1(x) + U_2(y)$  
    $U_1(x) = \begin{cases} 0 & (0 \le x \le L_x) \\ \infty & (x < 0 \text{ or } x > L_x) \end{cases}$  
    $U_2(y) = \begin{cases} 0 & (0 \le y \le L_y) \\ \infty & (y < 0 \text{ or } y > L_y) \end{cases}$
- The wave function depends on coordinates $x$ and $y$.
- The solution is obtained by combining two wave functions similar to the equation:  
    $\psi_{n_x, n_y}(x, y) = \psi_{n_x}(x)\psi_{n_y}(y)$  
    $\psi_{n_x}(x) = \begin{cases} \sqrt{\frac{2}{L_x}} \sin\left(\frac{n_x \pi x}{L_x}\right) & (0 \le x \le L_x) \\ 0 & (x < 0 \text{ or } x > L_x) \end{cases}$  
    $\psi_{n_y}(y) = \begin{cases} \sqrt{\frac{2}{L_y}} \sin\left(\frac{n_y \pi y}{L_y}\right) & (0 \le y \le L_y) \\ 0 & (y < 0 \text{ or } y > L_y) \end{cases}$
- States are characterized by two quantum numbers $n_x$ and $n_y$.
- These numbers are positive integers, independent of each other.
- The 2D wave function is a juxtaposition of perpendicular, independent stationary waves.
- A particle confined in an N-dimensional space is described by a stationary state, specified by N quantum numbers.
- Energy values:  
    $E_{n_x, n_y} = \frac{h^2}{8m} \left( \frac{n_x^2}{L_x^2} + \frac{n_y^2}{L_y^2} \right)$
- Energy levels depend on both quantum numbers.
- The ground state (lowest energy) is state $n_x = n_y = 1$.
- In some situations, two different states have the same energy (**degenerate states**).
- The electron can go from the ground state to an excited state if it absorbs energy corresponding to the difference between levels.
### 6.2 Infinite Well in Three Dimensions
- Now, consider a particle of mass $m$ confined to a 3D space in the form of a box.
- Analyze the infinite potential well: energy is zero inside and infinite outside.
- The box has length $L_x$, width $L_y$, and height $L_z$.
- To specify a 3D state, need three quantum numbers.
- Use an extra quantum number $n_z$ to indicate the mode number in the z-direction.
- Energy:  
    $E_{n_x, n_y, n_z} = \frac{h^2}{8m} \left( \frac{n_x^2}{L_x^2} + \frac{n_y^2}{L_y^2} + \frac{n_z^2}{L_z^2} \right)$
- The ground state is $n_x = n_y = n_z = 1$.
---
## 7. Finite Height Potential Wells
- The infinite potential well is a simple model, but doesn't represent reality.
- Study a particle in a finite height potential well: the well has a depth $U_0$ and a width $L$.
- Place the x-axis so $x = 0$ is at the well's center.
- The potential energy function is:  
    $U(x) = \begin{cases} 0 & (-L/2 \le x \le L/2) \\ U_0 & (x < -L/2 \text{ or } x > L/2) \end{cases}$
- The particle can have enough energy ($E > U_0$) that it isn't confined.
### 7.1 Non-Trapped Particle
- Suppose the particle has enough kinetic energy so that $E = K + U$ is greater than $U_0$.
- The particle has more kinetic energy when above the well, meaning a greater momentum and smaller wavelength.
- Since speed is greater inside, the probability of observing the particle is lower.
- Amplitude is smaller in the well.
- The solution gives an oscillating wave function in the three regions.
- The wave function and its derivative must be continuous.
- Boundary conditions don't constrain the wavelength.
- Energy isn't quantized when $E > U_0$.
- **For a non-confined particle, energy isn't quantized**.
### 7.2 Trapped Particle
- Study the situation of a particle confined to the finite height potential well.
- Occurs when $E < U_0$.
- The well is symmetric, so the wave function is either an even or odd function.
- Unlike the infinite well, the wave function can exist outside the well.
- A Schrödinger equation for $E < U_0$ for $|x| > L/2$:  
    $\frac{d^2 \psi(x)}{dx^2} = \frac{2m}{\hbar^2} (U_0 - E) \psi(x)$
- The general solution is the sum of two exponential functions:  
    $\psi(x) = C e^{-\kappa x} + D e^{\kappa x}$
- Where:
- $C, D$ = Integration constants
- $\kappa = \sqrt{\frac{2m(U_0 - E)}{\hbar}}$
- The wave function must tend toward 0 when $x \rightarrow \pm\infty$.
- $D = 0$ for $x > L/2$ and $C = 0$ for $x < -L/2$.
- The wave function outside the well is:  
    $\psi(x) = \begin{cases} C e^{-\kappa x} & (x > L/2) \\ D e^{\kappa x} & (x < -L/2) \end{cases}$
- The wave function decreases exponentially in the region $|x| > L/2$.
- The wave function $\psi(x)$ and its derivative must be continuous at $x = \pm L/2$.
- This is only possible for certain values of energy.
- There are only a few states where $E < U_0$.
- According to width $L$ and height $U_0$, there are stationary states where $E < U_0$.
- There is always at least one state, the ground state.
- Since the wave function penetrates the classically forbidden region, the wavelength is greater than in the infinite well.
- Kinetic energy is lower in the finite well.
---
## 8. Tunneling Effect
- The wave function of a particle isn't zero in a region where potential energy exceeds the value of mechanical energy.
- This behavior produces a different effect in the quantum world compared to classical physics.
- A particle has a probability of crossing a barrier, given that the wave function exists in the classically forbidden region.
- Analyze a quantum particle trapped in a potential well with barrier width $\ell$.
- The potential energy function is:  
    $U(x) = \begin{cases} U_0 & (L/2 \le |x| \le L/2 + \ell) \\ 0 & \text{elsewhere} \end{cases}$
- When the particle's energy is lower than $U_0$, the solution gives a sinusoidal wave function outside the barrier and a decreasing exponential function in the barrier:  
    $\psi(x) = \begin{cases} A\sin(kx) + B\cos(kx) & (0 \le |x| \le L/2) \\ Ce^{\kappa x} & (L/2 \le |x| \le L/2 + \ell) \\ D\sin(kx + \phi) & (|x| \ge L/2 + \ell) \end{cases}$
- Where:
    - $A, B, C, D, \phi$ = Constants
    - $k$ = Wave number ($\sqrt{2mE/\hbar}$)
    - $\kappa = \sqrt{2m(U_0 - E)/\hbar}$
- The wave function has an exponential decrease in the classically forbidden region, but there is a certain probability that the electron will cross the barrier (**tunneling effect**).
- Let $T$ be the probability of crossing the barrier (transmission coefficient).
- The probability is approximated by:  
    $T \approx \frac{\psi(L/2 + \ell)}{\psi(L/2)} = e^{-2\kappa\ell}$
- The probability is greater if the barrier isn't too wide and when $E$ is close to $U_0$.
- Since probability is an exponential function, it varies rapidly if the barrier changes.
### Scanning Tunneling Microscope (STM)
- A metal tip is placed close to the sample surface.
- Electrons cross the barrier by tunneling.
- These electrons produce an electric current.
- Current changes rapidly when the distance between the tip and sample changes.
- The computer moves the tip while keeping the tunnel current constant.
- The computer produces images from the tip's movement.
- STMs are sensitive enough to measure variations in height of 0.001 nm.
---
## 9. Spin and Exclusion Principle
- One goal of quantum mechanics is to study atoms.
- An atom is a trap in which several electrons are confined.
- A new quantum behavior appears: a new quantum number, **spin**.
- A particle's spin is described by a vector $\vec{S}$ whose modulus is:  
    $S = \sqrt{s(s + 1)}\hbar$
- Where:
    - $s$ = Spin quantum number
- Spin quantum number $s$ is a particle property.
- Particles are divided into:
- **Fermions**: Particles with half-integer spin (protons, neutrons, electrons).
- **Bosons**: Particles with integer spin.
- Vector $\vec{S}$ cannot be measured completely.
- $S_z$ is quantized:  
    $S_z = m_s \hbar$
- Where:
    - $m_s$ = Magnetic spin quantum number
- A particle with spin $s$ can have $2s + 1$ possible values of $m_s$:  
    $m_s = s, s - 1, ..., -s + 1, -s$
- For the electron ($s = 1/2$), the possible values of $m_s$ are $m_s = +1/2$ (spin up) and $m_s = -1/2$ (spin down).
- To describe an electron, give the value of the magnetic spin number $m_s$.
- The spin is a quantum property with no classical equivalent.
- Think of spin as a new physical quantity.
- Fermions are subject to a principle discovered in 1925 by Wolfgang Pauli:

> Two fermions cannot be in the same quantum state.
- **Pauli exclusion principle**: two fermions cannot have the same quantum numbers.
- When several electrons are confined in a potential well, the ground state isn't the configuration where all electrons are at the lowest level.
- Consider a 1D potential well of width $L$.
- An electron's state is specified by quantum number $n$, and energy is given by:  
    $E_n = \frac{h^2}{8mL^2}n^2$
- Configuration is specified by two quantum numbers: $n$ and $m_s$.
- According to the Pauli exclusion principle, two electrons cannot have the same values of $n$ and $m_s$.
- In the case of three trapped electrons, two electrons can be in state $E_1$: first with $n = 1, m_s = +1/2$, second with $n = 1, m_s = -1/2$.
- State $E_1$ is filled.
- The third electron can then be at level $E_2$, with $n = 2$.
- Total energy:  
    $E_{\text}