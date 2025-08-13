---
title: Introduction 8
Matière:
  - "[[Introduction à l’imagerie médicale]]"
Type: Cours
Date du cours: 2025-04-29
Supports:
  - "[[cours_IMED_IMAGE_intro-46-62.pdf]]"
---
# Histoire
![[cours_IMED_IMAGE_intro-1-45_compressed.pdf]]
  
# Enjeux de l’imagerie médicale aujourd’hui
  
Les ondes sont à la base des images médicales
![[image 99.png|image 99.png]]
Tout ce qui se trouve au dessus de la lumière visible est néfaste pour l’homme.
  
## Principe général d’aquisition d’une image
  
![[image 1 31.png|image 1 31.png]]
L’emetteur emmet des ondes qui vont interragir avec l’objet et sont ensuite interseptées par le récepteur. On va finalement utilisé la numérisation pour visualiser les résultat.

> [!important] Il ‘y a rien de pire en terme de robustesse statistique que le vivant !
  
## Format des images médicales
  
D’après les cours de Maxime Descoteaux
Il n’existe normalement pas de standard. Il y a une infinité de formats différents.
Les plus connus:
- .dcm DICOM [https://www.dicomstandard.org/](https://www.dicomstandard.org/)
- .nii NIFTI
- .hdr .img Analyze
- .ima .dim Gis (France)
- .mnc Minc (Montreal Neurological Institute (MNI))
- .nrrd Nrrd (USA)
- .mhd ITK
On a donc beacoup de soucis à l’ouverture des images. Il faut des bibliothèques spéciales pour les ouvrir.
Quelques bibliothèques python : medpy, nibabel, pydicom...

> [!important] Conseil: vérifier chaque nouvelle image en essayant de l’ouvrir
  
### DICOM
C’est le ormat le plus répandu dans les hôpitaux (tous les nouveaux appareils cliniques supportent le format DICOM).
C’est une boîte à fourre-tout. Les ocnstructeurs définissent leur “tag” ou étiquette maisons. Il devient très compliquer de traiter les image.
Pour être étique il faut dénormaliser.
**Information impartante dans l’entête**
- Taille du voxel
- Taille de l’image
- Matrice de transformation
- Type des données
![[image 2 31.png|image 2 31.png]]
Ce sont des images en “3D”, il s’agit d’une supperposition de “tranches”.
![[image 3 27.png|image 3 27.png]]
3 orientations : axial, sagittal et coronal
Pour certains cas on est pas dans ces 3 axes. ==ex: imagerie cardiaque==
  
### La résolution
  
Un pixel/voxel a une taille qui correspond à des longueurs physiques en imagerie médicale !
Plus cette taille est petite, meilleure est la résolution !
x, y et z peuvent être identiques (isotrope) ou différents (anisotrope). En général, c’est z qui fait n’importe quoi...
![[image 4 26.png|image 4 26.png]]
La résolution est souvent anisotrope.
![[image 5 25.png|image 5 25.png]]
![[image 6 23.png|image 6 23.png]]
![[image 7 21.png|image 7 21.png]]
### **Effet de volume partiel : l.m. (partial volume effect)**

> « Dans les imageries en coupes avec reconstruction matricielle, effet dû à l’existence au sein d’un même pixel de structures, de densité (scanographie) ou de signal (IRM) très différents. »  
> - d’après le dictionnaire médical de l’académie de médecine
![[image 8 19.png|image 8 19.png]]
![[image 9 19.png|image 9 19.png]]
L’effet de volume partiel est donc un réel problème.
On v donc devoir faire un compromis entre faible et haute résolution.
![[image 10 18.png|image 10 18.png]]
![[image 11 17.png|image 11 17.png]]
  
### Les bases de données annotées
L’annotation est une tâche très chronophage qui ne peut être réalisée que par un spécialiste, et donc un médecin !
![[image 12 16.png|image 12 16.png]]
Un seul annotateur = Apprendre à reproduire le chemin de décision du médecin, comme si on le  
« clonait »
Nécessité d’anonymiser les données : surcouche par rapport à la routine clinique
Erreurs d’annotations. Un même annotateur ne va pas annoter de la même manière. ex: début des données VS fin des données.