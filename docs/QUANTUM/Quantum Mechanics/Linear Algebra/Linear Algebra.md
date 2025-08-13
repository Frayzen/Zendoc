---
title: Linear Algebra
Owner: Tim Pearson
---
[[Change of Basis]]
[[QUANTUM/Quantum Mechanics/Linear Algebra/Definitions/Definitions|Definitions]]
# 1 Introduction
## 1.1 Qubits
- A **qubit** is mathematically represented by a **linear combination**, or **superposition**, (where$( \alpha, \beta \in \mathbb{C}^2 )$:$|\psi\rangle = \alpha |0\rangle + \beta |1\rangle$  
    
- The state $|\psi\rangle$ of the qubit, corresponding to a **physical system** (photon, electron, ...), is **normalized**, meaning that $|\alpha|^2 + |\beta|^2 = 1$ .
    
    The quantities $|\alpha|^2$ and $|\beta|^2$ can be interpreted as **probabilities**.
    
- There is another **parametrization** of the state $|\psi\rangle$ , for example, using ($\theta, \varphi, \gamma \in \mathbb{R})$:
    
    $|\psi\rangle = e^{i\gamma} \left( \cos\frac{\theta}{2} |0\rangle + e^{i\varphi} \sin\frac{\theta}{2} |1\rangle \right)$  
    
- Only the **magnitude** of $|\psi\rangle$ matters physically, so the factor $e^{i\gamma}$ can be ignored. $|e^{i \gamma}|^2 = 1$
    
    Moreover, $\theta$ and $\varphi$ belong to the **spherical coordinates** on a **Bloch sphere** of unit radius (for a single qubit).
    
## 1.2 Multiple Qubits
- for two cubits:
$|\psi\rangle = \alpha_{00}|00\rangle + \alpha_{01}|01\rangle + \alpha_{10}|10\rangle + \alpha_{11}|11\rangle$  
where:
- $|00\rangle = [1, 0, 0, 0]^T = |0\rangle \otimes |0\rangle = [1, 0, 0, 0]^T$
- $|01\rangle = [0, 1, 0, 0]^T = |0\rangle \otimes |1\rangle = [0, 1, 0, 0]^T$
- $|10\rangle = [0, 0, 1, 0]^T = |1\rangle \otimes |0\rangle = [0, 0, 1, 0]^T$
- $|11\rangle = [0, 0, 0, 1]^T = |1\rangle \otimes |1\rangle = [0, 0, 0, 1]^T$
- we now have the rule:
    
    $\sum{x \in \{0,1\}}{|\alpha| ^2} = 1$ so $|\alpha _ x|^2$ keeps its interpretation as a probability of the qubits being in state $x$
    
### Bell State
- particular for two qubit states $\frac{|00\rangle + |11 \rangle}{\sqrt{2}}$
- [https://www.youtube.com/watch?v=jWzTMtFiG8k](https://www.youtube.com/watch?v=jWzTMtFiG8k)
## 4 Pauli Matrices
- $\sigma_0 = I = \left[ \begin{array}{cc} 1 & 0 \\ 0 & 1 \end{array} \right]$
- $\sigma_1 = \sigma_x = X = \left[ \begin{array}{cc} 0 & 1 \\ 1 & 0 \end{array} \right]$
- $\sigma_2 = \sigma_y = Y = \left[ \begin{array}{cc} 0 & -i \\ i & 0 \end{array} \right]$
- $\sigma_3 = \sigma_z = Z = \left[ \begin{array}{cc} 1 & 0 \\ 0 & -1 \end{array} \right]$
  
- they form the basis of the space of 2x2 complex matrices
- they are also
    
    - **hermitian:** $A = A^ \dag$
    - **involutive:** $A^2 = I$
    - **unitary:** $A^{\dag}A = AA^{\dag}$ = I
    
      
    
- they verify the:
    - commutation relation:
        - $\left[ \sigma_i, \sigma_j \right] = \sigma_i \sigma_j - \sigma_j \sigma_i$
        - $\left[ \sigma_i, \sigma_j \right] = 2i \epsilon_{ijk} \sigma_k$
    - anti-commutation relation:
        
        - $\left\{ \sigma_i, \sigma_j \right\} = 2 \delta_{ij} I$
        
          
        
- where:
    - $Levi-Civita = \epsilon_{ijk} = \begin{cases} 1 & \text{if (i, j, k) is an even permutation of (1, 2, 3)} \\ -1 & \text{if (i, j, k) is an odd permutation of (1, 2, 3)} \\ 0 & \text{if any two indices are the same} \end{cases}$
    - $Kronecker \ Delta = \delta_{ij} = \begin{cases} 1 & \text{if } i = j \\ 0 & \text{if } i \neq j \end{cases}$
## 5 Scalar Product
- we represent the scale product of two vectors like this:$(|v\rangle,|w\rangle)=\langle v | w \rangle$
- we say that $\langle v|$ is the conjugate transpose of $|v \rangle$
- $| v \rangle$ and $|w \rangle$ are elements of a hermitian vector space
    - (v.s complex with finite dimension)
- $| v \rangle = \left[ \begin{array}{cc} z_1 \\ z_2 \end{array} \right] \Rightarrow \langle v | = \left[ \begin{array}{rr} z_1^* \\ z_2^*\end{array} \right]^T$
- a function $(\cdot,\cdot)$ in $V \times V$ in $\mathbb{C}$ is a **scalar product** if it satisfies:
    1. **Linearity** in the second argument:$(|v\rangle, \sum_i \lambda_i |w_i\rangle) = \sum_i \lambda_i (|v\rangle, |w_i\rangle)$
    2. **Symmetry**:$(|v\rangle, |w\rangle) = (|w\rangle, |v\rangle)^*$
    3. **Non-negativity:**$(|v\rangle, |v\rangle) \geq 0 \text{ with equality if and only if } |v\rangle = 0$
- two vectors are **orthog**o**nal** if the **scalar product** is 0
- $||v \rangle ||= \sqrt{\langle v | v \rangle}$
- **unit vector / normalized** $||v \rangle || = 1$
- Let the representations of vectors in a **Hilbert** space be:  
    $|w\rangle = \sum_i w_i |i\rangle$ and $|v\rangle = \sum_j v_j |j\rangle$
- The **inner product** $\langle v|w \rangle$ is calculated as:$\langle v|w \rangle = \left( \sum_i v_i |i\rangle, \sum_j w_j |j\rangle \right) = \sum_{ij} v_i^* w_j \delta_{ij} = \sum_i v_i^* w_i$
    
    Resulting in:$[v_1^* \ldots v_n^*] [ w_1 \ldots w_n ]^T$
    
- The shorthand notation is:$\sum_{ij} = \sum_{i=1}^n \sum_{j=1}^n$
- Outer product representation:$|w\rangle \langle v|$ is a linear operator in the Hilbert space $V$ and $W$ , defined by:$(|w\rangle \langle v|)(|v'\rangle) = \langle v|v'\rangle |w\rangle$
- If $A = |w\rangle \langle v|$, then $A|v'\rangle = \alpha |w\rangle$, with $\alpha = \langle v|v'\rangle$
- Linear combinations of outer products can be written as:$\sum_i a_i |w_i\rangle \langle v_i|$
- The identity operator $I$ can be written using outer products:$I = \sum_i |i\rangle \langle i|$
- This satisfies $I|v\rangle = |v\rangle$ for all $|v\rangle \in V$
- The identity operator is also known as the closure relation, frequently used in calculations.
- For any operator $A: V \to W$, we can write:  
    $A = I_W AI_ V = \sum_{ij} |w_j\rangle \langle w_j| A |v_i\rangle \langle v_i|$
    
    Here $\langle w_j | A | v_i \rangle$ is the matrix element of $A$, with indices corresponding to the input and output bases.
    
- Another application of the closure relation is the Cauchy-Schwarz inequality, which is a geometric property of Hilbert spaces.
## 7 Adjoint and Hermitian Operators
### **Adjoint operator**
- Let $A$ be a linear operator on a Hilbert space $V$.
- In this case, its adjoint operator (or Hermitian conjugate) $A ^ \dag$ is defined by:
    
    $(|\omega \rangle, A |v \rangle) = (A ^ \dag |v \rangle, |\omega \rangle)$
    
    or equivalently:
    
    $\langle \omega|a|v \rangle^* = \langle v| A ^ \dag | \omega \rangle$
    
- the dual $\langle v |$ (bra) of the vector $|v \rangle$ (ket) can also be defined in the relation:
    
    $(A|v \rangle) ^ \dag = \langle v|A ^ \dag$
    
- the definition of the adjoint operator in **Dirac notation** provides a simple interpretation of the **matrix representation of** $A^\dag$
- swapping the indices of $\omega$ and $v$ corressponds to a the operation of **transposition**
- The symbol ***** represents the **complex conjugation** operation
### Hermitian Operator
- an operator $A$ is called an **Hermitian Operator** or **Auto-adjoint operator** if it is invariant under transposition-conjugation:
    
    $A = A ^ \dag$ or even $A = (A^*)^T$
    
- An interesting property of Hermitian operators is that their spectrum, corresponding to the set of their eigenvalues, is real.
- A special type of **self-adjoint** operator are projectors:
    
    $P \equiv \sum_{i=1} ^{k}|i\rangle \langle i |$
    
    - where $|i \rangle$ is a **orthonormal** basis.
    - This operator projects a vector from a vector space of dimension $d$ into a sub vector space of dimension $k \lt d$.
- any **projector** verifies the property: $P^2 = P$
- an operator is said to be **normal** if it verifies: $AA^\dag = A^\dag A$
- It is clear that a **Hermitian operator** is also **normal**
- The **spectral decomposition theorem** states that any **normal** operator is **diagonalizable** (see the course document).
- an operator $U$ is called **unitary** is if verifies the relation:
    
    $U^\dag U = U U ^ \dag = I$
    
- A **unitary operator** is also **normal**, so it has a **spectral decomposition**
- Geometrically, **unitary** operators **preserve** the **scalar product** between vectors. Indeed, we easily verify that:
    
    $(U|v \rangle, U | w \rangle) = \langle v| UU^\dag|w \rangle \\ = \langle v|I|w \rangle = \langle v | w \rangle$
    
- if $|v_i \rangle$ is a **orthonormal basis** then the vectors $|w_i \rangle = U|v_i \rangle$ forms also an **orthonormal basis**. we can write $U$ in the form:$U = \sum_i |w_i \rangle \langle v_i|$
- **inversely,** if $|v_i \rangle$ and $| w_i \rangle$ are any two **orthonormal basis** then the operator $U$ is thus defined as a **unitary operator**
- an operator $A$ is said to be **positive** if for all the vectors $|v \rangle$, the **scalar quantity** $(\langle v|A|v \rangle)$ **real** and **positive**
- if $(|v\rangle, A|v \rangle)$ is **strictly greater than zero** for all $|v \rangle \ne 0$ meaning $\langle v | A|v \rangle \gt 0$, then $A$ is called **positive definite**
- all **positive operators** are **hermitian**
## 8 Tensor Product
- The **tensor product** is the operation that allows **vector spaces** to be "assembled" into **larger vector spaces**.
- Physically, this allows us to construct representations of composite systems formed of several subsystems.
- if $V$ and $W$ are v.s of dimension $n\times m$, then the v.s. of $V \otimes W$ is of dimension $n \times m$
- the **elements** of $V \otimes W$ are noted $|v \rangle \otimes |w \rangle$ with $|v \rangle \in V, |w \rangle \in W$
- if $|i \rangle$ is a **basis** of $V$ and $|j \rangle$ is a **basis** of $W$ then, the set of **elements** $|i \rangle \otimes |j \rangle$ forms a **basis** of $V \otimes W$
- $| v \rangle \otimes |w \rangle \equiv |v \rangle|w \rangle \equiv |vw \rangle$
- by definition, the **tensor product** satisfies the following properties:
    1. if $z$ is an **arbit**r**ary scalar,** $|v \rangle \in V$ **and** $|w \rangle \in W$ then:
        
        $z(|v \rangle \otimes | w \rangle) = (z| v \rangle) \otimes |w \rangle = |v \rangle \otimes (z| w \rangle)$
        
    2. if $|v_1 \rangle$ and $|v_2 \rangle$ belong to $V$ and $|w \rangle$ belongs to $W$ then:
        
        $( v_1 \rangle \otimes | v_2 \rangle) \otimes |w \rangle = |v _ 1 \rangle \otimes |w \rangle + |v_2 \rangle \otimes |w \rangle$
        
    3. if $|w_1 \rangle$ and $|w_2 \rangle$ belong to $W$ and $|v \rangle$ belongs to $V$ then:
        
        $|v \rangle \otimes ( w_1 \rangle \otimes | w_2 \rangle) = |v \rangle \otimes |w_1 \rangle + |v\rangle \otimes |w_2 \rangle$
        
- we notes that, for a notation point of view, the first” operator acts on the “first” vector of the **tensor product**
- The notion of **tensor product** of two operators extends  
    obviously to the case where the operators $A : V \rightarrow V'$ and $B: W \rightarrow W'$ act between different v.s.
- in effect, for an operator $C: V \otimes W \rightarrow V' \otimes W'$ we can write:$C = \sum_ic_iA_i \otimes B_i$
- in the case, by definition, we equally have:$C(|v \rangle \otimes |w \rangle) = \left(\sum_i c_iA_i \otimes B_i \right)|v \rangle \otimes |w \rangle \equiv \sum_ic_iA_i|v\rangle \otimes B_i|w \rangle$
- the **scalar products** on the spaces $V$and $W$ can be used to define a **natural scalar product** on $V \otimes W$. We have:$\left( \sum_i a_i|v_i \rangle \otimes |w_i \rangle, \sum_j b_j |v_j' \rangle \otimes |w_j' \rangle \right) \equiv \sum _i c_iA_i|v \rangle \otimes B_o|w \rangle$
- from this we can deduces that the **hermitian space** $V \otimes W$ **inherits** from the other structure we have encountered before
- another notation: $|\psi \rangle^{\otimes k} = |\psi \rangle \otimes ... \otimes | \psi \rangle$
  
## 9 Operator Functions
- Many important functions are defined when their  
    argument is an operator or a matrix.
- In general, it is possible to define a matrix function on normal or Hermitian matrices.
- let $A = \sum_A a|a \rangle \langle a |$ a **spectral decomposition** for a **normal** operator $A$. we then define a function $f$ by
    
    $f(A) = \sum _a f(a)|a \rangle \langle a |$
    
- We can thus define, in a unique way, many useful functions such as the square root of a positive operator, the exponential, etc...
- we can, for example write this expression:
    
    $\exp(\theta Z) = \left[\begin{array}{cc} e^\theta & 0 \\ 0 & e^{-\theta}\end{array} \right]$
    
    since the **eigen vectors** of $Z$ are $|0 \rangle$ and $|1 \rangle$
    
- the **trace** of $A$ is defined as:
    
    $\mathrm{tr}(A) = \sum _i A_{ii} = \sum_i \langle i | A| i \rangle$
    
- the **trace** is **invariant** by **cyclic permutation**, its to say:
    
    $\mathrm{tr}(AB) = \mathrm{tr}(BA),\mathrm{tr}(ABC) = \mathrm{tr}(CAB), ...$
    
- also, the **trace** is a **linear function**, so:
    
    $\mathrm{tr}(A + B) = \mathrm{tr}(A) + \mathrm{tr}(B)$ and $z\mathrm{tr}(A) = \mathrm{tr}(zA)$
    
    where $A$ and $B$ are arbitrary matrices and $z$ is a complex number
    
- The **cyclicity** of the **trace** implies that a matrix is **invariant** under **unitary** similarity transformation $A \rightarrow UAU^\dag$ since we have
    
    $\mathrm{tr}(UAU^\dag) = \mathrm{tr}(U^\dag U A) = \mathrm{tr}(A)$
    
- In general, we define the **trace** of an operator $A$ as being  
    the **trace** of any matrix representation of $A$.
- The **invariance** of the **trace** under **unitary similarity** transformations  
    ensures that the **trace** of an operator is well defined.
- we also have: $\mathrm{tr}(A \otimes B) = \mathrm{tr}(A)\mathrm{tr}(B)$
- suppose that $|\psi \rangle$ a **unit vectora** and $A$ an arbitary operator
- for evaluating
    
    $\mathrm{tr}(A|\psi \rangle \langle \psi|) = \sum_i \langle i| A|\psi \rangle \langle \psi |i \rangle$
    
    then
    
    $\mathrm{tr}(A|\psi \rangle \langle \psi|) = \langle \psi | A | \psi \rangle$
    
## 10 Commutator and Anti-Commutator
- the **commutator** $[A, B] \equiv AB - BA$
- if $[A,B] = 0 \Rightarrow AB = BA$ we say that $A$ **commutes** with $B$
- the **anti-commutator** $\{A,B\} \equiv AB + BA$
- if $\{A,B\} = 0$ we say that A **anti-commutes** with $B$
- Many important properties of operator pairs can be derived from their **commutator** and **anti-commutator**.
- A fundamental result is that two **commuting Hermitian** operators can be **simultaneously diagonalized**
- to be more precise, if $[A,B]=0$, then the operators $A$ and $B$, with a common **orthonormal eigen basis** can be expressed in the form:
    
    $A = \sum_ia_i |i\rangle \langle i |$ and $B=\sum_i b_i |i \rangle \langle i |$
    
- ==**Theorem: let**== ==$A$== ==and== ==$B$== ==be== ==**hermitian**== ==operators. then== ==$[A,B] = 0$== ==if and only if there exisits an orthonormal basis such that both== ==$A$== ==and== ==$B$== ==are diagonal with respect to that basis. in the case, we say that== ==$A$== ==and== ==$B$== ==are== ==**simultaneously diagonalizable.**==
- This result links the **commutator** of two operators, often easy to calculate, to the property of being **diagonalizable simultaneously**, which is a priori quite difficult to determine.
  
### 11 Polar decomposition and Singular value decomposition
- These decompositions are useful ways to **decompose linear operators** into **simpler** operators.
- In particular, they allow to **decompose** general linear operators into **products** of **unitary operators and positive operators.**
- **Theorem: Polar Decomposition**
    
    let $A$ be a **linear operator** on v.s. $V$. Then, there exists a **unitary operator** $U$ an **positive operators** $J$ and $K$ such that $A =UJ=KU$ where the **unique positive** operators $J$ and $K$ are defined by $J \equiv \sqrt{A^*A}$
    
- we call the expression $A+UJ$ the **left polar decomposition** of $A$, and $A=KU$ the **right polar decomposition** of $A$
- **Theorem: Singular Value Decomposition**
    
    let $A$ be a **sqaure matrix.** Then, there exists **unitary** matrices $U$ and $V$, and a **diagonal** matrix $D$ with positive entries such that:$A=UDV$
    
    the **diagonal** elements of $D$ and called the **singular values** of $A$
    
    - This theorem actually combines the **polar decomposition theorem** and the **spectral theorem.**
    - The **singular value decomposition theorem** is used in the **Schmidt decomposition procedure.**