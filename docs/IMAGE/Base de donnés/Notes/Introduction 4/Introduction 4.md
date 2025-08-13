---
Matière:
  - "[[Optimisation Convexe 1]]"
Type: Cours
Date du cours: 2025-02-25
Supports:
  - "[[intro_(1)_compressed.pdf]]"
---
![[2eda7bb4-c507-4e53-97c3-8cc3bb26b4c6.png]]
# Qu’est ce que l’optimisation
  
## Définition mathématique
Recherche des conditions d’optimalit ́e ( optimum = le meilleur) d’un système décrit par un mod`ele (une fonction) math ́ematique d ́ependant de plusieurs param`etres/variables
et produisant une sortie observable et quantifiable.
### But
Recherche des paramètres qui vont donner la meillleure sortie.
  

> [!important] Tout problème dont le but est de minimiser un coût, une erreur, un délai... ou de maximiser un profit, un rendement... , est un ==**problème d’optimisation**==.
L’otpimisation est omniprésente dans toutes les branches de l’ingénieurie. Elle est aussi fréquente en finance.
  
L’optimisation, comme branche à part entière des mathématiques appliqués, se repose largement sur des notions d’algèbre linéaire, de géométrie et de calcul différentiel (calcul variationnel)
  
## Optimiser, mais quoi
### Formulation générale
Un probleme d’optimisation s’écrit de manière standard sous la forme :
$(arg)\underset{x\in C}{\text{min}}f(x)$
Fonction ovjective (à optimiser) :
$f:\mathbb{R}^n\rightarrow \mathbb{R}$
$x\rightarrow f(x)$
Point optimal : $x^*=\underset{x\in C}{arg\ \text{min}} f(x)$
Valeur optimale : $f^*=f(x^*)=\underset{x\in C}{\text{min}}f(x)$
Lieu admissible : $C \subseteq \mathbb{R}^n$
Défini comme l’intersection de contraintes d’inégalité et d’égalité.
  
  
## Questions à se poser
  
- Est-ce qu’il existe une solution ?
- Si une solution existe, est-elle unique ?
- Peut-on d ́ecrire analytiquement l’ensemble des solutions ?
- Peut-on calculer num ́eriquement la ou les solutions ?
- Peut-on approcher la ou les solutions avec une précision donnée ?
  

> [!important] Il n’est pas forcément évident de répondre à ces questions. Le but de ce cours est de nous donner des outils pour nous aider à y répondre.
  
  
# Cadre d’OCVX1
  
On dit qu’un problème d’optimisation (opt) est
### Différentiable
Si toutes les fonctions (objective et contraintes) en jeux le sont.
- Propriété de régularité locale des fonctions.
- Permet d’introduire des outils mathématiques puissants pour l’étude et la résolution de (opt).
![[image 82.png|image 82.png]]
### Convexe
Si toutes les fonctions en jeux le sont (les contraintes d’égalité étant de plus affines).
- Proprité structurelle globale des fonctions.
- Permet de garantir que la solution trouvée de (opt) est optimale
![[image 1 15.png|image 1 15.png]]

> [!important] Il existe d’autre manières de définir la convexité d’une fonction que l’on verras plus tard.
### Sans contrainte
S’il n’y a aucune contrainte en jeux $(C = \mathbb{R}^n)$.
- Permet de construire des algorithmes itératifs se basant sur des propriétés géométriques “simples” pour la résolution de (opt).
![[image 2 15.png|image 2 15.png]]

> [!important] Dans OCVX1, les probl`emes d’optimisation abord ́es seront :
> 
> → toujours sans contraintes (on se revoit en OCVX2 pour les contraintes).
> 
> → très souvent convexes (on se revoit en TP pour comparaison convexe/non convexe).
> 
> → toujours différentiables (il y a déjà suffisamment à raconter sur le sujet)
  
# Exepmles de priblèmes d’optimisation
## Le voyageur de commerce
Il s’agit d’un problème très compliqué à résoudre. On ne peut pas y aller par la “force brut”.
![[image 3 12.png|image 3 12.png]]
## Méthode des moindres carrés
![[image 4 11.png|image 4 11.png]]
## Apprentissage statistique / supervisé
![[image 5 11.png|image 5 11.png]]
## L’algorithme du perceptron
![[image 6 11.png|image 6 11.png]]
## Les séparateurs à vaste marge
On le verra en OCVX2 le semestre prochain car il s’agit d’un problème avec contraintes.
![[image 7 10.png|image 7 10.png]]
## Deep Learning
![[image 8 8.png|image 8 8.png]]
## La diffusion anisotrope (modèle de Perona-Malik)
![[image 9 8.png|image 9 8.png]]
## Les contours actifs (snake model)
![[image 10 7.png|image 10 7.png]]
## Le recalage de nuages de points
![[image 11 6.png|image 11 6.png]]
  
# Comment opitmiser
Quel est le point optimal $x^*$ et la valeur optimale de $f^*$ pour :
## $f:x\mapsto x^2-\frac{3}{2}x+1$
### 1. Calcul de la derivee
$f'(x)=2x-\frac{3}{2}$
### 2. Recherche des 0
$f'(x)=0 \Leftrightarrow x=\frac{3}{4}$
⇒ Une solution optimale $x^*=\frac{3}{4}$ et $f^*=f(x^*)=\frac{7}{16}$
![[image 12 6.png|image 12 6.png]]
## $f:x\mapsto x^4-2x^2$
### 1. Calcul de la derivee
$f'(x)=4x^3-4x=4x(x^2-1)$
### 2. Recherche des 0
$f'(x)=0 \Leftrightarrow x\in\{-1,0,1\}$
⇒ Deux solution optimale $x^*=±1$ et $f^*=f(x^*)=1$
![[image 13 6.png|image 13 6.png]]

> [!important] Pour f : R → R, les exemples pr ́ec ́edents montrent qu’on arrive a s’en sortir si on a acces `a la d ́eriv ́ee f ′ puisqu’il “suffit” d’identifier ses z ́eros $\{x ∈ \mathbb{R}\ |\ f ′(x) = 0\}$.
> 
> Mais cette strat ́egie est bien fragile :
> 
> → Comment faire si f n’est pas d ́erivable ?  
> → Comment faire si f ′ a une infinit ́e de z ́eros ? (exemple : f (x) = x2 + cos(2πx))  
> → Comment faire si les z ́eros de f ′ n’ont pas de solution analytique simple ?  
## Méthode itérative
Etant donné un point initial $x_0$, le but d’une méthode d’optimisation itérative est  
de construire une suite de points $x_1, x_2, . . . , x_n,$ telle que $∀k, f (xk+1) ≤ f (xk )$.  
́Evidemment, une telle strat ́egie vient avec son lot de questions :
Comment choisir le point initial x0 ?
Comment choisir le nouvel itéré xk+1 ?
Est-ce que la m ́ethode converge ?  
→ Est-ce que la m ́ethode converge vers le minimum global ?  
→ Comment impl ́ementer efficacement en pratique cette m ́ethode ?  
→ d’un point de vue m ́emoire  
→ d’un point de vue temps de calcul  
→ d’un point de vue stabilit ́e/pr ́ecision des r ́esultats

> [!important] **L’objectif d’OCVX1 est de repondre (au moins partiellement) a ces questions.**
### Exemple
![[image 14 6.png|image 14 6.png]]
On a ici un oracle qui, quand on lui donne un point, nous donne la valeur de la fonction en ce point.
Etant donne un point initial $x_0$. Comment d ́ecider dans quelle direction partir ( ⬅️ ou ➡️) pour minimiser $f$ ?
![[image 15 6.png|image 15 6.png]]
![[image 16 6.png|image 16 6.png]]
![[image 17 6.png|image 17 6.png]]
![[image 18 6.png|image 18 6.png]]
![[image 19 6.png|image 19 6.png]]

> [!important] On part dans la direction ou le taux d’accroissement est negatif.
  
# Descente de gradient
  
## Rappel : le nombre derive
![[image 20 6.png|image 20 6.png]]
Cela ne fonctione plus en dimension sup a 1 → infinite de direction possible. (avec tout les angles possible dans R^2).
## Algorithme
L’algorithme de descente de gradient est conceptuellement simple.
![[image 21 6.png|image 21 6.png]]
![[image 22 6.png|image 22 6.png]]
## Plein de maniere de faire
La descente de gradient peut ˆetre :
- A pas fixe / a pas variable / avec backtracking...
- A plus forte pente / par coordonn ́ees / stochastique...
- Conjugu ́ee / projet ́ee / proximale...
- Avec acc ́el ́eration de type momentum / Nesterov / Adam...
- M ́ethode de Newton / de quasi-Newton / de Gauss-Newton...