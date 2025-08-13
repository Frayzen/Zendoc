---
title: Wave-Particle Duality
Owner: Tim Pearson
---
[[Exercise]]
## 1 Notion of a Photon
- **energy** of an EM wave is qunatized, each **qaunta** of energy carries this amount of energy:
    
    $E = h f = \frac{hc}{\lambda}$
    
- a particle associated with this **qunata** of energy is a **photon** $\gamma$ with a **wave character**
- since the frequency and the length appear in  
    the expression of its energy, we speak of dual nature for $\gamma$
- The quantification of energy is manifest through the **Planck constant** whose experimental value is :$h = 6.626 \times 10 ^{-32}$
  
## 2 Black Body Radiation
- Objects emit **infrared EM waves** due to their **thermal agitation**, this is called **thermal radiation**
- An object that **completely absorbs incident light** produces a **universal spectrum**, which depends only on its temperature.
- Such an object is called a **black body** and the **Stefan-Boltzmann law:**  
    $I = \sigma T^4$
    
    where $\sigma = 5.670 \times 10 ^{-8} Wm^{-2}K^{-4}$ relates **irradience** to its **temperature**
    
- the spectrum of a **black body** at **temperature** $T$ is given bu the **spectral radiance:**
    
    $R_T^{Plank}(\lambda) = \frac{b}{\lambda ^5} \frac{1}{e^{\frac{a} {\lambda T}}}$
    
- $R_T(\lambda)$ represents the **energy emitted** per unit of time and per unit of area for a wavelength between
- It was Max Planck who made it possible to find the previous form of $R_t(\lambda)$ and to determine its parameters a and b by assuming that the energy emitted or absorbed was quantified according to the hypothesis
    
    $\Delta E_{osc} = h f$
    
- The introduction of the Planck constant $h$ leads to the expression:
    
    $R_T^{Plank}(\lambda) = \frac{8 \pi c^2 h}{\lambda ^5} \frac{1}{e^{\frac{hc} {\lambda kT} } -1}$
    
    where $k= 1.38 \times 10 ^{-23} JK^-1$ is the **Boltsmann constant**
    
    ![[image 13.png|image 13.png]]
    
- This **Planck law** correctly represents the distribution of **radiation emitted** by a black body at a temperature $T$
- By integrating $R_T(\lambda)$we find the **Stefan-Boltzmann law** and we can then express $\sigma$ as a function of the fundamental constants, i.e.
  
## 3 Photoelectric Effect
### 3.1 Phenomenon Description
- The **photoelectric effect** occurs when an **EM wave is incident on a given surface**. If its **wavelength is small** enough, **photoelectrons** can be torn off.
- Experimentally, the escaped electrons can be collected in a circuit, which generates a photoelectric current. If the incident **irradiance** then **increases** this **photoelectric current** as well.
- In order to measure the kinetic energy of the $e^-$ we apply a d.d.p $\delta V = V_{stop}$ in order to completely stop the torn off electrons, therefore:
    
    $K_{max} = eV_{stop}$
    
- The quantity $V_{stop}$ is called the **stopping potential** and $K_{max}$is the **highest kinetic** energy among the stripped electrons
- Therefore, by measuring the stopping potential, we measure the maximum kinetic energy of the ejected electrons (see course document).
  
### 3.2 Einsteins Prediction
- If we denote $\Phi$ the extraction energy of an electron belonging to the irradiated surface, then the conservation of energy requires that:$hf = \Phi + K_{max}$ then $V_{stop} = \frac{h}{e}f - \frac{\phi}{e}$
    
    where $hf$ is the energy of a photon belonging tot he incident EM wave
    
- So $V_{stop} (f)$ is a universal slope line since only $\Phi$ depends on the selected material. **Irradiance** plays no role since if it increases, the number of photons also increases, without changing the energy of each photon.
- This **contradicts** the **classical approach** where it is expected that if the **irradiance** increases, the energy given up to the electrons should increase.
- However, experience has shown that it is the quantum interpretation that is correct, accompanied by the measurement of $h$.
  
### 3.3 Photoelectric Effect Equation
- The equation for the photoelectric effect is obtained by using wavelength rather than frequency, i.e.
    
    $\frac{hc}{\lambda} = eV_{stop} \Phi$
    
- in the case $V_{stop} = 0$, then the wavelength is just sufficient to tear off an electron, this is the threshold wavelength, or
    
    $\lambda_{alone} = \frac{hc}{\Phi}$
    
- For convenience, calculations are generally simplified by expressing the energy in electron volts.
- In this system, $eV_{stop}$ is simply calculated by multiplying the stopping potential by $1e$, taking into account the fact that $1e \times 1V = 1eV$.
- The wavelength is then expressed in m and can be written $hc = 1240 eV.nm$
  
## 3 Compton Effect
- Because of the wave-particle duality, we can associate an EM wave with a photon, a particle, whose quantity of movement is
    
    $p = \frac{h}{\lambda}$
    
- it is then possible that a photon performs a **inelastic collision** with an electron (for example), we then speak of the quantity of **Compton Diffusion**
![[image 1 6.png|image 1 6.png]]
- Diagram showing the collision of a photon on an electron at rest.  
    
![[image 2 6.png|image 2 6.png]]
- Feynman diagram of Compton scattering. The "collision"  
    in fact consists of an absorption and emission of photons.
- Applying the principle of conservation of momentum we obtain the following system, namely
    
    $Ox : \frac{h}{\lambda} = \frac{h}{\lambda} \cos \theta + p_{x, \acute{e}}$
    
    $Oy : \frac{h}{\lambda} = \frac{h}{\lambda} \sin \theta + p_{y, \acute{e}}$
    
    where:
    
    - $\frac{h}{\lambda}$ is the momentum of the of the incoming photon
    - with $h$ as **Planks constant**
    - $p_{x,\acute{e}} \ or \ p_{y,\acute{e}}$ is the electrons recoil momentum that the electron gains in the x or y direction as a restult of the collsion
- the conservation of energy gives $\frac{hc}{\lambda} + E_{0, \acute{e}} = \frac{hc}{\acute{\lambda}} + E_{\acute{e}}$
- we can then determine the **Compton shift:** $\Delta \lambda = \lambda - \acute{\lambda}$, independently of the wave lanegth of the inceident photon:  
    $\Delta \lambda = \frac{h}{mc} ( 1 - \cos \theta)$
- This expression is experimentally verified during the scattering of X-rays on graphite, which indicates the quantum nature of the incident EM wave (see course document).
- From λ′, we can calculate the energy of the scattered photon, we have:
    
    $E’ = \frac{hc}{\acute{\lambda}} = \frac{hc}{\lambda \acute{\lambda}}$ or $K =\frac{hc \Delta \lambda}{\lambda ( \lambda + \Delta \lambda )}$
    
      
    
### Demonstation of the Compton Formula
FINISH
# 5 Wave-Particle Duality for Light
## 5.1 The comparison between waves and particles
- In contrast to the previous results, the interference and diffraction phenomena highlight the wave aspect of light.
![[image 3 3.png|image 3 3.png]]
- Interference occurs when two waves overlap after passing through a barrier with two slits.
- The intensity of the resulting wave of the superposition $I_2$ is different from the simple sum of the intensities of the individual waves, $I_a$ an $I_b$, thats to say $I_2 \ne I_a I_b$
- Now we carry out this same experiment using a conventional particle gun, noting $P_2$ as the probability of finding a particle at a given position on the screen located after the two slits.
![[image 4 3.png|image 4 3.png]]
- we note $P_{a,b}$ the probabilty for one particle to pass by the slot $a$ or $b$, we precisely check that $P_2 = P_a + P_b$
- This clearly shows the difference between wave and particle since only waves produce interference
  
## 5.2 Young's experiment, one photon at a time
- We repeat the experiment with EM waves by reducing  
    the irradiance and using a sensor on the screen capable of detecting one photon at a time as well as its position
- Over a sufficiently long time, we see an interference  
    pattern forming, indicating that the photon is not just a particle...
![[image 5 3.png|image 5 3.png]]
- In order to take into account the wave and corpuscular nature of the photon, we introduce the concept of probability wave.
- Indeed, the photon has a greater probability of appearing at the locations where the irradiance is highest, and vice versa.
- Given that the irradiance of light is proportional to the  
    square of the amplitude of the wave, we affirm the following principle.

> [!important] Light behaves like a wave and like a set of particles. The probability of observing a photon is proportional to the square of the amplitude of the wave.
- An EM wave is therefore neither a wave nor a particle, this is what we call wave-particle duality.
# 6 Matter Waves
- In 1924, Louis de Broglie extended the concept of wave-particle duality by postulating that the set of verified particles
    
    $\lambda = \frac{h}{p}$ or $\lambda = \frac{h}{mv}$
    
- This was verified by several experiments, starting in 1927, by studying in particular the reflection of electrons by a nickel surface
- Since then, diffraction and interference have been produced from neutrons, atoms and even molecules.
- Experiments similar to that of Young's slits, seen previously, have been carried out, notably with electrons.
- As a result, Louis de Broglie obtained, at the age of 37, the Nobel Prize in physics in 1929 for "his discovery of the wave nature of electrons".
  
# 7 The Uncertainty Principle
- When we try to measure the position of a wave, it is not well defined because the wave is spread out in space. On the other hand, its wavelength $\lambda$ is well defined and measured.
- We can also produce a localized pulse, at $x_0$ for example, moving at speed $\overrightarrow{v}$. Its position is well defined unlike its wavelength
![[image 6 3.png|image 6 3.png]]
![[image 7 3.png|image 7 3.png]]
- It is possible to obtain an intermediate case, where the wave is fairly well localized, with a relatively well-known wavelength.
- We obtain a wave packet whose position is $x = x_0 \pm \Delta x$, where $\Delta x$ is the uncertainty on the position.
- A wave packet corresponds to the superposition of several sinusoidal waves, whose wavelength varies between $\lambda _ 0 - \Delta \lambda$ and $\lambda_0 + \Delta \lambda$.
- To obtain a wave packet with a small uncertainty ∆x on the position, it is necessary to superpose waves with a very large wavelength interval ∆λ.
- if on the contrary the wavelength interval ∆λ is small, the uncertainty on the position ∆x is greater.
- The previous situation is a general result that applies to any type of wave by virtue of de Broglie’s postulate on wave-particle duality and the universal relation p = h/λ
- This implies that an uncertainty on the wavelength produces an uncertainty on the momentum.
- Let ∆x be the uncertainty on the position and $\Delta p_x$ the uncertainty on the x component of the momentum.
- The previous argument implies that the more precisely he position is measured, the more uncertain the momentum is
- In formal terms, this is summarized by the uncertainty relation: $\Delta x \Delta p_x \ge \frac{\vec{h}}{2}$
- we have defined the reduced Plancks constant:
    
    $\vec{h} = \frac{h}{2 \pi} = 1.055 \times 10^{34}$J.s