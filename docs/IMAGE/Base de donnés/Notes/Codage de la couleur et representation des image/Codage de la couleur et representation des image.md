---
Matière:
  - "[[Traitement d’image fondamental C++]]"
Type: Cours
Date du cours: 2025-02-19
Supports:
  - "[[tifo_codage_coul_compressed_(1)-compress-pages-1.pdf]]"
  - "[[tifo_codage_coul_compressed_(1)-compress-pages-2.pdf]]"
---
# Espaces de couleurs et representation
  
## Modele RGB
  
## Modele HLS
  
On code une couleur par 3 composantes : Teinte, luminance et saturation. L'espace ressemble à deux cônes que l'on a joint par leurs bases. Une couleur est un point de cet espace.
![[image 30.png|image 30.png]]
### Teinte
C'est l'angle sur le disque :
- 0° rouge
- 60° jaune
- 120° vert
- 180° cyan
- 240° bleu
- 300° magent
### Luminance
La luminance est la hauteur dans le cône
### Saturation
La saturation (« pureté de la couleur ») est la distance au centre du disque
![[image 1 12.png|image 1 12.png]]
Photo oiginale
![[image 2 12.png|image 2 12.png]]
H
![[image 3 9.png|image 3 9.png]]
L
![[image 4 8.png|image 4 8.png]]
S
C’est un modele intuitif pour choisir une couleur

> [!important] L'utilisation de la teinte est intéressante toutefois, sur des saturations faibles, la teinte n'a plus vraiment de signification
Il existe beaucoup de viariante du modele.
  
  
## Espace YCbCr
  
Decrit les couleurs pae un lan de luminance Y et deux plans de chrominance ($C_b$,$C_r$)
Le plan de luminance est simplement l’image en niveau de gris
Luminance et
  
![[YCbCr-CbCr_Scaled_Y50.png]]
On est en 3D avec un axe pour la luminance
$Y = K(R+G+B)$
$U=B+Y$
$V=R+Y$
Ce qui donne
$R=Y+V$
$G=Y/K-R-B=(K’Y-U-V)$
$B=Y+U$
Ce type de representation est surtout utile en compression.
![[image 5 8.png|image 5 8.png]]
![[image 6 8.png|image 6 8.png]]
![[image 7 7.png|image 7 7.png]]
![[image 8 5.png|image 8 5.png]]
  
  
## Espace CMY (Cyan, Magenta, Yellow)
  
On code une couleur par un triplet representant la quantite de cyan, magenta et jaune (couleurs primaires en synthese soustractive).
Peu d’interet sauf si on travaille avec de des peripheriques d’imprimerie.
  
  
## Autres espaces
  
- YIQ
    - NTSC 1953
    - Facilite la transmission et la compatibilité de l'image tant pour un écran couleur que un écran noir et blanc
    - Y donne la luminance
- Lab
    - La distance entre deux couleurs dans cet espace est représentative de la différence perçue visuellement entre les deux couleurs
- XYZ
- YCbCr
- ...

> [!important] Il est important de connaitre les grandes familles afin de choisir la bonne representation en fonction de la tache a accomplir.
  
  
## Niveau de gris
Une seule composante qui code la luminance
- Une convention possible :
    - Composante nulle → pas de lumière (noir)
    - Composante au maximum → maximum de lumière (blanc)
- Un niveau de gris quelconque = un point de l'axe :
![[da7b53f5-46d7-49f3-8350-74fbb47cf007.png]]
  
  
## **Conversions entre espaces de couleurs**
  
### RGB → niveau de gris
Idee simple et intuitive : L = (R+V+B)/3
Amelioration : L = 0.299 R+ 0.587 V + 0.114 B
La premiere idee n’est pas fausse mais on va souvent preferer l’autre (depend si on veut etre rapide ou juste).
On ne peut pas faire la conversion inverse (sauf reseau de neuronne).
  
### RGB / niveau de gris → noir et blanc
Utile pour la segmentation d’image.
Il existe beaucoup de maniere de faire.
  
### RGV ↔ HLS
![[image 9 5.png|image 9 5.png]]
![[image 10 4.png|image 10 4.png]]
H [0°, 360°] L [0,1] S[0,1]
**Teinte :** éstimé en fonction de deux bornes min et max
Pour $L <=0,5$ :
**Saturation :**
- Joue sur l'écartement min ↔ max sur la teinte
- Si $S=0 : min=max=L$
- Si $S=1$ : $min=0$ et $max = 2L$
- Donc $max = (1+S)L$ et $min = (1-S)L$
Pour L >0,5 : Même raisonnement
  
### RGB ↔ CMY
La conversion est simple :
- $R = 1 - C$
- $G = 1 - M$
- $B = 1 - Y$
  

> [!important]
> 
> - Quelle variance on utilise ?
> - Quel est le range des valeurs ?
  
## Conclusion
Il existe différents espaces pour la représentation des couleurs
Il faut être capable de choisir le bon, en fonction de l'objectif recherché.
Être capable, dans la mesure du possible de passer de l'un à l'autre

> [!important]  
  
  
# Codage de l’image
  
## Codage d’une image par une matrice
  
L'image est une fonction discrète 2D, elle est souvent codée par une matrice.
Pour une image codée en RGB, un point de l'image = un triplet (r,g,b) de valeurs dans la matrice.
Pour une image codée en niveaux de gris, un point de l'image = une valeur dans la matrice codant la luminance
![[image 11 3.png|image 11 3.png]]
![[image 12 3.png|image 12 3.png]]
  
## Acces aux pixels
  
Pixel = Picture element
- Comment coder une image en vecteur ?
    
    Matrice ? Vecteur ?
    
- Comment accéder à un point de cette image ?
- Comment accéder à ses voisins ?
- Comment parcourir l'image ?

> [!important] Attention a l’ordre dans lequel on encode les pixels pour lire l’image de maniere efficace vis a vis de la memoire.
  
## Resolution / Echantillonage
  
### Discretisation spatiale (resolution)
![[image 13 3.png|image 13 3.png]]
### Echantillonage (amplitude) :
Combien de couleur.
![[image 14 3.png|image 14 3.png]]
- Codage par palette
    - Bits par pixels
        - 1 bpp
        - 2 bpp
        - 4 bpp
        - 6 bpp
        - 8bpp
- Codage sans palette
    - Bits par pixels
        - 16 bpp
        - 24 bpp
        - 32 bpp
  
## Representation de l;image
  
Un moyen classique de représenter une image est d'utiliser une matrice. Cependant il existe d’autre moyens :
- Arbre
- Graph
- …
Maillage. On choisi intuitivement un maillagecarre mais ce n’est pas une solution ideale.
### Topologie
Le probleme d’un maillage carre est le voisinage en diagonal, la distance seras de $\sqrt 2$ et on a un soucis si on “attache” les pixels diagonaux (choix de la connexité) . Il s’agit d’un probleme topologique.
![[image 15 3.png|image 15 3.png]]
![[image 16 3.png|image 16 3.png]]
Si le fond est 8-connexe (en noir), la forme (en blanc) est 4-connexe
Si le fond est 4-connexe (en noir), la forme (en blanc) est 8-connexe
⇒ Contradiction avec le théorème de Jordan
On va donc changer la forme des pixels.
![[d377a033-28f8-4720-a58e-8b838ddb4fce.png]]
![[image 17 3.png|image 17 3.png]]
On as plus de soucis de connexite ni de soucis de distance.
  
## Stockage / Transfert
### Différents formats
JPEG, TIFF, PNM, PNG, BMP, GIF, TGA...
### Choix en fonction de critères
- Avec ou sans compression (avec ou sans perte)
- Avec ou sans couleur
- Avec ou sans palette
- Une seule image ou plusieurs
- Optimisé pour une architecture ? (Ex. BMP sauvegardé à l'envers)
- Libre ou pas (Ex. GIF et Compuserve)
### Format PNM
- PBM : noir et blanc
    
    - PGM : niveaux de gris
    - PPM : couleurs
    
    Deux variantes
    
    Format tres simple
    
  
![[image 18 3.png|image 18 3.png]]
  
|   |   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|---|
||Couleur|Niveau de gris|Transparence|Compression avec perte|RAW|Valeurs negatives|Plusieurs images|Resolution max|
|JPG|||||||||
|JPG2000|||||||||
|TIFF|||||||||
|PNG|||||||||
|PNM|||||||||
|DNG|||||||||
|BMP|||||||||
|GIF|||||||||
|TGA|||||||||
  
## Changement d’illumination
Pour eclaircir l’image on va augmenter l’illumination en faisant $\times1.3$.

> [!important] Pour changer l'illumination il faut donc multiplier les valeurs des pixels par une constante (et non additionner/soustraire par une constante comme c'est usuellement fait).
  
![[image 19 3.png|image 19 3.png]]
Image originale
![[image 20 3.png|image 20 3.png]]
Image du fond
![[image 21 3.png|image 21 3.png]]
Soustraction des 2
![[image 22 3.png|image 22 3.png]]
Ratio des 2
  
  
## Modification des couleurs de l’image
Application : effet artistique
image_resultat(x,y) = image_origin(g(x,y), h(x,y))
- Les fonctions g et h ne tiennent pas forcement compte de la valeur du pixel
- La transformation doit être appliquée dans ce sens !
### Effet sepia
On associe à un niveau de luminance, une couleur.
![[image 23 2.png|image 23 2.png]]
![[image 24 2.png|image 24 2.png]]
![[image 25 2.png|image 25 2.png]]
### Rotation - cisaillement
Seulement appliquer une matrice de rotation et/ou un upscaling pose le probleme qu’on ne va pas remplir toute l’image de destination. On va calculer plein de pixel qui sont en dehors de l’image
Pour pallier a ca on part de l’image de destination et on va chercher les pixels dans l’image d;origine. On fais les etapes dans le sens inverse.
![[image 26 2.png|image 26 2.png]]
  
### Etirement - retricissement
Transformation linearie
![[image 27 2.png|image 27 2.png]]
  
### Autre
Ondulation, spirale, Translation aleatroire
![[image 28 2.png|image 28 2.png]]
  
### Morphing
En combinant
- Une moyenne pondérée des images (dont les poids évoluent au cours du temps)
- Un champ de vecteur translation
![[image 29 2.png|image 29 2.png]]
  

> [!important] Toute manipulation spatiale demande a ce qu’on passe par l’antecedant !
  
  
## Correction gamma
  

> [!important] **La perception de l'œil est logarithmique ⇒ L**a répartition des niveaux d'énergie n'est donc<br>pas linéaire mais exponentielle
Les niveaux de gris ne sont que des numéros, faire des opérations (moyenne, addition, application de filtres, interpolation...) n'a pas vraiment de sens.
Il y a un compromis entre précision du résultat et vitesse
Correction gamma = compenser le log de notre oeil. On resserre les niveau de gris qu’on distingue bien et on eloigne les niveau de gris que l’on distingue mal.
Pour avoir une bonne qualite de cliche il faut enlever la correction gamma pour retrouver des niveau de gris lineaire.
Ca depend du contexte et de la precision qu’on souhaite avoir.
srgb
  
  
# L’interpolation
  
Que faire lorsque l'on doit « chercher » la valeur d'un pixel mais que l'on ne tombe pas précisément sur un pixel (encherchant l’entecedant et en ne tombant pas sur des coordonnees entieres).
### 1ere solution
(rapide) : prendre la valeur du pixel le  
plus proche
![[image 30 2.png|image 30 2.png]]
### 2eme solution
Faire une interpolation bi-linéraire.
![[image 31.png]]
![[b8c66256-9b44-42c8-976b-e7be2d03757f.png]]
  
  
## Interpolation bi-cubique
  
Tenir compte de la dérivée pour interpoler. On utilise 4 points.
![[97a6e71c-0d83-4613-a4e2-df4a51dd0f3d.png]]
![[image 32.png]]
Usuellement on map grace au derivees au deux points les plus proches et en interpolant un polynome.

> [!important] Ici on interpole sur une seul ligne, en 2d il faut prendre les 2 lignes et les 2 colonnes les plus proches ⇒ on a besoin de 16 points.
  
Le soucis ici est que si on as une marche d’escalier on a des chances que se soit faux. Cela réhausse les contraste en allant chercher des intensite en dehors du range d’origine.
![[image 33.png]]
![[image 34.png]]
  
Il existe d'autres méthodes d'interpolation
Pour faire le choix de l'interpolation, il faut faire un compromis entre vitesse et qualité
![[image 35.png]]