---
title: Introduction aux modèles de programmation parallèle et massivement parallèle
Matière:
  - "[[Implémentation Rapide GPGPU]]"
Type: Cours
Date du cours: 2025-03-19
Supports:
  - "[[j1-part1-history.slides 2.pdf|j1-part1-history.slides 2.pdf]]"
---
# Histoire des GPU
## Pourquoi utiliser des GPU ?
  
On veux faire les choses **rapidement.**
### Les 3 grands domaines d’applications
![[image 92.png|image 92.png]]

- Developpement mobile : batterie limité
- Analyse de Big Data : Énorme volume de données
- Systèmes en temps réel : dois fournir une réponse dans un temps limité
Le
![[image 1 25.png|image 1 25.png]]

  
# Scientific computing
  
![[ikonas.mp4]]

  
Dans les années 70, les GPU étaient destinés à la synthèse d'images.
« Tous les calculs sont effectués dans l'écran Adage 3000 » (1)
  
### Les 1er GPU (99-2011)
  
Premier GPU : Ikonas RDS-3000
**Ikonas Geforce 3**
Premier GPU programmable :
- Vertex Shaders – Transformations de vertex programmables, 32 bits à virgule flottante
- Texturation configurable et dépendante des données + combinateurs de registres
A permis d'obtenir les premiers résultats GPGPU :
- Hoff (1999) – Diagrammes de Voronoï sur NVIDIA TNT2
- Larsen et McAllister (2001) : première multiplication matricielle GPU (8 bits)
- Rumpf et Strzodka (2001) : premières EDP GPU (diffusion, segmentation d'image)
- NVIDIA SDK Game of Life, Shallow Water (Greg James, 2001)
![[738-front.jpg]]

  
### GPGPU devienne à la mode (2006)
  
Deux facteurs expliquent l'essor massif du développement de GPGPU :
- Architecture GPU Nvidia G80 et plateforme logicielle conçue pour le calcul
    - Mode de calcul dédié : threads plutôt que pixels/sommets
    - Architecture mémoire générale adressable par octet
- Support logiciel : langages C et C++ et compilateurs pour GPU (spoiler… CUDA)
  

> **Publicité Nvidia pour le G80 :**  
> Un programmeur pourra utiliser le G80 comme un moteur de traitement de données hautement parallèle. Les applications nécessitant une puissance de calcul massivement parallèle verront leurs performances considérablement accélérées sur le G80 par rapport au processeur. Cela inclut l'analyse financière, la manipulation de matrices, le traitement physique et toutes sortes de calculs scientifiques.
  
### Datacenter (20010’s)
  
Le « calcul haute performance » (HPC) donne naissance aux centres de données d'entreprise.
![[image 2 25.png|image 2 25.png]]

  
## Systèmes embarqués (2013)
  
![[image 2 24.png|image 2 24.png]]

  
# La Programmation Parallèle
  
## Comment faire les chose rapidement
  
1. Faire moins de travail
2. Faire du travail plus efficacement
3. Faire du travail en même temps
4. Distribuer le travil entre collègue
  
(1) : Choisir les meilleurs algorithmes et éviter de re-coder les choses
(2) : Choisir les structures de données les plus adaptées
(3 & 4) : Parallélisation
  
## Pourquoi le parallélisme ?
  
Loi de Moore : les processeurs ne sont plus 2x plus puissants chaques années.
![[image 3 21.png|image 3 21.png]]

Les processeurs deviennent intelligents :
- Exécution hors service / renommage dynamique des registres
- Exécution spéculative avec prédiction de branchement
Les processeurs deviennent super-scalaires :
- pendant que la fréquence d'horloge du processeur est limitée…
- … la quantité de données à traiter a explosé !
Il nous faut une autre façon de concevoir la « vitesse ».
![[image 4 20.png|image 4 20.png]]

  
## Programmation parallèle orienté-données
  
### Ligne de d’assemblage d’une fabrique de sandwichs
  
![[image 3 22.png|image 3 22.png]]

Comment préparer plusieurs sandwichs le plus rapidement possible ?
- Optimiser la ==**latence**== : temps de préparation d'un sandwich.
- Optimiser le ==**débit**== : nombre de sandwichs préparés pendant une durée donnée.
  
### Taxonomie de Flynn
![[image 4 21.png|image 4 21.png]]

- SISD : pas de parallélisme
- SIMD : même instruction sur un groupe de données (vecteur)
- MISD : rare, principalement utilisé pour le code tolérant aux pannes
- MIMD : mode parallèle habituel
  
### Optimisation de la ==latence== ==-== MIMD avec collaboration de travailleurs
  
4 super-travailleurs (4 coeurs CPU) collabore pour faire 1 sandwich.
- Manu prends et coupe le pain puis attends les autres
- Donald coupe la salade
- Angela coupe les tomates
- Kim coupe le fromage
![[image 5 20.png|image 5 20.png]]

Temps pour faire 1 sandwitch : $\frac{s}{4}$ (400% de speed-up)
  
### Optimisation du ==débit== - MIMD Horizontal with multiple jobs
  
- Manu fais le sandwitch 1
- Donald fais le sandwitch 2
- …
![[image 6 19.png|image 6 19.png]]

Temps pour faire 4 sandwitch : $s$ (400% speed-up)
  
### Optimisation du ==débit== - (MIMD Vertical Pipelining)
  
- Manu coupe le pain
- Donald coupe la salade
- Angela coupe les tomates
- …
![[image 7 18.png|image 7 18.png]]

Temps pour faire 4 sandwitch : $s$ (400% speed-up)
  
### **Optimize du** ==**débit**== **- SIMD DLP**
  
A worker has many arms and make 4 sandwiches at a time
![[image 8 16.png|image 8 16.png]]

Temps pour faire 4 sandwitch : $s$ (400% speed-up)
  
## Tendances
  
La conception orientée données a transformé la façon dont nous concevons les processeurs (et même les CPU) :
- Fréquence d'horloge plus faible
- Taille vectorielle plus importante, ISA plus orientée vecteur
- Nombre accru de cœurs (unités de traitement)
![[image 9 16.png|image 9 16.png]]

Les performances de pointe / cœurs diminuent.
Les performances de pointe mondiales augmentent (avec plus de cœurs !).
![[image 10 15.png|image 10 15.png]]

  
### Perfomances CPU vs GPU
  
![[image 11 14.png|image 11 14.png]]

  
### Vers une architecture homogène
  
## Architecture GPU vs CPU
  
CPU
AlU qui font le calcul
Plus de la moitie de la place est prise par le cache (gestion de memeoire)
  
GPU
Peu de cache
Toute la place est prise par les ALU
  

> [!important] Warp
  
Dans gpu tout est plus lent
Beacoup de thread qui commutent
  

> [!important] Thread ID $\ne$ ID block
Lattence de branche a + celle de la branche b