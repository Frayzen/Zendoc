---
title: Exercises
Owner: Matcha
---
TD
![[TD_QUAC.pdf]]

  
# 1 Addition of two quantic bits
![[Untitled 79.png|Untitled 79.png]]

Show that for $a \in \{ |00\rangle, |01\rangle, |10\rangle, |11\rangle \}$, we obtain at the output the value $a + b$ (on the first two quantum lines) where $b \in \{|0\rangle, |1\rangle\}$ (up to overflow), in other words, $a$ becomes $a+$b.$ First justify it manually (think carry), then demonstrate it formally with a calculation.
## Resolution step-by-step
- If $b=|0\rangle$ then no door activates so $a=a+b$
- If $b=|1\rangle$ :
    - If $a = |00\rangle \Rightarrow\ |100\rangle$:
        
        1rst door does not activate
        
        2nd door → $|101\rangle$ $\Rightarrow a=|01\rangle$
        
    - If $a=|11\rangle\Rightarrow |111\rangle$:
        
        1rst door → $|101\rangle$
        
        2nd door → $|100\rangle$\Rightarrow a=|00\rangle$
        
        ==This correspond to an overflow==
        
    - If $a=|01\rangle\Rightarrow |101\rangle$:
        
        1rst door → $|111\rangle$
        
        2nd door → $|110\rangle$\Rightarrow a=|10\rangle$
        
        ==We basically did== ==$+2$== ==then== ==$-1$== ==to add== ==$1$== ==to== ==$a$==
        
  
# 2 Conditional phase shift
![[Untitled 1 54.png|Untitled 1 54.png]]

Show that when starting from the state $|00\rangle$, we arrive at the state:
$|00\rangle+|01\rangle+|10\rangle-|11\rangle$
In other words, we have phase-shifted only the state $|11\rangle$ by $\pi$.
## Resolution step by step
### 1 - Initial state: $|00\rangle$
### 2- Hadamard on both qubits:
$H|0\rangle=\frac{1}{\sqrt2}(|0\rangle+|1\rangle)\\  
H|1\rangle=\frac{1}{\sqrt2}(|0\rangle-|1\rangle)$
Now, let's apply this to each qubit in the state $|00\rangle$:
$H|0\rangle\otimes H|0\rangle=\frac{1}{\sqrt2}(|0\rangle+|1\rangle)\otimes \frac{1}{\sqrt2}(|0\rangle+|1\rangle)$
Expanding this tensor product:
$\frac{1}{2}\big(\ |00\rangle+|01\rangle+|10\rangle+|11\rangle\ \big)$
### 3- Rotation of $45^{\circ}$ on 2
$\theta=\frac{\pi}{4}\Rightarrow$ we multiply all $|1X\rangle$ states by $e^{j\frac{\pi}{4}}$
$\frac{1}{2}\big(\ |00\rangle+|01\rangle+e^{j\frac{\pi}{4}}|10\rangle+e^{j\frac{\pi}{4}}|11\rangle\ \big)$
### 4- CNOT on 2 controled by 1
Swap $|01\rangle$ and $|11\rangle$
$\frac{1}{2}\big(\ |00\rangle+e^{j\frac{\pi}{4}}|01\rangle+e^{j\frac{\pi}{4}}|10\rangle+|11\rangle\ \big)$
### 5- Rotation of $-45^\circ$ on 2
$\theta=-\frac{\pi}{4}\Rightarrow$ we multiply all $|1X\rangle$ states by $e^{-j\frac{\pi}{4}}$
$\frac{1}{2}\big(\ |00\rangle+e^{j\frac{\pi}{4}}|01\rangle+|10\rangle+e^{-j\frac{\pi}{4}}|11\rangle\ \big)$
### 6- CNOT on 2 controled by 1
Swap $|01\rangle$ and $|11\rangle$
$\frac{1}{2}\big(\ |00\rangle+e^{-j\frac{\pi}{4}}|01\rangle+|10\rangle+e^{j\frac{\pi}{4}}|11\rangle\ \big)$
### 7- Rotation of $45^{\circ}$ on 2
$\theta=\frac{\pi}{4}\Rightarrow$ we multiply all $|1X\rangle$ states by $e^{j\frac{\pi}{4}}$
$\frac{1}{2}\big(\ |00\rangle+|01\rangle+|10\rangle+e^{j\frac{\pi}{2}}|11\rangle\ \big)$
### 8- Rotation of $90^\circ$ on both
We only rotate $|11\rangle$ of $e^{j\frac{\pi}{2}}\Leftarrow\theta=\frac{\pi}{2}$
$|00\rangle+|01\rangle+|10\rangle-|11\rangle$
  
# 3- Swap Test
![[Untitled 2 40.png|Untitled 2 40.png]]

### Show that when the two qubits have the same input value, the output qubit always shows 1
It is important to find the situations where we are sure to have one result (ex: for 2 equal signals without spy)  
We want the most certitude
- $|000\rangle$ :
    
    $1^{st}$ Hadamar: $\big(|000\rangle + |100\rangle \big)*c^{st}$
    
    Swap test : 1 swap over 2 zeros for $|100\rangle$ → no consequences
    
    - $2^{nd}$ Hadamar: $|000\rangle$
        
        $c^{st}=\frac{1}{\sqrt2}$ ⇒ $H\Big(\frac{1}{\sqrt2}\big(|000\rangle+|100\rangle\big)\Big)=\frac{1}{\sqrt2}\big(H|0\rangle|00\rangle+H|1\rangle|00\rangle\big)$
        
        $\frac{1}{2}\big((|0\rangle + |1\rangle)|00\rangle+(|0\rangle - |1\rangle)|00\rangle\big)\\  
        = \frac{1}{2}\big(|011\rangle + |111\rangle + |011\rangle - |111\rangle \big)\\  
        =\frac{1}{2}*2|000\rangle$
        
    
    NOT : $|100\rangle$ ⇒ ==$1$==
    
- $|011\rangle$ :
    
    $1^{st}$ Hadamar: $\big(|011\rangle + |111\rangle \big)*c^{st}$
    
    Swap test : 1 swap over 2 ones for $|111\rangle$ → no consequences
    
    - $2^{nd}$ Hadamar: $|111\rangle$
        
        $c^{st}=\frac{1}{\sqrt2}$ ⇒ $H\Big(\frac{1}{\sqrt2}\big(|011\rangle+|111\rangle\big)\Big)=\frac{1}{\sqrt2}\big(H|0\rangle|11\rangle+H|1\rangle|11\rangle\big)$
        
        $\frac{1}{2}\big((|0\rangle + |1\rangle)|11\rangle+(|0\rangle - |1\rangle)|11\rangle\big)\\  
        = \frac{1}{2}\big(|011\rangle + |111\rangle + |011\rangle - |111\rangle \big)\\  
        =\frac{1}{2}*2|011\rangle$
        
    
    NOT : $|111\rangle$ ⇒ ==$1$==
    
### Show that when the input bits are different, there is a non-zero probability that the output shows that the states are equal by mistake
- $|001\rangle$:
    
    $1^{st}$ Hadamar: $\big(|001\rangle + |101\rangle \big)*c^{st}$
    
    Swap test : $\big(|001\rangle+|110\rangle\big)*c^{st}$
    
    - $2^{nd}$ Hadamar: $\big(|001\rangle + |101\rangle + |010\rangle - |110\rangle\big) * c^{st}$
        
        $c^{st}=\frac{1}{\sqrt2}$ ⇒ $H\Big(\frac{1}{\sqrt2}\big(|001\rangle+|110\rangle\big)\Big)=\frac{1}{\sqrt2}\big(H|0\rangle|01\rangle+H|1\rangle|10\rangle\big)$
        
        $=\frac{1}{2}\big((|0\rangle + |1\rangle)|01\rangle+(|0\rangle - |1\rangle)|10\rangle\big)\\  
        = \frac{1}{2}\big(|001\rangle + |101\rangle + |010\rangle - |110\rangle \big)$
        
    
    NOT : $\big(|$==$1$====$01\rangle + |$====$0$====$01\rangle + |$====$1$====$10\rangle - |$====$0$====$10\rangle\big) * c^{st}$==
    
    We have ==$50\%$== to have ==$1$== and ==$50\%$== chance to have ==$0$==
    
- $|010\rangle$:
    
    $1^{st}$ Hadamar: $\big(|010\rangle + |110\rangle \big)*c^{st}$
    
    Swap test : $\big(|010\rangle+|101\rangle\big)*c^{st}$
    
    - $2^{nd}$ Hadamar: $\big(|010\rangle + |110\rangle + |001\rangle - |101\rangle \big) * c^{st}$
        
        $c^{st}=\frac{1}{\sqrt2}$ ⇒ $H\Big(\frac{1}{\sqrt2}\big(|010\rangle+|101\rangle\big)\Big)=\frac{1}{\sqrt2}\big(H|0\rangle|10\rangle+H|1\rangle|01\rangle\big)$
        
        $=\frac{1}{2}\big((|0\rangle + |1\rangle)|10\rangle+(|0\rangle - |1\rangle)|01\rangle\big)\\  
        = \frac{1}{2}\big(|010\rangle + |110\rangle + |001\rangle - |101\rangle \big)$
        
    
    NOT : $\big(|$==$0$====$10\rangle + |$====$1$====$10\rangle + |$====$0$====$01\rangle - |$====$1$====$01\rangle\big) * c^{st}$==
    
    We have ==$50\%$== to have ==$1$== and ==$50\%$== chance to have ==$0$==
    
### Calculate this probability
We draw $n$ element with the same 2 signals, the probability of getting one 1 are:
- If the signal are equal : $P(n\ \text{elements}\ |=)\ =\ 1$
- If the signal ar different : $P(n\ \text{elements}\ |\neq)\ =\ \frac{1}{2^n}$
### What methodology do you propose to ensure with as much confidence as desired that the two input bits were indeed equal?
If we have a $0$ as output it means that the 2 signals are always different  
The chance of getting only $1$ for $n$ draws for 2 different signals is $\frac{1}{2^n}$, so we chose a number $n$ of draws such that $\frac{1}{2^n}$ is small enough
### How many measurements do you need to make to be 99% sure that the two input states are different?
This means that we want :
$\frac{1}{2^n}\leq0,01\ \Longrightarrow \ n\geq7$
  
# 4- Spy Hunter
![[Untitled 3 31.png|Untitled 3 31.png]]

**Reminder from the lecture:**
Alice transmits the classical bit $A_1 \in \{0,1\}$, and changes its polarization with a Hadamard gate if and only if $A_2 = 1$ (she does not change the polarization for $A_2 = 0$). Similarly, Bob at the reception will change the polarization with a Hadamard gate if and only if the bit $B_2$ is $1$.
### Case without eavesdropper: calculate the probability that Bob receives what Alice has sent. Deduce the overall probability that Bob received the value sent by Alice.
- $A_1=0,\ A_2=0,\ A_3=0$:
    
    No operation is applicated $\Rightarrow$ $|0\rangle=A_1\ \Longrightarrow$==$100\%$==
    
- $A_1=1,\ A_2=0,\ A_3=0$:
    
    NOT $\Rightarrow$ $|1\rangle=A_1\ \Longrightarrow$==$100\%$==
    
|   |   |   |   |   |
|---|---|---|---|---|
|$A_1$ \ $A_2,\ B_2$|$0,\ 0$|$0,\ 1$|$1,\ 0$|$1,\ 1$|
|$0$|$\|0\rangle\rightarrow100\%$|$\|0\rangle+\|1\rangle\rightarrow50\%$|$\|0\rangle+\|1\rangle\rightarrow50\%$|$\|0\rangle\rightarrow100\%$|
|$1$|$\|1\rangle\rightarrow100\%$|$\|0\rangle-\|1\rangle\rightarrow50\%$|$\|0\rangle-\|1\rangle\rightarrow50\%$|$\|1\rangle\rightarrow100\%$|
There is a ==$75\%$== chance for Bob to recieve the value $A_1$ that Alice sent.
### Case with eavesdropper: Same questions but assuming this time that the eavesdropper is indeed present
Here the value of $A_1$ and $A_2$ do not change the result, we will only consider the cases for $B_2$.
- $B_2=0$:
$|0\rangle\ \xrightarrow{NOT}$ $|1\rangle\ \xrightarrow{H}\ \frac{1}{\sqrt2}(|0\rangle-|1\rangle)$
- $B_2=1$:
$|0\rangle\ \xrightarrow{NOT}$ $|1\rangle\ \xrightarrow{H}\ \frac{1}{\sqrt2}(|0\rangle-|1\rangle)\ \xrightarrow{H}\ |1\rangle$
- $A_1=0,\ A_2=1,\ B_2=1:$
    
    Without spy we get $0$. With spy we get $1$ $\Longrightarrow$ we have $0\%$ chance to get the right value.
    
- $A_1=1,\ A_2=1,\ B_2=1:$
    
    Without spy we get $1$. With spy we get $1$ $\Longrightarrow$ we have $100\%$ chance to get the right value.
    
- $A_1=1,\ A_2=0,\ B_2=0:$
    
    Without spy we get $1$. With spy we get $1$ $\Longrightarrow$ we have $100\%$ chance to get the right value.
    
|   |   |   |   |   |
|---|---|---|---|---|
|$A_1$ \ $A_2,\ B_2$|$0,\ 0$|$0,\ 1$|$1,\ 0$|$1,\ 1$|
|$0$|$\|0\rangle+\|1\rangle\rightarrow50\%$|$\|1\rangle\rightarrow0\%$|$\|0\rangle-\|1\rangle\rightarrow50\%$|$\|1\rangle\rightarrow0\%$|
|$1$|$\|0\rangle-\|1\rangle\rightarrow50\%$|$\|1\rangle\rightarrow100\%$|$\|0\rangle-\|1\rangle\rightarrow50\%$|$\|1\rangle\rightarrow100\%$|
There is a ==$50\%$== chance for Bob to recieve the value $A_1$ that Alice sent.
  
# 5- Quantum Teleportation
![[Untitled 4 25.png|Untitled 4 25.png]]

### Demonstration
- **Staring state:** $\alpha|00$==$0$==$\rangle+\beta|00$==$1$==$\rangle$
- **Hadamar:** $\frac{1}{\sqrt2}\big(\alpha|000\rangle+\alpha|010\rangle+\beta|001\rangle+\beta|011\rangle\big)$
- **CNOT:** $\frac{1}{\sqrt2}\big(\alpha|000\rangle+\alpha|110\rangle+\beta|001\rangle+\beta|111\rangle\big)$
- **CNOT:** $\frac{1}{\sqrt2}\big(\alpha|000\rangle+\alpha|110\rangle+\beta|011\rangle+\beta|101\rangle\big)$
- **Hadamar:**
    
    $\frac{1}{\sqrt2}\big(\alpha|000\rangle+\alpha|110\rangle+\beta|010\rangle+\beta|100\rangle+\alpha|001\rangle+\alpha|111\rangle-\beta|011\rangle- \beta|101\rangle\big)$
    
Now we have 2 ordinary bits, we’ll call them CROT$80^\circ$ and CNOT in reference to the gate they activate :
- If CROT$80^\circ=0$ and CNOT $=0$: $\alpha|$==$0$==$00\rangle+\beta|$==$1$====$00\rangle$==
- If CROT$80^\circ=1$ and CNOT $=0$: $\alpha|001\rangle+\beta|101\rangle\ \xRightarrow{ROT}$ $\alpha|$==$0$==$01\rangle+\beta|$==$1$====$01\rangle$==
- If CROT$80^\circ=0$ and CNOT $=1$: $\alpha|110\rangle-\beta|010\rangle\ \xRightarrow{CNOT}$ $\alpha|$==$0$==$10\rangle+\beta|$==$1$====$10\rangle$==
- If CROT$80^\circ=1$ and CNOT $=1$:
    
    $\alpha|111\rangle-\beta|011\rangle\ \xRightarrow{CNOT}\ \alpha|011\rangle-\beta|111\rangle\ \xRightarrow{ROT}$ $\alpha|$==$0$==$11\rangle+\beta|$==$1$====$11\rangle$==
    
We always get ==$\alpha|0\rangle+\beta|1\rangle$==
  
# 6- Quantic Fourier Transform
![[Untitled 5 18.png|Untitled 5 18.png]]

Assume you have an input of the form: $A \left| 00 \right\rangle + B \left| 01 \right\rangle + C \left| 10 \right\rangle + D \left| 11 \right\rangle$,
with the second qubit representing the most significant bit, meaning that$\left| XY \right\rangle$ has $X$ as the most significant bit and $Y$ as the least significant bit. After applying various operators, observe the coefficients you obtain in the form: $A' \left| 00 \right\rangle + B' \left| 01 \right\rangle + C' \left| 10 \right\rangle + D' \left| 11 \right\rangle$. What do you notice about the new coefficients in terms of phase? That is, express each coefficient in a complex logical sequence. What connects them?
Now, imagine the output is "$0$", that is the state $\left| 00 \right\rangle$. What did you have as input? And for "$1$", "$2$", and "$3$"? In particular, what happened to "$3$" in terms of signal processing? Justify why one can say that the input corresponds to a frequency by observing the corresponding output in circular notation.
### Resolution
- **Initial state:** $A \left| 00 \right\rangle + B \left| 01 \right\rangle + C \left| 10 \right\rangle + D \left| 11 \right\rangle$
- Hadamar:
    
    $A|00\rangle+B|01\rangle+C|00\rangle+D|01\rangle+A|10\rangle+B|11\rangle-C|10\rangle-D|11\rangle$
    
- Phase:
    
    $|00\rangle(A+C)$
    
    $|01\rangle(B-D)$
    
    $|10\rangle(A-C)$
    
    $|11\rangle(B-D)$
    
    $\Longrightarrow$
    
      
    
    $|00\rangle(A+C)$
    
    $|01\rangle(B-D)$
    
    $|10\rangle(A-C)$
    
    $|11\rangle(B-D)e^{j\frac{\pi}{2}}$
    
- Hadamar:
    
    $(|00\rangle+|01\rangle)(A+C)$
    
    $(|00\rangle-|01\rangle)(B-D)$
    
    $(|10\rangle+|11\rangle)(A-C)$
    
    $(|10\rangle-|11\rangle)(B-D)e^{j\frac{\pi}{2}}$
    
    $\Longrightarrow$
    
      
    
    $|00\rangle(A+B+C+D)$
    
    $|01\rangle(A-B+C-D)$
    
    $|10\rangle(A+Be^{j\frac{\pi}{2}}-C-De^{j\frac{\pi}{2}})$
    
    $|11\rangle(A-Be^{j\frac{\pi}{2}}-C+De^{j\frac{\pi}{2}})$
    
- Swap:
    
    $|00\rangle(A+B+C+D)$
    
    $|01\rangle(A+Be^{j\frac{\pi}{2}}-C-De^{j\frac{\pi}{2}})$
    
    $|10\rangle(A-B+C-D)$
    
    $|11\rangle(A-Be^{j\frac{\pi}{2}}-C+De^{j\frac{\pi}{2}})$
    
    $\Longrightarrow$
    
      
    
    $A'=A+B+C+D$
    
    $B'=A+Be^{j\frac{\pi}{2}}-C-De^{j\frac{\pi}{2}}$
    
    $C'=A-B+C-D$
    
    $D'=A-Be^{j\frac{\pi}{2}}-C+De^{j\frac{\pi}{2}}$
    
To have $A'=1$ and $B'=C'=D'=0$