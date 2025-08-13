---
title: Probabilité
Matière:
  - "[[Probabilité et Statistiques]]"
Type: Notes
Date du cours: 2025-02-17
Supports:
  - "[[chapitre1.pdf]]"
  - "[[chapitre1complements.pdf]]"
---
# Séance 1
**Date**: 17 février 2025
**Source**: Image/SCIA EPITA
## 1. Probabilités
### Généralités
- **Expérience aléatoire** : Issue imprévisible mais dont toutes les possibilités sont connues (ex: lancer de dés, tirage de Bernoulli).
- Origine : _alea_ (latin pour "jeu de dés").
### Situation élémentaire
- **Univers** (Ω) : Ensemble des issues possibles $\{ω₁, ..., ωₙ\}$.
- **Loi de probabilité** : Probabilités associées $p_i$ (avec $\sum p_i = 1$ ).
- **Événement** : Sous-ensemble de $Ω$. Sa probabilité est la somme des $p_i$ des issues le composant.
### Exemples
- Lancer de pièce/dé.
- Tirage de Bernoulli (Succès/Échec).
- Choix aléatoire dans une population.
### Concepts clés
- **Équiprobabilité** : Toutes les issues ont la même probabilité.
- **Indépendance** : $P(A \cap B) = P(A) \times P(B)$.
### Conditionnement
- Probabilité conditionnelle :
$P_A(B) = \frac{P(A \cap B)}{P(A)}$
- **Formule de Bayes** :
$P_B(A) = \frac{P_A(B) \cdot P(A)}{P_A(B) \cdot P(A) + P_{\overline{A}}(B) \cdot P(\overline{A})}$
---
## 2. Lois Discrètes Usuelles
### Variables Aléatoires Discrètes
- **Définition** : Fonction $X: Ω → ℝ$ prenant des valeurs $x_i$ avec probabilités $p_i = P(X = x_i)$.
- **Espérance** :
$E(X) = \sum p_i x_i$
- **Variance** :
$V(X) = \sum p_i (x_i - E(X))^2$
- **Écart-type** : $\sigma(X) = \sqrt{V(X)}$.
### Lois Usuelles
1. **Loi de Bernoulli** $B(p)$ :
    - Valeurs : $0$ (échec) ou $1$ (succès).
    - $E(X) = p$, $V(X) = p(1-p)$.
2. **Loi Binomiale** $B(n, p)$ :
    - Nombre de succès en $n$ tirages indépendants.
    - $P(X=k) = \binom{n}{k} p^k (1-p)^{n-k}$.
    - $E(X) = np$, $V(X) = np(1-p)$.
3. **Loi Géométrique** $G(p)$ :
    - Nombre d'essais avant le premier succès.
    - $P(X=k) = (1-p)^{k-1} p$.
    - $E(X) = \frac{1}{p}, V(X) = \frac{1-p}{p^2}$.
4. **Loi de Poisson** $P(\lambda)$ :
    - Modélisation d'événements rares.
    - $P(X=k) = e^{-\lambda} \frac{\lambda^k}{k!}$.
    - $E(X) = V(X) = \lambda$.
---
## 3. Lois Continues
### Cadre
- **Variable aléatoire continue** : Prend des valeurs dans un intervalle $I$.
- **Densité de probabilité** f(x) :
    - $f(x) \geq 0$, $\int_I f(x)dx = 1$.
    - $P(a \leq X \leq b) = \int_a^b f(x)dx$.
### Fonction de Répartition
- $F_X(x) = P(X \leq x) = \int_{-\infty}^x f(t)dt$.
- **Fonction de survie** : $R_X(x) = 1 - F_X(x)$.
### Espérance et Variance
- **Espérance** : $E(X) = \int_I x f(x)dx$ (si intégrable).
- **Variance** : $V(X) = E(X^2) - E(X)^2$.
---
## 4. Lois Continues Usuelles
### Loi Uniforme $\mathcal{U}([a, b])$
- **Densité** :
$f(x) = \begin{cases}  
\frac{1}{b-a} & \text{si } x \in [a, b] \\  
0 & \text{sinon}  
\end{cases}$
- **Espérance** : $E(X) = \frac{a+b}{2}$.
- **Variance** : $V(X) = \frac{(b-a)^2}{12}$.
- **Application** : Modélisation d'événements équiprobables dans un intervalle (ex: attente entre 2 et 5 minutes).
---
### Loi Exponentielle $\mathcal{E}(\lambda)$
- **Densité** :
$f(x) = \begin{cases}  
\lambda e^{-\lambda x} & \text{si } x \geq 0 \\  
0 & \text{sinon}  
\end{cases}$
- **Espérance** : $E(X) = \frac{1}{\lambda}$.
- **Variance** : $V(X) = \frac{1}{\lambda^2}$.
- **Propriété clé** : _Sans mémoire_ :
$P(T > s + t \mid T > t) = P(T > s)$
- **Application** : Durée de vie sans vieillissement (ex: temps entre arrêts de bus).
---
### Loi Normale
### Loi Normale Centrée Réduite $\mathcal{N}(0, 1)$
- **Densité** :
$f(x) = \frac{1}{\sqrt{2\pi}} e^{-\frac{x^2}{2}}$
- **Propriétés** :
    - $P(X \leq 0) = 0.5$.
    - Symétrie : $P(X \leq -a) = P(X \geq a)$.
    - Intervalles clés :
        - $P(-1.96 \leq X \leq 1.96) \approx 0.95$.
        - $P(-2.58 \leq X \leq 2.58) \approx 0.99$.
### Loi Normale $\mathcal{N}(\mu, \sigma^2)$
- **Densité** :
$f(x) = \frac{1}{\sigma\sqrt{2\pi}} e^{-\frac{(x-\mu)^2}{2\sigma^2}}$
- **Standardisation** : Si $X \sim \mathcal{N}(\mu, \sigma^2)$, alors $\frac{X-\mu}{\sigma} \sim \mathcal{N}(0, 1)$.
- **Intervalles empiriques** :
    - $P(\mu - \sigma \leq X \leq \mu + \sigma) \approx 68.3\%$.
    - $P(\mu - 2\sigma \leq X \leq \mu + 2\sigma) \approx 95.4\%$.
    - $P(\mu - 3\sigma \leq X \leq \mu + 3\sigma) \approx 99.7\%$.
---
## 5. Théorèmes Importants
### Théorème de Transfert
- **Cas continu** : Pour $g$ mesurable et $X$ intégrable :
$E(g(X)) = \int_I g(x)f(x)dx$
- **Cas discret** : $E(g(X)) = \sum g(x_i) p_i$.
- **Exemple** : Calcul de $E(X^2)$ pour la variance.
### Formule du Changement de Variable
- **Conditions** :
    - $f(x) > 0$ sur un intervalle ouvert $I$.
    - $g$ bijective et dérivable sur $I$.
- **Densité de** $Y = g(X)$ :
$f_Y(y) = \frac{1}{|g'(g^{-1}(y))|} f(g^{-1}(y))$
---
## Résumé des Notations
|   |   |   |   |
|---|---|---|---|
|Lois|Notation|Espérance|Variance|
|Bernoulli|$B(p)$|$p$|$p(1-p)$|
|Binomiale|$B(n, p)$|$np$|$np(1-p)$|
|Géométrique|$G(p)$|$\frac{1}{p}$|$\frac{1-p}{p^2}$|
|Poisson|$P(\lambda)$|$\lambda$|$\lambda$|
|Uniforme|$\mathcal{U}([a, b])$|$\frac{a+b}{2}$|$\frac{(b-a)^2}{12}$|
|Exponentielle|$\mathcal{E}(\lambda)$|$\frac{1}{\lambda}$|$\frac{1}{\lambda^2}$|
|Normale|$\mathcal{N}(\mu, \sigma^2)$|$\mu$|$\sigma^2$|
---
### Conseils pour les Exercices
1. **Loi Binomiale** : Vérifier l'indépendance des tirages.
2. **Loi Exponentielle** : Exploiter la propriété de "non-vieillissement".
3. **Loi Normale** : Toujours standardiser pour utiliser les tables \( \mathcal{N}(0, 1) \).
---
# Séance 2
**Date**: 26 février 2025
**Source**: Image SCIA EPITA
---
## 1. Fonction Caractéristique
### Définition
- Pour une variable aléatoire $X$, la fonction caractéristique est définie par :
$\phi_X(t) = E(e^{itX}) \quad \text{pour } t \in \mathbb{R}$
- Pour un vecteur aléatoire $X = (X_1, \ldots, X_p)$, elle devient :
$\phi_X(t) = E(e^{it \cdot X}) \quad \text{pour } t \in \mathbb{R}^p$
### Propriétés
- Caractérise la loi d'une variable aléatoire :
$\phi_X = \phi_Y \implies X \text{ et } Y \text{ ont même loi}.$
- Utile pour étudier les sommes de variables aléatoires indépendantes.
---
## 2. Vecteurs Aléatoires
### Définition
- Un vecteur aléatoire est une fonction de l'univers $\Omega$ dans $\mathbb{R}^d$.
### Loi Conjointe
- **Cas discret** : Probabilités $\mathbb{P}(X_1 = x_1, \ldots, X_d = x_d)$.
- **Cas continu** : Densité jointe $f(x_1, \ldots, x_d)$ vérifiant :
$f(x_1, \ldots, x_d) \geq 0 \quad \text{et} \quad \int_{\mathbb{R}^d} f(x_1, \ldots, x_d) \, dx_1 \ldots dx_d = 1$
### Lois Marginales
- Lois individuelles des composantes $X_i$.
- **Attention** : La loi conjointe ne peut pas être déduite des lois marginales sans hypothèses supplémentaires.
---
## 3. Indépendance de Variables Aléatoires
### Cas Discret
- Deux variables $X$ et $Y$ sont indépendantes si :
$\mathbb{P}(X = x, Y = y) = \mathbb{P}(X = x) \cdot \mathbb{P}(Y = y) \quad \forall x, y$
### Cas Continu
- Indépendance équivaut à :
$f_{X,Y}(x, y) = f_X(x) \cdot f_Y(y)$
### Critère par Fonction Caractéristique
- $X$ et $Y$ sont indépendantes si :
$\phi_{X,Y}(t_1, t_2) = \phi_X(t_1) \cdot \phi_Y(t_2)$
---
## 4. Matrice de Covariance et Corrélation
### Matrice de Covariance
- Pour un vecteur $X = (X_1, \ldots, X_d)$, la matrice de covariance $\Sigma$ est définie par :
$\Sigma_{ij} = \text{Cov}(X_i, X_j)$
- **Diagonale** : Variances $\text{Var}(X_i)$.
### Coefficient de Corrélation
- Entre $X_i$ et $X_j$ :
$r_{ij} = \frac{\text{Cov}(X_i, X_j)}{\sigma_i \sigma_j},$
où $\sigma_i$ est l'écart-type de $X_i$.
### Matrice de Corrélation
- Matrice carrée d'ordre $d$ avec les coefficients $r_{ij}$.
---
## 5. Vecteurs Gaussiens
### Définition
- Un vecteur $X = (X_1, \ldots, X_d)$ est gaussien si toute combinaison linéaire de ses composantes est une variable gaussienne.
- **Loi** : Notée $\mathcal{N}_d(m, \Sigma)$, où :
    - $m = (E(X_1), \ldots, E(X_d))$ est le vecteur moyenne.
    - $\Sigma$ est la matrice de covariance.
### Densité
$f(x) = \frac{1}{(2\pi)^{d/2} \sqrt{|\det \Sigma|}} \exp\left( -\frac{1}{2} (x - m)^T \Sigma^{-1} (x - m) \right)$
### Indépendance
- Les composantes $X_1, \ldots, X_d$ sont indépendantes si et seulement si $\Sigma$ est diagonale.
---
## 6. Modes de Convergence
### 1. Convergence Presque Sûre (p.s.)
- **Définition** :  
    La suite $(X_n)$ converge p.s. vers $X$ si :
$P(\lim_{n \to \infty} X_n = X) = 1$
- **Interprétation** : Convergence "point par point" sauf sur un ensemble de probabilité nulle.
- **Exemple** : Loi forte des grands nombres.
### 2. Convergence en Probabilité
- **Définition** :
$\forall \varepsilon > 0, \lim_{n \to \infty} P(|X_n - X| \geq \varepsilon) = 0$
- **Comparaison** :
    - La convergence p.s. implique la convergence en probabilité.
    - Contre-exemple : Marche aléatoire oscillante.
### 3. Convergence en Loi
- **Définition** :
$\lim_{n \to \infty} F_{X_n}(x) = F_X(x) \quad \text{pour tout } x \text{ où } F_X \text{ est continue}$
- **Outils** :
    - Théorème de Paul Lévy : Convergence des fonctions caractéristiques $\phi_{X_n} \to \phi_X$.
### 4. Convergence $L^1$ et $L^2$
- $L^1$ (en moyenne) :
$\lim_{n \to \infty} E(|X_n - X|) = 0$
- $L^2$ (en moyenne quadratique) :
$\lim_{n \to \infty} E(|X_n - X|^2) = 0$
- **Hiérarchie** :
$L^2 \implies L^1 \implies \text{Convergence en probabilité}$
---
## 7. Théorèmes Fondamentaux
### Loi Forte des Grands Nombres
- **Énoncé** :  
    Pour $(X_i)$ i.i.d. avec $E(|X_1|) < \infty$ :
$\frac{X_1 + \dots + X_n}{n} \overset{p.s.}{\to} E(X_1)$
- **Application** : Estimation de la moyenne empirique.
### Théorème Central Limite (TCL)
### Cas Unidimensionnel
- **Énoncé** :  
    Pour $(X_i)$ i.i.d. avec $E(X_i) = m$ et $\text{Var}(X_i) = \sigma^2$ :
$\sqrt{n} \left( \frac{\bar{X}_n - m}{\sigma} \right) \overset{loi}{\to} \mathcal{N}(0, 1)$
- **Interprétation** : Normalisation des sommes pour $n$ grand.
### Cas Multidimensionnel
- **Énoncé** :  
    Pour des vecteurs $(X_i)$ i.i.d. dans $\mathbb{R}^p$ avec moyenne $m$ et matrice de covariance $\Sigma$ :
$\sqrt{n} \left( \frac{1}{n} \sum_{i=1}^n X_i - m \right) \overset{loi}{\to} \mathcal{N}_p(0, \Sigma)$
---
## 8. Applications et Exemples
### Exemple 1 : Simulation de Convergence
- **TCL en pratique** :
    - Générer 1000 tirages de $B(n=30, p=0.4)$.
    - Observer l'histogramme des $\sqrt{n}(\bar{X}_n - p)/\sqrt{p(1-p)}$ vs densité $\mathcal{N}(0,1)$.
### Exemple 2 : Vecteurs Gaussiens
- **Génération** :
    - Si $X \sim \mathcal{N}_d(m, \Sigma)$, alors $AX + b \sim \mathcal{N}_d(Am + b, A\Sigma A^T)$.
- **Usage** : Modélisation de portefeuilles financiers.
---
## Résumé des Concepts Clés
|   |   |   |
|---|---|---|
|**Concept**|**Définition/Formule**|**Implications**|
|**Fonction caractéristique**|$\phi_X(t) = E(e^{itX})$|Caractérise la loi|
|**Indépendance**|$f_{X,Y}(x,y) = f_X(x)f_Y(y)$|Simplifie les calculs joints|
|**Convergence p.s.**|$P(\lim X_n = X) = 1$|Plus forte que en probabilité|
|**TCL**|$\sqrt{n}(\bar{X}_n - m)/\sigma \to \mathcal{N}(0,1)$|Base des intervalles de confiance|
---
### À retenir :
1. **Hiérarchie des convergences** :
$\text{p.s.} \implies \text{Probabilité} \implies \text{Loi}$
1. **TCL** : Fondamental pour les tests statistiques et l'inférence.
2. **Vecteurs gaussiens** : Utilisez les matrices de covariance pour modéliser les dépendances.