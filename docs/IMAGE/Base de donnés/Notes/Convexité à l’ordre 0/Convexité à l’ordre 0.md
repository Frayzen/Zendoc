---
Matière:
  - "[[Optimisation Convexe 1]]"
Type: Cours
Date du cours: 2025-03-10
Supports:
  - "[[convexite_0.pdf]]"
---
![[image 86.png|image 86.png]]
  
# Sous parties de $\mathbb{R}^n$
  
![[image 1 19.png|image 1 19.png]]
  
## Représentation paramétrique
  
### Graphe
![[1925fc35-c8a0-4c36-b0cd-3bd3028292d9.png]]
### Épigraphe
![[f59e50aa-10e9-4450-8649-27ce68a1d415.png]]
![[image 2 19.png|image 2 19.png]]
![[image 3 16.png|image 3 16.png]]
  
## Représentation implicite
  
### Coubre de niveau
![[image 4 15.png|image 4 15.png]]
![[image 5 15.png|image 5 15.png]]
### Lieu de sous-niveau
![[image 6 14.png|image 6 14.png]]
![[image 7 13.png|image 7 13.png]]
![[image 8 11.png|image 8 11.png]]
On appelle ces représentations ”implicite” car la sous-partie est données comme la solution d'une équation.
  

> [!important] Attention aux dimension de ces ensembles !!!
  
## Lien entre les représentations
  
### Paramétrique → Implicite
![[image 9 11.png|image 9 11.png]]
  

> [!important] L’écriture paramétrique d’une partie donnée implicitement n’est en général pas<br>possible (cf théorème des fonctions implicites).
  
  
# Ensemble convexe
  
## Définition
![[image 10 10.png|image 10 10.png]]
### Exemple
![[image 11 9.png|image 11 9.png]]
  
## Propriétés
![[image 12 9.png|image 12 9.png]]
### Définitions
![[image 13 9.png|image 13 9.png]]
  
## Hyperplan d’appui et séparation des convexes
  
### Point de bord
![[e98b900a-4597-4e59-aa40-d53d54931123.png]]
Pour $[0,1[$ ses bords sont : $\partial A=\{\{0\},\{1\}\}$
### Hyperplan d’appui
![[093d1a10-b2b9-40af-ab12-ec488b006354.png]]

> [!important] Une partie convexe admet un hyperplan d’appui en tout point de son bord.
  
# Fonction convexe
  
## Convexité a l’ordre 0
![[image 14 9.png|image 14 9.png]]
### Exemple de fonctions convexes
![[image 15 9.png|image 15 9.png]]

> [!important] Les seules fonctions convexes et concaves sont les fonctions affines.
  
## Composition des fonctions convexes
![[image 16 9.png|image 16 9.png]]
  
## Norme et convexité
  
![[image 17 9.png|image 17 9.png]]
![[image 18 9.png|image 18 9.png]]
  

> [!important] Toute fonction sous-linéaire est convexe ⇒ toute les **norme** sont **convexes**.
  
![[image 19 9.png|image 19 9.png]]
  
  
## Lien entre fonction convexe et partie convexe
  
### Lien entre graphe et épigraphe
![[image 20 8.png|image 20 8.png]]
### Lien entre graphe et lieux de sous niveau
![[image 21 8.png|image 21 8.png]]
  
  
# Rappel sur la continuité d’une fonction
  
## Continuité d’une fonction $f:\mathbb{R}\rightarrow \mathbb{R}$
![[image 22 7.png|image 22 7.png]]
## Continuité d’une fonction $f:\mathbb{R}^n\rightarrow \mathbb{R}^n$
![[image 23 5.png|image 23 5.png]]
  
## Règles de continuité d’une fonciton
  
### Comment déterminer qu’une certaine fonction est continue :
![[image 24 5.png|image 24 5.png]]
  
### Continuité d’une fonction à plusieurs variables
![[image 25 5.png|image 25 5.png]]
**Exemple pathologique classique :**
![[image 26 5.png|image 26 5.png]]
  
## Fonction $k$-lipschitzienne
  
![[image 27 5.png|image 27 5.png]]
![[Lipschitz_Visualisierung.gif]]
![[image 28 5.png|image 28 5.png]]

> [!important] Toute fonction $k$-lipschitzienne est ==**continue**==.
![[image 29 5.png|image 29 5.png]]

> [!important] Toute **norme** est $1$-lipschitzienne donc **continue**.
![[image 30 5.png|image 30 5.png]]