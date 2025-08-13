---
title: Classification non-supervisée
Matière:
  - "[[Introduction au Machine Learning]]"
Type: Cours
Date du cours: 2025-03-18
Supports:
  - "[[Clustering_compressed-1-51.pdf]]"
  - "[[Clustering_compressed_(1)-118-133.pdf]]"
---
# Pourquoi ?
  
## Clustering
Regroupement : regrouper les données d'entrée en clusters qui partagent certaines caractéristiques.
  
Trouver des tendances générales dans les données (problème d'exploration de données)
Visualiser les données (de manière simplifiée)
Déduire certaines propriétés d'un point de données donné en fonction de ses relations avec d'autres points de données (apprentissage statistique)
  
## Compliqué
  
Le clustering relève de l'apprentissage non supervisé $⇒$ aucune vérité fondamentale n'est disponible  
pour apprendre/évaluer la qualité d'un algorithme de clustering.
![[image 90.png|image 90.png]]

  
Comment évaluer le degré de corrélation entre les points de données ?
⇒ Quels critères (caractéristiques) sont les plus pertinents pour notre problème ?
⇒ Quelle mesure est la plus pertinente ?
![[image 1 23.png|image 1 23.png]]

Comment évaluer la solidité des clusters créés ? Est-ce une question pertinente ?
![[image 2 23.png|image 2 23.png]]

  
# Familles d'approches de clustering (Clusteringception)
  
On peut tenter de diviser les approches de clustering existantes en plusieurs catégories :
  
## Centroid-based clustering
  
Les clusters sont résumés à l'aide d'un point représentatif unique, et des points sont attribués aux clusters en fonction de leur distance à ce centroïde (k-means  
et ses variantes directes).
![[image 3 20.png|image 3 20.png]]

  
## Density-based clustering
  
Les clusters sont définis comme un ensemble de points denses dans l'espace des caractéristiques (regroupement par décalage moyen, DBSCAN, etc.).
![[image 4 19.png|image 4 19.png]]

  
  
## Distribution-based clustering
  
Les clusters sont définis en fonction de la probabilité que des points appartiennent à la même distribution de probabilité (modèles de mélange gaussien, etc.).
![[image 5 19.png|image 5 19.png]]

  
  
## Hererchical clustering
  
Les clusters sont organisés de manière hiérarchique (clustering agglomératif hiérarchique, K-means récursif).
![[image 6 18.png|image 6 18.png]]

  
  
# k-means clustering
  
![[image 7 17.png|image 7 17.png]]

→ Minimise la somme des carrés (variance) intra-cluster
→ Problème d'optimisation global :
![[image 8 15.png|image 8 15.png]]

→ Problème NP-difficile, aucune garantie de trouver l'optimum global
→ Stochastique et très sensible aux conditions initiales
→ Sensible aux valeurs aberrantes (merci la norme $L_2$...)
→ Pourtant, c'est probablement l'algorithme de clustering le plus utilisé.
  
## Pavage (tesselation) de Voronoi
  
Partition de l'espace euclidien en points/graines discrets. Chaque région/cellule de Voronoï est composée de tous les points de l'espace qui sont plus proches du grain de la cellule que de toute autre graine.
![[image 9 15.png|image 9 15.png]]

  
La méthode k-means permet d'obtenir une tesselation de Voronoï de l'espace d'entrée, où les valeurs de départ sont les moyennes finales des clusters.
Alternativement, on peut utiliser des valeurs de départ de tesselation de Voronoï précalculées comme clusters initiaux pour la méthode k-means.
![[image 10 14.png|image 10 14.png]]


> [!important] On sais faire mieux mais comme il est simple il reste l’algorithme de clustering le plus utilisé.
  
### Déterminer le nombre optimal de clusters avec la méthode du coude
  
Pour un jeu de données on peut avoir un nombre de cluster aussi grand que le nombre de données. Mais on va vouloir trouver les nombre de cluster optimal.
![[image 11 13.png|image 11 13.png]]

Calculer la variance expliquée pour un nombre croissant de clusters k :
![[image 12 13.png|image 12 13.png]]

Tracer et trouver la courbure du coude
![[image 13 13.png|image 13 13.png]]

  
## Ne fonctionne pas toujours
  
Parfois, la méthode des k-moyennes fonctionne… Mais la plupart du temps, ce n'est pas comme prévu. Et c'est probablement à cause de la norme L2 que la méthode des k-moyennes tente de minimiser :
- Sensible à la malédiction de la dimensionnalité
- Forme des clusters « gaussiens normalisés » (sphériques)
- Ne s'adapte pas à la géométrie des variétés
- Sensible au déséquilibre de classe
- Sensible aux valeurs aberrantes
![[image 14 13.png|image 14 13.png]]

  
  
# Clustering itératif linéaire simple
  
Les superpixels SLIC utilisent un clustering k-means modifié dans l'espace Labxy pour produire des clusters k régulièrement échantillonnés et perceptuellement cohérents du point de vue des couleurs.
![[image 15 13.png|image 15 13.png]]

  
# Regroupement k-médoïdes
  
Une extension possible de la méthode k-moyenne.
Les centroïdes des clusters ne sont pas des points de données initiaux → peut être problématique
⇒ Remplacer le centroïde par le médoïde (point le plus éloigné de tous les autres points du cluster)
![[image 16 13.png|image 16 13.png]]

⇒ Algorithme des k-médoïdes
  
Objectif général : trouver k médoïdes m1, . . . , mk minimisant le coût de partitionnement :  
![[image 17 13.png|image 17 13.png]]

![[image 18 13.png|image 18 13.png]]

  
  
# Fuzzy c-means clustering
  
Le clustering k-means est une méthode de clustering stricte → chaque point de données appartient à 100 % à son cluster.
![[image 19 13.png|image 19 13.png]]

Les méthodes de clustering souple (ou flou) permettent à chaque point de données d'appartenir à plusieurs clusters avec différents degrés d'appartenance.
Clustering FCM : génère les clusters C1, . . . , Ck et la matrice d'appartenance Wn×k (wij = %(xi ∈ Cj))
![[image 20 12.png|image 20 12.png]]

Mise à jour alternative
![[image 21 11.png|image 21 11.png]]

![[image 22 10.png|image 22 10.png]]

  
![[image 23 8.png|image 23 8.png]]

  
  
# Modèles de mélange gaussien
  
Le k-means fonctionne pour les clusters sphériques, mais échoue dans tous les autres cas ⇒ redoublez d'efforts.
Modéliser la fonction de densité de probabilité f des données comme un mélange de gaussiennes multivariées
![[image 24 8.png|image 24 8.png]]

![[image 25 8.png|image 25 8.png]]

![[image 26 8.png|image 26 8.png]]

Rappel :
![[image 27 8.png|image 27 8.png]]

$\phi_i$ sont le poids des composants du mélange $\big(\sum_{i=1}^{k}\phi_i=1\big)$
![[image 28 8.png|image 28 8.png]]

  
  
# Algorithme EM
  
![[image 29 8.png|image 29 8.png]]

![[image 30 7.png|image 30 7.png]]

![[image 31 5.png|image 31 5.png]]

![[image 32 5.png|image 32 5.png]]

![[image 33 5.png|image 33 5.png]]

![[image 34 5.png|image 34 5.png]]

  
## k-means VS GMM
  
![[image 35 5.png|image 35 5.png]]

  
  
# Estimation de la densité de noyau
  
### Objectif 
Estimer la fonction de densité de probabilité f à partir de l’observation x1 . . . , xn uniquement, supposée dériver de f (sinon, que fait-on ?)
![[image 36 5.png|image 36 5.png]]

L’estimateur de densité par noyau de bande passante h en un point x donné  
est donné par
![[image 37 4.png|image 37 4.png]]

![[image 38 4.png|image 38 4.png]]

![[image 39 4.png|image 39 4.png]]

  
  
# Mean shift clustering
  
Regroupement par décalage moyen : décaler chaque point vers le maximum de densité local de son KDE et attribuer au même groupe tous les points qui conduisent au même maximum.
![[image 40 4.png|image 40 4.png]]

![[image 41 4.png|image 41 4.png]]

![[image 42 3.png|image 42 3.png]]

![[image 43 3.png|image 43 3.png]]

![[image 44 3.png|image 44 3.png]]

![[image 45 3.png|image 45 3.png]]

  
  
# DBSCAN
  
Regroupement spatial basé sur la densité des applications avec bruit
  
- Diviser les points en 3 catégories (noyau, limite, valeurs aberrantes) qu'il y ait au moins minPts dans leur voisinage ou non
- Trouver les composantes connexes des points noyaux (en ignorant tous les points non noyaux)
- Affecter les points non noyaux au cluster proche s'il est à moins de distance, sinon les affecter au bruit.
  
![[image 46 3.png|image 46 3.png]]

![[image 47 3.png|image 47 3.png]]

  

> [!important] Permet de gérer les points abérants
  
  
# Clustering spéculaire
  
### Idée générale
Voir la tâche de clustering comme une opération de coupe minimale dans un graphique
![[image 48 3.png|image 48 3.png]]

  
- Calculer le graphe de similarité (mais lequel ?) des données x1, . . . , xn
    
    ![[image 49 3.png|image 49 3.png]]

    
- Calculer la matrice d'adjacence (pondérée) W, la matrice de degrés D et la matrice laplacienne L = D − W
- Effectuer la décomposition en valeurs propres de L = (E,Λ)
  
### Fait n°1
0 est une valeur propre de L dont la multiplicité est ≡ # de composantes connexes dans le graphe ; ses vecteurs propres sont les vecteurs identités de ces composantes connexes.
![[image 50 3.png|image 50 3.png]]

  
### Fait n° 2
Le vecteur propre de la plus petite valeur propre non nulle (vecteur de Fiedler) donne la coupe minimale normalisée du graphe.
![[image 51 3.png|image 51 3.png]]

  
Effectue un clustering k-means sur les k plus petits vecteurs propres [e1, . . . , ek ]n×k
![[image 52 3.png|image 52 3.png]]

  
# Hierchical clustering
  
Objectif
Générer une séquence de clusters imbriqués et les classer hiérarchiquement, représentés par un dendogramme :
→ Feuilles du dendogramme = données initiales
→ Nœuds internes du dendogramme = clusters