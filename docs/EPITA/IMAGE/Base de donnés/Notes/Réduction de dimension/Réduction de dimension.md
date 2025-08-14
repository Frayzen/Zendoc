---
title: Réduction de dimension
Matière:
  - "[[Introduction au Machine Learning]]"
Type: Cours
Date du cours: 2025-03-12
Supports:
  - "[[ReducDim.pdf]]"
---
![[image 87.png|image 87.png]]

  

> [!important] Le sujet le plus dur qu’on va aborder dans ce cours. Il ne seras pas nécessaire de retenir les formules mais juste de comprendre le principle.
  
# Pourquoi ?
  
On a à disposition $n$ points $x_1,...,x_n$ dans un espace $N$-dimentionnel, $x_i\in\mathbb{R}^n$, $\forall i=1,...,n$, la compatibilité est notée comme une matrice $X$ de taille $n\times N$.
- Une ligne de $X$ = un échantillon
- Une collone de $X$ = une valeur caractéristique pour tout les échantillon
![[image 1 20.png|image 1 20.png]]

![[image 2 20.png|image 2 20.png]]


> [!important] On travail avec des grandes dimansion → malédiction de dimensionnalité (phénomène de Hughes).
  
## Pourquoi c’est compliqué
  
Pour garantir la robustesse de nos données on doit augmenter le nombre d’échantillons selon la dimension. Le nombre de points à prendre augmente exponentiellement avec la dimension.
![[image 3 17.png|image 3 17.png]]

Pour les jeux de donnre en grandes dimension, les points ont une grandes probabilité d’être loins les un des autres → échantillonage très creux.
En très grande dimension le volume de l’hyper-sphère de rayon 1 deviens négligeable par rapport au volume à l’extérieur de la sphère mais toujours à l’intérieur du cube.
![[image 4 16.png|image 4 16.png]]

![[image 5 16.png|image 5 16.png]]

  
- On a du mal à se représenter plus que la dimension 3. ==Visualiser de la 3D sur un écran 3D est déjà compliqué.==
- La donnée vit naturellement dans un espace (complex) de grande dimansion
- La donnée est souvent fortemment corréler.
  

> [!important] Pourtant on veut examiner attentivement notre donnée avant de la donner à un algorithme de ML.
> 
> $\Rightarrow$ Puis-je utiliser la structure inhérente de mes données pour améliorer mes performances d'apprentissage automatique ?
  
# Comment ?
  
## Réduction de dimension
Transformer un jeux de données $X$
![[image 6 15.png|image 6 15.png]]

  
![[image 7 14.png|image 7 14.png]]

  
## Approches linéaires
  
Essayer de trouver un sous-espace de faible dimension dans lequel les données projetées ne seraient pas trop déformées après la projection.
![[image 8 12.png|image 8 12.png]]

  
### Lemme Johnson-Lindenstrauss
  
Soit $0<ε<1$ et $x1,...,x_n$ les $n$ points dans $\mathbb{R}^N$. Alors il existe une application lineaire $f:\mathbb{R}^N\rightarrow \mathbb{R}^M$ tel que $\forall i,j$ avec $i\ne j$ :
$(1-ε)\|x_i-x_j\|^2 \le \|f(x_i)-f(x_j)\|^2\le(1+ε)\|x_i-x_j\|^2$
avec $M=4\ log\ n/(ε^2/2-ε^3/3)$
**En gros :** Il existe une projection linéaire de $\mathbb{R}^n$ dans $\mathbb{R}^m$ tq les distance entre paires de points après projection n’est pas trop variée par rapport à la distance avant projection.
![[image 9 12.png|image 9 12.png]]

On peut construire cette projection facilement en tirant les entrée d’une matrice aléatoirement.
![[image 10 11.png|image 10 11.png]]

==**Problème !**==
La dimension de l'espace de projection $M = 4 log n/(ε2/2 − ε3/3)$ dépend uniquement du nombre d'échantillons d'entrée $n$ et du facteur de distorsion $ε$ et non de la dimension de l'espace d'entrée $N$.
![[image 11 10.png|image 11 10.png]]


> [!important] La plupart du temps ce lemme n’est pas une bonne idée
> 
> $→ M>N$ pour un $ε$ fixé (faible) $\Rightarrow$ augmentation de dimentionnalité
> 
> $→ M<N$ pour un $ε$ grand $\Rightarrow$ distortion $\equiv$ perte d’information
  
### Positionnement multi-dimensionnel
  
![[image 12 10.png|image 12 10.png]]

Il s’agit d’un problème d’optimisation convexe.
  
### Analyse en composante principal (ACP)
  
Étroitement liée au PMD, mais fonctionne sur la matrice de covariance $\frac{1}{n-1}X_{c}^{T}X_c$
L'ACP recherche les principales directions de propagation dans le nuage de points de données $X$.
Quel axe représente le mieux la direction principale de propagation du nuage de points de données ?
Which mathematical criterion could we define to automatically derive ==$m_1$== ?
![[693129f1-5f81-4adf-8cad-b3690b0d5a31.png]]

Définissons $y_i = \mathcal{P}_m(x_i)$ comme la projection du point de données $x_i$ sur l'axe formé par $m$.$→$ Le meilleur axe minimise la somme des erreurs de projection$→$ Équivalent à la maximisation de la dispersion (la variance) après projection.
$\Rightarrow\ u^*=arg\ \text{min}_{\|u\|=1}\sum^{n}_{i=1}\|x_i-\mathcal{P}_m(x_i)\|^2=arg\ \text{max}_{\|u\|=1}\text{Var}(Y)$
![[image 13 10.png|image 13 10.png]]


> [!important] L'ACP est probablement la technique de réduction de dimension linéaire non supervisée la plus populaire et la plus utilisée.
Mais elle soulève de nombreuses questions d'opérabilité. Les deux principes sont :
1. Comment sélectionner automatiquement le nombre approprié de dimensions à projeter ?
![[image 14 10.png|image 14 10.png]]

1. Comment projeter un nouveau point de données sur un sous-espace de projection appris ?
    
    ==⇒ Rendez-vous en TP pour la réponse.==
    
  
  
## Approches non linéaires
  
Lorsqu'on suppose que les données ne se trouvent pas dans un sous-espace euclidien (pourquoi le feraient-elles d'ailleurs ?), il faut recourir à des techniques plus avancées.
![[image 15 10.png|image 15 10.png]]

![[image 16 10.png|image 16 10.png]]

  
### Isomap - distance géodésique
  
Cartographie des caractéristiques métriques : même principe que la mise à l’échelle classique, mais en utilisant la distance géodésique au lieu de la distance euclidienne.
![[image 17 10.png|image 17 10.png]]

1. Calculer le graphe des $k$ plus proches voisins des données $x_1, . . . , x_n$
2. Calculer toutes les distances géodésiques deux à deux
3. Appliquer la mise à l'échelle classique
![[image 18 10.png|image 18 10.png]]

==Il faut trouver le bon cas. L’Isomaop ne va pas fonctionner dans beaucoup de cas mais peut être utile dans certains cas.==
  
### LLE - Locally linear embeding
  
Plongement localement linéaire
**LLE :** la variété peut être localement considérée comme euclidienne.
![[image 19 10.png|image 19 10.png]]

![[image 20 9.png|image 20 9.png]]

Pour chaque point $x_i$:
1. Trouver ces $k$ plus proches voisins $x_{j,\ j=1,...,k}$
2. Trouver les poids $w_{ij}$ qui construise le mieux linéairement $x_i$ avec $x_j$:
  
### L’astuce du noyau (kernel trick)
  
Quand on souhaite réellement augmenter la dimension.
**Idée de base :** associer $n$ points non linéairement séparables à un espace (éventuellement infini) où ils se trouveraient avec une fonction $φ$.
$→$ Comment définir $φ$ ?$→$ Souhaitons-nous vraiment calculer des données dans un espace de caractéristiques (éventuellement infini) ?
![[image 21 9.png|image 21 9.png]]


> [!important] **Théorème de Mercer :** il n’est pas nécessaire de connaître explicitement l’application $φ$ tant que nous disposons d’une matrice de Gram/noyau semi-définie positive:
> 
> $K = [κ(xi, xj)] = [⟨φ(xi), φ(xj)⟩]$
![[5ab0b175-5a97-4293-9be5-184ffc4e81a1.png]]

  
### ACP noyau
  
![[image 22 8.png|image 22 8.png]]

  
### ACP non linéaire (autoencoder)
  
Idée générale :
1. Entraîner un auto-encodeur (réseau neuronal doté d'une architecture autoassociative) pour effectuer une cartographie d'identité.
2. Utiliser la sortie de la couche de goulot d'étranglement comme code à faible dimension.
![[image 23 6.png|image 23 6.png]]

Le code goulot d'étranglement est une combinaison non linéaire d'entrées (grâce aux fonctions d'activation sur les couches de l'encodeur) → le mappage appris est une ACP non linéaire.
Les composantes principales sont généralisées des droites aux courbes : le sous-espace de projection décrit par toutes les composantes non linéaires est également courbe.
![[image 24 6.png|image 24 6.png]]

![[4242a20b-05fc-45a2-b0f4-07226bee08cc.png]]

![[image 25 6.png|image 25 6.png]]

  
# Recap
  

> [!important] La grande question est comment est ce qu’on choisit.
L’ensemble de données de grande dimension $X$ est une matrice $n × N$, avec $n$ = nombre d’échantillons et $N$ = dimensionnalité de l’espace sous-jacent.
![[image 26 6.png|image 26 6.png]]

Paramétrique $≡$ intégration explicite d'un espace de grande dimension vers un espace de faible dimension
Pour LLE : $p$ est le rapport entre les éléments non nuls d'une matrice creuse et le nombre total d'éléments
Pour NL-PCA : $i$ est le nombre d'itérations et $w$ est le nombre de pondérations dans le réseau neuronal
  
### t-Distributed Stochastic Neighbor Embedding
  
La t-SNE est une méthode courante pour visualiser en 2D ou 3D ce qui se passe dans les espaces de grande dimension.
1. Construire une distribution de probabilité p sur des paires de points de l'espace de grande dimension : plus les deux points sont proches, plus la probabilité est élevée.
2. Définir une seconde distribution de probabilité q sur les points de l'espace de petite dimension et répartir les points de telle sorte que la distance entre p et q soit minimisée (pour la divergence de Kullback-Leibler).
    
    ![[image 27 6.png|image 27 6.png]]

    
$→$ Le t-SNE est excellent pour visualiser les clusters bien séparés, mais ne parvient pas à préserver la géométrie globale des données.
$→$ Le t-SNE dépend d'un paramètre de perplexité, qui reflète l'échelle de recherche des points proches.
![[1b3d8009-3107-4aa7-afbf-f8c2e67cf57b.png]]

![[image 28 6.png|image 28 6.png]]

  
### Analyse de composante independante
  
L'ICA vise à apporter une solution au problème du cocktail : retrouver des sources indépendantes mélangées avec des coefficients d'échelle inconnus.  
Objectif : estimer la source s et la matrice de mélange A à partir de l'observation x = As.  
→ Mal posée ⇒ garantir l'indépendance des composantes de la source  
→ Travailler sur les statistiques d'ordre supérieur (limites de l'ACP aux statistiques d'ordre 2)  
→ La source inconnue ne doit pas être distribuée de manière gaussienne  
Contrairement aux vecteurs de l'ACP, les vecteurs de l'ICA ne sont ni orthogonaux ni classés par ordre d'importance, mais ils sont mutuellement indépendants.
![[image 29 6.png|image 29 6.png]]

