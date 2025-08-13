---
title: Modélisation
Matière:
  - "[[Introduction à la synthèse d’image]]"
Type: Cours
Date du cours: 2025-03-17
Supports:
  - "[[isim_modelisation_compressed.pdf]]"
---
![[modlisation-surfacique-vs-modlisation-polygonale-thumb-1172x660.avif]]
  
Rendu temps réel
- Maillages/polygones
Rendu photoréaliste (algorithmes type raytracing)
- Maillages/polygones
- Mathématiques
Animation :
- Modèles physiques
  
Chaque objet est décrit par une formule mathématique
- Très compact et bien adapté pour les algorithmes type raytracing
- Formule compliquée ou impossible à déterminer pour la plupart des objets
  
### Formes de base - primitives 2D/3D :
- Sphere
- Cylindre
- Cube
- Plan
- Tore…
  
# [Maillage](https://fr.wikipedia.org/wiki/Maillage)
  
Construction d'objets par assemblage de polygones.
Bonne modélisation des objets avec peu de courbes (architecture...)
Peu compacte mais facile à manipuler
![[image 88.png|image 88.png]]
  
## Représentation
### Polygone utilisé :
Majoritairement le triangle
- Facilite le traitement (remplissage...)
### Représentation en interne :
- Liste de coordonnées de sommets par polygone
    - Duplication des sommets communs à plusieurs polygones
    - Pas de connaissance de la topologie
- Liste de sommets puis liste d'indices par polygone
    - Gain de place
    - Réduction de la quantité d'information
    - Pas de connaissance de la topologie
  
## [Traingulation de Delaunay](https://fr.wikipedia.org/wiki/Triangulation_de_Delaunay)
  
### [Diagramme de Voronoï](https://fr.wikipedia.org/wiki/Diagramme_de_Vorono%C3%AF)
$⁍$
![[image 1 21.png|image 1 21.png]]
  
## [Mesh refinement](https://en.wikipedia.org/wiki/Adaptive_mesh_refinement)
  
  
# Modélisation surfacique
  
## [Surface de Bézier](https://fr.wikipedia.org/wiki/Surface_de_B%C3%A9zier)
  
### Courbe de Bézier
Définir une courbe passant par deux points
Lissage linéaire :
![[image 2 21.png|image 2 21.png]]
![[image 3 18.png|image 3 18.png]]
Lissage polynomial de Hermite:
![[image 4 17.png|image 4 17.png]]
![[image 5 17.png|image 5 17.png]]
Comment avoir les
![[image 6 16.png|image 6 16.png]]
Ajout de points de contrôle pour déterminer la dérivée localement.
![[image 7 15.png|image 7 15.png]]
Les vecteurs tangents sont déduit par $3(D_1 − P_1)$
Cela donne :
$xP_1(1 − t)^3 + xD_1(3t(1 − t)^2  
) + xD_23t^2(1 − t) + xP_2t^3$
![[image 8 13.png|image 8 13.png]]
  
![[image 9 13.png|image 9 13.png]]
![[image 10 12.png|image 10 12.png]]
  
Pour dénir une courbe plus complexe :
- Augmenter le degré
    - La modication d'un point de contrôle perturbe toute la courbe
    - Joindre plusieurs courbes de Bézier
Pour appliquer des transformations affines :
- Appliquer les transformations affines aux points de contrôle
Par extension : surfaces de Bézier
- 4 points de contrôle en 2D, 16 points de contrôle en 3D
- Joindre plusieurs surfaces de Bézier
  
## Lissage des polygones
  
Diérents algorighmes : Algorithme de Catmull-Clark, Doo-Sabin.
Un exemple en 2D :
- diviser chaque segment en 3 parties égales
- joindre les divisions successives
- Recommencer jusqu'au niveau lissage désiré
  
![[image 11 11.png|image 11 11.png]]
  
### Algorithme de Catmull-Clark
![[image 12 11.png|image 12 11.png]]
![[image 13 11.png|image 13 11.png]]
![[image 14 11.png|image 14 11.png]]
![[image 15 11.png|image 15 11.png]]
  
  
# Modélisation par assemblage
  
## [C.S.G : Constructive Solid Geometry](https://fr.wikipedia.org/wiki/G%C3%A9om%C3%A9trie_de_construction_de_solides)
  
Combiner des briques de base (solides) par des opérations :
- Union
- Intersection
- Différence
### Union
![[image 16 11.png|image 16 11.png]]
![[image 17 11.png|image 17 11.png]]
### Intersection
![[image 18 11.png|image 18 11.png]]
![[image 19 11.png|image 19 11.png]]
![[image 20 10.png|image 20 10.png]]
### Différence
![[image 21 10.png|image 21 10.png]]
![[image 22 9.png|image 22 9.png]]
![[image 23 7.png|image 23 7.png]]
  
### Représentation sous forme d'arbre :
![[image 24 7.png|image 24 7.png]]
![[image 25 7.png|image 25 7.png]]
  
# Modélisation par révolution
  
L'objet est construit par la rotation d'une forme autour d'un axe de révolution :
- fonction d'un angle
- fonction d'un pas d'échantillonnage
  

> [!important] Prends peu de temps.
## Tracé du contour
![[4011c5d5-3c92-4088-a483-5cc2eccc58a3.png]]
![[image 26 7.png|image 26 7.png]]
  
## Rotation du contour
![[image 27 7.png|image 27 7.png]]
![[image 28 7.png|image 28 7.png]]
![[image 29 7.png|image 29 7.png]]
![[image 30 6.png|image 30 6.png]]
![[image 31 4.png|image 31 4.png]]
  
# Modélisation par extrusion
  
L'objet est construit par une surface suivant une trajectoire.
Le chemin peut être plus ou moins compliqué.
  
![[image 32 4.png|image 32 4.png]]
![[image 33 4.png|image 33 4.png]]
![[image 34 4.png|image 34 4.png]]
![[image 35 4.png|image 35 4.png]]
![[image 36 4.png|image 36 4.png]]
![[image 37 3.png|image 37 3.png]]
![[image 38 3.png|image 38 3.png]]
![[image 39 3.png|image 39 3.png]]
  
# Cartes d’altitude
  
Permet généralement de représenter les terrains
![[image 40 3.png|image 40 3.png]]
![[image 41 3.png|image 41 3.png]]
  
  
# [Blobs / Metaballs](https://fr.wikipedia.org/wiki/M%C3%A9taballe)
  
Représentation d'un objet par isosurface.
![[image 42 2.png|image 42 2.png]]
![[image 43 2.png|image 43 2.png]]
![[image 44 2.png|image 44 2.png]]
![[image 45 2.png|image 45 2.png]]
![[image 46 2.png|image 46 2.png]]
  
### Rendu
- En raytracing, évaluation le long du rayon
- Algorithme des [marching cubes](https://fr.wikipedia.org/wiki/Marching_cubes)
- Particules
- Attention au calcul des normales
  
  
# Modélisation de la végétation : Graftales
  
### [L-Systems](https://fr.wikipedia.org/wiki/L-Syst%C3%A8me) (Lindenmayer, 1968)
Similaire à une grammaire
Souvent utilisé pour modéliser la végétation (mais pas seulement)
![[image 47 2.png|image 47 2.png]]
![[Dragon_trees.jpg]]
  
# Acquisition
  
## Scan 3D
### Création du modèle
![[image 48 2.png|image 48 2.png]]
### Modèle numérique
![[image 49 2.png|image 49 2.png]]
![[image 50 2.png|image 50 2.png]]
![[image 51 2.png|image 51 2.png]]
### Enrichissement
![[image 52 2.png|image 52 2.png]]
  

> [!important] Tend à disparaître. On a des problèmes au niveau de l’éclairage lors de l’aquisition.
![[image 53 2.png|image 53 2.png]]
  
# Sculpture 3D
  
On déplace les points d’un maillage dense.
![[image 54 2.png|image 54 2.png]]
  
  
# Codage des formes / maillages
  
## Arrêtes ailées:
  
Une arête :
- une orientation
- deux faces
- deux sommets
- quatre arêtes
![[image 55 2.png|image 55 2.png]]
  
## Boundary Representation : _[B-Rep](https://fr.wikipedia.org/wiki/B-Rep)_
  
Un solide est modélisé par les éléments extérieurs
Cela donne une surface fermée
- Ensemble de : Faces, arêtes et sommets + relations topologiques
- Les faces ne doivent pas s'intersecter ailleurs que sur des arêtes explicites (de la B-REP)
- Les faces doivent séparer l'intérieur de l'extérieur du solide
Redondance des données $→$ risque d'incohérence
  
## Autres
### Array of vertex
### Array of indexes
  
  
# Modélisation d’une scène
  
Déformation/Mouvements/Objets articulés
### Représentation hiérarchique
![[image 56 2.png|image 56 2.png]]
## Déformations libres
![[37fa901a-b5b1-4f7f-b31d-48ae89763eb3.png]]
Une solution simple, s’inspire des courbes de Bézier, on va avoir des genre de volumes de Bézier.
  
  
# Animation
  
Génération de toutes les images qui composent l'animation
Il faut donc modéliser les transformations :
- Déplacements
- Déformations
- Changements de couleur (texture, illumination…)

> [!important] On va essayer de trouver des statégies pour ne pas tout faire image par image.
  
## Solutions
### Équation de mouvement
- Dénitions des positions et orientations trajectoire à suivre
### Position clé et interpolation
- Spécication que de quelques positions puis interpolation automatique pour générer les positions intermédiaires (pas facile de respecter toutes les contraintes)
![[image 57 2.png|image 57 2.png]]
![[image 58 2.png|image 58 2.png]]
Vitesse du mouvement
### Modèle physique
- Donne du réalisme au mouvement
  
## Animation difficiles
  
### Animation de personnages
Dénition de l'animation complète du personnage
- Diffcile et consommation mémoire trop élevée
Dénition d'un squelette et d'une peau
- Le mouvement est spécié uniquement pour le squelette
- Gain de place
![[image 59 2.png|image 59 2.png]]
![[image 60 2.png|image 60 2.png]]
Dénition d'un squelette
- Le corps humain comporte environ 200 os
- Environ une centaine d'articulations
- Assemblage de segments rigides
    - Structure arborescente hiérarchique
    - Rotation avec ajout de contraintes
- Cinématique inverse
    - Trouver la bonne position
- Le déplacement des os entraîne le déplacement de la peau
  
  
![[image 61 2.png|image 61 2.png]]
La peau
- Cylindres
- Maillages ou surfaces (Splines...)
- Attachement de chaque point à un os
- Pondération de l'attachement d'un point aux os voisins
- Modèles de muscles
- Modélisation par blobs et surfaces implicites (Dans l'ensemble ce type de modèles  
    n'est plus trop utilisé)
- Modélisation des muscles par des ressorts
![[image 62 2.png|image 62 2.png]]
Modélisation par particules hiérarchiques  
I Noyau : lié au reste du modèle  
I Derme : déformation de l'objet  
I Épiderme : cohésion et surface + interaction et collisions avec  
le reste du monde  
→ Diminution de la complexité  
I Interaction uniquement avec la couche voisine  
I Interaction avec l'exterieur gérée au niveau de l'épiderme  
I diminution du nombre de particules  
I diminution de la quantité de calculs
![[image 63 2.png|image 63 2.png]]
  
Problème de jointures  
I Augmentation du maillage aux jointures  
I Ajout d'os dans l'articulation  
I Ajout de contraintes : section minimal autour de chaque os...  
I Lissage des pondérations des contributions des os sur  
l'enrobage
  
### Animation des visages
  
Quelques positions modélisées  
I Normal, souriant...  
I Calcul automatique des transitions (morphing)
Temps réel : Blend shape  
I Position neutre  
I Codage des deltas pour arriver à une pose particulière
  
### Motion capture
![[image 64 2.png|image 64 2.png]]
![[image 65 2.png|image 65 2.png]]
![[image 66 2.png|image 66 2.png]]
![[image 67 2.png|image 67 2.png]]
![[image 68 2.png|image 68 2.png]]
![[image 69 2.png|image 69 2.png]]
![[image 70 2.png|image 70 2.png]]
  
### Tissus et vêtements
  
[Modèle masses-ressorts](https://fr.wikipedia.org/wiki/Syst%C3%A8me_masse-ressort)
**Maillage de Provot**
- Ajout de ressorts pour le cisaillement et la courbure
![[image 71 2.png|image 71 2.png]]
![[DB2W9Fz.gif]]
Collisions et autocollisions
→ Beaucoup de calculs : division de l'espace et volumes englobants