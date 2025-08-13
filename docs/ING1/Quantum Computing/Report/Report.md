---
title: Report
Owner: Matcha
---
![[Enonc_Informatique_Quantique_2024.pdf]]
# Exercice 1
![[Untitled 76.png|Untitled 76.png]]
Multiplying $A\times X$:
We add $A$ to $X$ if the $1^{st}$ bit of $X$ is $1$, then we shift $A$ of $1$ to the left. Finally we add $A$ shifted to $X$ again if the $2^{nd}$ bit of $X$ is $1$.
  
# Exercice 2
Pour détecter un espion sur une ligne de transmission quantique, Alice et Bob utilisent un protocole basé sur des bits classiques et des transformations Hadamard. Alice envoie un qubit en fonction de deux bits aléatoires $A_1$ et $A_2$, modifiant la polarisation si $A_2 = 1$. Bob reçoit le qubit et applique une transformation Hadamard selon son bit $B_2$. Ils comparent ensuite leurs bits $A_2$ et B2B_2B2 publiquement.
Si $A_2 = B_2$, Bob devrait recevoir $A_1$ correctement environ $75\%$ du temps sans espion. S'ils répètent ce processus plusieurs fois et constatent que Bob reçoit $A_1$ correctement seulement $50\%$ du temps, cela indique la présence d'un espion, car l'interception perturbe les états quantiques.
  
# Exercice 3
En termes de bits, un multiple de 4 se caractérise par le fait que les deux premiers bits (le bit de poids faible et le deuxième bit) sont à 0. Par conséquent, pour générer un multiple de 4, il suffit de fixer ces deux bits à 0 et d'appliquer une porte Hadamard à tous les autres bits.
```Python
var num_qubits = 5;
qc.reset(num_qubits);
var a = qint.new(5, 'a');
a.write(0);
//a.write(28);
qc.nop();
a.had(0x4|0x8|0x10);
//a.add(4);
qc.nop();
a.read();
```
![[Untitled 1 51.png|Untitled 1 51.png]]
En informatique quantique, la représentation d'un nombre sur $n$ qubits permet de coder des nombres entiers de $0$ à $2^n - 1$. Dans le cas de $5$ qubits, on peut représenter des nombres de $0$ à$2^5 - 1 = 31$.
Les multiples de $4$ dans cette plage sont : $0, 4, 8, 12, 16, 20, 24,$et $28$. La plus grande valeur multiple de $4$ est donc $28$. En ajoutant $4$ à $28$, on obtient $32$, ce qui dépasse la capacité de $5$ qubits. En conséquence, ce dépassement de capacité fait que le résultat revient à $0$. Ce phénomène est similaire à l'overflow en arithmétique binaire classique.
  
# Exercice 5