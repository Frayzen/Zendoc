# **1. Introduction**
Dans cette partie, nous étudions le comportement de l’algorithme de **descente de gradient à pas constant**, appliqué à la minimisation d’une fonction quadratique convexe. Le choix du **pas d’apprentissage** $\alpha$ est une composante critique de l’algorithme : un pas trop petit induit une convergence lente, tandis qu’un pas trop grand peut provoquer une divergence.
L’objectif de ce benchmark est de **mettre en évidence empiriquement** les propriétés théoriques de la descente de gradient, en particulier l’influence du pas $\alpha$ sur la **vitesse de convergence**. Nous comparons les performances de l’algorithme pour différents choix de $\alpha$, en lien avec les **valeurs limites théoriques** issues de l’analyse de la fonction testée. Le cas unidimensionnel ($n=1$) est d’abord étudié en détail, avant d’envisager des extensions en dimension $n = 2$ et $n = 5$.
---
# **2. Étude en dimension** $1$
## **2.1 Théorie**
Nous considérons la fonction quadratique convexe suivante : $f(x) = \gamma x^2 + x + 1, \quad \text{avec } \gamma > 0$
Son gradient est donné par : $\nabla f(x) = 2\gamma x + 1$.
Cette fonction est $\mu$-fortement convexe et son gradient est LL-Lipschitzien, avec : $\mu = L = 2\gamma$.
Dans notre cas, on fixe $\gamma = 10$, d'où : $L = \mu = 20$.
Le schéma de descente de gradient s’écrit : $x_{k+1} = x_k - \alpha \nabla f(x_k)$.
La théorie assure la convergence pour $0 < \alpha < \frac{2}{L}$, avec un taux de décroissance géométrique donné par : $f(x_k) - f(x^\ast) \leq \rho^k (f(x_0) - f(x^\ast)), \quad \rho = 1 - \alpha \mu$.
Le pas optimal est : $\alpha_{\text{opt}} = \frac{1}{L} = 0{,}05$.
---
## **2.2 Analyse expérimentale**
### a) Benchmark
Nous appliquons la descente de gradient pour plusieurs valeurs de $\alpha \in [0.001, 0.2]$, et pour trois conditions initiales : $x_0 \in \{-10, 0, 10\}$. L’algorithme est arrêté lorsque $\| \nabla f(x_k) \| < 10^{-6}$, ou après $500$ itérations.
Nous enregistrons le **nombre d’itérations nécessaires à la convergence** en fonction de $\alpha$.

> _**Figure 1 :** Influence du pas $\alpha$ sur le nombre d’itérations pour différents $x_0$, avec $\gamma = 10$._
> 
> ![[image 105.png|image 105.png]]
**Analyse** :
- Pour $\alpha \ll \alpha_{\text{opt}}$, la convergence est lente.
- Le minimum du nombre d’itérations est atteint pour $\alpha \approx 0{,}05$, en adéquation avec la théorie.
- Lorsque $\alpha \to \alpha_{\text{max}} = 0{,}1$, le nombre d’itérations augmente brusquement.
- Pour $\alpha > \alpha_{\text{max}}$, l’algorithme diverge numériquement (valeurs `NaN` ou plateau à `max_iter`).
Le **choix de la condition initiale** $x_0$ influe légèrement sur la courbe, mais ne change pas le pas optimal, ce qui illustre la **robustesse théorique du schéma linéaire** en 1D.
---
### **b) Étude de la décroissance de la fonction objectif**
Nous avons également représenté la décroissance de $f(x_k) - f(x^\ast)$ en échelle logarithmique pour plusieurs valeurs de $\alpha$.

> _**Figure 2 -** Évolution logarithmique de $f(x_k) - f(x^\ast)$ pour différentes valeurs de $\alpha$._
> 
> ![[image 1 36.png|image 1 36.png]]
**Analyse** :
- **Décroissance géométrique linéaire** pour $\alpha < \alpha_{\text{max}}$.
- Le **meilleur taux** de décroissance est atteint pour $\alpha = \alpha_{\text{opt}}$, avec une pente maximale.
- Pour $\alpha \geq \alpha_{\text{max}}$, la fonction stagne : l’algorithme diverge ou oscille.
---
## **2.3 Conclusion du cas 1D**
Ce premier benchmark confirme les prédictions théoriques :
- La **valeur optimale du pas** $\alpha_{\text{opt}}$ est prédite par la théorie.
- La convergence est **géométrique**, et dépend fortement de $\alpha$.
- Le pas doit être **calibré avec soin** : trop petit $→$ lent, trop grand $→$ divergence.
Le cas 1D constitue donc un **modèle de référence** pour valider la compréhension des propriétés fondamentales des algorithmes de descente de gradient.
---
# **3. Étude en dimension 2**
## 3.1 Introduction
Étendons l'analyse au cas bidimensionnel. Cela permet de mieux comprendre le rôle de la **structure de la fonction objectif**, en particulier lorsqu’elle est **anisotrope (**la vitesse de variation n’est pas identique dans toutes les directions).
L’objectif de cette section est d’étudier l’impact du **pas d’apprentissage** $\alpha$ dans un contexte où les directions $x$ et $y$ présentent des échelles différentes, c’est-à-dire un **conditionnement non trivial**.
---
## 3.2 Théorie
La fonction étudiée est la somme de deux fonctions quadratiques unidimensionnelles : $f(x, y) = f_1(x) + f_2(y) = \gamma_x x^2 + x + \gamma_y y^2 + y + 2$ avec $\gamma = (\gamma_x, \gamma_y) = (10, 1)$.
Le gradient est donné par : $\nabla f(x, y) = \begin{bmatrix} 2\gamma_x x + 1 \\ 2\gamma_y y + 1 \end{bmatrix}$
La fonction est strictement convexe, de minimum unique situé en : $(x^\ast, y^\ast) = \left( -\frac{1}{2\gamma_x}, -\frac{1}{2\gamma_y} \right)$
La **constante de Lipschitz** du gradient est déterminée par la plus grande des dérivées secondes : $L = \max(2\gamma_x, 2\gamma_y) = 20$
et la **constante de forte convexité** est : $\mu = \min(2\gamma_x, 2\gamma_y) = 2$
D’après la théorie, la descente de gradient converge pour tout $\alpha \in (0, 2/L)$, et le taux de convergence géométrique est : $f(x_k) - f(x^\ast) \leq \left(1 - \alpha \mu\right)^k (f(x_0) - f(x^\ast))$
Le pas optimal théorique, qui minimise ce taux, est : $\alpha_{\text{opt}} = \frac{1}{L} = 0.05$
---
## 3.3 Analyse expérimentale
Nous appliquons la descente de gradient à partir du point initial $x_0 = (5, 5)$, pour différentes valeurs de $\alpha \in \{0.01, 0.03, 0.05, 0.07, 0.1\}$.
### a) **Trajectoires de convergence dans le plan**

> _**Figure 3** - Trajectoires sur les courbes de niveau de $f(x, y)$ pour différents pas $\alpha$_
> 
> ![[image 2 36.png|image 2 36.png]]
**Analyse :**
- Pour $\alpha = 0.05$, on a une convergence rapide
- Pour $\alpha = 0.01$, les pas sont trop faibles, et la progression est très lente.
- Pour $\alpha \geq 0.07$, des oscillations apparaissent dans la direction $x$ (mal conditionnée), avec divergence pour $\alpha = 0.1$.
Ces trajectoires mettent en évidence la **difficulté d’accélérer simultanément la convergence dans toutes les directions** avec un pas unique, surtout dans un cadre mal conditionné.
---
### b) **Décroissance de la fonction objectif**

> _**Figure 4** – Évolution logarithmique de $f(x_k) - f(x^\ast)$_
> 
> ![[image 3 32.png|image 3 32.png]]
Cette courbe permet d’évaluer le **taux de décroissance** :
- Pour $\alpha = 0.05$, la décroissance est **géométrique**, avec une pente constante, en accord avec la théorie.
- Pour $\alpha = 0.01$, la pente est très faible (presque imperceptible).
- Pour $\alpha = 0.1$, la fonction stagne à une valeur élevée, signe de **divergence**.
La forme linéaire de la courbe sur une échelle log confirme que la convergence est bien exponentielle tant que $\alpha < 2/L$.
---
### c) **Norme du gradient au fil des itérations**

> _**Figure 5** - Norme $\|\nabla f(x_k)\|$ pour différents pas_
> 
> ![[image 4 30.png|image 4 30.png]]
**Analyse** :
- Pour $\alpha = 0.05$, la norme du gradient chute rapidement sous le seuil de tolérance.
- Pour $\alpha = 0.01$, la décroissance est lente.
- Pour $\alpha \geq 0.07$, la norme cesse de décroître, voire augmente, ce qui confirme l’entrée en instabilité numérique.
---
## 3.4 Conclusion du cas 2D
Cette étude montre que la descente de gradient dans un espace à **directions non homogènes** est fortement influencée par le conditionnement. Les résultats expérimentaux confirment avec précision les prédictions théoriques :
- Il existe un **intervalle admissible** pour $\alpha$, borné par $2/L$.
- Le **pas optimal** $\alpha_\text{opt}$ prédit par la théorie se vérifie en pratique.
- Le **conditionnement du problème** affecte directement la stabilité et la vitesse de convergence.
On voit que même quand les variables sont séparées, comme dans une fonction diagonale, la descente de gradient à pas constant peut quand même poser problème. Ça montre l’intérêt d’utiliser des méthodes avec un pas adaptatif dans des cas plus compliqués.
---
# **4. Cas général en dimension 5 – influence du conditionnement**
## 4.1 Introduction
Dans cette dernière partie, nous étendons notre analyse au cas d’une fonction quadratique générale en dimension $n = 5$, sous forme matricielle. Contrairement aux cas précédents où les coordonnées étaient découplées, ici la fonction admet une structure de type : $f(x) = \frac{1}{2} x^T A x + b^T x$ avec $A$ une matrice **symétrique définie positive (SPD)**. Ce cas est plus proche des scénarios d’optimisation rencontrés en pratique, où le choix du pas d’apprentissage $\alpha$ devient particulièrement délicat en présence de **mauvais conditionnement**.
L’objectif est ici d’étudier l’impact de $\alpha$ sur la vitesse de convergence, pour différents **niveaux de conditionnement** du problème.
---
## 4.2 Théorie
Le gradient de la fonction est : $\nabla f(x) = A x + b$ et la convergence de la descente de gradient est garantie pour : $0 < \alpha < \frac{2}{L}, \quad \text{où } L = \lambda_{\max}(A)$.
La meilleure vitesse de convergence est obtenue pour : $\alpha_{\text{opt}} = \frac{2}{\mu + L}, \quad \mu = \lambda_{\min}(A)$
Le **taux géométrique de convergence** associé est : $\rho = \left( \frac{\kappa - 1}{\kappa + 1} \right)^2, \quad \kappa = \frac{L}{\mu}$
Ce taux se dégrade fortement quand $\kappa$ devient grand. Plus le problème est mal conditionné, plus le **nombre d’itérations nécessaire pour converger augmente**, et plus le **choix du pas** devient contraint.
---
## 4.3 Analyse expérimentale
Trois matrices $A \in \mathbb{R}^{5 \times 5}$ ont été générées avec conditionnements cibles $\kappa \in [ 2, 10, 100]$, en fixant leur spectre propre entre 1 et $\kappa$, puis en les diagonalant aléatoirement. Le vecteur $b$ est tiré aléatoirement.
Pour chaque cas :
- On fait varier $\alpha$ sur une échelle logarithmique jusqu’à $2.5 / L$,
- On enregistre le **nombre d’itérations jusqu’à convergence** (défini comme $\|\nabla f(x_k)\| < 10^{-6}$),

> _**Figure 6** - Nombre d’itérations jusqu’à convergence selon $\alpha$, pour différents conditionnements._
> 
> ![[image 5 29.png|image 5 29.png]]
### **Analyse :**
Contrairement aux cas 1D et 2D, aucune divergence brutale n’apparaît. Le comportement est **plus lisse** et **plus réaliste**.
- **Comportement général :**
    - Le **nombre d’itérations décroît** progressivement quand $\alpha$ augmente.
    - Chaque courbe atteint un **minimum large et plat**, aux alentours de $\alpha \in [\alpha_{\text{opt}}, \alpha_{\text{max}}]$.
    - Ce minimum est suivi par une **remontée** (ralentissement).
- **Effet du conditionnement :**
    - Plus $\kappa$ est élevé, plus la courbe est **haute** (plus d’itérations).
    - Pour $\kappa = 2$, la convergence est très rapide (moins de 200 itérations).
    - Pour $\kappa = 100$, on observe plus de 1500 itérations, même au minimum.
- **Pas optimal :**
    - Le **minimum d’itérations** ne se trouve pas exactement à $\alpha_{\text{opt}}$, mais un peu à droite.
    - Ce décalage est attendu en pratique : bien que $\alpha_{\text{opt}}$ soit optimal au sens du **taux asymptotique**, un pas légèrement plus grand permet parfois d’accélérer la phase transitoire de convergence (tant qu’on reste sous $\alpha_{\text{max}}$).
---
## 4.5 Conclusion du cas général
Cette dernière expérience valide plusieurs aspects de la théorie :
- Le **conditionnement** influence fortement le comportement de la descente de gradient.
- Le **pas optimal** prédit par la théorie reste pertinent, mais les meilleures performances pratiques se trouvent souvent juste au-dessus.
- Contrairement aux petits cas (1D, 2D), le **comportement numérique est plus régulier**, sans divergence brutale.
- L’analyse du nombre d’itérations en fonction de $\alpha$ reste une méthode simple mais efficace pour calibrer le pas en pratique.
---
# **5. Conclusion**
Au cours de benchmark, on a étudié l’influence du pas d’apprentissage $\alpha$ sur la convergence de la descente de gradient à pas constant, en commençant par des cas très simples pour aller vers des situations plus complexes.
Dans le cas **unidimensionnel**, tout est très bien contrôlé : la fonction est simple, les équations de convergence sont explicites, et la théorie correspond à ce que l’on observe. On voit clairement que si $\alpha$ est trop petit, on converge lentement, et si $\alpha$ est trop grand, on finit par diverger. Le pas optimal $\alpha = 1/L$ donne bien les meilleurs résultats.
En **deux dimensions**, même si les variables sont toujours séparées, on découvre que le comportement est un peu plus subtil. Une seule valeur de $\alpha$ ne permet pas d’aller vite dans toutes les directions en même temps, surtout quand le conditionnement est déséquilibré. Les courbes montrent des oscillations ou des lenteurs selon les cas, et là encore, la théorie nous aide à comprendre ce qui se passe.
Enfin, dans le cas **matriciel en dimension 5**, on entre dans un cadre plus réaliste. Le comportement est plus progressif, moins brutal. Il n’y a pas de divergence soudaine, mais le nombre d’itérations varie beaucoup avec $\alpha$, surtout quand le conditionnement est mauvais. Le pas optimal prédit par la théorie reste une bonne référence, mais en pratique, on peut parfois prendre un $\alpha$ un peu plus grand sans problème.
---
## On retiens que
- Le **pas d’apprentissage** est un paramètre crucial pour la descente de gradient. Mal choisi, il ralentit ou fait diverger l’algorithme.
- La **théorie** est très utile pour comprendre ce qui se passe et prévoir les bons ordres de grandeur.
- Quand la dimension ou le conditionnement augmente, le **choix de** $\alpha$ devient plus sensible, et des méthodes plus avancées (comme les pas variables ou les préconditionnements) sont souvent nécessaires.