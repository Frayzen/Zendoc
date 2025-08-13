---
title: Introduction
Date du cours: "2025-02-18"
Supports:
  - "[[isim_introduction_compressed.pdf]]"
Type: Cours
re:
  - "[[Introduction à la synthèse d’image]]"
---
![[image 20.png|image 20.png]]

  
### Qu’est ce que la synthèse d’image
Modéliser la forme, l’apparence et les mouvements du monde réel ou d’objets imaginaires avec un ordinateur.
  
### Informatique Graphique 3D
Modéliser la forme, l’apparence et les mouvements du monde réel ou d’objets imaginaires avec un ordinateur.
### Réalité Virtuelle
Simulation informatique interactive immersive, visuelle, sonore et/ou haptique, d’environnements réels ou imaginaires
  

> [!important] On va se focalisé sur le rendu temps réel et le rendu photoréaliste.
> 
> ==Avec le temps les deux se rejoignent grace aux performances des cartes graphiques.==
  
Les réseaux de neuronnes aident au rendu. On fait un rendu a petite échelle et on demande au réseau de neuronne de corriger le grain et dùaméliorer la qualité du rendu.
On touche à beaucoup de domaine en même temps : physique, parallélisation, géométrie…
  
  
## Modélisation
Représenter et traiter la forme des objets 3D.
- Modèles
    - maillages, splines, subdivision, implicites, points (MLS)
    - Tet-meshes, voxels, implicites
- Numérisation/scanning 3D
- Traitement Numérique
    - Reconstruction, simplification, optimisation, raffinement, paramétrisation, tri/quadrangulation
- Analyse
    - Laplacienne, multiresolution, par partitionnement
- Modélisation interactive
Il y a plein de manières de représenter les objets et d’obtenir les maillages.
On essaye d’adapter le modèle selon l’importance au moment du rendu (ex : adaptation du niveau de détails selon la distance à l’objet dans un jeu vidéo).
## Rendu
Il faut resoudre beaucoup de questions si on veut une bonne image.
Synthétiser des images à partir des modèles 3D.
- Détermination des parties cachées
- Géométrie projective
- Couleur
- Ombrage
- Micro- (BRDF) et Meso- (BTF) structure
- Éclairage global
- Temps-réel
    - Rasterization
    - Ray tracing
    - Ombres, structures multirésolution, éclairage indirect, texture/cartes couleur et normales
    - GPU (Graphics Processor Unit)
- Expressif / Non-photoréaliste
    - Rendu cartoon
  
  
## Animation
  
On traite les pixels non plus 1 a 1 mais par lots, cependant on dois appliquer la même operation sur tous les pixels (parallélisation).
- Corps articulés
- Physique des solides
- Fluides
- Design d’animation
- Muscles, peau, cheveux
- Capture de performance

> [!important] On auras un cours d’animation l’année prochaine au S9
  
  
## Domaines liés à la synthèse d’image
- Programmation GPU.
- Traitement d’images (image HDR)
  
# Applications
- Réalité augmentée,
- Cinéma,
- Jeux vidéo,
- Simulation (civil, militaire),
- Assistance chirurgicale,
- Architecture
- CAO
- …
  
  
## Outils
Modeleurs
- Outils d’animation
- Moteurs de rendu
- Rendu réaliste
    - POVRAY
    - Blender
    - Maya
- Rendu temps réel
    - OpenGL
    - Direct 3D
    - Java 3D
- Moteurs
    - Unity (commercial)
    - Ogre (open soucre)
Il faut un outils **ergonomique** pour adapter les modèles à notre situation.

> [!important] On va utiliser ==**OpenGL**== car **Vulcan** est trop bas niveau, il faudrais tout les TPs pour faire un premier programme, et **Unity** est trop haut niveau, on ne comprendrais pas ce qui se passe.
Un jour OpenGL finiras par s’arrêter car il demande besoin de trop de modification dqns les cartes graphiques pour suivre les standards actuels, il seras doucement remplacer par Vulcan.
