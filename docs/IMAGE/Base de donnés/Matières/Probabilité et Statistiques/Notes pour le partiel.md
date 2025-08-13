---
title: Notes pour le partiel
---

# Les lois
### **Bernoulli** $\mathcal{B}(p)$
- **Signification** : Une épreuve binaire : succès $1$ ou échec $0$
- **Définition** : Support $\{0,1\}$, $P(X=1)=p$,$P(X=0)=1−p$
- **Espérance** : $E(X) = p$
- **Variance** : $V(X) = p(1 - p)$
---
### **Binomiale** $\mathcal{B}(n,p)$
- **Définition** : $P(X = k) = \binom{n}{k}p^k(1-p)^{n-k}$
- **Signification** : Nombre de succès en $n$ essais de Bernoulli
- **Espérance** : $E(X) = np$
- **Variance** : $V(X) = np(1 - p)$
- **Propriétés** : Approximable par la normale (Moivre-Laplace) ou Poisson.
---
### **Géométrique** $\mathcal{G}(p)$
- **Définition** : $P(X = k) = pq^{k-1}, \, k \in \mathbb{N}^*, \, q = 1-p$
- **Signification** : Nombre d’essais avant le 1er succès
- **Espérance** : $E(X) = \frac{1}{p}$
- **Variance** : $V(X) = \frac{1-p}{p^2}$
- **Propriétés** : Loi sans mémoire : $P(X > n+k \mid X > k) = P(X > n)$
---
### **Poisson** $\mathcal{P}(\lambda)$
- **Définition** : $P(X = k) = \frac{e^{-\lambda} \lambda^k}{k!}, k \in \mathbb{N}$
- **Signification** : Nombre d’événements rares dans un intervalle fixe
- **Espérance** : $E(X) = \lambda$
- **Variance** : $V(X) = \lambda$
---
### **Uniforme continue** sur $[a,b]$
- **Définition** : $f(x) = \frac{1}{b-a}\ pour\ x \in [a,b]$
- **Espérance** : $E(X) = \frac{a+b}{2}$
- **Variance** : $V(X) = \frac{(b-a)^2}{12}$
- **Propriétés** : Tous les intervalles de même taille ont même probabilité.
---
### **Exponentielle** $\mathcal{E}(\lambda)$
- **Définition** : $f(x) = \lambda e^{-\lambda x}$ pour $x \geq 0$
- **Signification** : Temps entre deux événements indépendants
- **Espérance** : $E(X) = \frac{1}{\lambda}$
- **Variance** : $V(X) = \frac{1}{\lambda^2}$
- **Propriétés** : Sans mémoire : $P(X > s+t \mid X > t) = P(X > s)$
---
### **Normale** $\mathcal{N}(\mu, \sigma^2)$
- **Densité** : $f(x) = \frac{1}{\sqrt{2\pi\sigma^2}} e^{-\frac{(x-\mu)^2}{2\sigma^2}}$
- **Espérance** : $E(X) = \mu$
- **Variance** : $V(X) = \sigma^2$
- **Propriétés** : Symétrique, densité en cloche, théorème central limite
---
### **Rayleigh** Rayleigh$(σ)$
- **Densité** : $f(x) = \frac{x}{\sigma^2} \exp\left(-\frac{x^2}{2\sigma^2}\right)$ pour $x > 0$
- **Espérance** : $E(X) = \sigma \sqrt{\pi/2}$
- **Variance** : $V(X) = \left(2 - \frac{\pi}{2}\right)\sigma^2$
- **Propriétés** : Si $X \sim \text{Rayleigh}(\sigma)$, alors $X^2 \sim \text{Exp}(2\sigma^2)$
---
### **Gamma** $\Gamma(\alpha, \beta)$
- **Densité** : $f(x) = \frac{\beta^\alpha}{\Gamma(\alpha)} x^{\alpha-1} e^{-\beta x}$ pour $x > 0$
- **Espérance** : $E(X) = \frac{\alpha}{\beta}$
- **Variance** : $V(X) = \frac{\alpha}{\beta^2}$
- **Propriétés** : Exponentielle = cas particulier avec $\alpha = 1$
---
### Pareto$(α)$
- **Densité** : $f(x) = \alpha x^{-\alpha-1}$ pour $x \geq 1$
- **Espérance** : existe si $\alpha > 1$, $E(X) = \frac{\alpha}{\alpha - 1}$
- **Variance** : existe si $\alpha > 2$, $V(X) = \frac{\alpha}{(\alpha-1)^2(\alpha-2)}$
---
# **Notions fondamentales de probabilités**
### **Espace probabilisable**
- **Univers** $\Omega$ : ensemble des issues possibles.
- **Événement** : sous-ensemble de $\Omega$.
- **Événement certain** : $\Omega$, probabilité $1$.
- **Événement impossible** : $\emptyset$, probabilité $0$.
---
### **Probabilité d’un événement**
- Si $A \subset \Omega$ :
    
    $P(A) \in [0, 1], \quad P(\Omega) = 1$
    
---
### **Union et intersection**
- $P(A \cup B) = P(A) + P(B) - P(A \cap B)$
- Si A et B sont disjoints $A\cap B=\empty$ :
    
    $P(A \cap B) = 0 \Rightarrow P(A \cup B) = P(A) + P(B)$
    
---
### **Complémentaire**
$P(\bar{A}) = 1 - P(A)$
---
### Probabilité conditionnelle
Si $P(B) > 0$, alors :
$P(A \mid B) = \frac{P(A \cap B)}{P(B)}$
### Formule du produit :
$P(A \cap B) = P(A \mid B) \cdot P(B) = P(B \mid A) \cdot P(A)$
---
### **Formule de Bayes**
Si $P(B) > 0$ :
$P(A \mid B) = \frac{P(B \mid A) \cdot P(A)}{P(B)}$
---
### **Indépendance**
Deux événements $A$ et $B$ sont **indépendants** si :
$P(A \cap B) = P(A) \cdot P(B) \Longleftrightarrow P(A \mid B) = P(A)  
\quad \text{et}\quad P(B \mid A) = P(B)$
---
### **Inégalité de Bienaymé-Tchebychev**
Pour toute v.a. $X$ de moyenne $m$ et variance $\sigma^2$, et pour tout $\alpha > 0$ :
$P(|X - m| \geq \alpha) \leq \frac{\sigma^2}{\alpha^2}$
---
# **Notions fondamentales des variables aléatoires**
## **Densité de probabilité**
### Définition
Une fonction $f : \mathbb{R} \to \mathbb{R}_+$ est une densité de probabilité si :
1. $\forall x \in \mathbb{R},\ f(x) \geq 0$
2. $\int_{-\infty}^{+\infty} f(x) dx = 1$
### Interprétation
- Donne la “concentration” de probabilité autour de chaque valeur.
- $P(a \leq X \leq b) = \int_a^b f(x) dx$
### Fonction de répartition associée
$F(x) = P(X \leq x) = \int_{-\infty}^{x} f(t) dt$
### Fonction de survie associée
$R(x) = P(X > x) = 1 - F(x)$
### Propriétés
- Si $X$ admet une densité, alors elle est dérivable presque partout, et $F$ est continue, croissante.
- Changement de variable :
    
    Soit $Y = g(X)$, si $g$ est bijective et dérivable :
    
    $f_Y(y) = \frac{f_X(g^{-1}(y))}{|g'(g^{-1}(y))|}$
    
---
## **Espérance**
### Définition
- Pour une variable aléatoire discrète $X$ de support $S$ :
    
    $E(X) = \sum_{x \in S} x \cdot P(X = x)$
    
- Pour une variable aléatoire continue $X$ de densité $f$ :
    
    $E(X) = \int_{-\infty}^{+\infty} x f(x) dx$
    
### Interprétation
- Moyenne théorique d'une variable aléatoire.
- Ce à quoi tend la **moyenne empirique** sur un grand nombre d'observations.
### Propriétés
1. **Linéarité** :
    
    $E(aX + bY) = aE(X) + bE(Y)$
    
2. Si $X$ est constante : $E(c) = c$
3. Si $X \geq 0$, alors $E(X) \geq 0$
---
## **Variance**
### Définition
- Mesure de la **dispersion** autour de la moyenne :
    
    $V(X) = E((X - E(X))^2)$
    
- **Formule de Koenig-Huygens** :
    
    $V(X) = E(X^2) - E(X)^2$
    
---
### Écart-type
- Racine carrée de la variance : $\sigma(X) = \sqrt{V(X)}$
- Interprétation intuitive : dispersion "moyenne" autour de la moyenne.
---
### Propriétés de la variance
1. $V(aX + b) = a^2 V(X)$
    
    Le décalage par une constante $b$ n'affecte pas la variance.
    
2. Si $X$ est constante : $V(X) = 0$
3. Si $X$ et $Y$ sont indépendantes :
    
    $V(X + Y) = V(X) + V(Y)$
    
---
## **Fonction caractéristique**
### Définition
Soit $X$ une variable aléatoire réelle :
$\varphi_X(t) = E(e^{itX}), \quad t \in \mathbb{R}$
### Propriétés générales
1. $\varphi_X(0) = 1$
2. Toujours définie (même si $E(X)$ ou $V(X)$ n’existent pas)
3. Détermine entièrement la loi de $X$
### Développement de Taylor (si X admet des moments) :
$\varphi(t) = 1 + it E(X) - \frac{t^2}{2} E(X^2) + \cdots$
- $\varphi^{(k)}(0) = i^k E(X^k)$ (quand $E(X^k) < \infty$)
### Fonction caractéristique de lois classiques :
|   |   |
|---|---|
|**Loi**|$\varphi_X(t)$|
|Bernoulli $\mathcal{B}(p)$|$1 - p + p e^{it}$|
|Binomiale $\mathcal{B}(n, p)$|$(1 - p + p e^{it})^n$|
|Poisson $\mathcal{P}(\lambda)$|$\exp(\lambda(e^{it} - 1))$|
|Géométrique $\mathcal{G}(p)$|$\frac{p e^{it}}{1 - (1-p)e^{it}}$|
|Exponentielle $\mathcal{E}(\lambda)$|$\frac{\lambda}{\lambda - it}$|
|Normale $\mathcal{N}(0, 1)$|$e^{-t^2/2}$|
|Normale $\mathcal{N}(m, \sigma^2)$|$e^{itm - \frac{\sigma^2 t^2}{2}}$|
|Gamma $\Gamma(\alpha, \beta)$|$\left( \frac{\beta}{\beta - it} \right)^\alpha$|
### Propriété : somme de variables indépendantes
Si $X \perp Y$, alors :
$\varphi_{X+Y}(t) = \varphi_X(t) \cdot \varphi_Y(t)$
### Cas particulier : loi normale
Si $X_1 \sim \mathcal{N}(m_1, \sigma_1^2)$, $X_2 \sim \mathcal{N}(m_2, \sigma_2^2)$ indépendantes, alors :
$X_1 + X_2 \sim \mathcal{N}(m_1 + m_2, \sigma_1^2 + \sigma_2^2)$
---
# Vecteurs aléatoires
### Définition
Un **vecteur aléatoire** de dimension $d$ est une application :
$X = (X_1, \dots, X_d) : \Omega \to \mathbb{R}^d$
où chaque composante $X_i$ est une variable aléatoire réelle.
---
### Loi d’un vecteur aléatoire
- **Cas discret** : la loi est donnée par
    
    $\mathbb{P}(X_1 = x_1, \dots, X_d = x_d)$
    
- **Cas continu** : la loi est donnée par une **densité jointe** $f_{X_1,\dots,X_d}(x_1,\dots,x_d)$
---
### Lois marginales
Ce sont les lois de chaque composante $X_i$ individuellement. Elles sont obtenues par marginalisation de la loi conjointe :
$f_{X_i}(x_i) = \int f_{X_1,\dots,X_d}(x_1,\dots,x_d) \, dx_1\cdots dx_{i-1}dx_{i+1}\cdots dx_d$
---
## Espérance et matrice de covariance
### **Espérance** :
$\mathbb{E}(X) = (\mathbb{E}(X_1), \dots, \mathbb{E}(X_d))$
### **Matrice de variance-covariance** :
$\Sigma = \left( \mathrm{Cov}(X_i, X_j) \right)_{1 \leq i,j \leq d}  
\quad \text{où } \mathrm{Cov}(X_i, X_j) = \mathbb{E}(X_i X_j) - \mathbb{E}(X_i)\mathbb{E}(X_j)$
- Elle est **symétrique** et **semi-définie positive**.
---
### Indépendance
Deux composantes $X_i$ et $X_j$ sont **indépendantes** ssi :
$\mathbb{P}(X_i \leq a, X_j \leq b) = \mathbb{P}(X_i \leq a)\mathbb{P}(X_j \leq b)$
Et dans le cas continu :
$f_{X_i,X_j}(x,y) = f_{X_i}(x)f_{X_j}(y)$
Cela **implique** que $\mathrm{Cov}(X_i, X_j) = 0$, mais la réciproque est fausse en général.
---
### Fonction caractéristique du vecteur aléatoire
Pour $t \in \mathbb{R}^d$, on définit :
$\varphi_X(t) = \mathbb{E}(e^{i t \cdot X}) = \mathbb{E}(e^{i(t_1 X_1 + \cdots + t_d X_d)})$
Si $X_1, \dots, X_d$ sont indépendantes, alors :
$\varphi_X(t) = \prod_{j=1}^d \varphi_{X_j}(t_j)$
---
## Vecteur gaussien
Un vecteur $X = (X_1, \dots, X_d)$ est **gaussien** si toute combinaison linéaire $a^T X$ est une variable aléatoire gaussienne (loi normale).
- Il est entièrement caractérisé par son espérance $m \in \mathbb{R}^d$2 et sa matrice de covariance $\Sigma \in \mathbb{R}^{d \times d}$.
- Sa densité est :
$f(x) = \frac{1}{(2\pi)^{d/2} \sqrt{\det \Sigma}} \exp\left( -\frac{1}{2}(x - m)^T \Sigma^{-1}(x - m) \right)$
### Propriétés
- Si $\Sigma$ est **diagonale**, alors les composantes sont indépendantes.
- Si $X \sim \mathcal{N}_d(m, \Sigma)$ et $A \in \mathbb{R}^{p \times d}$, alors :
$AX \sim \mathcal{N}_p(Am, A \Sigma A^T)$
---
# Théorèmes de convergence & Théorème central limite
## Modes de convergence
### **Convergence presque sûre (p.s.)**
$X_n \xrightarrow{p.s.} X \quad \Longleftrightarrow \quad \mathbb{P}\left( \lim_{n \to \infty} X_n = X \right) = 1$
C’est la forme de convergence **la plus forte** (convergence point par point sauf sur un ensemble négligeable).
---
### **Convergence en probabilité**
$X_n \xrightarrow{\mathbb{P}} X \quad \Longleftrightarrow \quad \forall \varepsilon > 0, \quad \lim_{n \to \infty} \mathbb{P}(|X_n - X| \geq \varepsilon) = 0$
Elle signifie que la probabilité que $X_n$ s’éloigne de $X$ devient négligeable quand $n \to \infty$.
---
### **Convergence en loi**
$X_n \xrightarrow{\mathcal{L}} X \quad \Longleftrightarrow \quad \forall x \text{ point de continuité de } F_X, \quad F_{X_n}(x) \to F_X(x)$
Concerne **la distribution** (et non les valeurs) des variables.
---
### **Convergence en** $L^1$
$X_n \xrightarrow{L^1} X \quad \Longleftrightarrow \quad \mathbb{E}(|X_n - X|) \to 0$
---
### **Convergence en** $L^2$ **(ou moyenne quadratique)**
$X_n \xrightarrow{L^2} X \quad \Longleftrightarrow \quad \mathbb{E}(|X_n - X|^2) \to 0$
---
## Liens entre convergences
- $p.s. \Rightarrow \mathbb{P} \Rightarrow \mathcal{L}$
- $L^2 \Rightarrow L^1 \Rightarrow \mathbb{P} \Rightarrow \mathcal{L}$
---
# Théorèmes importants
### **Théorème de Slutsky**
Si :
- $X_n \xrightarrow{\mathcal{L}} X$
- $Y_n \xrightarrow{\mathbb{P}} c \in \mathbb{R}$
Alors :
$(X_n, Y_n) \xrightarrow{\mathcal{L}} (X, c)$
---
### **Théorème de Lévy (convergence via fonction caractéristique)**
$X_n \xrightarrow{\mathcal{L}} X \quad \Longleftrightarrow \quad \varphi_{X_n}(t) \to \varphi_X(t) \quad \forall t \in \mathbb{R}$
---
## Théorème Central Limite (TCL)
### **Version unidimensionnelle (classique)**
Soient $X_1, X_2, \dots$ des v.a. i.i.d. avec :
- $\mathbb{E}(X_i) = \mu$
- $\mathrm{Var}(X_i) = \sigma^2 < +\infty$
Alors :
$\frac{\bar{X}_n - \mu}{\sigma / \sqrt{n}} \xrightarrow{\mathcal{L}} \mathcal{N}(0, 1)$
où $\bar{X}n = \frac{1}{n} \sum{i=1}^n X_i$
### **Version multidimensionnelle**
Soient $X_i \in \mathbb{R}^d$, i.i.d., avec $\mathbb{E}(X_i) = m \in \mathbb{R}^d$, $\mathrm{Cov}(X_i) = \Sigma$.
Alors :
$\sqrt{n} \left( \frac{1}{n} \sum_{i=1}^n X_i - m \right) \xrightarrow{\mathcal{L}} \mathcal{N}_d(0, \Sigma)$
### **Application statistique**
- Permet de construire des **intervalles de confiance** pour une moyenne.
- Fournit la **vitesse de convergence** $\sim \frac{1}{\sqrt{n}}$.
---
# **Les moments d’une variable aléatoire**
### Moment d’ordre $k$

> C’est l’espérance de la puissance $k$-ième de $X$
Soit $X$ une variable aléatoire réelle, son moment d’ordre $k \in \mathbb{N}^*$ est :
$m_k = E(X^k)$
### Moment centré d’ordre $k$

> Mesure la dispersion autour de la moyenne.
$m'_k = E\left((X - E(X))^k\right)$
Le moment centré d’ordre 2 est la variance.
### **Méthode des moments** (en estimation)
Idée : on remplace les moments théoriques $E(X^k)$ par leurs versions empiriques :
$\frac{1}{n} \sum_{i=1}^n X_i^k$
On identifie les paramètres du modèle en égalant moments théoriques et empiriques.
### **Lien avec fonction caractéristique**
Le développement en série de la fonction caractéristique permet d’extraire les moments :
$\varphi(t) = 1 + it E(X) + \frac{(it)^2}{2!} E(X^2) + \cdots + \frac{(it)^k}{k!} E(X^k) + \cdots$
Donc, si $\varphi^{(k)}(0)$ existe, alors :
$\varphi^{(k)}(0) = i^k E(X^k)$
### Propriétés utiles
- $E(X - m)^2 = V(X)$
- Si $X \sim \mathcal{N}(m, \sigma^2)$, tous les moments existent
- Si $X$ n’a pas de $E(|X|^k) < +\infty$, le moment d’ordre $k$ **n'existe pas**
## Méthode des moments
### Principe
On remplace les **moments théoriques** $E(X), E(X^2), ...$ par les **moments empiriques** $\bar{X}_n, \frac{1}{n} \sum X_i^2, ...$, puis on résout l’équation.
---
# Estimation
## Définitions formelles
### **Estimateur**
Un **estimateur** est une fonction mesurable :
$\hat{\theta} : H^n \to \mathbb{R}^d$
qui associe à un échantillon $(X_1, ..., X_n)$ une estimation du paramètre $\theta$ d’un modèle.
### **Biais**
Le **biais** d’un estimateur $\hat{\theta}$ de $g(\theta)$ est :
$b(\hat{\theta}) = \mathbb{E}[\hat{\theta}] - g(\theta)$
### **Estimateur sans biais**
$\hat{\theta} \text{ est sans biais} \quad \Longleftrightarrow \quad \mathbb{E}[\hat{\theta}] = g(\theta)$
### **Estimateur convergent**
$\hat{\theta}_n \xrightarrow{\mathbb{P}} \theta \quad \text{(quand } n \to \infty)$
i.e. l’estimateur tend vers la vraie valeur du paramètre en probabilité.
### **Estimateur fortement convergent**
$\hat{\theta}_n \xrightarrow{p.s.} \theta$
Plus fort que la convergence en probabilité.
### **Estimateur efficace**
Un estimateur sans biais $\hat{\theta}$ est **efficace** si :
$\mathrm{Var}(\hat{\theta}) = \frac{1}{I_n(\theta)}$
où $I_n(\theta)$ est l'information de Fisher sur l’échantillon.
---
## Maximum de vraisemblance (EMV)
### Définition
Soit un échantillon $(X_1, ..., X_n)$ i.i.d. de densité $f(x, \theta)$.  
La **fonction de vraisemblance** est :
$L(\theta) = \prod_{i=1}^n f(X_i, \theta)$
On cherche à maximiser $L(\theta)$, ce qui revient à maximiser la **log-vraisemblance** :
$\ell(\theta) = \log L(\theta) = \sum_{i=1}^n \log f(X_i, \theta)$
L’**estimateur du maximum de vraisemblance** $\hat{\theta}_{\text{EMV}}$ est défini par :
$\hat{\theta}{\text{EMV}} = \arg\max{\theta} \ell(\theta)$
---
## Information de Fisher
### Définition (cas univarié)
Pour une densité $f(x, \theta) > 0$, l’**information de Fisher** est :
$I(\theta) = \mathbb{E}\left[ \left( \frac{\partial}{\partial \theta} \log f(X, \theta) \right)^2 \right]$
Autre expression (si $f$ est $\mathcal{C}^2$) :
$I(\theta) = -\mathbb{E}\left[ \frac{\partial^2}{\partial \theta^2} \log f(X, \theta) \right]$
### Cas multivarié
Si $X_1, ..., X_n$ sont i.i.d., alors l'information de Fisher de l’échantillon est :
$I_n(\theta) = n \cdot I(\theta)$
---
## Inégalité de Cramér-Rao (FDCR)
Soit $T$ un estimateur **sans biais** de $g(\theta)$, alors :
$\mathrm{Var}(T) \geq \frac{[g'(\theta)]^2}{I_n(\theta)}$
- Elle donne une **borne inférieure** sur la variance d’un estimateur sans biais.
- Lorsque cette borne est **atteinte**, on dit que $T$ est **efficace**.
---
# Démonstrations
## **Propriété sans mémoire**
### Loi exponentielle
Soit $X \sim \text{Exp}(\lambda)$, on veut montrer :
$\forall s, t \geq 0, \quad \mathbb{P}(X > s + t \mid X > t) = \mathbb{P}(X > s)$
Par définition de la probabilité conditionnelle :
$\mathbb{P}(X > s + t \mid X > t) = \frac{\mathbb{P}(X > s + t)}{\mathbb{P}(X > t)}$
Or, pour la loi exponentielle :
$\mathbb{P}(X > x) = \int_x^{+\infty} \lambda e^{-\lambda u} du = e^{-\lambda x}$
Donc :
$\frac{\mathbb{P}(X > s + t)}{\mathbb{P}(X > t)} = \frac{e^{-\lambda(s + t)}}{e^{-\lambda t}} = e^{-\lambda s} = \mathbb{P}(X > s)  
\quad$
---
### Loi géométrique
Soit $X \sim \text{Géom}(p)$ avec support $\mathbb{N}^*$, on veut montrer :
$\forall k, n \in \mathbb{N}, \quad \mathbb{P}(X > n + k \mid X > k) = \mathbb{P}(X > n)$
**Démonstration :**
Par définition :
$\mathbb{P}(X > m) = \sum_{r = m+1}^{\infty} p (1-p)^{r-1} = (1 - p)^m$
Donc :
$\mathbb{P}(X > n + k \mid X > k) = \frac{\mathbb{P}(X > n + k)}{\mathbb{P}(X > k)} = \frac{(1 - p)^{n + k}}{(1 - p)^k} = (1 - p)^n = \mathbb{P}(X > n)$
---
## **Information de Fisher - loi exponentielle**
Soit $X \sim \text{Exp}(\lambda)$, densité :
$f(x, \lambda) = \lambda e^{-\lambda x}, \quad x \geq 0$
### Objectif :
Calculer l'information de Fisher :
$I(\lambda) = \mathbb{E}\left[\left( \frac{\partial}{\partial \lambda} \log f(X, \lambda) \right)^2\right]$
### Étape 1 : Calcul de la log-vraisemblance
$\log f(X, \lambda) = \log \lambda - \lambda X \Longrightarrow \frac{\partial}{\partial \lambda} \log f(X, \lambda) = \frac{1}{\lambda} - X$
### Étape 2 : Carré du score
$\left( \frac{1}{\lambda} - X \right)^2 = \frac{1}{\lambda^2} - \frac{2X}{\lambda} + X^2$
### Étape 3 : Espérance
On connaît :
- $\mathbb{E}(X) = \frac{1}{\lambda}$
- $\mathbb{E}(X^2) = \frac{2}{\lambda^2}$
Donc :
$I(\lambda) = \mathbb{E}\left[ \left( \frac{1}{\lambda} - X \right)^2 \right]  
= \frac{1}{\lambda^2} - \frac{2}{\lambda^2} + \frac{2}{\lambda^2} = \frac{1}{\lambda^2}$
---
# Autres
## **Montrer qu’un vecteur est gaussien**
### Définition
Un vecteur aléatoire $X = (X_1, \dots, X_d)^T$ est **gaussien** si toute combinaison linéaire :
$\sum_{i=1}^d a_i X_i = a^T X$
suit une loi normale (univariée) pour tout $a \in \mathbb{R}^d$.
---
### Méthode 1 : Par combinaison linéaire
Montrer que pour tout $a \in \mathbb{R}^d$, $a^T X \sim \mathcal{N}(m_a, \sigma_a^2)$
### Méthode 2 : Si $X \sim \mathcal{N}(m, \Sigma)$
Densité connue :
$f(x) = \frac{1}{(2\pi)^{d/2} \sqrt{\det \Sigma}} \exp\left(-\frac{1}{2}(x - m)^T \Sigma^{-1}(x - m)\right)$
### Méthode 3 : Si $X = A Z + b$, avec $Z \sim \mathcal{N}(0, I_d)$
- Toute image affine d’un vecteur gaussien est gaussienne.
### Méthode 4 : Composantes indépendantes normales
- Si $X_1, ..., X_d$ sont normales **indépendantes**, alors $X = (X_1, ..., X_d)^T$ est gaussien.
---
$Intervalles de confiance$
On cherche un intervalle $IC_{1-\alpha}$ tel que :
$\mathbb{P}(\theta \in IC_{1-\alpha}) = 1 - \alpha$
---
## Intervalles de Confiance
### **1. IC pour la moyenne** $\mu$**, variance** $\sigma^2$ **connue**
### Hypothèses :
- $X_i \sim \mathcal{N}(\mu, \sigma^2)$
- $\sigma^2$ connue
### Résultat :
$\bar{X}_n \in \left[ \bar{X}n - z{1 - \alpha/2} \cdot \frac{\sigma}{\sqrt{n}},\; \bar{X}n + z{1 - \alpha/2} \cdot \frac{\sigma}{\sqrt{n}} \right]$
Utilise la **loi normale centrée réduite**
---
### **2. IC pour** $\mu$**, variance** $\sigma^2$ **inconnue**
### Hypothèses :
- $X_i \sim \mathcal{N}(\mu, \sigma^2)$
- $\sigma^2$ inconnue
### Statistiques :
- Moyenne : $\bar{X}_n = \frac{1}{n} \sum X_i$
- Variance : $S_n^2 = \frac{1}{n-1} \sum (X_i - \bar{X}_n)^2$
### Résultat :
$\bar{X}_n \in \left[ \bar{X}n - t{n-1, 1 - \alpha/2} \cdot \frac{S_n}{\sqrt{n}},\; \bar{X}n + t{n-1, 1 - \alpha/2} \cdot \frac{S_n}{\sqrt{n}} \right]$
Utilise la loi de **Student à** $n - 1$ **ddl**  
Si $n > 30$, on peut approximer par la normale.
---
### **3. IC pour** $\sigma^2$**, moyenne** $\mu$ **connue**
### Statistique :
$S_n^{*2} = \frac{1}{n} \sum (X_i - \mu)^2$
### Résultat :
$\sigma^2 \in \left[ \frac{n S_n^{*2}}{\chi^2_{1 - \alpha/2}},\; \frac{n S_n^{*2}}{\chi^2_{\alpha/2}} \right]$
Utilise la loi $\chi^2_n$
---
### **4. IC pour** $\sigma^2$**, moyenne** $\mu$ **inconnue**
### Statistique :
$S_n^2 = \frac{1}{n-1} \sum (X_i - \bar{X}_n)^2$
### Résultat :
$\sigma^2 \in \left[ \frac{(n - 1) S_n^2}{\chi^2_{1 - \alpha/2}},\; \frac{(n - 1) S_n^2}{\chi^2_{\alpha/2}} \right]$
Utilise la loi $\chi^2_{n - 1}$
---
### Remarques générales
- Dans tous les cas, les bornes sont données par :
    
    $\text{statistique observée} \quad \text{× (quantile inverse de la loi pivot)}$
    
- Bien connaître les quantiles :
    - $z_{1 - \alpha/2}$ (normale)
    - $t_{n - 1, 1 - \alpha/2}$
    - $\chi^2_{1 - \alpha/2}$, etc.
---