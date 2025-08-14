---
title: Quantum Report
Owner: Tim Pearson
---
## Exercise 1
|   |   |   |   |   |   |
|---|---|---|---|---|---|
|x1|x0|y3|y2|y1|y0|
|0|0|0|1|0|0|
|0|1|0|1|1|1|
|1|0|1|0|1|0|
|1|1|1|1|0|1|
|||!(!x0 and x1)|x1|x0 XOR x1|x0|
```Python
qc.reset(6);
var x = qint.new(2, 'x');
var y = qint.new(4, 'y');
x.write(0);
y.write(0);
x.had();
qc.not(0x4, 0x1);
qc.not(0x8, 0x1);
qc.not(0x8, 0x2);
qc.not(0x20, 0x2);
qc.not(0x1|0x10);
qc.not(0x10, 0x1|0x2);
```
![[Untitled 73.png|Untitled 73.png]]

  
## Exercise 2
To detect an eavesdropper on a quantum transmission line, Alice and Bob use a protocol involving classical bits and Hadamard transformations. Alice sends the bit and chooses bit $A_2$ to determine the polarization of the qubit, modifying it if $A_2$ = 1. Bob recieves the qubit and applies a Hadamar based on his bit $B_2$. Then, $A_2$ and $B_2$ can be compared.
Without the Spy:
key: white = 100%, ==yellow = 50%,== ==red = 0%==
|$A_1$ \ $A_2,\ B_2$|$0,\ 0$|$0,\ 1$|$1,\ 0$|$1,\ 1$|
|---|---|---|---|---|
|$0$|$\|0\rangle$|==$\|0\rangle+\|1\rangle$==|==$\|0\rangle+\|1\rangle$==|$\|0\rangle$|
|$1$|$\|1\rangle$|==$\|0\rangle-\|1\rangle$==|==$\|0\rangle-\|1\rangle$==|$\|1\rangle$|
We can see that Bob has a 75% of finding the value for $A_1.$ Furthermore, he has a a 100% chance of finding the value for $A_1$ given that $A_2 = B_2$
With the Spy:
|   |   |   |   |   |
|---|---|---|---|---|
|$A_1$ \ $A_2,\ B_2$|$0,\ 0$|$0,\ 1$|$1,\ 0$|$1,\ 1$|
|$0$|==$\|0\rangle+\|1\rangle$==|==$\|1\rangle$==|==$\|0\rangle-\|1\rangle$==|==$\|1\rangle$==|
|$1$|==$\|0\rangle-\|1\rangle$==|$\|1\rangle$|==$\|0\rangle-\|1\rangle$==|$\|1\rangle$|
Here we see that Bob has an overall 50% chance of finding $A_1$correctly. Furthermore, he has a 0% chance when $A_1 = 0, \ B_2 = 1$.
  
We can use the case where we have certainty of getting the correct value without the spy and certainty we will have the wrong value when we do have the spy.
This leaves us with $A_1=0, \ B_2 = A_2 = 1$ as the test case as the value that Bob receives will definitely have interference if there is an spy.
  
## Exercise 3
In terms of bits, a multiple of 4 is characterized by the fact that the first two bits (the least significant bit and the second bit) are 0. Therefore, to generate a multiple of 4, it is sufficient to set these two bits to 0 and apply a Hadamard gate to all the other bits.
In quantum computing, the representation of a number on nnn qubits allows encoding integers from $0$ to $2^n - 1$. In the case of 5 qubits, we can represent numbers from $0$ to $2^5 - 1 = 31$.
The multiples of 4 within this range are: 0, 4, 8, 12, 16, 20, 24 and 28. The largest multiple of 4 is therefore 28. By adding 4 to 28, we get 32, which exceeds the capacity of 5 qubits. Consequently, this overflow causes the result to wrap around to 0. This phenomenon is similar to overflow in classical binary arithmetic.
  
In a binary representation, multiples of four are represented with the two least significant bits set to 0. In other words, it doesn't matter what the other bits are. Therefore, if we we are given 5 quibits, we can apply a Hadamar gate on the 3 most significant bits.
In a similar way to number represented in bits, provided n bits we can have $2^n -1$ values. In the case of 5 bits that leaves us with 31 possibile combinations. This means that we can have values of $4 \cdot k, \ k \in \{0, 1, 2, 3, 4, 5,6\}$ with 28 being the largest multiple of 4 we can achieve.
  
## Exercise 5
The purpose of phase kickback is to transfer a phase from one quantum state to another via a conditional operation. This allows the manipulation of the phase of a qubit without directly affecting its state.
The phase kickback in quantum computing occurs when the phase information of a target qubit is transferred to a control qubit through a controlled unitary gate. Let's consider a circuit with two registers of qubits: register 1 with control qubits initialized in superposition states using Hadamard gates, and register 2 with a target qubit.
  
![[Untitled 1 49.png|Untitled 1 49.png]]

In this circuit, controlled rotation gates $R_{\pi/4}$ and $R_{\pi/2}$ are applied between the qubits of register 2 and those of register 1. When a controlled rotation gate is applied, if the control qubit is in the $| 1 \rangle$state, it introduces an additional phase $\phi$ to the state of the target qubit. This phase is then "kicked back" to the control qubit, modifying its own phase.
After the application of the gates, the control qubits in register 1 remain in superposition, but with phases conditioned by the state of the target qubit. The control qubit has thus accumulated a phase based on the operations performed on the target qubit.
  
## Exercise 6
![[Untitled 2 36.png|Untitled 2 36.png]]

  
The purpose of the swap test is to find out the similarity between two quantum states. The output shows the probability that the two input states are the same.
  
Referencing the circuit above, the two input states are initialize to the two states we are trying to compare and the output initialized to $| 0 \rangle$. The output qubit will be the ancillary qubit.
Then, a Hadamar gate is applied to the output so that it is in the super position $\frac{1}{\sqrt{2}} ( | 0 \rangle + | 1 \rangle )$.
The control swap gate is applied to the two input states controlled by the ancillary (output) qubit. If the ancillary quibit is $| 1 \rangle$, the states of the two input qubits are swapped, else nothing happens.
Another hadamar gate is applied to the ancillary bit
### Initialization
$|\psi_1\rangle \quad \text{(input1 state)} \\  
|\psi_2\rangle \quad \text{(input2 state)} \\  
|0\rangle \quad \text{(ancillary qubit initial state)}$
### First Hadamar Gate
$\frac{1}{\sqrt{2}}(|0\rangle + |1\rangle)|\psi_1\rangle|\psi_2\rangle$
### Controlled SWAP operation
$\frac{1}{\sqrt{2}}(|0\rangle|\psi_1\rangle|\psi_2\rangle + |1\rangle|\psi_2\rangle|\psi_1\rangle)$
### Second Hadamar gate on the ancillary qubit
$\frac{1}{\sqrt{2}} \left( \frac{1}{\sqrt{2}}(|0\rangle + |1\rangle)|\psi_1\rangle|\psi_2\rangle + \frac{1}{\sqrt{2}}(|0\rangle - |1\rangle)|\psi_2\rangle|\psi_1\rangle \right) \\  
\frac{1}{2} \left( |0\rangle(|\psi_1\rangle|\psi_2\rangle + |\psi_2\rangle|\psi_1\rangle) + |1\rangle(|\psi_1\rangle|\psi_2\rangle - |\psi_2\rangle|\psi_1\rangle) \right)$
### Apply NOT Gate to Ancillary
$X \left( \frac{1}{2} \left( |0\rangle(|\psi_1\rangle|\psi_2\rangle + |\psi_2\rangle|\psi_1\rangle) + |1\rangle(|\psi_1\rangle|\psi_2\rangle - |\psi_2\rangle|\psi_1\rangle) \right) \right) = \\  
\frac{1}{2} \left( |1\rangle(|\psi_1\rangle|\psi_2\rangle + |\psi_2\rangle|\psi_1\rangle) + |0\rangle(|\psi_1\rangle|\psi_2\rangle - |\psi_2\rangle|\psi_1\rangle) \right)$
### Measurement
if $\psi_1 = \psi_2$, then we can be 100 % sure that the output will be $| 1 \rangle$
if $\psi_1 = | 0 \rangle, \psi_2 = | 1 \rangle$, then there is a 50% chnace that we that there will be the output will be $| 0 \rangle$ and 50% chance that it will be $| 1 \rangle$.
the output in the case where the two inputs are not the same will be a measure of the overlap between the two input states.