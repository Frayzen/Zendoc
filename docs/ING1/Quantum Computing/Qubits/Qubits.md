---
Owner: Matcha
---
![[Cours_Informatique_Quantique_2024____avec_references_vers_exos_compressed-1-64.pdf]]
  
## Conventional bits
They have either a value of 0 or 1
![[Untitled 77.png|Untitled 77.png]]
Usage of photon as a conventional bit
![[Untitled 1 52.png|Untitled 1 52.png]]
  
A qubit utilizes quantum superposition, enabling it to exist in a combination of states $|0\rangle$ and $|1\rangle$ at the same time, thanks to the principles of quantum mechanics.
![[Untitled 2 38.png|Untitled 2 38.png]]
Simple implementation of one photonic qubit
  
# Possible value of a qubit
The state of a qubit can be described by a **linear combination of its basis states,** $|0\rangle$ **and** $|1\rangle$. Mathematically, a qubit's state $|\psi \rangle$ can be represented as:
$|\psi \rangle =\alpha | 0\rangle + \beta |1\rangle$
where $\alpha$ and $\beta$ are complex numbers that satisfy the normalization condition:
$⁍$
**Probability of reading 0 :** $|\alpha |^2$
**Probability of reading 1:** $|\beta |^2$
# Graphical circular representation
![[59253b34-d9d8-4899-8444-8e4691870bf6.png]]
_Probability of the value 1 for different superpositions_
![[Untitled 3 29.png|Untitled 3 29.png]]
_Example of relative phases in a single qubits_
# Phase
We can write $\alpha$ and $\beta$ as below, where $\theta_\alpha$ and $\theta_\beta$ are the phases of $\alpha$ and $\beta$ respectivly.
$\alpha = |\alpha|e^{i\theta_\alpha },\ \theta_\alpha=arg(\alpha)$
$\beta = |\beta|e^{i\theta_\beta},\ \theta_\beta = arg(\beta)$
## Relative phase
The relative phase between the components $\alpha$ and $\beta$ is the difference between their individual phases:
$\phi=\theta_\beta - \theta_\alpha= arg(\beta)-arg(\alpha)$
Only **relative rotation matter** in circular rotation. These two states are **equivalent** because the relative phase of the two circles is the same in each one.
![[Untitled 4 23.png|Untitled 4 23.png]]
### Example calculation
Consider a qubit in the state where $\alpha = \frac{1}{\sqrt{2}},\ \beta=\frac{e^{i\pi/4}}{\sqrt{2}}$ :
$⁍$
Phase of $\alpha$ and $\beta$ :
$\alpha = \frac{1}{\sqrt{2}} \rightarrow \theta_\alpha=arg(\frac{1}{\sqrt2})= 0  
\\\beta=\frac{e^{i\pi/4}}{\sqrt{2}}\rightarrow \theta_\beta=arg(\frac{e^{i\pi/4}}{\sqrt{2}})=\frac{\pi}{4}$
Relative phase :
$\phi=\theta_\beta-\theta_\alpha=\frac{\pi}{4}$