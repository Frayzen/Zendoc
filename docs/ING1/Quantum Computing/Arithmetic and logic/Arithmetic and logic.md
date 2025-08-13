---
title: Arithmetic and logic
Owner: Matcha
---
![[Cours_Informatique_Quantique_2024____avec_references_vers_exos_compressed-65-97.pdf]]
# Increment and Decrement : $a$++ / $b$++
![[Untitled 78.png|Untitled 78.png]]
  
A simple way to implement an **increment** operation is to use a series of quantum gates that perform a bit-wise addition with a carry :
1. Start from the least significant bit (LSB) and move to the most significant bit (MSB).
2. Use a series of CNOT gates to flip each bit, taking into account the carry from the previous bit.
  
The **decrement** operation is the **increment** with its constituents **operations swapped**.
### Increment graphical representation
Before
![[Untitled 1 53.png|Untitled 1 53.png]]
After
![[Untitled 2 39.png|Untitled 2 39.png]]
  
# Add an integer : $a+n$
![[Untitled 3 30.png|Untitled 3 30.png]]
Here, the input values of $|1\rangle$ and $|5\rangle$ will become $|13\rangle$ and $|1\rangle$, since this programm will wrap on overflow.
![[Untitled 4 24.png|Untitled 4 24.png]]
  
# Add two Quantum integers : $a+b$
Supposing we have two QPU registers $a$ and $b$ and we want to store $a +b$ in a new register $c$ (analogous to the CPU + operation), we would have a problem since this approach **violates** both the **reversibility** and the **non-copying restrictions** of QPU logic!
- Reversibility is violated by $c=a+b$ because the previous content of $c$ is lost
  
So we prefer to do the operation $a$+=$b$
![[Untitled 5 17.png|Untitled 5 17.png]]
### Apply CNOT
- CNOT gates are applied between corresponding qubits of $a$ and $b$.
- This performs the **bitwise XOR operation**: $a_i=a_i\ \otimes\ b_i$ for each bit $i$.
This step ensures that the $a$ register qubits now contain the result of the bitwise XOR of the original $a$ and $b$ qubits.
### **Apply Toffoli (CCNOT) Gates:**
- Toffoli gates are used to handle the **carry bits**.
- A Toffoli gate takes two control qubits and one target qubit. It flips the target qubit if both control qubits are in state $|1\rangle$.
- This step effectively propagates the carry through the addition process, ensuring that the correct sum is obtained when there are carry bits to consider.
- For each bit $i$, the Toffoli gate ensures that if both $a_1$ and $b_i$ are 1, the carry bit is added to the next higher bit position $i+1$.
  
# Negation : $-a$
![[Untitled 6 13.png|Untitled 6 13.png]]
- **Apply NOT Gates to All Qubits:** This operation flips all the bits, effectively computing the bitwise NOT of the integer.
- **Add 1 to the Result:** After flipping all the bits, you need to add 1 to the resulting integer to complete the two's complement operation, which gives you the negative of the original integer.
  
## Example
![[Untitled 7 11.png|Untitled 7 11.png]]