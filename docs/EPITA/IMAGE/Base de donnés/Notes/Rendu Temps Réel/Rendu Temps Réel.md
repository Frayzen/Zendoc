---
title: Rendu Temps Réel
Matière:
  - "[[Introduction à la synthèse d’image]]"
Type: Cours
Date du cours: 2025-02-28
Supports:
  - "[[isim_rendu_temps_reel.pdf]]"
---
![[a-1622532340059-2x.jpg]]

  
## Rendu temps réel VS Rendu photoréaliste
### Rendu photoréaliste
Objectif :
- Génération d'images réalistes
- Contrainte de temps faible...
Stratégies :
- Object-based rendering algorithms
- Illumination globale calculée indépendamment du point de vue
- Image-based rendering algorithms
- Illumination calculée partiellement, en fonction du point de vue
- Deterministic rendering algorithms
- Monte Carlo rendering algorithm
### Rendu temps réel
Objectif :
- Génération rapide d'images
  
# Principe
  

> [!important] Preparation de la scene → Projection → Rasterisation/fill-in/lighting (on peint chaque polygones)
Modélisation des objets dans un repère local
Modélisation de la scène dans un repère global
Projection de la scène sur le plan image
- passage repère global au repère caméra
- projection sur le plan image (+dessin 2D
On ne va pas traiter toute la surface mais on va traiter individuellement les sommets de chaques triangles.
Pipeline : prends un triangle individuelle → camera coordinate space → projection → rasterisation ⇒ image
On le repete autant de fois qu’on a de triangle (mesh).
On a donc une partie en 3D et un partie en 2D.
  
# Algorithmes 3D fondamentaux
  
## Projection de la scène sur le plan image
![[image 103.png|image 103.png]]

### Comment determiner les sommets/faces non visibles ?
![[image 1 35.png|image 1 35.png]]

### Comment déterminer les objets cachés (ou partiellement cachés) ?
![[image 2 35.png|image 2 35.png]]

### Comment déterminer les objets qui sont hors du champ (ou partiellement hors du champ/derrière le plan image) ?
![[image 3 31.png|image 3 31.png]]

![[image 4 29.png|image 4 29.png]]

  
## Clipping
  
Résolution des objets hors champs
![[image 5 28.png|image 5 28.png]]

- On abandonne les objets qui sont loins (attention à la transition dehors-dedans)
    - Élimination des faces à l'extérieur (pénible quand un objet est à cheval : il va falloir le couper)
- Estimation de la position d'une face par rapport aux plans
- Découpage des polygones à cheval (équations paramétriques)
  
## Backface Culling
  
Détermination des faces non vivibles
Déterminer l'orientation de la face par rapport à l'axe optique :
- Calculer le vecteur normal à la surface (produit vectoriel)
- Déterminer l'angle entre le vecteur normal à la surface et le vecteur directeur de l'axe optique (produit scalaire)
![[image 6 26.png|image 6 26.png]]

Permet de “dégager” la moitié des triangles de la scène.
Énumérer les objets toujours dans le même sens.
Permet de gagner énormemment de temps.
⚠️ Si notre modèle à des trous c’est très probablement dû à l’orientation de notre normale
![[image 7 24.png|image 7 24.png]]

Pour faire des effets particuliers, on peut faire l’inverse.
  
## Déterminer les objets cachés (ou partiellement caché)
  
### Trier les polygônes
Trier les objets et les dessiner dans l'ordre
![[image 8 22.png|image 8 22.png]]

On va commencer par les objets les plus proches et aller vers les objets les plus éloignés pour éviter de repasser sur des pixels inutilement.
### Ne fonctionne pas dans beaucoup de cas !
Les objets en biais ne sont pas bien pris en compte.
Ici l’objet vert a un baricentre plus proche que le rose, il cacheras donc le rose ⇒ FAUX.
![[image 9 22.png|image 9 22.png]]

  
### Utilisation d’un arbre SBR (Binary Space Partitionning Tree)
- Chaque noeud représente un hyperplan (déduit d'une face F)
- Le premier ls contient les faces du demi-espace derrière F et le second ls contient les faces du demi-espace devant F.
- Lorsque l'hyperplan intersecte une face, la face est coupée en deux
On peut déduire un ordre de parcours des polygones pour les dessiner du plus éloigné au plus proche. ==idem, du plus proche au plus éloigné==
**Efficacité :** Compromis entre arbre équilibré et nombre de polygones (fragmentation des polygones
  
## Z-buffer
Sauvegarde de la profondeur pour chaque pixel dessiné
### Avantages
- Simple
### Inconvénients
- Oblige à projeter l'ensemble des polygones
- Problème de résolution lors de l'encodage du Z
![[image 10 21.png|image 10 21.png]]


> [!important] On peu avoir une fonction distance exponentielle (pas linéaire) → on est de moins en moins capable de distinguer des distance plus on est loins, mais on gagne en précision proche.
- Graphique de profondeur log et précision de profondeur
    
    ![[depth_log_2.png]]

    
    ![[depth-precision-graph5-625x324.jpg]]

    
  
## Projection
  
Une fois que l'on a éliminé les éléments hors du champ de la caméra, les éléments qui ne sont pas de face.
On projette les sommets et on dessine (et rempli) le polygone en tenant compte de la profondeur.
$p_i=\frac{\text{fp}}{z}$
![[image 11 20.png|image 11 20.png]]


> [!important] On le reveras en OpenGL
  
  
# Algorithme 2D fondamentaux
  
  
## Remplisage de polygones
  
Suivant la projection des polygones, il faut dessiner/remplir le polygone
- Déterminer si une partie n'est pas visible
- Déterminer la couleur et l'éclairage
- Éventuellement plaquer une texture
- ….
### Données
Liste des sommets
  
### Approches :
- Triangulation
- Remplissage direct
- Inondation
  
### Algorithme
Parcourir toutes les arrêtes de haut en bas et remplir horizontalement
![[image 12 19.png|image 12 19.png]]

- Trier les sommets pour définir des sections
- Remplir les sections les unes après les autres
- Déterminer les arrêtes actives (dans la section)
- A chaque transition, il faut remettre à jour la liste des arrêtes actives
![[image 13 18.png|image 13 18.png]]

Liste des arrêtes actives
![[image 14 18.png|image 14 18.png]]

![[image 15 18.png|image 15 18.png]]

![[image 16 18.png|image 16 18.png]]

A chaque niveau il faut tracer des segments horizontaux
![[image 17 18.png|image 17 18.png]]

  

> [!important] Simplications pour les polygones convexes (ou même dans le cas du triangle).
  
  
## Tracé de segment
  
Tracé rapide de segments
- Achage de segments
- Suivi des arrêtes actives
L’algorithme naïf repose sur l'utilisation des nombres à virgule flottante (un peu lent).
  
### [Algorithme de Bresenham](https://fr.wikipedia.org/wiki/Algorithme_de_trac%C3%A9_de_segment_de_Bresenham)
Uniquement avec des additions d'entiers.
![[image 18 18.png|image 18 18.png]]

### Critère
![[image 19 18.png|image 19 18.png]]

On a éliminer la division donc on peut réster sur des entiers.
Pour savoir le pixel suivant il suiffis de reprendre D de l’oppération précédente. On fais donc seulement une addition à chaque ittération (et toujours les 2 même).

> [!important] Problème d’alliasing
  
## Tracé de cercle
  
Algorithme naïf :
- Repose sur l'utilisation des nombres à virgule ottante (un peu lent).
- Utilisation des symétries
- Precalcul des fonctions trigos
  
### [Algorithme de Bresenham](https://fr.wikipedia.org/wiki/Algorithme_de_trac%C3%A9_d%27arc_de_cercle_de_Bresenham)
Même esprit que pour les segments
![[image 20 17.png|image 20 17.png]]

![[image 21 16.png|image 21 16.png]]

  
  
## Clipping
  
Même s'il est possible de fenêtrer les polygones dans l'espace, on peut aussi le faire dans le plan (après projection).
### Fenêtrage rectangulaire de segments : [Cohen-sutherland](https://en.wikipedia.org/wiki/Cohen%E2%80%93Sutherland_algorithm)
On peut savoir qui est complètement visible et qui n’est que partiellement visible en deux opérations.
Cependant on va avoir des soucis pour les segment à moitié visible ou certains invisibles.
![[image 22 14.png|image 22 14.png]]

![[image 23 12.png|image 23 12.png]]

  
### Fenêtrage d'un polygone à partir des segments : [Weiler Atherton](https://en.wikipedia.org/wiki/Weiler%E2%80%93Atherton_clipping_algorithm)
  
On marche le long du polygône et quand on rencontre la fenêtre on suit la fenêtre puis si on retrouve un point d’intersection on reviens le long du polygône.
![[image 24 11.png|image 24 11.png]]

  
### Fenêtrage entre deux polygones : [Cyrus-Beck](https://en.wikipedia.org/wiki/Cyrus%E2%80%93Beck_algorithm) (Pour deux polygones convexes)
Connaître la position d'un point $Q$ par rapport à un coté de la fenêtre ?
![[image 25 10.png|image 25 10.png]]

![[image 26 10.png|image 26 10.png]]

![[image 27 10.png|image 27 10.png]]

![[image 28 10.png|image 28 10.png]]


> [!important] Moins important mais peut être utile dans certains cas
  
  
## Éclairage
  
### [Modèle de Lambert](https://fr.wikipedia.org/wiki/Ombrage_plat)
$I_d=k*N.L/ \|N\|\|L\|$
![[image 29 10.png|image 29 10.png]]

  
### [Modèle de Gouraud](https://fr.wikipedia.org/wiki/Ombrage_de_Gouraud)
![[image 30 9.png|image 30 9.png]]

Avec peut de points on réussi à avoir une illumination.
  
### [Modèle de Pong](https://fr.wikipedia.org/wiki/Ombrage_de_Phong)
On va interpoler les normales entre les deux points.
![[image 31 7.png|image 31 7.png]]


> [!important] Attention aux normales !
> 
> ![[image 32 6.png|image 32 6.png]]

  
### Résultats
![[image 33 6.png|image 33 6.png]]

Lambert
![[image 34 6.png|image 34 6.png]]

Gouraud
![[2a7b422b-0f27-47ad-9f7f-f41b018e13b5.png]]

Phong

> [!important] La différence entre Phong et Gouraud se creuse lorsque le modèle est pauvre.
  
### Éclairages plus évolués
On peut tricher et précalculer l’illumination de la scène.
![[06f16cd7-a598-4181-a839-ffc3d9109a45.png]]

  
  
## Conclusion
Il existe beaucoup d’algorithmes différents.
Implémentés dans les moteurs à connaitre pour inter-argir avec ces moteurs
De nouvelles technologies emerges (RTX…)