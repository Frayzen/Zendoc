---
title: Rendu Photoréaliste
Matière:
  - "[[Introduction à la synthèse d’image]]"
Type: Cours
Date du cours: 2025-02-20
Supports:
  - "[[isim_rendu_photorealiste.pdf]]"
---
==2 séances : pages 1-62 et 63-80==
![[6930417cbdcfdde0b92908c566b74057f3a94918_2_690x388.jpeg]]

Unreal Engine
  
### Objectif :
- Génération d’images réalistes
### Avec :
- une contrainte de temps faible...
### Stratégies :
- Object-based rendering algorithms
    
    Illumination globale calculée indépendamment du point de vue
    
- Image-based rendering algorithms (solution plus simple)
    
    Illumination calculée partiellement, en fonction du point de vue
    
- Deterministic rendering algorithms
- Monte Carlo rendering algorithms
  
On va preferer faire une image moins precise et ajuster apres.
### Algo
- Raytracing
- Path Tracing et Bidirectional Path Tracing
- Point-Based Global Illumination - PBGI
- Radiosity
- Photon map
  
![[image 22.png|image 22.png]]

  
  
# Raytracing
  
En principe on lance une “infinité” de rayons depuis la source pour espérer trouver ceux qui frappent l’œil de l’observateur.
![[image 1 10.png|image 1 10.png]]

Difficile de suivre tous les rayons partant de la source en revanche il est possible d’estimer le chemin inverse. C’est le principe du raytracing.
![[image 2 10.png|image 2 10.png]]

Faire le chemin inverse pour trouver les objets «vus».
On va devoir calculer l’intersection des rayon avec tout les objets de la scene.
Une fois qu’on sait qu’on as heurte un objet avec un pixel, pour detreminer la couleur il faut determiner les sources limuneuses qui contribu a la couleur.
Pour chaque objet vu, on peut estimer une approximation de l’éclairage local.
On va estimer l;eclairage local en calculant la lumiere diffuse et celle reflechis.
Les images vont etre de bonne qualite mais on ne va pas avoir un rendu realiste. Le rendu est faux car chaque objet deviens une source limuneuse de la scene.
![[image 3 7.png|image 3 7.png]]

On ne va donc pas compte la reflexion de la lumiere sur l’objet.
Approximation de deux types de contributions :
- la partie diffuse
- la partie spéculaireSource lumineuse
![[image 4 6.png|image 4 6.png]]

  
### Calcul de l’illumination locale :
- Composante diffuse
- Composante spéculaire
- Apport des sources primaires
- Apport des sources secondaires
### Source primaires :
- Lumières ponctuelles
- Spots
- Lumières directionnelles
- Objets lumineux
![[image 5 6.png|image 5 6.png]]

  
  
## Modele local avec lumiere ponctuelle
![[image 6 6.png|image 6 6.png]]

On connais de la source lumineuse avec la normale grace au produit scalaire.
La composante diffuse
- La propriété de diffusion de la surface est kd
- La couleur de la surface est C
  
### Composante diffuse
![[image 7 5.png|image 7 5.png]]


> [!important] On reviendras sur l’ombre plus tard.
  
## Composante speculaire
La propriété de réflexion de la surface est ks
![[image 8 3.png|image 8 3.png]]

On va utiliser le produit scalaire pour dire que plus S se rapproche de L plus on va avoir de reflexion.
Ici on ne mets pas la couleur.
![[image 9 3.png|image 9 3.png]]

![[image 10 2.png|image 10 2.png]]

  
## Calcul de l’illumination locale
  
Composante diffuse
- Composante spéculaire
- Apport des sources primaires
- Ne tient pas compte des sources secondaires
![[image 11 2.png|image 11 2.png]]

Les « kd » incluent la couleur
Il faut sommer toutes les sources lumineuses i..
  
![[image 12 2.png|image 12 2.png]]

ajout possible d’un coefficient d’atténuation f (d) (d → distance
  
## Etape 1 : Prise en compte des sources primaires
### Algorithme :
Pour l’ensemble des points de l’image :
- Calculer le vecteur directeur du rayon lumineux v partant de l’observateur
- Chercher les intersections de ce rayon lumineux avec l’intégralité des objets de la scène et garder le plus proche
- Calculer le niveau d’éclairement au point d’intersection en sommant l’apport diffus et spéculaire pour chaque source lumineuse
### Problèmes :
- Ne tient pas compte des sources lumineuses secondaires
- Ne gère pas les ombres
  
## Prise en compte des sources secondaires
  
![[a764623a-00b5-49ee-a347-61d0cdeda2bb.png]]

On rappelle la fonction qui va chercher la lumiere pour aller cherche les reflets. Demande peu d‘ajout dans le code mais ajoute pas mal de complexité pour la machine.
Il faut s arrater au bout d un moment, il est possible de faire par calcul mais la plupart des raytraceurs decide arbitrairement de s arreter a un certain nombre de rayons.
![[image 13 2.png|image 13 2.png]]

  
  
## Étape 2 : Prise en compte des sources primaires et certaines sources secondaires
  
### Algorithme :
Pour l’ensemble des points de l’image :
- Calculer le vecteur directeur du rayon lumineux v partant de l’observateur
- Chercher les intersections de ce rayon lumineux avec l’intégralité des objets de la scène et garder le plus proche
- Relancer un rayon dans la direction de S puis calculer le niveau d’éclairement récursivement
- Calculer le niveau d’éclairement au point d’intersection en sommant l’apport diffus et spéculaire pour chaque source lumineuse ainsi que l’éclairement dans la direction de S
  
  
## Étape 3 :
  
Pour l’ensemble des rayons que l’on « lance » vers les sources primaires, il faut chercher si un objet de la scène ne s’est pas inséré entre le point considéré et la source. Pour cela, il faut à nouveau calculer l’intersection du rayon avec l’ensemble des objets de la scène et prendre le plus proche.
  
![[image 14 2.png|image 14 2.png]]

Ici il manque la transparence des ombres, la lumiere ambiante.
  

> [!important] L’algorithme du raytracing est un processus simple, récursif
> 
> Il faut être capable, pour chaque objet, de calculer la normale en chaque point
> 
> Il faut réfléchir à la condition d’arrêt
  
### Avantages
- Algorithme simple et rapide à mettre en œuvre
- Génère des images honorables
### Inconvénients
- Temps de calcul un peu élevé
- Pas gestion de la profondeur de champ et autres effets
- Mauvaise gestion des ombres (frontières trop brutales)
- Sources secondaire pas suffisamment prises en compte (éclairage indirect incorrect)
- Objets transparents
- « Aliasing »
  
## [Problème d’alliasing](https://cs.stanford.edu/people/eroberts/courses/soco/projects/1997-98/ray-tracing/aliasing.html)
Un pixel est une surface carré et on associe une couleur, intensité à tout le pixel selon un rayon partant du centre de ce pixel.
Manière de faire très binaire et non représentative de la réalité.
On peut louper des objets.
![[image 15 2.png|image 15 2.png]]

  
## Solutions
### Sur-échantillonnage
- Lancer plusieurs rayons pour chaque pixel
- De manière organisée
- Au hasard
- Lancer plusieurs rayons pour chaque pixel où le gradient est
### Élevé
- Bon résultats mais peut être très lent
- Post-filtrage
- Résultat moyen mais très rapide
  
### Résultats
![[a83f02e2-5701-4840-810c-4be5fc4a27e3.png]]

Sans anti-aliasing
![[image 16 2.png|image 16 2.png]]

Anti-aliasing (Upsampling) sur toute l’image (50 rays/pixel)
![[1ae165b1-f7d2-4ff5-a384-82b2cacd0df1.png]]

Anti-aliasing sur les zones de gradient élevé (50 rays/pixel)
On rajoute du temps de calcul.
On calcul une première image grossière et on augmentr le nombre de rayons aux pixels d’interet.
  
### Solution au temps de calcul
- ==**Volumes englobants**==
- Projection sur un plan/partition de l’espace
- Pre-trier les objets (trop difficile à mettre en oeuvre)
- Calcul parallèle
- Utilisation d’OpenGL
- ...
![[images.jpg]]


> [!important] On vaa voir une hierarchie de volumes englobants
  
## Problème des objets transparents
  
Comme nous avons relancé le rayon réfléchi, il faut «suivre» le rayon réfracté
- Loi de la réfraction
### Milieux transparents
![[image 17 2.png|image 17 2.png]]

Loi de la réfraction (Snell Decartes) :
$n_1sin(i_1)=n_2sin(i_2)$
### Objets translucides
![[160b801a-73b0-4f3f-a781-3f76d8fe3469.png]]

Distribution probabiliste
  
### Problème
Tenir compte du rayon réfracté pour l’illumination locale : $I = Id + IS + It +k_t T$
On va avoir un problème au niveau de l’ombre.
Si on a plusieurs objets transparents à la suite on va avoir des soucis à calculer.
**Solution approchée :** Ne pas dévier le rayon mais filtrer les longueurs d’ondes
![[3525f9e1-278f-4952-961b-3c2bc04e9b2b.png]]


> [!important] On auras pas les caustiques ici.
  
  
## Problème de l’éclairage indirect
  
![[cefeef73-6a62-42e8-ad58-bf51f37b60df.png]]

On ajoute la lumière ambiante : $I =$ ==$k_a ∗ I_a$== $+ Id + Is + Ir + It$
![[027733a2-bee5-416e-9917-5636accaf82a.png]]

  
  
## Probème de l’ombre
  
L’origine des ombres tranchés proviens de la lumière ponctuelle.
![[e798d38b-4faf-4321-a469-91e72f510768.png]]

### Solution
Ne plus considérer une lumière comme ponctuelle
- Problème du temps de calcul
On envoie (encore) plein de rarons et on vois ce qui sont passés.
  
  
## Conclusion
  
Avantages :
- Algorithme très simple
- Donne des images honorables
Des problèmes majeurs persistent
- Les sources secondaires ne sont pas suffisamment bien gérées
- Les objets transparents non plus
Amélioration :
Raytracing distribué (84)
- Sur-échantillonnage pour simuler
    - les ombres douces
    - la profondeur de champ
    - ...
- Ne règle pas le problème de l’apport de la diffusion des sources secondaires
- Quantité de calcul énorme
Algorithme simple
Nécessite beaucoup d’améliorations pour avoir des images photoréalistes.
Déjà implémenté dans les GPU :
- Linear Swept Spheres
- BVH
- ...
Amélierations liés à l’utilisations de réseaux de neurones :
- débruitage
- Sur la carte vidéo : Tensor cores (Neural Texture Compression, Neural Radience Cache), DLSS (AI optical flow, Super resolution...)
  

> [!important] Ce n’est pas un algorithme considéré comme photoréaliste. On ne l’utilise pas en temps réel. Seulement sur des objets préecis pour calculer des reflets.
  
  
# La Radiosité
  
On essaye d’estimer la « radiosité » de chaque élément de la scène, c’est à dire la quantité d’énergie que chaque élément émet...
Cela permets de rajouter du réalisme à la scène mais est gourmand en calcul.
On précalcul lìllumination sur toute la scène.

> [!important] Ne fonctionne pas si la scène n’est pas fixe. Si un objet bouge l’illumination change.
  
$B_i$ la radiosité de la surface $i$
- $E_i$ la quantité de lumière émise par la surface $i$
- $P_i$ la fraction de lumière incidente qui est réfléchie par la surface $i$
- $F_{ij}$ la fraction de lumière quittant la surface i et atteignant la surface $j$
$⁍ ⁍$
### Calcul des $F_{ij}$ par hemi-cubes
![[image 18 2.png|image 18 2.png]]

![[image 19 2.png|image 19 2.png]]

Ne permet pas directement de calculer une vue de la scène mais simplement l’illumination globale
### Avantages :
- Prend mieux en compte les sources secondaires
- Calculée une fois pour toutes
### Inconvénients
- Tient compte que de la diffusion
- Assez lourd
- Obligation d’avoir un maillage (il faut discrétiser les surfaces)
- Objets transparents ?
  
  
# Photon Map
  
Pré calcul de l’illumination de la scène.
Lancement de rayons lumineux depuis les sources et calcul des accumulations des photons.
### Avantages
- Permet de modéliser plus proprement les sources secondaires, les ombres portées (...) et surtout les objets transparents (caustiques).
### Inconvénients
- Calculs
- Complexité
### Améliorations :
- Projection Maps
- Visual importance map (3-pass Technique)
- Shadow photons
- ...
  

> [!important] La radiostité et le photon mapping sont de moins en moins utilises aujourd’hui.
  
# Path Tracing
  
Modélisation des propriétés de réflexion des surfaces : (Bidirectional reflectance distribution function – BRDF) (idem pour la transmission)
Solution pour résoudre l’illumination
  
## BRDF : Bidirectional reflectance distribution function (Réflectivité bidirectionnelle)
  
![[image 20 2.png|image 20 2.png]]

- Conservative
    
    ![[image 21 2.png|image 21 2.png]]

    
    On ne doit pas avoir plus d’energie sortante que d’energie entrante
    
- Réciprocité de Helmholtz
    
    ![[image 22 2.png|image 22 2.png]]

    
- Positivite
### Mesurée
- Goniophotometer
- ...
  
### Modèles
- Blinn-Phong
- Cook-Torrance
- GGX
- ...
$f_r(x, \theta_i,\theta_o)=k_df_d(x,\theta_i,\theta_o)+k_sf_s(x,\theta_i,\theta_o)$
  
## Principe du rendu
  
On lance des rayon aleatoirement dans l’espace mais on tiens compte de la BRDF de l’objet. On converge donc plus vite vers une solution liee a la scene
![[image 23.png]]

On ne calcul pas l’apport de la soucre lumineuse mais on espere juste qu’un des rayon tombe sur la source lumineuse. Ca va donc prendre un petit peu de temps.
![[image 24.png]]

Ici on ne peut pas vraiment avoir de lumiere ponctuelle, on va preferer des objet lumineux.
  
### Avantages
- Rendu réaliste
- Rend les caustiques (on va lancer des rayons à l’intérieur des objets transparents)
- Convient bien aux scènes d’extérieurs
- Prend bien en compte la lumière indirecte
- Possibilité de modéliser les effets (profondeur de champ...) mais c’est très coûteux
- On as naturellement des ombres douces
### Inconvenients
- Demande beaucoup de puissance de calul
- **Lent** (vraiment)
- Bruité (Il faut vraiment# beaucoup d’itérations pour converger)
- Le bruit des séquences vidéos est “désastreux"

> [!important] On a un très (très) grand nombre de rayons à lancer ⇒ prends énormément de temps.
> 
> Comment faire pour accélérer le processus ? Quels rayons peut on omettre ?
  
## Bidirectional Path Tracing
  
### Amélioration du rendu
Lancement des rayons depuis l’observateur **ET** depuis les sources lumineuses
![[image 25.png]]

On tiens bien compte de la BRDF.
### Avantages
- Facilite la recherche de chemin vers la source lumineuse
- Permet de modéliser des petites sources lumineuses
- On va aller beaucoup plus vite
On auras toujours du bruit dans les images (on reste dans de l’aléatoire). Et ca demande toujours beaucoup de temps même si on en gange beaucoup.
On va souvent utiliser des débruiteur, facile car on connais les objets.
  
# PBGI : Point-Based Global Illumination
  
Méthode pour estimer l’illumination globale.
Beaucoup utilisée pour le cinéma
### Avantages
- Rapide
- Image non bruitée (pas d’artefacts temporel)
### Inconvénients
- Pas aussi précis que le raytracing
- Difficile de gérer les effets miroir
## Approximation de la scène par un nuage de points
  
Un point = un disque de couleur
Calcul de l’illumination directe de la scène
![[image 26.png]]

![[9ef62f09-9c10-4920-8761-1ec8390d570d.png]]

### Calcul de l’illumination globale
Calcul de la contribution des points sur un point :
- Pour les points éloignés
    - Utilisation du cluster
- Pour les points proches
    - Raytracing
- Pour les autres points
    - Utilisation directe du disque
  
![[image 27.png]]

  

> [!important] Algorythme utilisé dans Pirate des Caraïbes
  
  
# Bilans et remarques
  
On est censé avoir compris les avantages, inconvénients, difficultés et solutions de chaques algorythmes.
On a les outils pour choisir l’algorythme qu’on va utiliser selon notre contexte.