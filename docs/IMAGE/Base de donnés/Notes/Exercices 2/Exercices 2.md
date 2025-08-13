---
title: Exercices 2
Matière:
  - "[[Probabilité et Statistiques]]"
Type: TP/TD
Supports:
  - "[[Feuille2.pdf]]"
---
### 📘 **Exercice 3 – Fonction caractéristique**
### Enoncé
1. Déterminer la **fonction caractéristique** de la loi de **Bernoulli(p)**.
2. Déterminer la **fonction caractéristique** de la loi **exponentielle(λ)**.
---
## ✅ **1. Loi de Bernoulli(p)**
Soit X∼Bernoulli(p)X \sim \text{Bernoulli}(p), alors :
P(X=1)=p,P(X=0)=1−pP(X = 1) = p, \quad P(X = 0) = 1 - p
La **fonction caractéristique** est :
ϕX(t)=E(eitX)=(1−p)⋅eit⋅0+p⋅eit⋅1=(1−p)+peit\phi_X(t) = \mathbb{E}\left(e^{itX}\right)  
= (1 - p) \cdot e^{it \cdot 0} + p \cdot e^{it \cdot 1}  
= (1 - p) + p e^{it}
🔹 **Résultat** :
ϕX(t)=(1−p)+peit\phi_X(t) = (1 - p) + p e^{it}
---
## ✅ **2. Loi exponentielle(λ)**
Soit X∼Exp(λ)X \sim \text{Exp}(\lambda) avec densité :
f(x)=λe−λx1x≥0f(x) = \lambda e^{-\lambda x} \mathbf{1}_{x \geq 0}
La **fonction caractéristique** est :
ϕX(t)=E(eitX)=∫0∞eitx⋅λe−λxdx=λ∫0∞e−(λ−it)xdx\phi_X(t) = \mathbb{E}(e^{itX}) = \int_0^{\infty} e^{itx} \cdot \lambda e^{-\lambda x} dx  
= \lambda \int_0^{\infty} e^{-(\lambda - it)x} dx
Cette intégrale converge si λ>0\lambda > 0. Calcul :
ϕX(t)=λ⋅[1λ−it]=λλ−it\phi_X(t) = \lambda \cdot \left[ \frac{1}{\lambda - it} \right] = \frac{\lambda}{\lambda - it}
🔹 **Résultat** :
ϕX(t)=λλ−it\phi_X(t) = \frac{\lambda}{\lambda - it}
---
## 🧠 FICHE DE SYNTHÈSE — À RETENIR POUR LE PARTIEL
### 🧩 Définitions essentielles
- **Fonction caractéristique d'une variable aléatoire X** :
    
    ϕX(t)=E[eitX]\phi_X(t) = \mathbb{E}[e^{itX}]
    
    Elle caractérise complètement la loi de XX et est très utile pour :
    
    - déterminer la loi limite (via convergence),
    - identifier des lois (ex : loi normale, exponentielle),
    - démontrer l’indépendance ou les sommes de variables.
---
### 💡 Propriétés utiles
- **Bernoulli(p)** :
    
    ϕX(t)=(1−p)+peit\phi_X(t) = (1 - p) + p e^{it}
    
- **Exponentielle(λ)** :
    
    ϕX(t)=λλ−it,valide pour t∈R\phi_X(t) = \frac{\lambda}{\lambda - it}, \quad \text{valide pour } t \in \mathbb{R}
    
- La **fonction caractéristique** est toujours **continue**, **bornée (≤ 1)**, et ϕX(0)=1\phi_X(0) = 1.
---
### 🎯 ASTUCES
- Si l'énoncé parle de **somme de variables indépendantes**, **pense à multiplier les fonctions caractéristiques** :
    
    ϕX+Y(t)=ϕX(t)⋅ϕY(t)(si indeˊpendants)\phi_{X + Y}(t) = \phi_X(t) \cdot \phi_Y(t) \quad \text{(si indépendants)}
    
- La **fonction caractéristique d’une loi normale** N(μ,σ2)\mathcal{N}(\mu, \sigma^2) est :
    
    ϕX(t)=exp⁡(iμt−σ2t22)\phi_X(t) = \exp\left(i \mu t - \frac{\sigma^2 t^2}{2} \right)
    
- Pour la **loi exponentielle**, **attention à ne pas confondre avec la densité** : ici, l'intégration se fait avec eitxe^{itx}, ce n’est pas une espérance standard.
---
Parfait, continuons avec l'**Exercice 4 de la Feuille 2** en gardant le même format avec la résolution complète et une fiche de synthèse.
---
### 📘 **Exercice 4 – Somme de lois de Bernoulli**
### Énoncé
Montrer que la **somme de n variables aléatoires indépendantes suivant une loi de Bernoulli de paramètre pp** suit une **loi binomiale** de paramètres nn et pp.
---
## ✅ **Résolution**
Soient X1,X2,…,XnX_1, X_2, \dots, X_n des variables aléatoires indépendantes telles que Xi∼Bernoulli(p)X_i \sim \text{Bernoulli}(p).
On pose :
Sn=X1+X2+⋯+XnS_n = X_1 + X_2 + \cdots + X_n
On cherche la loi de SnS_n. Pour tout k∈{0,1,...,n}k \in \{0, 1, ..., n\}, on veut :
P(Sn=k)P(S_n = k)
Cette probabilité correspond au fait que **exactement kk des XiX_i valent 1**, et n−kn - k valent 0. Il y a (nk)\binom{n}{k} façons de choisir quels kk XiX_i valent 1, et chaque combinaison a une probabilité pk(1−p)n−kp^k (1 - p)^{n - k}.
Donc :
P(Sn=k)=(nk)pk(1−p)n−kP(S_n = k) = \binom{n}{k} p^k (1 - p)^{n - k}
C’est la définition même de la **loi binomiale B(n,p)\mathcal{B}(n, p)**.
---
## 🧠 **FICHE DE SYNTHÈSE – À RETENIR POUR LE PARTIEL**
### 🧩 Définitions importantes
- **Loi de Bernoulli(p)** :
    - X∈{0,1}X \in \{0, 1\}
    - P(X=1)=pP(X = 1) = p, P(X=0)=1−pP(X = 0) = 1 - p
- **Loi binomiale B(n,p)\mathcal{B}(n, p)** :
    - Représente le **nombre de succès** dans **n épreuves de Bernoulli indépendantes**
    - P(Sn=k)=(nk)pk(1−p)n−kP(S_n = k) = \binom{n}{k} p^k (1 - p)^{n - k}
---
### 💡 Propriétés utiles
- Si X1,…,XnBernoulli(p)X_1, \dots, X_n \overset{\text{i.i.d.}}{\sim} \text{Bernoulli}(p), alors :
    
    Sn=∑i=1nXi∼B(n,p)S_n = \sum_{i=1}^n X_i \sim \mathcal{B}(n, p)
    
- Espérance : E(Sn)=np\mathbb{E}(S_n) = np
- Variance : Var(Sn)=np(1−p)\text{Var}(S_n) = np(1 - p)
---
### 🎯 ASTUCES
- Ce résultat est **fondamental** pour comprendre les **comptages** (succès/échecs) dans des expériences répétées (tirages, tests, essais cliniques...).
- Il peut être **généralisé** pour des tirages non indépendants (ex : loi hypergéométrique), mais la **binomiale suppose indépendance et identique distribution**.
- En simulation :
    
    ```Python
    import numpy as np
    np.random.binomial(n, p, size=1000)
    ```
    
---
### 📘 **Exercice 5 – Somme de deux lois normales**
### Enoncé
Soient deux variables aléatoires indépendantes X1∼N(m1,σ12)X_1 \sim \mathcal{N}(m_1, \sigma_1^2) et X2∼N(m2,σ22)X_2 \sim \mathcal{N}(m_2, \sigma_2^2).
Montrer que :
X1+X2∼N(m1+m2,σ12+σ22)X_1 + X_2 \sim \mathcal{N}(m_1 + m_2, \sigma_1^2 + \sigma_2^2)
---
## ✅ **Résolution**
Nous utilisons une **propriété fondamentale des lois normales** :

> La somme de deux variables normales indépendantes est encore une variable normale.
Comme X1X_1 et X2X_2 sont indépendantes et normales, alors :
- X1+X2X_1 + X_2 suit une **loi normale** (même sans connaître leur densité explicitement),
- Son espérance :
    
    E[X1+X2]=E[X1]+E[X2]=m1+m2\mathbb{E}[X_1 + X_2] = \mathbb{E}[X_1] + \mathbb{E}[X_2] = m_1 + m_2
    
- Sa variance (car indépendantes) :
    
    Var(X1+X2)=Var(X1)+Var(X2)=σ12+σ22\text{Var}(X_1 + X_2) = \text{Var}(X_1) + \text{Var}(X_2) = \sigma_1^2 + \sigma_2^2
    
🔹 **Conclusion** :
X1+X2∼N(m1+m2,σ12+σ22)X_1 + X_2 \sim \mathcal{N}(m_1 + m_2, \sigma_1^2 + \sigma_2^2)
---
## 🧠 **FICHE DE SYNTHÈSE – À RETENIR POUR LE PARTIEL**
### 🧩 Définitions essentielles
- **Loi normale N(m,σ2)\mathcal{N}(m, \sigma^2)** :
    - Densité :
        
        f(x)=12πσ2e−(x−m)22σ2f(x) = \frac{1}{\sqrt{2\pi \sigma^2}} e^{ -\frac{(x - m)^2}{2\sigma^2} }
        
    - Espérance : E(X)=m\mathbb{E}(X) = m
    - Variance : Var(X)=σ2\text{Var}(X) = \sigma^2
---
### 💡 Propriétés fondamentales
- **Somme de deux normales indépendantes** :
    
    X∼N(m1,σ12),Y∼N(m2,σ22)⇒X+Y∼N(m1+m2,σ12+σ22)X \sim \mathcal{N}(m_1, \sigma_1^2), \quad Y \sim \mathcal{N}(m_2, \sigma_2^2) \Rightarrow X + Y \sim \mathcal{N}(m_1 + m_2, \sigma_1^2 + \sigma_2^2)
    
- Cela se généralise à la somme de nn normales indépendantes :
    
    ∑i=1nXi∼N(∑mi,∑σi2)\sum_{i=1}^n X_i \sim \mathcal{N}\left(\sum m_i, \sum \sigma_i^2\right)
    
---
### 🎯 ASTUCES
- **Attention : l’indépendance est cruciale** pour que les variances s’ajoutent.
- Pour prouver qu’une somme suit une normale, on peut aussi :
    - Utiliser les **fonctions caractéristiques** :
        
        ϕX+Y(t)=ϕX(t)⋅ϕY(t)\phi_{X + Y}(t) = \phi_X(t) \cdot \phi_Y(t)
        
    - Ou les **transformations linéaires** d’un vecteur gaussien.
- Ce résultat est souvent utilisé en **théorie des erreurs**, **statistiques**, **inférences**, ou pour des **modèles de bruit**.
---
### 📘 **Exercice 6 – Minimum de lois exponentielles**
### Enoncé
Soient deux variables aléatoires indépendantes X1∼Exp(λ1)X_1 \sim \text{Exp}(\lambda_1) et X2∼Exp(λ2)X_2 \sim \text{Exp}(\lambda_2).
Montrer que :
min⁡(X1,X2)∼Exp(λ1+λ2)\min(X_1, X_2) \sim \text{Exp}(\lambda_1 + \lambda_2)
---
## ✅ **Résolution**
Soit Z=min⁡(X1,X2)Z = \min(X_1, X_2).
On cherche la loi de ZZ.
On commence par calculer la **fonction de répartition** FZ(t)=P(Z≤t)F_Z(t) = \mathbb{P}(Z \leq t). On utilise le complément :
P(Z>t)=P(X1>t et X2>t)=P(X1>t)⋅P(X2>t)(indeˊpendance)\mathbb{P}(Z > t) = \mathbb{P}(X_1 > t \text{ et } X_2 > t)  
= \mathbb{P}(X_1 > t) \cdot \mathbb{P}(X_2 > t) \quad \text{(indépendance)}
Or pour une loi exponentielle :
P(Xi>t)=e−λit\mathbb{P}(X_i > t) = e^{-\lambda_i t}
Donc :
P(Z>t)=e−λ1t⋅e−λ2t=e−(λ1+λ2)t\mathbb{P}(Z > t) = e^{-\lambda_1 t} \cdot e^{-\lambda_2 t} = e^{-(\lambda_1 + \lambda_2)t}
Donc la fonction de répartition de ZZ est :
FZ(t)=1−e−(λ1+λ2)tF_Z(t) = 1 - e^{-(\lambda_1 + \lambda_2)t}
C’est la fonction de répartition d’une loi **exponentielle de paramètre λ1+λ2\lambda_1 + \lambda_2**.
🔹 **Conclusion** :
min⁡(X1,X2)∼Exp(λ1+λ2)\min(X_1, X_2) \sim \text{Exp}(\lambda_1 + \lambda_2)
---
## 🧠 **FICHE DE SYNTHÈSE – À RETENIR POUR LE PARTIEL**
### 🧩 Définitions
- **Loi exponentielle Exp(λ)\text{Exp}(\lambda)** :
    - Densité : f(x)=λe−λx1x≥0f(x) = \lambda e^{-\lambda x} \mathbf{1}_{x \geq 0}
    - Espérance : E(X)=1λ\mathbb{E}(X) = \frac{1}{\lambda}
    - Variance : Var(X)=1λ2\text{Var}(X) = \frac{1}{\lambda^2}
---
### 💡 Propriétés clés
- Pour deux variables exponentielles **indépendantes**, la **valeur minimale** suit une **exponentielle de paramètre égal à la somme des paramètres** :
    
    min⁡(X1,X2)∼Exp(λ1+λ2)\min(X_1, X_2) \sim \text{Exp}(\lambda_1 + \lambda_2)
    
- Plus généralement :
    
    Si X1,…,Xn∼Exp(λi)X_1, \dots, X_n \sim \text{Exp}(\lambda_i), alors :
    
    min⁡(X1,…,Xn)∼Exp(λ1+⋯+λn)\min(X_1, \dots, X_n) \sim \text{Exp}(\lambda_1 + \dots + \lambda_n)
    
---
### 🎯 ASTUCES
- Très utile en **fiabilité** ou en **file d’attente** : le minimum correspond au **premier événement** qui se produit.
- Cette propriété est liée à la **mémoire sans mémoire** de l’exponentielle :
    
    P(X>t+s∣X>s)=P(X>t)\mathbb{P}(X > t + s \mid X > s) = \mathbb{P}(X > t)
    
- Pour **simuler le temps d’attente jusqu’au premier événement parmi plusieurs** :
    - Tirer une exponentielle de paramètre λ1+λ2+…\lambda_1 + \lambda_2 + \dots
    - Choisir l’origine du minimum de manière aléatoire pondérée (probas proportionnelles aux λ)
---
### 📘 **Exercice 11 — Une loi faible des grands nombres**
### Énoncé
Soit (Xn)n≥1(X_n)_{n \geq 1} une suite de variables aléatoires :
- Dans L2L^2 (c’est-à-dire avec variance finie),
- **Centrées** : E(Xn)=0\mathbb{E}(X_n) = 0,
- **Deux à deux non corrélées** : Cov(Xi,Xj)=0\text{Cov}(X_i, X_j) = 0 pour i≠ji \neq j.
On définit :
Sn=∑k=1nXkS_n = \sum_{k=1}^n X_k
Et on suppose :
1n∑k=1nVar(Xk)⟶0\frac{1}{n} \sum_{k=1}^n \text{Var}(X_k) \longrightarrow 0
Montrer que :
Snn⟶0en moyenne quadratique\frac{S_n}{n} \longrightarrow 0 \quad \text{en moyenne quadratique}
---
## ✅ **Résolution détaillée**
On veut montrer que :
E[(Snn)2]→n→∞0\mathbb{E}\left[\left( \frac{S_n}{n} \right)^2\right] \xrightarrow[n \to \infty]{} 0
Or, comme E[Xk]=0\mathbb{E}[X_k] = 0, on a :
E[(Snn)2]=1n2E[Sn2]=1n2Var(Sn)\mathbb{E}\left[\left( \frac{S_n}{n} \right)^2\right] = \frac{1}{n^2} \mathbb{E}[S_n^2] = \frac{1}{n^2} \text{Var}(S_n)
Comme les XkX_k sont deux à deux non corrélées, alors :
Var(Sn)=∑k=1nVar(Xk)\text{Var}(S_n) = \sum_{k=1}^n \text{Var}(X_k)
Donc :
E[(Snn)2]=1n2∑k=1nVar(Xk)=1n⋅(1n∑k=1nVar(Xk))\mathbb{E}\left[\left( \frac{S_n}{n} \right)^2\right] = \frac{1}{n^2} \sum_{k=1}^n \text{Var}(X_k) = \frac{1}{n} \cdot \left( \frac{1}{n} \sum_{k=1}^n \text{Var}(X_k) \right)
Et l’hypothèse de l’exercice dit que :
1n∑k=1nVar(Xk)⟶0\frac{1}{n} \sum_{k=1}^n \text{Var}(X_k) \longrightarrow 0
Donc :
E[(Snn)2]⟶0\mathbb{E}\left[\left( \frac{S_n}{n} \right)^2\right] \longrightarrow 0
🔹 **Conclusion** :
Snn→n→∞L20\frac{S_n}{n} \xrightarrow[n \to \infty]{L^2} 0
---
## 🧠 **FICHE DE SYNTHÈSE – À RETENIR POUR LE PARTIEL**
### 🧩 Définitions clés
- **Convergence en moyenne quadratique (L²)** :
    
    Une suite Xn→XX_n \to X en L2L^2 si :
    
    E[(Xn−X)2]→0\mathbb{E}\left[(X_n - X)^2\right] \to 0
    
- **Non-corrélation** :
    
    Cov(X,Y)=0\text{Cov}(X, Y) = 0 (n’implique pas indépendance, sauf en loi normale).
    
---
### 📌 Propriété illustrée ici (loi faible des grands nombres modifiée)

> Si (Xn)∈L2(X_n) \in L^2, centrées, deux à deux non corrélées, et
> 
> 1n∑Var(Xk)⟶0,\frac{1}{n} \sum \text{Var}(X_k) \longrightarrow 0,
> 
> alors :
> 
> Snn→L20\frac{S_n}{n} \xrightarrow{L^2} 0
---
### 🎯 ASTUCES
- La méthode ici repose uniquement sur la **variance** de la somme et l’**inégalité de Bienaymé** (utilisée implicitement via le calcul d’espérance quadratique).
- Cela montre qu’un comportement "moyen" disparaît si la **variance moyenne** tend vers zéro :
    
    → **Pas besoin d’indépendance**, seulement **non-corrélation**.
    
- Dans un contexte de partiel, toujours vérifier :
    - **Centrage** : E[Xn]=0\mathbb{E}[X_n] = 0,
    - **Var finie** : Xn∈L2X_n \in L^2,
    - **(Non)-corrélation** ou **indépendance**.
---
### 📘 **Exercice 14 — Vecteurs gaussiens et transformation aléatoire**
![[exercice14f2.pdf]]
### Contexte
Soient :
- X∼N(0,1)X \sim \mathcal{N}(0,1) (loi normale centrée réduite),
- ε∈{−1,1}\varepsilon \in \{-1, 1\} telle que P(ε=−1)=P(ε=1)=12\mathbb{P}(\varepsilon = -1) = \mathbb{P}(\varepsilon = 1) = \frac{1}{2},
- ε\varepsilon et XX indépendants,
Et on définit :
Y:=εXY := \varepsilon X
---
### ✅ Résolution détaillée
### **1. Montrer que Y∼N(0,1)Y \sim \mathcal{N}(0,1)**
On utilise la **fonction de répartition** :
FY(x)=P(εX≤x)=12P(−X≤x)+12P(X≤x)=12P(X≥−x)+12P(X≤x)F_Y(x) = \mathbb{P}(\varepsilon X \leq x)  
= \frac{1}{2} \mathbb{P}(-X \leq x) + \frac{1}{2} \mathbb{P}(X \leq x)  
= \frac{1}{2} \mathbb{P}(X \geq -x) + \frac{1}{2} \mathbb{P}(X \leq x)
La loi normale centrée est **symétrique**, donc P(X≤x)=P(X≥−x)\mathbb{P}(X \leq x) = \mathbb{P}(X \geq -x).
Ainsi :
FY(x)=P(X≤x)⇒Y∼N(0,1)F_Y(x) = \mathbb{P}(X \leq x)  
\Rightarrow Y \sim \mathcal{N}(0,1)
---
### **2. Calculer Cov(X,Y)\text{Cov}(X, Y)**
Cov(X,Y)=E[XY]−E[X]E[Y]=E[εX2]\text{Cov}(X, Y) = \mathbb{E}[XY] - \mathbb{E}[X] \mathbb{E}[Y] = \mathbb{E}[\varepsilon X^2]
Par indépendance :
E[εX2]=E[ε]⋅E[X2]=0⋅1=0⇒Cov(X,Y)=0\mathbb{E}[\varepsilon X^2] = \mathbb{E}[\varepsilon] \cdot \mathbb{E}[X^2] = 0 \cdot 1 = 0  
\Rightarrow \text{Cov}(X, Y) = 0
---
### **3. Déterminer la loi de Z:=X+YZ := X + Y**
Deux cas :
- Si ε=1\varepsilon = 1 : Z=2X∼N(0,4)Z = 2X \sim \mathcal{N}(0, 4)
- Si ε=−1\varepsilon = -1 : Z=0Z = 0
Donc ZZ prend la valeur 0 avec probabilité 12\frac{1}{2}, et suit une loi N(0,4)\mathcal{N}(0,4) avec probabilité 12\frac{1}{2}.
Donc la fonction de répartition est :
FZ(z)={12F2X(z)si z<012+12F2X(z)si z≥0F_Z(z) =  
\begin{cases}  
\frac{1}{2} F_{2X}(z) & \text{si } z < 0 \\  
\frac{1}{2} + \frac{1}{2} F_{2X}(z) & \text{si } z \geq 0  
\end{cases}
Cette fonction **présente un saut en 0**, donc **ZZ n’a pas de densité**.
---
### **4. (X,Y)T(X, Y)^T n’est pas un vecteur gaussien**
Car **X+YX + Y** n’a pas une loi normale → contradiction avec la définition d’un **vecteur gaussien**, qui impose que **toute combinaison linéaire** suive une loi normale.
---
## 🧠 FICHE DE SYNTHÈSE – POUR LE PARTIEL
### 🧩 Définitions clés
- **Vecteur gaussien** : (X1,...,Xn)T(X_1, ..., X_n)^T est gaussien si **toute combinaison linéaire** a1X1+⋯+anXna_1 X_1 + \dots + a_n X_n est une variable normale.
- **Loi symétrique** : X∼N(0,1)⇒X−XX \sim \mathcal{N}(0,1) \Rightarrow X \overset{d}{=} -X
- **Covariance** :
    
    Cov(X,Y)=E[XY]−E[X]E[Y]\text{Cov}(X,Y) = \mathbb{E}[XY] - \mathbb{E}[X] \mathbb{E}[Y]
    
---
### 💡 Propriétés utiles
- Si ε∈{−1,1}\varepsilon \in \{-1,1\} indépendante de X∼N(0,1)X \sim \mathcal{N}(0,1), alors εX∼N(0,1)\varepsilon X \sim \mathcal{N}(0,1)
- Cov(X,εX)=E[ε]⋅E[X2]\text{Cov}(X, \varepsilon X) = \mathbb{E}[\varepsilon] \cdot \mathbb{E}[X^2], donc = 0 si E[ε]=0\mathbb{E}[\varepsilon] = 0
- Si une **combinaison linéaire** n’est pas normale, le vecteur n’est **pas gaussien**
---
### 🎯 ASTUCES
- Vérifie bien si **toute combinaison linéaire** est normale pour justifier qu’un vecteur est gaussien.
- Attention : **covariance nulle ≠ indépendance**, sauf cas normal.
- Si tu trouves une variable qui prend **une valeur fixe avec proba >0> 0** + densité ailleurs → ce n’est **ni discret ni continu**.
---
### 📘 **Exercice 15 — Vecteur gaussien et indépendance**
### Enoncé
Soient XX et YY deux variables aléatoires **indépendantes**, toutes deux suivant une loi normale centrée réduite :
X,Y∼N(0,1)X, Y \sim \mathcal{N}(0,1)
On définit :
- U=X+YU = X + Y
- V=X−YV = X - Y
On demande :
1. Montrer que (U,V)T(U, V)^T est un **vecteur gaussien**
2. Montrer que UU et VV sont **indépendantes**
---
## ✅ **Résolution**
### 1. Montrer que (U,V)T(U, V)^T est un vecteur gaussien
Rappel : un vecteur aléatoire est **gaussien** si **toute combinaison linéaire** des composantes suit une **loi normale**.
On a :
U=X+Y,V=X−YU = X + Y, \quad V = X - Y
Or XX et YY sont **indépendantes** et **normales** ⇒ le vecteur (X,Y)T(X, Y)^T est gaussien.
Et toute **application linéaire** d’un vecteur gaussien reste gaussienne.
Donc :
(U,V)T=A⋅(X,Y)T,ouˋ A=(111−1)(U, V)^T = A \cdot (X, Y)^T, \quad \text{où } A =  
\begin{pmatrix}  
1 & 1 \\  
1 & -1  
\end{pmatrix}
🔹 **Conclusion** :
(U,V)T est un vecteur gaussien(U, V)^T \text{ est un vecteur gaussien}
---
### 2. Montrer que UU et VV sont indépendantes
Pour deux variables **jointement normales**, **l’indépendance équivaut à la non-corrélation**.
On calcule donc Cov(U,V)\text{Cov}(U, V).
### a) Espérances :
E[U]=E[X+Y]=0,E[V]=E[X−Y]=0\mathbb{E}[U] = \mathbb{E}[X + Y] = 0, \quad \mathbb{E}[V] = \mathbb{E}[X - Y] = 0
### b) Covariance :
Cov(U,V)=E[UV]=E[(X+Y)(X−Y)]=E[X2−Y2]\text{Cov}(U, V) = \mathbb{E}[UV] = \mathbb{E}[(X+Y)(X-Y)] = \mathbb{E}[X^2 - Y^2]
Comme X∼N(0,1)X \sim \mathcal{N}(0,1) et Y∼N(0,1)Y \sim \mathcal{N}(0,1) :
E[X2]=E[Y2]=1⇒Cov(U,V)=1−1=0\mathbb{E}[X^2] = \mathbb{E}[Y^2] = 1  
\Rightarrow \text{Cov}(U, V) = 1 - 1 = 0
🔹 UU et VV sont **non corrélées**, et comme elles sont **jointement normales**, cela implique qu'elles sont **indépendantes**.
---
## 🧠 FICHE DE SYNTHÈSE – À RETENIR POUR LE PARTIEL
### 🧩 Notions clés
- **Vecteur gaussien** : toute combinaison linéaire de ses composantes suit une loi normale.
- **Application linéaire d’un vecteur gaussien** → donne encore un vecteur gaussien.
- **Indépendance pour des lois normales** :
    - Deux variables normales **jointement normales** sont **indépendantes si et seulement si elles sont non corrélées**.
---
### 💡 Propriétés utiles
Soit X,Y∼N(0,1)X, Y \sim \mathcal{N}(0,1) indépendantes :
- U=X+Y∼N(0,2)U = X + Y \sim \mathcal{N}(0,2)
- V=X−Y∼N(0,2)V = X - Y \sim \mathcal{N}(0,2)
- Cov(U,V)=0⇒U⊥V\text{Cov}(U, V) = 0 \Rightarrow U \perp V
---
### 🎯 ASTUCES
- Si on te demande si un **vecteur est gaussien**, vérifie si c’est une **transformation linéaire** d’un vecteur de normales.
- Si tu montres que deux variables normales sont **non corrélées**, et qu’elles viennent d’un **vecteur gaussien**, alors elles sont **automatiquement indépendantes**.
- À l’oral ou à l’écrit, **insiste bien sur l’implication "normales + non corrélées ⇒ indépendantes"** (ce n’est pas vrai en général).
---
Souhaites-tu qu’on fasse l’exercice 16 aussi ? C’est la suite logique.