---
title: Exercices 1
Matière:
  - "[[Probabilité et Statistiques]]"
Type: TP/TD
Supports:
  - "[[feuille1pbs 2.pdf|feuille1pbs 2.pdf]]"
---
# **Exercice 11**
La variable aléatoire $U$ suit une loi uniforme sur l’intervalle $[2; 5]$. Calculer $P(U \in [2; 3])$ puis $E(U)$.
### Loi uniforme sur $[a, b]$
Une variable aléatoire $U \sim \mathcal{U}(a, b)$ admet la densité :
$f_U(x) = \begin{cases}\frac{1}{b - a} & \text{si } x \in [a, b] \\  
0 & \text{sinon}  
\end{cases}$
Ici, $a = 2$, $b = 5$, donc :
$f_U(x) = \frac{1}{5 - 2} = \frac{1}{3} \text{ pour } x \in [2, 5]$
### $\boldsymbol{P(U \in [2; 3])}$
Pour une loi uniforme continue, la probabilité d’être dans un intervalle $[c, d] \subset [a, b]$ est :
$P(U \in [c, d]) = \frac{d - c}{b - a}$
Ici :
$P(U \in [2; 3]) = \frac{3 - 2}{5 - 2} = \frac{1}{3}$
### $\boldsymbol{E(U)}$ — Espérance d’une loi uniforme continue
$E(U) = \frac{a + b}{2} = \frac{2 + 5}{2} = \frac{7}{2} = 3{,}5$
---
### **Synthèse**
### Loi uniforme continue sur _$[a, b]$_ :
- **Densité** : $f(x) = \frac{1}{b - a}$ sur $[a, b]$
- **Espérance** : $E(X) = \frac{a + b}{2}$
- **Variance** : $V(X) = \frac{(b - a)^2}{12}$
- **Probabilité sur un sous-intervalle** $[c, d]$ :
    
    $P(c \leq X \leq d) = \frac{d - c}{b - a}$
    
### Astuces :
- Uniforme = densité constante.
- Dessiner un rectangle aide souvent : base = $b−a$, hauteur = $\frac{1}{b-a}$, l'aire donne la probabilité.
- Idéal pour des phénomènes avec probabilité "également répartie".
---
### **Exercice 13 - Loi de Pareto**
Soient α\alpha un réel strictement positif et $X$ une variable aléatoire dont la densité est définie par :
$f_X(x) = \begin{cases} \alpha x^{-\alpha - 1} & \text{si } x \geq 1 \\ 0 & \text{sinon}\end{cases}$
### **Vérifier que** $f_X$ **est une densité de probabilité**
Une fonction est une densité ssi :
- $f(x) \geq 0$
- $\int_{-\infty}^{+\infty} f(x) dx = 1$
Ici, $f(x) \geq 0$ pour $x \geq 1$, et $f(x) = 0$ sinon.
Calcul de l'intégrale :
$⁍$
Utilisons la primitive :
$⁍$
Donc :
$\int_{1}^{+\infty} \alpha x^{-\alpha - 1} dx = \alpha \left[ \frac{x^{-\alpha}}{-\alpha} \right]_1^{+\infty} = - \left[x^{-\alpha}\right]_1^{+\infty} =−(lim⁡x→∞x−α−1−α)=−(0−1)=1= - \left( \lim_{x \to \infty} x^{-\alpha} - 1^{-\alpha} \right) = - (0 - 1) = 1$
Donc $f_X$ est bien une densité.
---
### **Déterminer la fonction de répartition associée** $F_X(x)$
Par définition :
$F_X(x) = P(X \leq x) = \int_{-\infty}^{x} f_X(t) dt$
Cas 1 : $x < 1$
$F_X(x) = 0$
Cas 2 : $x \geq 1$
$F_X(x) = \int_1^x \alpha t^{-\alpha - 1} dt = \left[- t^{-\alpha} \right]_1^x = 1 - x^{-\alpha}$
**Conclusion :**
$F_X(x) =  
\begin{cases}  
0 & \text{si } x < 1 \\  
1 - x^{-\alpha} & \text{si } x \geq 1  
\end{cases}$
### **Calculer** $P(0 < X \leq 2)$
Puisque $X \geq 1$, alors :
$P(0 < X \leq 2) = P(1 \leq X \leq 2) = F_X(2) - F_X(1)\\= (1 - 2^{-\alpha}) - (1 - 1^{-\alpha}) = 1 - 2^{-\alpha} - 0 = 1 - 2^{-\alpha}$
### **Espérance de** $X$
Formule :
$E(X) = \int_1^{+\infty} x \cdot f_X(x) dx = \int_1^{+\infty} x \cdot \alpha x^{-\alpha - 1} dx = \alpha \int_1^{+\infty} x^{-\alpha} dx$
La primitive :
$\int x^{-\alpha} dx = \frac{x^{-\alpha + 1}}{-\alpha + 1}$
Donc l’intégrale converge ssi $\alpha > 1$
Et dans ce cas :
$E(X) = \frac{\alpha}{\alpha - 1}$
---
### **Synthèse**
### Densité :
$f(x) = \alpha x^{-\alpha - 1} \text{ pour } x \geq 1$
### Fonction de répartition :
$F(x) =  
\begin{cases}  
0 & x < 1 \\  
1 - x^{-\alpha} & x \geq 1  
\end{cases}$
### Propriétés :
|   |   |   |
|---|---|---|
|Quantité|Valeur|Condition|
|$E(X)$|$\frac{\alpha}{\alpha - 1}$|$\alpha > 1$|
|$V(X)$|$\frac{\alpha}{(\alpha - 1)^2(\alpha - 2)}$|$\alpha > 2$|
|$P(X \leq x)$|$1 - x^{-\alpha} pour x≥1x \geq 1$|-|
---
# **Exercice 14 — Loi géométrique et absence de mémoire**
Soit $X$ une variable aléatoire suivant une loi géométrique.
Montrer que :
$P(X > n + k \mid X > k) = P(X > n) \quad \text{pour tous entiers naturels } k, n.$
### **Loi géométrique : rappels essentiels**
La loi géométrique modélise le **nombre d’échecs avant le premier succès** dans une suite d’épreuves de Bernoulli indépendantes avec probabilité de succès $p \in (0, 1)$.
- Support : $X \in \mathbb{N}$
- Probabilité :
    
    $P(X = k) = (1 - p)^k p \quad \text{pour } k \in \mathbb{N}$
    
- Fonction de survie :
    
    $P(X > k) = (1 - p)^{k+1}$
    
    ou, dans l’autre version de la loi géométrique (commençant à 11), $P(X > k) = (1 - p)^k$
    

> [!important] **Important** : ici, on travaille avec la version où $X \in \mathbb{N}$, donc on utilise :
> 
> $P(X > k) = (1 - p)^{k+1}$
Mais l’énoncé veut démontrer l’absence de mémoire, donc on utilisera une version qui commence à **1** : $P(X > k) = (1 - p)^k$
Donc on suppose que $X \sim \text{Geom}(p)$ avec support $\{1, 2, 3, \dots\}$.
### **Montrons l’égalité**
Démontrons :
$P(X > n + k \mid X > k) = P(X > n)$
Par la formule des probabilités conditionnelles :
$P(X > n + k \mid X > k) = \frac{P(X > n + k)}{P(X > k)}$
Comme $P(X > m) = (1 - p)^m$ :
$\frac{(1 - p)^{n + k}}{(1 - p)^k} = (1 - p)^n = P(X > n)$
---
## **Synthèse**
### _Deux définitions possibles_ :
- $X \in \mathbb{N}$, compte les **échecs avant le 1er succès**.
- $X \in \mathbb{N}^*$, compte le **rang du 1er succès**.
Fais toujours attention à quelle version tu utilises.
### _Propriété sans mémoire_ :
Pour tout $n, k \in \mathbb{N}$,
$P(X > n + k \mid X > k) = P(X > n)$

> [!important] Cela signifie que **l’histoire passée ne change pas la probabilité du futur**.
## Astuce :
- Cette propriété est **unique aux lois géométrique (discrète)** et **exponentielle (continue)**.
- Pour prouver une loi "sans mémoire", essaie **directement la formule des probabilités conditionnelles** avec les formules de survie.
---