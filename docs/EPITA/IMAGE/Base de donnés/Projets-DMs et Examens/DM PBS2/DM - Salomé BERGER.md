---
title: DM - Salomé BERGER
---

# Partie 1
## 1. Justifier que la fonction$f(., σ)$ d´efinit bien une densité sur $\mathbb{R}$ pour tout $σ > 0$.
$f(x, \sigma) =  
\begin{cases}  
0 & \text{si } x < 0 \\  
\frac{x}{\sigma^2} \exp\left( -\frac{x^2}{2\sigma^2} \right) & \text{si } x \geq 0  
\end{cases}$
### Montrons que $\forall x \in \mathbb{R}, f(x)\ge0$
- Pour $x<0$
    
    $f(x)=0 \Rightarrow f(x)\geq0$
    
- Pour $x\ge0$
    
    $\sigma^2>0\Rightarrow\frac{x}{\sigma^2}\geq0 \text{ et }$\text{exp}\gt0 \Longrightarrow f(x)\ge0$
    
### Montrons que $\int_{-\infty}^{+\infty} f(x, \sigma)\, dx = 1$
$\forall x \in \mathbb{R}^{*-}, f(x)=0$ donc :
$\int_{-\infty}^{+\infty} f(x, \sigma)\, dx = \int_{0}^{+\infty} f(x, \sigma)\, dx = \int_0^{+\infty} \frac{x}{\sigma^2} \exp\left(-\frac{x^2}{2\sigma^2}\right)\, dx$
Par changement de variables :
$u = \frac{x^2}{2\sigma^2} \Rightarrow x = \sigma \sqrt{2u}, \quad dx = \sigma \frac{1}{\sqrt{2u}}\, du$
$\int_0^{+\infty} f(x, \sigma)\, dx = \int_0^{+\infty} \frac{\sigma\sqrt{2u}}{\sigma^2} \exp(-u) \cdot \frac{\sigma}{\sqrt{2u}}\, du = \int_0^{+\infty} \exp(-u)\, du = 1$
---
## 2. À l’aide de la formule du changement de variable, montrer que la variable aléatoire $Y = X^2$ suit une loi exponentielle.
Soit $Y=g(X)=X^2$
### Montrons que $Y$ est bijective et strictiement positive sur $\mathbb{R}^+$
$X \sim \text{Rayleigh}(\sigma)$ donc $X \geq 0$
$\forall x \in\mathbb{R}^+,\ x↦x^2$ est strictement croissante et bijective de $\mathbb{R}^+$ dans $\mathbb{R}^+$
On peut donc appliquer la formule de changement de variable sur $Y$.
### Application du changement de variable
$f_Y(y) = f_X( g^{-1}(y)) \cdot \left| \frac{d}{dy} g^{-1}(y) \right|$
Or $g^{-1}(y) = \sqrt{y}$ pour $y\ge0$, donc
$f_Y(y) = f_X\left(\sqrt{y}\right) \cdot \left| \frac{d}{dy} \sqrt{y} \right| = f_X\left( \sqrt{y} \right) \cdot \frac{1}{2\sqrt{y}} \quad \text{pour } y > 0$
On a donc
$f_Y(y) = \frac{\sqrt{y}}{\sigma^2} \exp\left( -\frac{y}{2\sigma^2} \right) \cdot \frac{1}{2\sqrt{y}}  
= \frac{1}{2\sigma^2} \exp\left( -\frac{y}{2\sigma^2} \right)  
\quad \text{pour } y > 0$
On reconnaît la densité d’une **loi exponentielle** de paramètre $\lambda = \frac{1}{2\sigma^2}$ :
$f_Y(y) =  
\begin{cases}  
\frac{1}{2\sigma^2} \exp\left( -\frac{y}{2\sigma^2} \right) & \text{si } y \geq 0 \\  
0 & \text{sinon}  
\end{cases}$
Donc : $Y = X^2 \sim \text{Exponentielle}\left( \frac{1}{2\sigma^2} \right)$
---
## 3. Montrer que $E(X) = σ\sqrt{\frac{π}{2}}$
$\forall x \in \mathbb{R}^{-*},\ f_X(x)=0$ donc :
$E(X)=\int^{+\infty}_{-\infty}xf_x(x)dx\\=\int^{+\infty}_{0}  
\frac{x^2}{\sigma^2}.\text{exp}\Big(-\frac{x^2}{2\sigma^2}\Big)dx\\= \frac{1}{\sigma^2}\int^{+\infty}_{0}  
x^2.\text{exp}\Big(-\frac{x^2}{2\sigma^2}\Big)dx$
### Changement de variable
$u = \frac{x^2}{2\sigma^2} \Rightarrow x = \sigma \sqrt{2u}, \quad dx = \sigma \frac{1}{\sqrt{2u}}\, du$
$E(X)= \int^{+\infty}_{0}  
\frac{\sigma^2.2u}{\sigma^2}.e^{-u}\frac{\sigma}{\sqrt{2u}}dx\\  
= \sigma\int^{+\infty}_{0}  
2u.e^{-u}\frac{1}{\sqrt{2u}}dx \\= \sigma\sqrt{2}\int^{+\infty}_{0} \sqrt{u}.e^{-u}dx \\  
= \sigma\sqrt{2}\int^{+\infty}_{0} u^{1/2}.e^{-u}dx$
On reconnaît ici une intégrale de la forme gamma avec $a=\frac{3}{2}$ :
$\int_0^{\infty} u^{a-1} e^{-u} du = \Gamma(a) \Longrightarrow \int_0^{\infty}u^{1/2}.e^{−u}du=Γ\Big(\frac{3}{2}\Big)$
Or $Γ\Big(\frac{3}{2}\Big) = \dfrac{\sqrt{\pi}}{2}$, on a donc bien :
$E(X) = \sigma \sqrt{2} \cdot \Gamma\left( \frac{3}{2} \right)  
= \sigma \sqrt{2} \cdot \frac{\sqrt{\pi}}{2}  
= \sigma \cdot \sqrt{\frac{\pi}{2}}$
---
## 4. En admettant que $\text{Var}(X) = \frac{4 − π}{2}σ^2$, calculer $E(X^2)$
D’après la question précedente : $E(X) = \sigma \cdot \sqrt{\dfrac{\pi}{2}}$, donc
$E(X^2)=\text{Var}(X)+E(X)^2 \\  
= \frac{4 − π}{2}σ^2 + \Big(\sigma\cdot \sqrt{\frac{\pi}{2}}\Big)^2  
\\= \frac{\sigma^2}{2}(4-\pi+\pi)=2\sigma^2$
---
## 5. Déterminer deux estimateurs du paramètre $\sigma$ à l’aide de la méthode des moments.
### Moments théoriques connus :
- $E(X) = \sigma \sqrt{\dfrac{\pi}{2}}$
- $E(X^2) = 2\sigma^2$
### Moments empiriques :
Si on a un échantillon $X_1, \dots, X_n$, alors :
- $M_1 = \bar{X}_n = \frac{1}{n} \sum X_i$ (moyenne empirique)
- $M_2 = \frac{1}{n} \sum X_i^2$ (moment d’ordre 2 empirique)
$\bar{X}_n = \sigma \sqrt{\frac{\pi}{2}} \quad \Rightarrow \quad \hat{\sigma}_1 = \bar{X}_n \cdot \sqrt{\frac{2}{\pi}}$
$\frac{1}{n} \sum X_i^2 = 2\sigma^2 \quad \Rightarrow \quad \hat{\sigma}_2 = \sqrt{\frac{1}{2n} \sum X_i^2}$
---
## 6. Déterminer l’estimateur du maximum de vraisemblance du paramètre $σ$.
### **Fonction de vraisemblance**
Pour un échantillon indépendant de $n$ variables :
$\mathcal{L}(\sigma) = \prod_{i=1}^n f(X_i, \sigma)$
Donc :
$\mathcal{L}(\sigma) = \prod_{i=1}^n \left( \frac{X_i}{\sigma^2} \exp\left(-\frac{X_i^2}{2\sigma^2} \right) \right)$
### L**og-vraisemblance**
$\mathcal{L}(\sigma)  
= \sum_{i=1}^n \log\left( \frac{X_i}{\sigma^2} \right) - \sum_{i=1}^n \frac{X_i^2}{2\sigma^2}  
= \sum \log(X_i) - 2n \log(\sigma) - \frac{1}{2\sigma^2} \sum X_i^2$
### **Dériver pour trouver le maximum**
On dérive $\ell(\sigma)$ par rapport à $\sigma$, on pose la dérivée égale à $0$ :
$\frac{d\ell}{d\sigma} = -\frac{2n}{\sigma} + \frac{1}{\sigma^3} \sum X_i^2 = 0$
$-\frac{2n}{\sigma} + \frac{1}{\sigma^3} \sum X_i^2 = 0 \Rightarrow  
\frac{1}{\sigma^3} \sum X_i^2 = \frac{2n}{\sigma}$
Multiplions les deux côtés par $\sigma^3$ :
$\sum X_i^2 = 2n \sigma^2 \Rightarrow \hat{\sigma}_{\text{MV}} = \sqrt{ \frac{1}{2n} \sum_{i=1}^n X_i^2 }$
---
  
# Partie 2
Soit $(X_1, \dots, X_n)$ un échantillon i.i.d. suivant la loi de Rayleigh de paramètre $\sigma$.
## 1. Considérons $T_n = \sum_{k=1}^n X_k^2$ avec $T_n \sim \text{Gamma}(n, 2\sigma^2)$
### (a) Exprimer l’estimateur du maximum de vraisemblance du paramètre $\sigma$ en fonction de $T_n$
D’après la question 6 de la partie 1.
$\hat{\sigma}_{\text{MV}} = \sqrt{ \frac{1}{2n} \sum_{i=1}^n X_i^2 }$
Or, par définition :
$T_n = \sum_{i=1}^n X_i^2 \Longrightarrow \hat{\sigma}_{\text{MV}} = \sqrt{ \frac{T_n}{2n} }$
### (b) Pourquoi est-il impossible d’utiliser directement la variable aléatoire $T_n$ pour déterminer un intervalle de confiance pour $\sigma$ ?
On **ne peut pas utiliser directement** $T_n$ pour construire un intervalle de confiance, car sa loi dépend de $\sigma$. On ne peut donc pas inverser directement une distribution connue.
Il faut **transformer** $T_n$ pour éliminer la dépendance à $\sigma$.
---
## 2. **Montrer que, si** $X_k \sim \text{Rayleigh}(\sigma)$**, alors :** $Y_k = \frac{X_k^2}{\sigma^2}$ suit une loi $\chi^2$ à 2 degré de liberté
D’aprè la question 2 de la partie 1 :
$X^2 \sim \text{exp}\left( \frac{1}{2\sigma^2} \right)\Longrightarrow \frac{X^2}{\sigma^2} \sim \text{exp}\left( \frac{1}{2} \right)$
Or si $Z \sim \chi^2(2)$, alors $Z \sim \text{exp}\left( \frac{1}{2} \right)$ donc :
$Y_k = \frac{X_k^2}{\sigma^2} \sim \text{Exp}\left( \frac{1}{2} \right) = \chi^2(2)$
---
## 3. Déterminer la fonction caractéristique de $\frac{T_n}{\sigma^2}$ puis en déduire la loi de $\frac{T_n}{\sigma^2}$.
### Définition de la variable
$Z_n = \frac{T_n}{\sigma^2} = \sum_{k=1}^n \frac{X_k^2}{\sigma^2} = \sum_{k=1}^n Y_k$
avec $Y_k \sim \chi^2(2)$
### Propriétés des lois Khi-deux
La somme de $n$ variables indépendantes suivant une loi $\chi^2(2)$ suit une loi $\chi^2(2n)$.
Donc :
$Z_n = \frac{T_n}{\sigma^2} \sim \chi^2(2n)$
### Fonction caractéristique
Soit $Y \sim \chi^2(2)$, alors sa fonction caractéristique est, pour $t \in \mathbb{R}$ :
$\varphi_Y(t) = (1 - 2it)^{-1}$
$Z_n = \sum_{k=1}^n Y_k$, donc, comme les $Y_k$ sont indépendants :
$\varphi_{Z_n}(t) = \prod_{k=1}^n \varphi_{Y_k}(t) = \left( (1 - 2it)^{-1} \right)^n = (1 - 2it)^{-n}$
---
## 4. En déduire un intervalle de confiance au niveau de confiance $1 − α$ pour le paramètre $σ$.
### Pivot
On a montré que si $X_1, \dots, X_n \sim \text{Rayleigh}(\sigma)$, alors : $T_n = \sum_{i=1}^n X_i^2$
suit une loi Gamma de paramètres $n$ et $2\sigma^2$, ce qui revient à dire que : $\dfrac{T_n}{\sigma^2} \sim \chi^2(2n)$
### Encadrement probabiliste
Soit $\chi^2_{2n;\,\alpha/2}$ et $\chi^2_{2n;\,1-\alpha/2}$ les **fractiles** (quantiles) d’ordre $\alpha/2$ et $\alpha/2$ de la loi $\chi^2$ à $2n$ degrés de liberté. Alors :
$1 - \alpha=\mathbb{P} \left( \chi^2_{2n;\,\alpha/2} \leq \frac{T_n}{\sigma^2} \leq \chi^2_{2n;\,1-\alpha/2} \right) \\= \mathbb{P} \left( \frac{T_n}{\chi^2_{2n;\,1 - \alpha/2}} \leq \sigma^2 \leq \frac{T_n}{\chi^2_{2n;\,\alpha/2}} \right)  
\\ = \mathbb{P} \left( \sqrt{ \frac{T_n}{\chi^2_{2n;\,1 - \alpha/2}} } \leq \sigma \leq \sqrt{ \frac{T_n}{\chi^2_{2n;\,\alpha/2}} } \right)$
Un **intervalle de confiance au niveau** $1 - \alpha$ pour le paramètre $\sigma$ est donné par :
$IC_{1 - \alpha}(\sigma) = \left[ \sqrt{ \frac{T_n}{\chi^2_{2n;\,1 - \alpha/2}} },\ \sqrt{ \frac{T_n}{\chi^2_{2n;\,\alpha/2}} } \right]$
où :
- $T_n = \sum_{i=1}^n X_i^2,$
- $\chi^2_{2n;\,u}$ désigne le quantile d’ordre $u$ de la loi Khi-deux à $2n$ degrés de liberté.
---
## 5. Application numérique : $(n = 5)$. Déterminer un intervalle de confiance au niveau de confiance $0, 95$ pour le paramètre σ.
À partir des observations $X_1 = 1, X_2 = 2, X_3 = 3, X_4 = 4, X_5 = 6,$ on calcule :
$T_5 = \sum_{i=1}^5 X_i^2 = 66$
Le niveau de confiance souhaité est$1 - \alpha = 0{,}95$, soit $\alpha = 0{,}05$, avec $2n = 10$ degrés de liberté.
D’après la question précédente :
$IC_{0.95}(\sigma) = \left[ \sqrt{ \frac{T_n}{\chi^2_{10;0.975}} },\ \sqrt{ \frac{T_n}{\chi^2_{10;0.025}} } \right]$
À l’aide des tables :
$\chi^2_{10;0.975} \approx 3.94,\quad \chi^2_{10;0.025} \approx 20.48$
On en déduit :
$IC_{0.95}(\sigma) \approx \left[ \sqrt{ \frac{66}{20.48} },\ \sqrt{ \frac{66}{3.94} } \right] \approx \left[ 1.794,\ 4.093 \right]$