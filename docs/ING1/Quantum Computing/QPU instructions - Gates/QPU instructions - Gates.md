---
Owner: Matcha
---
# Single qubit
## NOT or Pauli’s gate
Fundamental quantum gate that performs the quantum analog of the classical NOT operation. It flips the state of a qubit, exchanging $|0\rangle$ and $|1\rangle$.
![[Untitled 75.png|Untitled 75.png]]
In quantum computing, this operation is represented mathematically by the following transformation:
$X=\begin{bmatrix}  
0 & 1 \\  
1 & 0  
\end{bmatrix}$
### Graphic representation
![[Untitled 1 50.png|Untitled 1 50.png]]
## HAD (Hadamard)
It creates superposition by transforming between the basis states $|0\rangle$ and $|1\rangle$.
![[Untitled 2 37.png|Untitled 2 37.png]]
In mathematical terms, the Hadamard gate is represented by the following transformation:
$H=\frac{1}{\sqrt2}\begin{bmatrix}  
1 & 1 \\  
1 & -1  
\end{bmatrix}$
### Pure state
![[3e1f1ecd-2677-4788-bdff-32d3bac77751.png]]
$H|0\rangle = \frac{1}{\sqrt2}(|0\rangle+|1\rangle)$
So, applying the Hadamard gate creates an equal superposition of $|0\rangle$ and $|1\rangle$.
![[Untitled 3 28.png|Untitled 3 28.png]]
$H|1\rangle = \frac{1}{\sqrt2}(|0\rangle-|1\rangle)$
Here, the Hadamard gate creates an equal superposition, but with a relative phase of $180^\circ$between $|0\rangle$ and $|1\rangle$.
## READ
Process of measuring a qubit, which collapses its state to either $|0\rangle$ and $|1\rangle$. It is unic in being the only part of the QPU’s instruction set that potentially returns a random result.
The readout process is represented by a projection operator onto the computational basis states.
![[Untitled 4 22.png|Untitled 4 22.png]]
For a single qubit, the projection operators are:
- Projection onto $|0\rangle: |0\rangle \langle0|$
- Projection onto $|1\rangle: |1\rangle \langle1|$
## WRITE
It allows us to initialize a QPU register before we operate on it. It is a deterministic process.
### Graphic representation
![[Untitled 5 16.png|Untitled 5 16.png]]
## PHASE($\theta$)
This instruction allows us to directly change the relative phase of a qubit.
![[Untitled 6 12.png|Untitled 6 12.png]]
It takes an additional (numerical) input parameter → the angle to rotate by $\theta$.
$\alpha |0\rangle+\beta|1\rangle\Rightarrow \alpha|0\rangle+e^{j\theta}\beta |1\rangle$
### Graphic representation
It simply rotates the circle associated with $|1\rangle$ by the specified angle
![[Untitled 7 10.png|Untitled 7 10.png]]
### 3D visual
![[Untitled 8 9.png|Untitled 8 9.png]]
  
  
## ROOT-of-NOT
Mathematically, it is defined as a unitary operation whose square is the Pauli-X gate: $(\sqrt X)^2=X$
![[Untitled 9 7.png|Untitled 9 7.png]]
A possible matrix representation of the gate is:
$\sqrt X =\frac{1}{2}\begin{bmatrix}  
1+i & 1-i \\  
1-i & 1+i  
\end{bmatrix}$
### Graphic representation
![[Untitled 10 6.png|Untitled 10 6.png]]
## SWAP
Swaps the states of two qubits.
![[Untitled 11 6.png|Untitled 11 6.png]]
If qubit $A$ is in state $|a\rangle$ and qubit B is in state $|b\rangle$, after applying the SWAP gate, qubit A will be in state $|b\rangle$ and qubit $B$ will be in state $|a\rangle$
  
### Graphic representation
![[Untitled 12 6.png|Untitled 12 6.png]]
  
### Generating a perfectly random bit with a QPU
![[Untitled 13 6.png|Untitled 13 6.png]]
```C++
qc.reset(1); // allocate one qubit
qc.write(0); // write the value zero
qc.had();    // place it onto superposition of 0 and 1
var result = qc.read(); // read the result as a digital bit
```
- Generating one random **byte**
    
    ![[Untitled 14 3.png|Untitled 14 3.png]]
    
  
## Equivalences
![[Untitled 15 3.png|Untitled 15 3.png]]
![[Untitled 16 3.png|Untitled 16 3.png]]
![[Untitled 17 2.png|Untitled 17 2.png]]
![[Untitled 18 2.png|Untitled 18 2.png]]
  
  
# Multiple qubits
## Circle representation
![[Untitled 19 2.png|Untitled 19 2.png]]
![[Untitled 20 2.png|Untitled 20 2.png]]
Here, you have 100% of chances to have 0 as the first bit of the byte. Each qubit represents a bit.
![[Untitled 21 2.png|Untitled 21 2.png]]
In this case, there is no way to write down circle representations for the individual qubits! Notice that reading out the three qubits always results in us finding them to have the same values (with 50% probability that the value will be 0 and 50% probability it will be 1.
### One qubytes
![[Untitled 22 2.png|Untitled 22 2.png]]
  
## NOT
It swaps values in each of the qubit’s operator pairs.
### Graphic representation
![[Untitled 23 2.png|Untitled 23 2.png]]
### 1rst row
![[Untitled 24 2.png|Untitled 24 2.png]]
### 2nd row
![[35e59b2f-c17d-4f62-81b9-06358dc2f22b.png]]
### 3rd row
![[Untitled 25 2.png|Untitled 25 2.png]]
## PHASE($\theta$)
The PHASE($\theta$) operation applied to a specific qubit will only affect that qubit's state within the overall tensor product of the qubits' states.
### Graphic representation
![[Untitled 26 2.png|Untitled 26 2.png]]
### 1rst row
![[Untitled 27 2.png|Untitled 27 2.png]]
### 2nd row
![[Untitled 28 2.png|Untitled 28 2.png]]
### 3rd row
![[Untitled 29 2.png|Untitled 29 2.png]]
  
## READ
When measuring multiple qubits in a system, the measurement collapses the qubits into one of the possible states corresponding to the measurement outcomes. The overall quantum state is then renormalized to ensure the total probability is $1$. Each possible outcome for the measured qubits has a probability determined by the amplitudes of the states that correspond to that outcome.
### Graphic representation
![[Untitled 30 2.png|Untitled 30 2.png]]
When we read the unit bit :
- Either we get $0\Rightarrow 00=|0\rangle$ and $10=|2\rangle$
- Either we get $1\Rightarrow 01=|1\rangle$ and $11=|3\rangle$
The energies are then renormalized so that their sum equals 1.
## CNOT
The CNOT gate has two qubits:
- **Control qubit**: Determines whether the NOT operation (bit flip) is applied to the target qubit.
- **Target qubit**: The qubit that is flipped if the control qubit is in state $|1\rangle$.
![[Untitled 31 2.png|Untitled 31 2.png]]
The operation of the CNOT gate can be described as follows:
- If the control qubit is $|0\rangle$, the target qubit remains unchanged.
- If the control qubit is $|1\rangle$, the target qubit is flipped ($|0\rangle \leftrightarrow |1\rangle$).
### Graphic representation
![[Untitled 32 2.png|Untitled 32 2.png]]
### Example - Bell pair circuit
![[Untitled 33 2.png|Untitled 33 2.png]]
![[Untitled 34 2.png|Untitled 34 2.png]]
![[Untitled 35 2.png|Untitled 35 2.png]]
![[Untitled 36 2.png|Untitled 36 2.png]]
## CPHASE and CZ
The CPHASE gate applies a phase shift (a change in the relative phase) to the target qubit, but only if the control qubit is in the state $|1\rangle$.
Same as the CNOT but with PHASE
![[d23da678-d914-4a44-aca7-222950c9b2db.png]]
If the control qubit is in the state $|1\rangle$, a phase shift is applied to the target qubit. This phase shift doesn't change the state of the target qubit in terms of probabilities (it doesn't change from $|0\rangle$ to $|1\rangle$ or vice versa), but it changes the relative phase, which can affect interference and subsequent quantum operations.
### Graphic representation
![[Untitled 37 2.png|Untitled 37 2.png]]
### Equivalence
![[Untitled 38 2.png|Untitled 38 2.png]]
## CCNOT (Toffoli)
Three-qubit gate that performs a conditional NOT operation on the target qubit based on the states of two control qubits.
![[Untitled 39 2.png|Untitled 39 2.png]]
**Control Qubits**: There are two control qubits (let’s call them _C_1 and _C_2).
**Target Qubit**: There is one target qubit (let’s call it _T_).
The Toffoli gate works as follows:
- If both control qubits _C_1 and _C_2 are in the state $|0\rangle$ or one of them is in the state $|1\rangle$, the target qubit _T_ remains unchanged.
- If both control qubits _C_1 and _C_2 are in the state $|1\rangle$, the target qubit _T_ is flipped (i.e., $|0\rangle$ becomes $|1\rangle$ and $|1\rangle$ becomes $|0\rangle$).
### Graphic representation
![[Untitled 40 2.png|Untitled 40 2.png]]
![[Untitled 41 2.png|Untitled 41 2.png]]
## CSWAP
Conditionally swaps the states of two target qubits based on the state of a control qubit.
![[Untitled 42 2.png|Untitled 42 2.png]]
The CSWAP gate operates on three qubits: one control qubit and two target qubits.
The CSWAP gate swaps the states of the two target qubits only if the control qubit is in the state $|1\rangle$.
### Graphic representation
![[Untitled 43 2.png|Untitled 43 2.png]]