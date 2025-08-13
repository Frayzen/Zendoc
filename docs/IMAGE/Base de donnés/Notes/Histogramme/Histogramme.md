---
title: Histogramme
Matière:
  - "[[Traitement d’image fondamental C++]]"
Type: Cours
Date du cours: 2025-02-21
Supports:
  - "[[tifo_histo_compressed.pdf]]"
---
## L’histogramme
- Nombre d’occurences par niveau
- Recense les occurrences de chaque couleur
- Donne une information globale sur l’image
- Permet la réalisation de petits traitements globaux
- Peut être calculé sur une image en couleur
  
# L’histogramme par niveau de gris
  
  
![[image 81.png|image 81.png]]
On peut voir le ciel au niveau du pic.
![[image 1 14.png|image 1 14.png]]
![[image 2 14.png|image 2 14.png]]
![[image 3 11.png|image 3 11.png]]
Les images sont toutes un peu sombre On utilise pas correctement l’intégralité du spectre.
```JavaScript
histogramme : tableau initialisé à 0
image : l ’ image sous forme d ’ un v e c t e u r
f o r ( o f f s e t =0; o f f s e t <sx ∗ sy;++ o f f s e t ) {
histogramme [ image [ o f f s e t ]]++;
}
```
Il donne des information sur lìmage :
![[image 4 10.png|image 4 10.png]]
Sous exposée
![[image 5 10.png|image 5 10.png]]
Manque de contaste
![[image 6 10.png|image 6 10.png]]
![[image 7 9.png|image 7 9.png]]
  
## Amelioration du contraste
  
On va venir modifier l`histogramme pour corriger l’image. On applique ici une fonction linéaire avec une droite affine.
![[image 8 7.png|image 8 7.png]]
![[image 9 7.png|image 9 7.png]]
On a étirer les niveau de gris → on a ajouter des trous.
On a perdu une partie du signal. Les pixel de droite on tous été regrouper dans le blanc. Selon le contexte il faut penser à l’information que l’on perd.
  
## Généralisation
  
Étirement de l’histogramme
![[image 10 6.png|image 10 6.png]]
![[image 11 5.png|image 11 5.png]]
![[image 12 5.png|image 12 5.png]]
On va potentiellement abandonner quelque pixel pour calculer un min et un max approprié.
### Fonction de correction
$f(x) = ax+b\\a=\frac{b_{sup}-b_{inf}}{max-min} \\ b=b_{inf}-ax\\\text{souvent } b_{inf} = 0$
  
![[image 13 5.png|image 13 5.png]]

> [!important] On a amélioré le contrast mais on a potentiellement perdu une partie de l’information !
  
### Ne fonctionne pas tout les temps.
Peut ne rien apporter (par exemple si les deux extrémintés sont utilisées).
Peut dégrader le signal même si visuellement l’image semble meilleurs.
On va vouloir trouver la fonction de correction automatiquement.
![[image 14 5.png|image 14 5.png]]
  
## Diverses corrections
  
![[84aa18c2-57dc-44d2-80df-401ef18ec3ac.png]]
![[5115df3b-4163-4356-96bd-59ffaa00cf33.png]]
### Choix de $f$
![[image 15 5.png|image 15 5.png]]
  
```C++
image : l ’ image sou s forme d ’ un v e c t e u r
for ( offset=0 ; offset < sx ∗ sy; ++offset)
image[offset] = f( image[offset] ) ;
```
  
### Exemples
  
![[image 16 5.png|image 16 5.png]]
![[image 17 5.png|image 17 5.png]]
![[image 18 5.png|image 18 5.png]]
$f(x) = b_{sup}-x$
  
On va vouloir trouver un algorithme qui
## Histogramme cummulé
Histogramme cumulé $ℎ (𝑥)$ de l’histogramme ℎ :
Si $𝑥 > 0,\ ℎ𝑐 (𝑥) = ℎ𝑐 (𝑥 − 1) + ℎ (𝑥)$
Si $𝑥 = 0,\ ℎ𝑐 (𝑥) = ℎ (𝑥)$
  

> [!important] Pour que le contraste soit optimal, il faut que l’histogramme soit plat (avoir autant de pixels dans chacunes des barres) ⇒ l’histogramme cumulé est linéaire.
  
On va essayer d’uniformiser la répartition des niveaux de gris dans l’histogramme.
Cela revient à essayer de rendre l’histogramme cumulé linéaire.
## Égalisation de l’histogramme
  
$f(x) = b_{sup} * \frac{hc(x)}{nb\_pix}$
![[3f295f63-821a-4ed2-b5e7-d3f8572c087d.png]]
![[257de681-0530-486a-a27b-fa1b62c154dd.png]]
Ici on ne tiens pas compte de la repartition spatiale des pixels ⇒ ca peut ne pas fonctionner pour certaines image.
  
![[image 19 5.png|image 19 5.png]]
![[image 20 5.png|image 20 5.png]]
  
## Bilan
  
- Simple
- Rapide
- Efficace pour du pré-traitement
Pour aller plus loin :
- CLAHE
- Spécification d’histogramme (Imposer la forme de l’histogramme - comme pour l’égalisation qui donne un histogramme plat)
  

> [!important] N’est pas adapté à tout les traitements. Pour certains on va perdre trop de parties du signal.
  
  
# L’histogramme avec des images de couleurs
  
  
La première intuition est de faire 3 histogramme, un pour le rouge, un pour le vert et un pour le bleu. C’est ce qui se fais usuellement mais ce n’est pas la seule option. Il est possible de le faire avec un cude en 3D.
![[image 21 5.png|image 21 5.png]]
Global
![[image 22 5.png|image 22 5.png]]
Par plan
  
  
## Égalisation de l’histogramme
  
### Égalisation sur chaque plan RGB
  
La premère intuition est de calculer indépendemment sur chaque canal.
![[image 23 4.png|image 23 4.png]]
Imae d’origine
![[image 24 4.png|image 24 4.png]]
Égalisation sur chaque plan RGB
Le contaste à bel et bien été amélioré mais on a changer les couleurs.
  
### Égalisation sur le canal L ou V de HLS
  
On ne va pas changer la couleur, seulement la luminense.
![[image 23 4.png|image 23 4.png]]
Imae d’origine
![[image 25 4.png|image 25 4.png]]
Égalisation sur L
![[image 26 4.png|image 26 4.png]]
Égalisation sur V
On a réussi à augmenter le contraste sans toucher aux teintes.
  

> [!important] Ce n’est pas magique il y a des photos pour lesquels ca ne va pas fonctionner.
  
  
## Comparaison
  
Indexation/comparaison (Distance entre histogrammes) :
- Comparaison d’images
- Segmentation automatique en plan de séquences
    - Différences entre images consécutives
Distances :
- Bin-by-bin distances (match individuellement pour voir si il sont identique)
    - Distance de Hellinger Bhattacharyya
    - ...
- Cross-bin distances (voir si ils ont le même profil)
    - Earth Mover’s Distance
    - …
  
  
## Réduction du nombre de couleur
  
On risque de perdre trop d’information si on passe en niveau de gris.
  
Pourquoi diminuer le nombre de couleurs ?
- Simplifier l’image
- Diminuer l’espace nécessaire au stockage
- Focaliser sur les éléments qui nous intéressent
- Effet artistique
Pourquoi plus précisément passer de la couleur aux niveaux de gris ?
- Traitement de la couleur pas toujours aisée
- Plusieurs canaux
- Pas vraiment de relation d’ordre utilisable avec la couleur
Pourquoi plus précisément passer en noir et blanc ?
### Focaliser sur les éléments qui nous intéressent
### Séparation fond/forme (O.C.R. ...)
  
### Objectif :
Réduire le nombre de couleurs utilisées tout en conservant le plus possible une image proche de l’original.
![[image 27 4.png|image 27 4.png]]
  
On reconnait l’image et on pourras la traiter plus facilement même si on perd des informations.
![[image 28 4.png|image 28 4.png]]
  
  
## Algorithme du Median cut
  
Basée sur l’étude de l’histogramme
Digression : diffusion de l’erreur (adoucit certaines erreurs pour la visualisation).
- Calcul l’histogramme couleur de l’image
- Élimination des extrémités vides
- Découpage du parallélépipède restant en deux sous blocs contenant autant de points
- Pour chaque sous bloc, recommencer jusqu’à avoir autant de sous blocs que de couleurs souhaitées
- Trouver pour chaque partie, une couleur représentante
![[image 29 4.png|image 29 4.png]]
![[image 30 4.png|image 30 4.png]]
![[image 31 3.png|image 31 3.png]]
![[image 32 3.png|image 32 3.png]]
![[image 33 3.png|image 33 3.png]]
On s’arrête quand on a le nombre de couleur désiré. On auras ici un nombre de couleur en puissance de 2.
  
### Digression : diffusion de l’erreur
Quand on substitue une couleur par son représenant, on commet une petite erreur.
Le but de la diffusion de l’erreur est de compenser l’erreur commise sur un pixel en propageant cette erreur sur les pixels voisins.
  
### Algorithme de FloydSteinberg
On parcours les pixels de haut en bas et de gauche à droite,
Pour chaque pixel, on subsitue la valeur d’un pixel par son représant,
On calcule l’erreur commise et on la répartie suivant :
  
|   |   |   |
|---|---|---|
||X|-7/16|
|-3/16|-5/16|-1/16|
### Exemple
![[image 34 3.png|image 34 3.png]]
### Résultats
![[image 35 3.png|image 35 3.png]]
  
  
# Passage en noir et blanc (binarisation)
  
**Séparation Fond/forme**
  
## Seuil global
  
- Utilisation de l’histogramme
- On suppose l’histogramme bi-modal (1 mod pour le fond et 1 pour la forme)
- Trouver le niveau de gris à la jonction entre les deux
  
![[image 36 3.png|image 36 3.png]]
![[image 37 2.png|image 37 2.png]]
![[image 38 2.png|image 38 2.png]]
  
Il existe plein de manière se trouver le seuil.
  
![[image 39 2.png|image 39 2.png]]
  
### Critère d’Ostu
  
![[image 40 2.png|image 40 2.png]]
  

> [!important] Il faut le connaître, c’est un critère très utilisé. Mais il faut bien comprendre quand l’utiliser.
### Résultat
![[image 41 2.png|image 41 2.png]]
Ici il n’est pas adapté. Il faut d’abord corrigé la luminence.
  
- Rapide et simple
- Se calcul directement sur l’histogramme
- Dans la pratique pas toujours efficace selon le contexte (le seuil est global !)
- Régulièrement mal utilisé
- Moins utile (utilisation d’outils de segmentation issus du deep ou même pas de nécessité de séparer le fond et la forme)
On peut determiner un seuil **par pixel** en analisant le voisinage. Cela permet d’adapter le seuil au changement de luminense.
  
  
# Conclusion
  
- Simple à calculer
- Simple à modifier
- Rapide
Applications :
- pre-traitements (amélioration de contraste)
- diminution du nombre de couleurs
- indexation/comparaison rapide d’images
- découpage en plan séquence