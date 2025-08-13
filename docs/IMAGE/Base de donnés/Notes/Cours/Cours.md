---
title: Cours
Matière:
  - "[[Probabilité et Statistiques]]"
Type: Notes
Date du cours: 2025-02-17
Supports:
  - "[[chapitre1 3.pdf|chapitre1 3.pdf]]"
  - "[[chapitre1complements 2.pdf|chapitre1complements 2.pdf]]"
---
# 1. Introduction aux probabilités
## 1.1. Expérience aléatoire
### **Définition**
Une expérience aléatoire est une expérience dont on ne peut pas prédire l'issue à l'avance, mais dont on connaît toutes les issues possibles.
### **Exemples** :
- Lancer d'une pièce.
- Lancer d'un dé.
- Choix d'une personne dans une population.
## 1.2. Univers et événements
### **Univers (**$Ω$**)**
Ensemble de toutes les issues possibles d'une expérience aléatoire.
### **Événement**
Sous-ensemble de l'univers $Ω$. Une issue **a** réalise un événement $A$ si $a ∈ A$.
## 1.3. Probabilité conditionnelle
### **Définition** :
La probabilité conditionnelle de l'événement $B$ sachant que l'événement $A$ est réalisé est donnée par :
$P_A(B) = \frac{P(A \cap B)}{P(A)}$
### **Formule de Bayes** :
$P_B(A) = \frac{P_A(B) \times P(A)}{P_A(B) \times P(A) + P_{\overline{A}}(B) \times P(\overline{A})}$
---
# 2. Variables aléatoires
## 2.1. Variables aléatoires discrètes
- **Définition**
Une variable aléatoire $X$ est discrète si elle prend des valeurs dans un ensemble discret (fini ou dénombrable).
- **Loi de probabilité**
La loi de $X$ est définie par les probabilités $P(X = x_i)$ pour chaque $x_i$ dans le support de $X$.
- **Espérance (**$E(X)$**)**
Moyenne pondérée des valeurs possibles de$X$.
$E(X) = \sum_{x \in S} x \cdot P(X = x)$
- **Variance (**$V(X)$**)**
Mesure de la dispersion des valeurs de $X$ autour de l'espérance.
$V(X) = E(X^2) - E(X)^2$
- **Écart-type (**$σ(X)$**)**
Racine carrée de la variance.
$\sigma(X) = \sqrt{V(X)}$
## 2.2. Variables aléatoires continues
### **Définition**
Une variable aléatoire $X$ est continue si elle prend des valeurs dans un intervalle continu.
### **Fonction de densité**
Une fonction $f(x)$ telle que :
$P(a \leq X \leq b) = \int_a^b f(x) \, dx$
### **Fonction de répartition**
$F_X(x) = P(X \leq x) = \int_{-\infty}^x f(t) \, dt$
### **Espérance et variance**
$E(X) = \int_{-\infty}^{+\infty} x f(x) \, dx$
$V(X) = \int_{-\infty}^{+\infty} (x - E(X))^2 f(x) \, dx$
  
---
# 3. Lois de probabilité discrètes
## 3.1. Loi de Bernoulli
- **Notation** : $B(p)$
- **Support** : $\{0, 1\}$
- **Espérance** : $E(X) = p$
- **Variance** : $V(X) = p(1 - p)$
## 3.2. Loi binomiale
- **Notation** : $B(n, p)$
- **Support** : $\{0, 1, ..., n\}$
- **Espérance** : $E(X) = np$
- **Variance** : $V(X) = np(1 - p)$
## 3.3. Loi géométrique
- **Notation** : $G(p)$
- **Support** : $N$
- **Espérance** : $E(X) = 1/p$
- **Variance** : $V(X) = (1 - p)/p²$
## 3.4. Loi de Poisson
- **Notation** : $P(λ)$
- **Support** : $N$
- **Espérance** : $E(X) = λ$
- **Variance** : $V(X) = λ$
---
# 4. Lois de probabilité continues
## 4.1. Loi uniforme
- **Notation** : $U([a, b])$
- **Densité** :
$f(x) = \frac{1}{b - a} \quad \text{pour} \quad x \in [a, b]$
- **Espérance** :$E(X) = (a + b)/2$
- **Variance** : $V(X) = (b - a)²/12$
## 4.2. Loi exponentielle
- **Notation** : $E(λ)$
- **Densité** :
$f(x) = \lambda e^{-\lambda x} \quad \text{pour} \quad x \geq 0$
- **Espérance** : $E(X) = 1/λ$
- **Variance** : $V(X) = 1/λ²$
## 4.3. Loi normale
- **Notation** : $N(μ, σ²)$
- **Densité** :
$f(x) = \frac{1}{\sqrt{2\pi}\sigma} e^{-\frac{(x - \mu)^2}{2\sigma^2}}$
- **Espérance** : $E(X) = μ$
- **Variance** : $V(X) = σ²$
---
# 5. Fonctions caractéristiques
## **Définition**
La fonction caractéristique d'une variable aléatoire $X$ est définie par :
$\phi_X(t) = E(e^{itX})$
## **Propriétés**
- **Loi de Bernoulli** : $\phi(t) = 1 - p + pe^{it}$
- **Loi binomiale** : $\phi(t) = (1 - p + pe^{it})^n$
- **Loi de Poisson** : $\phi(t) = \exp(\lambda(e^{it} - 1))$
- **Loi normale** : $\phi(t) = e^{-\frac{\sigma^2 t^2}{2} + it\mu}$
---
# 6. Convergence de variables aléatoires
## 6.1. Convergence presque sûre
### **Définition**
La suite $(X_n)$ converge presque sûrement vers $X$ si :
$\lim_{n \to +\infty} X_n(\omega) = X(\omega) \quad \text{pour presque tout} \quad \omega \in \Omega$
## 6.2. Convergence en probabilité
### **Définition**
La suite $(X_n)$ converge en probabilité vers $X$ si :
$\forall \varepsilon > 0, \quad \lim_{n \to +\infty} P(|X_n - X| \geq \varepsilon) = 0$
## 6.3. Convergence en loi
### **Définition**
La suite $(X_n)$ converge en loi vers $X$ si :
$\lim_{n \to +\infty} F_{X_n}(x) = F_X(x) \quad \text{en tout point de continuité de} \quad F_X$
---
# 7. Théorème Central Limite (TCL)
### **Énoncé**
Soit $(X_i)$ une suite de variables aléatoires i.i.d. (indépendantes et identiquement distribuées) avec $E(X_i) = μ$ et $V(X_i) = σ²$. Alors :
$\frac{\sqrt{n}(\bar{X}_n - \mu)}{\sigma} \quad \text{converge en loi vers} \quad N(0, 1) \\\text{où } \bar{X}n = \frac{1}{n} \sum{i=1}^n X_i.$
---
# 8. Approximation de lois
## 8.1. Approximation de la loi binomiale par la loi normale
### **Conditions** :
- $n \geq 30$
- $np \geq 5$
- $n(1 - p) \geq 5$
## 8.2. Approximation de la loi binomiale par la loi de Poisson
### **Conditions** :
- $n \geq 20$ et $p \leq 0.05$
- $n \geq 100$ et $np \leq 10$