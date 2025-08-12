---
title: "QPU instructions - Gates"
---
Last edited time: April 1, 2025 7:14 PM

# Single qubit

## NOT or Pauli’s gate

Fundamental quantum gate that performs the quantum analog of the classical NOT operation. It flips the state of a qubit, exchanging $|0\rangle$ and $|1\rangle$. 

![Untitled](QPU%20instructions%20-%20Gates/Untitled.png)

In quantum computing, this operation is represented mathematically by the following transformation:

$$
X=\begin{bmatrix}
0 & 1 \\
1 & 0 
\end{bmatrix}
$$

### Graphic representation

![Untitled](QPU%20instructions%20-%20Gates/Untitled%201.png)

## HAD (Hadamard)

It creates superposition by transforming between the basis states $|0\rangle$ and $|1\rangle$.

![Untitled](QPU%20instructions%20-%20Gates/Untitled%202.png)

In mathematical terms, the Hadamard gate is represented by the following transformation:

$$
H=\frac{1}{\sqrt2}\begin{bmatrix}
1 & 1 \\
1 & -1 
\end{bmatrix}
$$

### Pure state

![Untitled](QPU%20instructions%20-%20Gates/3e1f1ecd-2677-4788-bdff-32d3bac77751.png)

$$
H|0\rangle = \frac{1}{\sqrt2}(|0\rangle+|1\rangle)
$$

So, applying the Hadamard gate creates an equal superposition of $|0\rangle$ and $|1\rangle$.

![Untitled](QPU%20instructions%20-%20Gates/Untitled%203.png)

$$
H|1\rangle = \frac{1}{\sqrt2}(|0\rangle-|1\rangle)
$$

Here, the Hadamard gate creates an equal superposition, but with a relative phase of $180^\circ$between $|0\rangle$ and $|1\rangle$.

## READ

Process of measuring a qubit, which collapses its state to either $|0\rangle$ and $|1\rangle$. It is unic in being the only part of the QPU’s instruction set that potentially returns a random result.

The readout process is represented by a projection operator onto the computational basis states. 

![Untitled](QPU%20instructions%20-%20Gates/Untitled%204.png)

For a single qubit, the projection operators are: 

- Projection onto $|0\rangle: |0\rangle \langle0|$
- Projection onto $|1\rangle: |1\rangle \langle1|$

## WRITE

It allows us to initialize a QPU register before we operate on it. It is a deterministic process.

### Graphic representation

![Untitled](QPU%20instructions%20-%20Gates/Untitled%205.png)

## PHASE($\theta$)

This instruction allows us to directly change the relative phase of a qubit.

![Untitled](QPU%20instructions%20-%20Gates/Untitled%206.png)

It takes an additional (numerical) input parameter → the angle to rotate by $\theta$.

$$
\alpha |0\rangle+\beta|1\rangle\Rightarrow  \alpha|0\rangle+e^{j\theta}\beta |1\rangle
$$

### Graphic representation

It simply rotates the circle associated with $|1\rangle$ by the specified angle

![Untitled](QPU%20instructions%20-%20Gates/Untitled%207.png)

### 3D visual

![Untitled](QPU%20instructions%20-%20Gates/Untitled%208.png)

## ROOT-of-NOT

Mathematically, it is defined as a unitary operation whose square is the Pauli-X gate: $(\sqrt X)^2=X$

![Untitled](QPU%20instructions%20-%20Gates/Untitled%209.png)

A possible matrix representation of the gate is:

$$
\sqrt X =\frac{1}{2}\begin{bmatrix}
1+i & 1-i \\
1-i & 1+i 
\end{bmatrix}
$$

### Graphic representation

![Untitled](QPU%20instructions%20-%20Gates/Untitled%2010.png)

## SWAP

Swaps the states of two qubits.

![Untitled](QPU%20instructions%20-%20Gates/Untitled%2011.png)

If qubit $A$ is in state $|a\rangle$ and qubit B is in state $|b\rangle$, after applying the SWAP gate, qubit A will be in state $|b\rangle$ and qubit $B$ will be in state $|a\rangle$

### Graphic representation

![Untitled](QPU%20instructions%20-%20Gates/Untitled%2012.png)

### Generating a perfectly random bit with a QPU

![Untitled](QPU%20instructions%20-%20Gates/Untitled%2013.png)

```cpp
qc.reset(1); // allocate one qubit
qc.write(0); // write the value zero
qc.had();    // place it onto superposition of 0 and 1
var result = qc.read(); // read the result as a digital bit
```

- Generating one random **byte**
    
    ![Untitled](QPU%20instructions%20-%20Gates/Untitled%2014.png)
    

## Equivalences

![Untitled](QPU%20instructions%20-%20Gates/Untitled%2015.png)

![Untitled](QPU%20instructions%20-%20Gates/Untitled%2016.png)

![Untitled](QPU%20instructions%20-%20Gates/Untitled%2017.png)

![Untitled](QPU%20instructions%20-%20Gates/Untitled%2018.png)

# Multiple qubits

## Circle representation

![Untitled](QPU%20instructions%20-%20Gates/Untitled%2019.png)

![Untitled](QPU%20instructions%20-%20Gates/Untitled%2020.png)

Here, you have 100% of chances to have 0 as the first bit of the byte. Each qubit represents a bit.

![Untitled](QPU%20instructions%20-%20Gates/Untitled%2021.png)

In this case, there is no way to write down circle representations for the individual qubits! Notice that reading out the three qubits always results in us finding them to have the same values (with 50% probability that the value will be 0 and 50% probability it will be 1.

### One qubytes

![Untitled](QPU%20instructions%20-%20Gates/Untitled%2022.png)

## NOT

It swaps values in each of the qubit’s operator pairs. 

### Graphic representation

![Untitled](QPU%20instructions%20-%20Gates/Untitled%2023.png)

### 1rst row

![Untitled](QPU%20instructions%20-%20Gates/Untitled%2024.png)

### 2nd row

![Untitled](QPU%20instructions%20-%20Gates/35e59b2f-c17d-4f62-81b9-06358dc2f22b.png)

### 3rd row

![Untitled](QPU%20instructions%20-%20Gates/Untitled%2025.png)

## PHASE($\theta$)

The PHASE($\theta$) operation applied to a specific qubit will only affect that qubit's state within the overall tensor product of the qubits' states.

### Graphic representation

![Untitled](QPU%20instructions%20-%20Gates/Untitled%2026.png)

### 1rst row

![Untitled](QPU%20instructions%20-%20Gates/Untitled%2027.png)

### 2nd row

![Untitled](QPU%20instructions%20-%20Gates/Untitled%2028.png)

### 3rd row

![Untitled](QPU%20instructions%20-%20Gates/Untitled%2029.png)

## READ

When measuring multiple qubits in a system, the measurement collapses the qubits into one of the possible states corresponding to the measurement outcomes. The overall quantum state is then renormalized to ensure the total probability is $1$. Each possible outcome for the measured qubits has a probability determined by the amplitudes of the states that correspond to that outcome.

### Graphic representation

![Untitled](QPU%20instructions%20-%20Gates/Untitled%2030.png)

When we read the unit bit :

- Either we get $0\Rightarrow 00=|0\rangle$ and $10=|2\rangle$
- Either we get $1\Rightarrow 01=|1\rangle$ and $11=|3\rangle$

The energies are then renormalized so that their sum equals 1.

## CNOT

The CNOT gate has two qubits:

- **Control qubit**: Determines whether the NOT operation (bit flip) is applied to the target qubit.
- **Target qubit**: The qubit that is flipped if the control qubit is in state $|1\rangle$.

![Untitled](QPU%20instructions%20-%20Gates/Untitled%2031.png)

The operation of the CNOT gate can be described as follows:

- If the control qubit is $|0\rangle$, the target qubit remains unchanged.
- If the control qubit is $|1\rangle$, the target qubit is flipped ($|0\rangle \leftrightarrow |1\rangle$).

### Graphic representation

![Untitled](QPU%20instructions%20-%20Gates/Untitled%2032.png)

### Example - Bell pair circuit

![Untitled](QPU%20instructions%20-%20Gates/Untitled%2033.png)

![Untitled](QPU%20instructions%20-%20Gates/Untitled%2034.png)

![Untitled](QPU%20instructions%20-%20Gates/Untitled%2035.png)

![Untitled](QPU%20instructions%20-%20Gates/Untitled%2036.png)

## CPHASE and CZ

The CPHASE gate applies a phase shift (a change in the relative phase) to the target qubit, but only if the control qubit is in the state $|1\rangle$.

Same as the CNOT but with PHASE

![Untitled](QPU%20instructions%20-%20Gates/d23da678-d914-4a44-aca7-222950c9b2db.png)

If the control qubit is in the state $|1\rangle$, a phase shift is applied to the target qubit. This phase shift doesn't change the state of the target qubit in terms of probabilities (it doesn't change from $|0\rangle$ to $|1\rangle$ or vice versa), but it changes the relative phase, which can affect interference and subsequent quantum operations.

### Graphic representation

![Untitled](QPU%20instructions%20-%20Gates/Untitled%2037.png)

### Equivalence

![Untitled](QPU%20instructions%20-%20Gates/Untitled%2038.png)

## CCNOT (Toffoli)

Three-qubit gate that performs a conditional NOT operation on the target qubit based on the states of two control qubits.

![Untitled](QPU%20instructions%20-%20Gates/Untitled%2039.png)

**Control Qubits**: There are two control qubits (let’s call them *C*1 and *C*2).

**Target Qubit**: There is one target qubit (let’s call it *T*).

The Toffoli gate works as follows:

- If both control qubits *C*1 and *C*2 are in the state $|0\rangle$ or one of them is in the state $|1\rangle$, the target qubit *T* remains unchanged.
- If both control qubits *C*1 and *C*2 are in the state $|1\rangle$, the target qubit *T* is flipped (i.e., $|0\rangle$ becomes $|1\rangle$ and $|1\rangle$ becomes $|0\rangle$).

### Graphic representation

![Untitled](QPU%20instructions%20-%20Gates/Untitled%2040.png)

![Untitled](QPU%20instructions%20-%20Gates/Untitled%2041.png)

## CSWAP

Conditionally swaps the states of two target qubits based on the state of a control qubit.

![Untitled](QPU%20instructions%20-%20Gates/Untitled%2042.png)

The CSWAP gate operates on three qubits: one control qubit and two target qubits.

The CSWAP gate swaps the states of the two target qubits only if the control qubit is in the state $|1\rangle$.

### Graphic representation

![Untitled](QPU%20instructions%20-%20Gates/Untitled%2043.png)
