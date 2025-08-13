---
title: Textures
Matière:
  - "[[Introduction à la synthèse d’image]]"
Type: Cours
Date du cours: 2025-03-17
Supports:
  - "[[isim_textures_compressed.pdf]]"
---
![[zcquxjcy4t0r.webp]]
  
### Objectifs
- Ajouter du réalisme
- Simplier la modélisation des scènes
- Simuler l'éclairage
### Applications :
- Algorithmes temps réels
- Algorithmes photoréalistes
### Types :
- Textures procédurales
- Textures plaquées
- Effet de volume
- Éclairage
  
## Les couleurs
### Associer une couleur par face
- Effet de volume donné par l'illumination
    - Gouraud
    - Phong
### Associer une couleur par sommet
- Interpolation
### Indiquer les propriétés des matériaux
- Diffusion
- Spécularité
- ...
  
# Textures plaquées ([[Textures]])
  
Mapper un bitmap sur un polygone
- Réalisme
- Consommation mémoire élevée
Comment plaquer une texture ?
- Sur un plan → facile
- Sur une surface quelconque ?
    - Trouver une fonction
    - Plaquer la texture suivant une projection simple
        - Plan
        - Sphère
        - Cylindre
        - Cube
        - ...
    - Conformal map
  
### Projections :
- Planaire,
- Cylindrique,
- Spherique,
- Triplanaire
![[image 89.png|image 89.png]]
Triplanaire
![[image 1 22.png|image 1 22.png]]
  
Association texture $↔$ model
![[image 2 22.png|image 2 22.png]]
![[image 3 19.png|image 3 19.png]]
### [Conformal map](https://fr.wikipedia.org/wiki/Transformation_conforme)
![[image 4 18.png|image 4 18.png]]
  
“Mapper” un bitmap sur un ploygone
  
## Origine du Bitmap
### Image
Photo
![[image 5 18.png|image 5 18.png]]
Peinture
![[image 6 17.png|image 6 17.png]]
Résultat d’un rendu (surface réfléchissante)
![[image 7 16.png|image 7 16.png]]
  
![[image 8 14.png|image 8 14.png]]
Interpolation dépendante du $z$
Répétition de la texture si non compris entre $0$ et $1$
  
### Texture répétitive
![[image 9 14.png|image 9 14.png]]
Le motif peut devenir visible $\rightarrow$ Prendre des patches plus petits
![[image 10 13.png|image 10 13.png]]
  
## [Mipmap](https://fr.wikipedia.org/wiki/MIP_mapping)
  
Le but du MIP mapping est d'éviter la pixelisation lorsqu'on s'éloigne d'une texture.  
Le niveau de détail des textures est adapté à la distance de l'objet
![[image 11 12.png|image 11 12.png]]
  
### Lissage
- Mip mapping : niveau de détail (LOD)
- Point sampling : texel le plus proche
- Bilinéaire : interpolation sur 4 texels
- Trilinéaire : interpolation inter-LOD
- Anisotropique : prise en compte des eets d'angle (32 texels)
  
![[image 12 12.png|image 12 12.png]]
  
  
# Textures procédurales
  
## Bruit de Perlin
  
On génère quelque point sur une grille et on interpolle. Donne un aspect structuré.
On va prendre pluseiurs carte aléatoire (octaves) en changeant l’écartement entre les points puis on les somme.
On choisit si les hautes ou les basses fréquences sont plus fortes.
![[image 13 12.png|image 13 12.png]]
On va ensuite appliquer des couleurs en fonction de la valeur des fréquences.
### Applications
- Fumée :
    
    - Interpolation du blanc $\rightarrow$ noirColorramp from white $→$ to black
    
    ![[image 14 12.png|image 14 12.png]]
    
- Ciel / Nuages
    
    - En dessous d'un certain seuil : Interpolation du gris bleu → bleu
    - Au dessous d'un certain seuil :Above another threshold : bleu
    
    ![[image 15 12.png|image 15 12.png]]
    
- Bois
    
    - En dessous d'un certain seuil, marron foncé
    - Au dessus d'un certain seuil, marron clair
    - Entre les deux, interpolation
    
    ![[image 16 12.png|image 16 12.png]]
    
- Psyco
    
    ![[image 17 12.png|image 17 12.png]]
    
- Marbre
    
    - $n=1\sqrt{|sin(2\pi)|}$
    - Interpolation linéaire du gris vers le noir en fonction de $n$…
    
    ![[image 18 12.png|image 18 12.png]]
    
  
## Effet de volume
  
### Perturbation normale
On ne veux pas modéliser toute les variations locales : ce serait trop lourd.
On va donc prendre les normales à la surface et les bruités selon les circonvolution locale. Donne des effetes d,ombre et de lumières qui donne l’impression que la surface à des aspérités. Le contour lui reste lisse.
![[image 19 12.png|image 19 12.png]]
![[image 20 11.png|image 20 11.png]]