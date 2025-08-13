---
title: Exercices 3
Matière:
  - "[[Probabilité et Statistiques]]"
Type: TP/TD
Supports:
  - "[[Feuille3.pdf]]"
---
Passons à l’**Exercice 1** de la **Feuille 3**, qui demande :

> Déterminer un estimateur convergent et sans biais du paramètre λ pour la loi de Poisson.
---
### 🧠 **Contexte et rappel**
Une variable aléatoire XX suivant une **loi de Poisson de paramètre λ>0\lambda > 0** a pour espérance et variance :
E(X)=λ,Var(X)=λ\mathbb{E}(X) = \lambda, \quad \text{Var}(X) = \lambda
On suppose que l’on observe un **échantillon X1,…,XnX_1, \dots, X_n** i.i.d. suivant une loi de Poisson(λ).
---
### ✅ **Méthode de résolution**
### 🎯 Objectif :
Trouver un estimateur **sans biais** et **convergent** de λ\lambda.
### 🔧 Méthode des moments (ou maximum de vraisemblance ici) :
On sait que :
E(X)=λ⇒Xˉn=1n∑i=1nXi\mathbb{E}(X) = \lambda \Rightarrow \bar{X}_n = \frac{1}{n} \sum_{i=1}^n X_i
est un estimateur naturel de λ\lambda.
---
### 📌 **Solution**
On pose :
λ^n=Xˉn=1n∑i=1nXi\hat{\lambda}_n = \bar{X}_n = \frac{1}{n} \sum_{i=1}^n X_i
### 🔍 Vérifications :
- **Sans biais** :
    
    E(λ^n)=E(1n∑i=1nXi)=1n∑i=1nE(Xi)=1n⋅n⋅λ=λ\mathbb{E}(\hat{\lambda}_n) = \mathbb{E}\left( \frac{1}{n} \sum_{i=1}^n X_i \right) = \frac{1}{n} \sum_{i=1}^n \mathbb{E}(X_i) = \frac{1}{n} \cdot n \cdot \lambda = \lambda
    
- **Convergence** (loi faible des grands nombres) :
    
    λ^n→Pλ\hat{\lambda}_n \xrightarrow{P} \lambda
    
Donc λ^n\hat{\lambda}_n est **convergent** vers λ\lambda **en probabilité** (voire en moyenne quadratique si on veut aller plus loin).
---
### 🧩 **Synthèse : Propriétés, astuces et méthodes**
### ✅ Estimateur obtenu :
λ^n=Xˉn\hat{\lambda}_n = \bar{X}_n
### 📌 Propriétés :
- **Sans biais** : E(λ^n)=λ\mathbb{E}(\hat{\lambda}_n) = \lambda
- **Consistant (convergent)** : λ^n→Pλ\hat{\lambda}_n \xrightarrow{P} \lambda
- **Efficace** : dans la famille exponentielle (la Poisson en fait partie), la moyenne est l’estimateur du maximum de vraisemblance et optimal.
### 🛠️ Astuce :
- Quand l’espérance dépend directement du paramètre à estimer, la moyenne empirique est souvent un excellent estimateur.
- Dans les lois du type exponentielle, binomiale, poisson… les estimateurs du maximum de vraisemblance et des moments coïncident souvent.
---
Souhaites-tu passer à l’exercice 2 ?
Passons à l’**Exercice 2** de la **Feuille 3** :

> Déterminer un estimateur du paramètre α\alpha pour la loi de Pareto par la méthode des moments. (cf. feuille 1)
---
### 🧠 **Contexte et rappel (Feuille 1, Exercice 13)**
La densité de la loi de Pareto (paramètre α>0\alpha > 0) est donnée pour x≥1x \geq 1 par :
fX(x)=αx−α−1,fX(x)=0 sinonf_X(x) = \alpha x^{-\alpha - 1}, \quad f_X(x) = 0 \text{ sinon}
### 🧾 Espérance (quand elle existe) :
E(X)={αα−1,si α>1non deˊfinie,sinon\mathbb{E}(X) = \begin{cases}  
\frac{\alpha}{\alpha - 1}, & \text{si } \alpha > 1 \\  
\text{non définie}, & \text{sinon}  
\end{cases}
---
### ✅ **Méthode de résolution (méthode des moments)**
L’idée est d’égaler l’espérance théorique à la moyenne empirique. Soit un échantillon X1,…,XnX_1, \dots, X_n i.i.d. suivant une loi de Pareto(α). On note :
Xˉn=1n∑i=1nXi\bar{X}_n = \frac{1}{n} \sum_{i=1}^n X_i
On pose :
Xˉn=E(X)=αα−1\bar{X}_n = \mathbb{E}(X) = \frac{\alpha}{\alpha - 1}
---
### 🔍 Résolution de l’équation
On résout :
Xˉn=αα−1\bar{X}_n = \frac{\alpha}{\alpha - 1}
On multiplie les deux membres par α−1\alpha - 1 :
Xˉn(α−1)=α⇒Xˉnα−Xˉn=α⇒Xˉnα−α=Xˉn⇒α(Xˉn−1)=Xˉn⇒α^n=XˉnXˉn−1\bar{X}_n (\alpha - 1) = \alpha  
\Rightarrow \bar{X}_n \alpha - \bar{X}_n = \alpha  
\Rightarrow \bar{X}_n \alpha - \alpha = \bar{X}_n  
\Rightarrow \alpha(\bar{X}_n - 1) = \bar{X}_n  
\Rightarrow \hat{\alpha}_n = \frac{\bar{X}_n}{\bar{X}_n - 1}
---
### 📌 **Conclusion : Estimateur**
L’estimateur par la méthode des moments est :
α^n=XˉnXˉn−1(valide si Xˉn>1)\boxed{\hat{\alpha}_n = \frac{\bar{X}_n}{\bar{X}_n - 1}}  
\quad \text{(valide si } \bar{X}_n > 1 \text{)}
---
### 🧩 **Synthèse : Propriétés, astuces et méthodes**
### ✅ Estimateur obtenu :
α^n=XˉnXˉn−1\hat{\alpha}_n = \frac{\bar{X}_n}{\bar{X}_n - 1}
### 📌 Propriétés :
- **Sans biais ?** : non, généralement biaisé (car fonction non linéaire de Xˉn\bar{X}_n), mais **consistant** (converge vers α\alpha).
- **Convergent** : oui, car Xˉn→PE(X)\bar{X}_n \xrightarrow{P} \mathbb{E}(X) implique α^n→Pα\hat{\alpha}_n \xrightarrow{P} \alpha.
### 🛠️ Astuce :
- **Toujours identifier l’espérance théorique en fonction du paramètre**.
- Ensuite **résoudre l’équation** pour le paramètre : méthode directe et utile en pratique.
---
Souhaites-tu qu’on continue avec l’**Exercice 3** ?
Passons à l’**Exercice 3** de la **Feuille 3** :

> Déterminer un estimateur du paramètre pp pour une loi géométrique.
---
### 🧠 **Contexte et rappel**
Une variable aléatoire XX suivant une **loi géométrique** de paramètre p∈(0,1]p \in (0, 1] (modélisant le nombre d’échecs avant le premier succès) a pour loi :
P(X=k)=(1−p)kp,k∈NP(X = k) = (1 - p)^k p, \quad k \in \mathbb{N}
### 📏 Espérance :
E(X)=1−pp⇒1p=E(X)+1\mathbb{E}(X) = \frac{1 - p}{p}  
\quad \Rightarrow \quad \frac{1}{p} = \mathbb{E}(X) + 1
---
### ✅ **Méthode des moments**
On note un échantillon X1,...,XnX_1, ..., X_n i.i.d. suivant une loi géométrique de paramètre pp, et on note la moyenne empirique :
Xˉn=1n∑i=1nXi\bar{X}_n = \frac{1}{n} \sum_{i=1}^n X_i
On égalise la moyenne empirique à l'espérance théorique :
Xˉn=1−pp⇒p=1Xˉn+1\bar{X}_n = \frac{1 - p}{p}  
\Rightarrow p = \frac{1}{\bar{X}_n + 1}
---
### 📌 **Conclusion : Estimateur**
L’estimateur du paramètre pp est :
p^n=1Xˉn+1\boxed{\hat{p}_n = \frac{1}{\bar{X}_n + 1}}
---
### 🧩 **Synthèse : Propriétés, astuces et méthodes**
### ✅ Estimateur obtenu :
p^n=1Xˉn+1\hat{p}_n = \frac{1}{\bar{X}_n + 1}
### 📌 Propriétés :
- **Sans biais ?** Non, en général biaisé.
- **Convergent** : oui, car Xˉn→PE(X)⇒p^n→Pp\bar{X}_n \xrightarrow{P} \mathbb{E}(X) \Rightarrow \hat{p}_n \xrightarrow{P} p
### 🛠️ Astuce :
- Toujours exprimer l’espérance théorique en fonction du paramètre recherché.
- Puis inverser pour isoler le paramètre.
---
Souhaites-tu continuer avec l’**Exercice 4** ?
Passons à l’**Exercice 4** de la **Feuille 3** :

> 1. Déterminer les estimateurs donnés par la méthode des moments pour une loi normale N(m,σ2)\mathcal{N}(m, \sigma^2).
> 
> **2. Sont-ils convergents ? Pourquoi ?**
---
### 🧠 **Contexte : loi normale N(m,σ2)\mathcal{N}(m, \sigma^2)**
### 📏 Paramètres :
- Espérance : E(X)=m\mathbb{E}(X) = m
- Variance : Var(X)=σ2\text{Var}(X) = \sigma^2
- Deux paramètres à estimer : mm et σ2\sigma^2
---
### ✅ 1. **Méthode des moments**
Soit X1,...,XnX_1, ..., X_n un échantillon i.i.d. de N(m,σ2)\mathcal{N}(m, \sigma^2).
### 🎯 Estimation de mm :
m^n=Xˉn=1n∑i=1nXi\hat{m}_n = \bar{X}_n = \frac{1}{n} \sum_{i=1}^n X_i
### 🎯 Estimation de σ2\sigma^2 :
On utilise :
E(X2)=Var(X)+(E(X))2=σ2+m2\mathbb{E}(X^2) = \text{Var}(X) + (\mathbb{E}(X))^2 = \sigma^2 + m^2
On estime donc E(X2)\mathbb{E}(X^2) par la moyenne empirique du carré :
X2‾n=1n∑i=1nXi2\overline{X^2}_n = \frac{1}{n} \sum_{i=1}^n X_i^2
Alors :
X2‾n≈σ2+m2etXˉn2≈m2⇒σ^n2=X2‾n−Xˉn2\overline{X^2}_n \approx \sigma^2 + m^2 \quad \text{et} \quad \bar{X}_n^2 \approx m^2  
\Rightarrow \hat{\sigma}^2_n = \overline{X^2}_n - \bar{X}_n^2
Ce qui est en fait la **variance empirique non corrigée**.
---
### 📌 **Résultat : Estimateurs des moments**
m^n=Xˉnetσ^n2=1n∑i=1nXi2−(1n∑i=1nXi)2\boxed{  
\hat{m}_n = \bar{X}_n  
\quad \text{et} \quad  
\hat{\sigma}^2_n = \frac{1}{n} \sum_{i=1}^n X_i^2 - \left(\frac{1}{n} \sum_{i=1}^n X_i \right)^2  
}
---
### ✅ 2. **Sont-ils convergents ?**
### 🔹 m^n\hat{m}_n :
C’est une moyenne → **converge vers mm** (loi faible des grands nombres).
### 🔹 σ^n2\hat{\sigma}^2_n :
C’est aussi une moyenne (de Xi2X_i^2), donc converge vers E(X2)−m2=σ2\mathbb{E}(X^2) - m^2 = \sigma^2.
✅ **Donc les deux estimateurs sont convergents** (consistants).
---
### 🧩 **Synthèse : Propriétés, astuces et méthodes**
### ✅ Estimateurs obtenus :
- Moyenne : m^n=Xˉn\hat{m}_n = \bar{X}_n
- Variance : σ^n2=X2‾n−Xˉn2\hat{\sigma}^2_n = \overline{X^2}_n - \bar{X}_n^2
### 📌 Propriétés :
- **Convergents** : oui
- **Sans biais** :
    - m^n\hat{m}_n : sans biais
    - σ^n2\hat{\sigma}^2_n : **biaisé** (il existe une version corrigée avec 1n−1\frac{1}{n-1})
### 🛠️ Astuce :
- Méthode des moments = égaler moments empiriques aux moments théoriques.
- Penser à la **relation fondamentale** : Var(X)=E(X2)−(E(X))2\text{Var}(X) = \mathbb{E}(X^2) - (\mathbb{E}(X))^2
---
Souhaites-tu qu’on passe à l’**Exercice 5** ?
Passons à l’**Exercice 6** de la **Feuille 3** :

> Soit X∼U[0;θ]X \sim \mathcal{U}[0; \theta].
> 
> 1. Quelle est la densité de la variable aléatoire XX ?
> 2. Quelle est son espérance ?
> 3. En déduire un estimateur du paramètre θ\theta par la méthode des moments.
---
### ✅ 1. **Densité de la variable XX**
Si X∼U[0;θ]X \sim \mathcal{U}[0; \theta], alors la densité est donnée par :
fX(x)={1θ,si 0≤x≤θ0,sinonf_X(x) = \begin{cases}  
\frac{1}{\theta}, & \text{si } 0 \le x \le \theta \\  
0, & \text{sinon}  
\end{cases}
---
### ✅ 2. **Espérance de XX**
E(X)=∫0θxθ dx=1θ⋅[x22]0θ=θ2\mathbb{E}(X) = \int_0^\theta \frac{x}{\theta} \, dx = \frac{1}{\theta} \cdot \left[ \frac{x^2}{2} \right]_0^\theta = \frac{\theta}{2}
---
### ✅ 3. **Estimateur de θ\theta par la méthode des moments**
Soit X1,...,XnX_1, ..., X_n un échantillon i.i.d. suivant U[0;θ]\mathcal{U}[0; \theta].
On note :
Xˉn=1n∑i=1nXi\bar{X}_n = \frac{1}{n} \sum_{i=1}^n X_i
On égalise :
Xˉn≈E(X)=θ2⇒θ^n=2Xˉn\bar{X}_n \approx \mathbb{E}(X) = \frac{\theta}{2}  
\Rightarrow \boxed{\hat{\theta}_n = 2 \bar{X}_n}
---
### 🧩 **Synthèse : Propriétés, astuces et méthodes**
### ✅ Estimateur obtenu :
θ^n=2Xˉn\hat{\theta}_n = 2 \bar{X}_n
### 📌 Propriétés :
- **Sans biais ?** Non, biaisé (car E[max⁡(Xi)]\mathbb{E}[\max(X_i)] serait sans biais pour θ).
- **Convergent** : Oui, car Xˉn→Pθ2⇒θ^n→Pθ\bar{X}_n \xrightarrow{P} \frac{\theta}{2} \Rightarrow \hat{\theta}_n \xrightarrow{P} \theta
### 🛠️ Astuce :
- Dans une loi uniforme U[0;θ]\mathcal{U}[0; \theta], l’espérance est simple à calculer : θ/2\theta/2
- Si on veut un estimateur sans biais, on peut aussi utiliser :
    
    θ^n(sans biais)=n+1n⋅max⁡(X1,...,Xn)\hat{\theta}_n^{\text{(sans biais)}} = \frac{n+1}{n} \cdot \max(X_1, ..., X_n)
    
---
Souhaites-tu que l’on termine avec l’**Exercice 5** ou passer à un autre thème ?