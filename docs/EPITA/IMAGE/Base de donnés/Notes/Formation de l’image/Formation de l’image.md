---
title: Formation de l’image
Matière:
  - "[[Traitement d’image fondamental C++]]"
Type: Cours
Date du cours: 2025-02-19
Supports:
  - "[[tifo_formation_image_(1)_compressed.pdf]]"
---
[[Rappels]]

  
## Acquisition
Difference CCD / CMOS
Transfert de donnees :
- entrelaces
- progressif
On utilise le RVB car l’oeil humaine a des cones (capteurs) avec des bandes de frequences correspondant a ces 3 couleur.
  
  
## Visualisation
Technologies :
- CRT (Cathode Ray Tube)
- LCD (Liquid Cristal Display avec Neons ou leds)
- LED
![[image 28.png|image 28.png]]

  
  
## Perception
  
### L’oeil
![[image 1 11.png|image 1 11.png]]

![[image 2 11.png|image 2 11.png]]

Capteurs :
- Cônes (7 000 000), perception r/v/b, vision diurne, maximal dans la fovéa
- Bâtonnets (120 000 000), vision scotopique, maximal en périphérie
Nerf optique transmet les info.
On as une zone aveugle que le cerveau corrige automatiquement.
Dan l’oeil il n’y a pas de différence entre un rayon jaune et deux rayons vert et rouge
  

> [!important] Notre perception des couleur influence le codage de l‘image et la maniere dont on construit les dispositif de visualisation.
### La perception humaine est
- Logarithmique
- Maximum dans le vert
- Varie dans le temps (persistance retinienne)
  
### ⚠️ A notre perception
![[image 3 8.png|image 3 8.png]]

![[image 4 7.png|image 4 7.png]]

Ici toute les lignes sont paralleles.
![[image 5 7.png|image 5 7.png]]

![[image 6 7.png|image 6 7.png]]

Ici les lignes sont droites.
![[image 7 6.png|image 7 6.png]]

![[image 8 4.png|image 8 4.png]]

![[image 9 4.png|image 9 4.png]]

Ici les lignes et disque centraux sont de meme taille.
![[image 10 3.png|image 10 3.png]]

ici les cercles centraux sont de la meme couleur.
  
  
# Conclusion
Nos dispositifs sont fortement influencés par notre perception.
La perception humaine doit parfois être prise en compte dans les traitements.
L’interprétation des images doit se faire à l’aide de critères objectifs (Évaluation).