---
Matière:
  - "[[Introduction à la synthèse d’image]]"
Type: Cours
Date du cours: 2025-02-18
Supports:
  - "[[isim_rappels_compressed.pdf]]"
---
# Formation de l’image
### Calcul de l’intensité lumineuse
On prends en compte le source lumineuse et la caméra puis on calcul le reflet du rayon provenant de la source lumineuse sur l’objet jusqu’à la caméra. Ceci donne les ombres et lumiere d’une image.
### Couleur
L’objet filtre les longueurs d’onde de la lumiere et n’en renvoie que certaines ce qui lui donne sa couleur.
La lumiere part dans toute les direction donc on peut voir l’objet depuis toute les directions.
Il existe plusieurs maniere de represente les couleurs : RVB (rouge vert bleu), CMJ (cyan magenta jaune)
**Synthèse additive :** pour une source de lumière : ==**R**====**V**====**B**==.
Plus on rajoute des longeurs d’onde plus on tends vers le blanc.
**Synthèse soustractive :** pour un objet : ==**C**====**M**====**J**==.
Plus on ajoute des filtres plus on tend vers le noir.
  
![[image 21.png|image 21.png]]
  
  
# Capture de l’image
  
![[458f082e-0a3d-43b1-bc39-5892aa06c0d2.png]]
Le champs de vue (FOV) augmente si la distance focale diminue. Cela se traduit par un dezoom et inversement.
Distance focale = distance entre le plan de projection et le foyer
![[image 1 9.png|image 1 9.png]]
Avec un diaphragme la convergence des rayons lumineux ne se fais pas en un seul point.
Si on augmente le diaphragme on réduit la profondeur de champs (DOF).
Ceci reviens à gérer le focus d’un appreil photo. Il y a une distance précise pour laquelle on a un rendu net.
  
![[image 2 9.png|image 2 9.png]]
Dans la pratique le plan image est derriere le foyer. Mais on se placeras dans ce cours derriere car on ne veut pas d’inversement de l’image..
On a un capteur virtuel.
Dependant ce modele ne gere pas la profondeur de champs.
  
← modèle sténopé
![[image 3 6.png|image 3 6.png]]
Capteurs sensibles à la lumière : plus il reçois de la lumière plus il génère d’électrons donc plus grande charge electrique. On a simplement les niveaux de gris.
On va mettre un filtre sur chacun des capteurs pour mesurer les quantités des 3 couleurs (1 par capteur).
==Il y a deux fois plus de filtre vert car l’oeuil est le plus sensible au vert et on avait besoin d’un nombre de filtre pair (décision arbitraire).==
==Spacialement on a donc l’information d’une couleur mais pas partout (il faut trouver les autres couleurs en regardants les voisins) →== ==**voir cours de traitement d’image**==
Le nombre de pixel est moins important que la qualité du pixel (correction, détection de la couleur…).
  
# Formation de l’image
  
![[image 4 5.png|image 4 5.png]]
Spectre du visible
### Codage de la couleur
Comme on est majoriterement en synthèse additive on va utiliser le ==**modèle RGB**== :
On code une couleur par la quantité de rouge, de vert et de bleu que contient cette couleur
- Une couleur est alors un point du cube
Modèle directement lié à notre perception
On va avoir l’amplitude de chacune des 3 couleurs (maximale pour les 3 pour le blanc et minimale pour les 3 pour le noir comme on est en synthèse additive).
  
### Génération d’une image synthétique
Il va falloir simuler les phenomenes optiques qui conduisent a la formation de l’image.
  
  
  
---
# Mathématiques
  
# Géométrie Euclidienne
  
## Produit scalaire
  
Un produit scalaire est une **forme bilinéaire, symétrique et définie positive** sur un espace vectoriel réel. Il associe à chaque paire de vecteurs un scalaire.
### Définition
Un produit scalaire sur un espace vectoriel réel $V$ est une application :
$⟨⋅,⋅⟩:V×V→\mathbb{R}$
telle que, $\forall u,v,w\in V$ et $\lambda \in \R$ :
### Bilinéarité
$⟨u+v,w⟩=⟨u,w⟩+⟨v,w⟩ \\  
⟨λu,v⟩=λ⟨u,v⟩$
  
### Symétrie
$⟨u,v⟩=⟨v,u⟩$
  
### Définie positive
$⟨u,u⟩≥0\\ et\ ⟨u,u⟩=0⇔u=0$
---
  
## Espace pré-hilbertien réel
### Définition
Un **espace préhilbertien réel** est un **espace vectoriel réel** $V$ muni d’un produit scalaire $\langle \cdot, \cdot \rangle$.
### Norme associée
$||u||=\sqrt{\langle u,u\rangle}$
### Distance induite
$d(u,v)=||u-v||$
  
## Espace Euclidien
### Définition
Un **espace euclidien** est un espace préhilbertien **de dimension finie**.
En particulier, un **espace vectoriel euclidien de dimension** $n$ est un $\mathbb{R}^n$ muni du produit scalaire standard :
$\langle u,v\rangle = \sum_{i=1}^{n}u_iv_i$
### Propriétés
- Norme d’**ortogonalité** : $u\ \bot \ v \Longleftrightarrow \langle u,v\rangle = 0$
- Base **orthonormée** : Une base $(e_1, ..., e_n)\ |$ $\langle e_i, e_j \rangle = \delta_{ij}$ (produit scalaire de Kronecker).
- **Angles et distances** bien définis grâce au produit scalaire.
### Cas particuliers
### Dimension 0 : Point
- Le produit scalaire est trivial : $⟨0,0⟩=0$
- L’unique norme possible est $∣∣0∣∣=0$.
### Dimension 1 : Droite Euclidienne
- Produit scalaire : $⟨u,v⟩=uv$
- Norme : $∣u∣$
### Dimension 2 : Plan Euclidien
- Espace $\mathbb{R}^2$ avec le produit scalaire standard : $\langle (x_1, y_1), (x_2, y_2) \rangle = x_1 x_2 + y_1 y_2$
- Notion de **base orthonormée** ($i,j)$
- Angle entre deux vecteurs $u,v$ :
    
    $\cos \theta = \frac{\langle u, v \rangle}{||u|| \cdot ||v||}$
    
  
## Espace affine $\mathcal{F}$ de $E$
Un **espace affine** $\mathcal{F}$ est une structure associée à un **espace vectoriel euclidien** $E$, où l'on considère des **points** et non seulement des vecteurs.
### **Définition**
- Un **espace affine** est un ensemble de **points** où la différence de deux points $A,B$ est un **vecteur** $\overrightarrow{AB} \in E$
- **Translation** : Toute transformation de $\mathcal{F}$ qui préserve les **différences de points** est une translation.
### **Notions fondamentales** :
1. **Barycentre** d'un système de points pondérés
2. **Milieu d’un segment** : $M = \frac{A + B}{2}$ en dimension $2$ ou $3$
3. **Systèmes de coordonnées** ==(ex : repères cartésiens)==
  
## Repère cartésien de $\mathcal{F}$
Un **repère cartésien** est un repère affine de l’espace FFF défini par :
1. **Un point origine** $O$
2. **Une base orthonormale** $(e_1, ..., e_n)$
**Coordonnées d’un point** $M$ **dans un repère** $(O, e_1, ..., e_n)$ :
$M(x_1, ..., x_n) \iff \overrightarrow{OM} = x_1 e_1 + \dots + x_n e_n$

> [!important] En dimension $2$ et $3$, ce repère permet d’exprimer les vecteurs et distances facilement.
  
---
## Norme $N$ sur un $\mathbb{R}$-espace vectoriel $E$
### **Définition**
Soit $E$ un espace vectoriel réel. Une **norme** est une application $N : E \to \mathbb{R}$ :
1. **Positivité** : $N(u) \geq 0$
2. **Nullité uniquement pour** $0$ : $N(u) = 0 \iff u = 0$
3. **Homogénéité** : $N(\lambda u) = |\lambda| N(u)$
4. **Inégalité triangulaire** : $N(u + v) \leq N(u) + N(v)$
  
## **Norme euclidienne (associée au produit scalaire)**
Si $E$ possède un **produit scalaire** $\langle \cdot, \cdot \rangle$, la **norme euclidienne** est définie par : $||u|| = \sqrt{\langle u, u \rangle}$
Elle représente la **longueur** du vecteur $u$.
  
---
  
## Produit mixte
Le **produit mixte** est une opération définie en dimension 3 qui associe un **nombre réel** à trois vecteurs $u,v,w$.
### **Définition** :
$[u, v, w] = \langle u, v \wedge w \rangle = det(u,v,w) = (u\times v).w$
### **Interprétation géométrique** :
- $∣[u,v,w]∣$ représente le **volume** du parallélépipède défini par $u,v,w$.
- Si $[u,v,w]=0$, alors les trois vecteurs sont **coplanaires**.
  
## Produit vectoriel
Le **produit vectoriel** de deux vecteurs $u$ et $v$, noté $u\wedge v$, est défini comme l’unique vecteur $w$ tel que :
- $w$ est **orthogonal** à $u$ et $v$
- $||w|| = ||u|| \cdot ||v|| \cdot |\sin(u, v)|$ (longueur proportionnelle à l’aire du parallélogramme formé par $u$ et $v$)
- La base $(u,v,w)$ est **orientée positivement** (sens direct).
### **Lien avec le produit mixte** :
$[u, v, w] = (u \wedge v) \cdot w$
- $||u \wedge v||$ représente l’**aire du parallélogramme** formé par $u$ et $v$.
- $\frac{1}{2} ||u \wedge v||$ est l’**aire du triangle** formé par ces vecteurs.
  
  
Etude des objes tel qu’ils sont dans l’espace.
On va beaucoup utiliser le produit scalaire pour calculer un angle.
Rappels de geometrie Euclideinne
On utilise rarement le produit mixte, on utilise plus le produit vectoriel.

> [!important] A revoir et completer. Voir les transparants
Revoir les equation des droites 2d et 3d
La definition cartesienne de droite n’existe pas, c’est celle d’un plan et ce n;est pas ergonomique pour nos problemes.
On utiliseras (P + dv) point plus vecteur directeur de la droite.
Besoin d’intersection droite sphere pour le premier TP.
  
# Geometrie projective
  
Analyse des objets tels qu’ils sont vus.
Projection sur le plan image.
Point de fuite
Droites parralleles ne son plus parallele et se rejoigne et converges toutes sur le point de fuite (orizon).
Horizon : Intersection du plan passant par le foyer et parallèle
au plan objet
![[image 5 5.png|image 5 5.png]]
![[image 6 5.png|image 6 5.png]]
### Points a l’infini
On ne peut pas calculer l’antecedant d’un point sur l’horizon
On ajoute aux plans des points à l’infini
Un ensemble de droites parallèles convergent vers ce point à l’infiniPlan objet
### Coordonnees homogenes
Tous les points du plan projectifs en 2d sint represente avec 3 coordonnees.
Plusieurs triplets differents peuvent represente le meme points.
Le point (0,0,0) n’as pas de sens en pojectif.
  
  
# Transformations usuelles
Représentation des transformations usuelles dans l’espace projectif
- Translation
- Echelle
- Rotation
- Projection
Combinaison des transformation
  
Si on veut faire d’abord une rotation puis un passage a l’echelle on multiplie avec la matrice de rotation a droite de celle de passage a l’echelle.
Pour un objet articuler (humain et son bras) on va avoir plusieurs matrices avec une hierarchie (si l’humain avance en faisant un rotation du bras).
Pour la translation en euclidien faire avec une addition on serais obliger de garder l’expression globale. On passe donc en projectif. On gagne de l’efficacite et du temps.
  
On seras en projectif la grande partie du temps. Passag en Euclidien