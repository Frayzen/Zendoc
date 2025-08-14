---
title: Morphologie Mathématique 1
Matière:
  - "[[Traitement d’image fondamental Python]]"
Type: Cours
Date du cours: 2025-04-04
Supports:
  - "[[TIFO_morpho_math_cours_1.pdf]]"
---
# Un peu d’histoire
  
C’est une invention **française** 🇲🇫. Née en 1964 aux MINES ParisTech (ENSMP à Fontainebleau), c’est Georges Matheron et Jean Serra (son doctorant) qui sont les pionniers de cette discipline.

> Le nom de “Morphologie Mathématique” à été choisi...dans un bar ! 🍻
![[image 95.png|image 95.png]]

Il a fallu attendre 1982 avec la parution du livre de Serra en Anglais et 1987 avec les premiers articles dans IEEE PAMI (un très bon journal international) pour que la morphologie mathématique soit internationalement reconnue.
Depuis, elle est utilisée dans le monde entier, une conférence internationale lui est dédiée, on retrouve les principaux outils dans les bibliothèques communes de traitement d’image en python !
  
# ⚠️ Attention à OpenCV
  
OpenCV, c’est cool, ça existe en C++ et en Python. Oui mais...
Pour importer OpenCV v1 : import cv  
Pour importer OpenCV v2 : import cv2  
Pour importer OpenCV v3 : import cv2  
Pour importer OpenCV v4 : import cv2 (pourquoi changer ?)
![[OpenCV_logo_black.svg.png]]

D.une version à l’autre les fonction ou paramètres par défaut changent.
RGB? non, BGR...  
xyz? non, zyx...
Est très compliquer à hybrider.
OpenCV c’est super puissant, mais à prendre avec des pincettes…
  
# Concept de base
  
On assimile une image en 2D avec une fonction 3D.
![[image 1 27.png|image 1 27.png]]

![[image 2 27.png|image 2 27.png]]

  
## Notion d’ordre
Critères pour ordener l’élévation des pixels.
Une des bases de la morphologie mathématique est la noti on d’ordre .  
On doit pouvoir établir une relation d’ordre entre chaque élément considéré (pixels, groupes de pixels etc) .
![[image 3 24.png|image 3 24.png]]

  
## Notion de treillis complet
C’est une structure **ordonnée** qui a toutes les propriétés vues juste avant ( re flexi ve, antisymét rique, transitive , et dont t oute partie admet un sup et un in f ).
![[image 4 23.png|image 4 23.png]]

  
# Propriétés générale
  
Les opérateurs en mo rphologie mathématique répondent aux propriétés suivantes :
Soit $𝛺$ un opérateur morphologique, $x$ et $y$ deux parties de treillis
- $𝑥 ≤ 𝑦 ⟹ Ω 𝑥 ≤ Ω(𝑦)$ Croissance
- $𝑥 ≤ Ω 𝑥$ 𝑜𝑢 $Ω 𝑥 ≤ 𝑥$ Extensivité ou Antiextensivité
- $Ω Ω 𝑥 = Ω 𝑥$ Idempotence
On peut aussi construire de nouveaux opérateurs. Soit Ω et Ψ deux opérateurs morpho, on peut construire :
- par composition : $Γ 𝑥 = Ω(Ψ 𝑥)$
- par différence : $Γ 𝑥 = Ω 𝑥 − Ψ 𝑥$
  
## En quelque mots
  
La morphologie mathématique fait partie de la catégorie de traitement d’images dite "non linéaire", contrairement à la convolution, Fourier et les ondelettes !
⇒ Ca signifie que toutes les parties de l’image ne vont pas réagir de la même manière à l’application d’outils de morphologie mathématique !
⇒ Ce genre de propriétés permet d’être beaucoup plus générique et efficace, en particulier parce qu’on est invariant au contraste !
  
## La connexité
  
La connexité, c’est le voisinage des pixels. En gros c’est le nombre de voisins que l’on considère  
comme étant "connectés" au pixel considéré. En 2D, on va considérer la connexité 4 et 8 surtout.

> [!important] Attention à la connnexité sur OpenCV ou sikit.
En 3D, on considère la connexité 6, 18 et 26. Pour voir à quoi cela correspond, imaginez (ou prenez) un Rubik’s cube : 6 = les cubes centraux, 18 = tout sauf les angles et 26 = tout!
![[image 5 22.png|image 5 22.png]]

  
### Influence
  
Une composante connexe, c’est un ensemble de pixels qui sont connectés selon une connexité. Ainsi on n’a pas le même nombre d’objets si on est en connexité 4 ou 8!
![[image 6 20.png|image 6 20.png]]

![[image 7 19.png|image 7 19.png]]

  

> L’idée de base de la morphologie mathématique est de  
> comparer ce qu’on veut traiter avec un objet de  
> géométrie connue : l’élément structurant.
  
### L’élément structurant
  
Un élément structurant a les caractéristiques suivantes :
- il a une forme connue
- il a une taille connue
- il a une origine (qui peut être à l’extérieur de lui même mais c’est rare)
![[image 8 17.png|image 8 17.png]]

![[image 9 17.png|image 9 17.png]]

  
# Les opérateurs
  
## L’érosion
  
Nous allons considérer que l’image est binaire, le fond est noir (0), et elle contient un objet blanc (255) $X$.
L’érosioin va venir “_grignoter_” l’objet blanc.
On considère un élément structurant $B_z$, avec une origine $z$.
$\epsilon(X)_B=\{z/B_z\subset X\}$
[https://www.youtube.com/watch?v=b5lgnNEzGeU](https://www.youtube.com/watch?v=b5lgnNEzGeU)
  
  
## La dilatation
  
Cette fois ci, on "repousse les bords" de l’objet.
$\delta(X)_B=\{z/B_z\cap X\neq \empty\}$
[https://www.youtube.com/watch?v=3IJ8RFtlDLY](https://www.youtube.com/watch?v=3IJ8RFtlDLY)
  
## Ouverture
  
Il s’agit d’une érosion suivie d’une dilatation.
L’ouverture, comme elle érode en premier, élimine les objets plus petits que l’élément structurant (car il n’y a aucun pixel conservé si l’élément structurant ne rentre pas dans la composante).
![[image 10 16.png|image 10 16.png]]

![[image 11 15.png|image 11 15.png]]

  
## Fermeture
Il s’agit d’une dilatation suivie d’une érosion.
La fermeture, comme elle dilate en premier, élimine les trous plus petits que l’élément structurant (car la dilatation les aura bouchés !).
![[image 12 15.png|image 12 15.png]]

  
## Bilan
  
La forme de l’élément structurant va "sélectionner" les formes qu’on garde ! On filtre en quelques sortes en fonction de la taille/forme !
Erosion
- Agrandit des trous
- Déconnecte des objets
- "augmente le noir"
![[f5f7c927-79fe-4e1b-a063-3dd9a552f30e.png]]

Dilatation
- Remplit les trous
- Connecte l es objets
- "augmente le blanc"
![[22ecc523-1fee-4160-97f1-d92ef9c2a5d3.png]]

- $z$ érosions de taille $y =$ une érosion de taille $z*y$
  
L’ouverture et la fermeture sont des outils très puissants en morphologie mathématique !
Ils permettent de sélectionner les objets en fonction de la taille et de la forme de l’élément structurant.
Les ouvertures et fermetures sont idéales dans des problèmes de filtrage/débruitage!
![[image 13 15.png|image 13 15.png]]

- $z$ ouverture de taille $y =$ une ouverture de taille $y$ (idempotence)
- $z$ ouvertures de taille $y\neq$ une ouverture de taille $z*y$

> [!important] Ces propriétés sont vraies si on remplace érosion par dilatation et ouverture par fermeture
  
![[image 14 15.png|image 14 15.png]]

  
  
# En niveau de gris
  
En niveaux de gris, on peut voir l’érosion et la dilatation comme une étude des niveaux de gris présents dans une fenêtre glissante représentée par l’élément structurant.
Comme en binaire, on regarde le pixel de l’origine de l’élément structurant.
Cette fois, on lui attribue le min ou le max pour les pixels correspondants à l’élément structurant de leurs niveaux de gris.
![[image 15 15.png|image 15 15.png]]

  
![[image 16 15.png|image 16 15.png]]

  
## Les filtres
  
Les filtres morphologiques sont des opérateurs régis par  
les propriétés déjà vues :  
• Ils sont croissants  
• Ils sont idempotents  
L’ouverture et la fermeture sont des filtres ! Mais on  
peut également les composer afin de créer de nouveaux  
filtres qui respectent ces propriétés.
  
### Supremum d’ouverture, infimum de fermeture
**Propriétés :**
- Tout supremum d’ouverture est une ouverture
- Tout infimum de fermeture est une fermeture
![[image 17 15.png|image 17 15.png]]

Image originale
![[image 18 15.png|image 18 15.png]]

![[image 19 15.png|image 19 15.png]]

![[image 20 14.png|image 20 14.png]]

Spectrum d’ouvertures
Illustration : filtrer un fond d’oeil
![[image 21 13.png|image 21 13.png]]

  
### Filtres alternés et alternés séquencés
Que se passe-t-il lorsque nous composons des ouvertures et des fermetures ?
![[image 22 11.png|image 22 11.png]]

Alterner des ouvertures et fermetures de tailles croissantes permet de filtrer « en douceur » l’image ou le signal.
On parle alors de filtres alternés séquencés.
Ils sont utilisés pour débruiter en limitant la perte d’information.
Illustration sur une image en niveaux de gris :
![[image 23 9.png|image 23 9.png]]

