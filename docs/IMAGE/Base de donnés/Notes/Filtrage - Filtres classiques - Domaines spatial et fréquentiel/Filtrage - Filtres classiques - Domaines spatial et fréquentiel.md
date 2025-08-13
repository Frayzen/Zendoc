---
Matière:
  - "[[Traitement d’image fondamental C++]]"
Type: Cours
Date du cours: 2025-03-07
Supports:
  - "[[tifo_filtrage_compressed-1-43.pdf]]"
  - "[[tifo_filtrage_compressed-44-93.pdf]]"
  - "[[tifo_filtrage_compressed-94-123.pdf]]"
---
  
# Filtres classiques
  
## Filtre Gaussien
  
Objectif : lisser l'image
Fonctionnement : on remplace la valeur d'un pixel par la moyenne pondérée des valeurs des pixels du  
voisinage
Noyau de convolution : gaussienne
Paramètre / Taille du Noyau : On dépend surtout de l’écart type que l’on as choisi. Usuellemnt entre -3sigma et 3sigma
### Résultats
Va être meilleure sur les contours
![[daff893a-8123-4056-bf9e-423b324add83.png]]
![[image 36.png|image 36.png]]
  
  
## Flitre Médian
  
### Objectif :
Débruitage
### Fonctionnement :
Trier l'ensemble des valeurs des intensités des pixels sur un voisinage puis remplacer la valeur du pixel considéré par la valeur médiane sur le voisinage
### Résultats
- Supprime facilement le bruit impulsionnel
- Préserve l'information de contour
- Est un peu lourd (tri)
![[image 1 13.png|image 1 13.png]]
Le bruit se fais globalemet toujours éeliminer.
On ne dégrade pas les contours.

> [!important] S’utilise quand on a des rayures ou de bruit _poivre et sel._
### Comparaison avec filtre Gaussien pour bruit poivre et sel
![[image 2 13.png|image 2 13.png]]
  
## Filtre Gaussien selectif ou filre bilatéral
  
Pour pallier à la dégradation des frontières on va regarder les changement drastiques entre des pixels voisins.
Faire contribuer principalement les pixels qui ont une couleur proche de la couleur du pixel considéré ou pondérer leur apport en fonction de leur couleur.
On peut également mettre un seuil. ==Mais attention cela rendras un peu comme si on avait repeint à la main par dessus, on auras comme si on avais fais un flou puis appliquer un coup de pincaux sur les bordures.==
$\sum G(\|p-q\|)I(q)$
![[image 3 10.png|image 3 10.png]]
![[image 4 9.png|image 4 9.png]]
![[daff893a-8123-4056-bf9e-423b324add83.png]]
Originale
![[image 36.png|image 36.png]]
Filtre Gaussien
![[image 5 9.png|image 5 9.png]]
Filtre Gaussien selectif
  
## Filtre de Nagao
  
Faire un médian mais dans la région de variance faible.
On ne sais pas où est la frontière. On va donc prendre toute les soltuyions de masques pour ce pixel et in va calculer la variance pour chacun de ces masques. On va appliquer celui avec la plus petite variances.
On ne fais donc pas focrément dans le masque centrale.
![[image 6 9.png|image 6 9.png]]
![[image 7 8.png|image 7 8.png]]
On garde bien la distinction entre les frontières.
  
## Détection de bords
  
### Définition de la notion de bord / contour
Transition brutale de luminance (échelon)
![[image 8 6.png|image 8 6.png]]
Théorie
![[image 9 6.png|image 9 6.png]]
Pratique
### Calcul de la dérivée
$lim_{h\rightarrow 0}\frac{f(x+h)-f(x)}{h}$
![[image 10 5.png|image 10 5.png]]
Dans notre cas on est pas en continu mais en discret :
$f'(x)=(f(x+1)-f(x))\ ou\\ \frac{1}{2}*(f(x+1)-f(x-1))$
![[image 11 4.png|image 11 4.png]]
  
### Filtre de Roberts
Les contours ne sont pas forcemment nets
![[image 12 4.png|image 12 4.png]]
  
### Sobel
![[image 13 4.png|image 13 4.png]]
Filtre triangulaire / gaussien pour lisser
![[image 14 4.png|image 14 4.png]]
### Prewitt
![[image 15 4.png|image 15 4.png]]
Filtre moyenneur pour lisser
![[image 16 4.png|image 16 4.png]]
  
On va le plus souvent utilisé Sobel
![[image 17 4.png|image 17 4.png]]
### Résultats Sobel
![[image 18 4.png|image 18 4.png]]
![[image 19 4.png|image 19 4.png]]
![[image 20 4.png|image 20 4.png]]
![[image 21 4.png|image 21 4.png]]
  
### Récupération des contours à ârtir de l’image du gradient
Le vecteur gradient est orthogonal aux lignes de niveaux, plus sa norme est grande plus la  
transition est forte. On cherche une transition maximale.
Différantes statégies:
- Seuillage
- Seuillage par hystérésis
- Recherche de lignes de crête
Problème : Diffuculté au niveaud es contours fermés ou ouverts.
![[0a16a605-8ace-4e2d-af3a-e6cae10d0b01.png]]
![[0e16a63c-d993-422b-a681-84e9f8594abd.png]]
  
### Seuillage par Hystérésis
On va prendre 2 seuil, un tolérant et un strcicte.
Avec le seuil tolérant on obtient plus que ce que l’on veut. Avec le strict on perd de l’information, elle est dégrader.
On va donc venir fusionner les deux. On va compléter le seuil stricte à l’aide du seuil tolérant, on va également éliminé les “tâches” présentes sur le seuil tolérant en voyant qu’elles n’ont pas d’homologues dans le seuil strict.
![[image 22 4.png|image 22 4.png]]
Seuil tolérant
![[image 23 3.png|image 23 3.png]]
Seuil strict
![[image 24 3.png|image 24 3.png]]
Fusion

> [!important] Trouver les 2 seuils est beaucoup plus facile que de trouvé le seuil idéal.
  
### Kirsch et Robinson
L'amplitude est donnée par la plus forte réponse. L'orientation est déduite du masque qui a donné la plus forte réponse.
![[image 25 3.png|image 25 3.png]]

> [!important] Ce n’est plus trop utilisé.
  
  
### Frei-Chen
Compliquer à caculer, on utilise plus souvent Sobel.
![[image 26 3.png|image 26 3.png]]
  
### Le Laplacien
**Utilisation de la dérivée seconde :** Un point de contour est un passage à zéro de la dérivée seconde
C’est un filtre très sensible.
**Calcul :**
$f'(x)=f(x+1)-f(x)  
\\f''(x)=f'(x+1)-f'(x)=f(x+2)-f(x+1)-f(x+1)+f(x)\\  
f''(X)=f(X+1)-2*f(X)+f(X-1)$
**Masque :**
![[image 27 3.png|image 27 3.png]]
![[image 28 3.png|image 28 3.png]]
![[image 29 3.png|image 29 3.png]]
  
### Conclusion
Le calcul des dérivées est approché au moyen de filtres
- Simple et rapide
- Inconvénients : approximation, sensibilité au bruit, en particulier le Laplacien → Nécessite de lisser le signal avant ou lors de la dérivation
Impact du lissage
- Robustesse au bruit
- Délocalisation des points de contour
Le Laplacien est sensible au bruit → sur-segmentation

> [!important] On essaie essentiellement des filtres passe-haut et passe-bas (voir suite du cours)
  
### Évalutation de la qualité de la détection de contours
- Bonne détection
- Bonne localisation
- Réponse unique
Cf filtre de Canny/Deriche
  
## Détection des points d’intérêts
  
### Détection de coins
Coin = gradient fort dans deux directions
![[image 30 3.png|image 30 3.png]]
  
### Moravec
Pour chaque point
- On fait la somme $S$ des différences des intensités entre un voisinage centré sur le point et le  
    voisinage décalé.
- On réitère le calcul avec des décalages dans toutes les directions
- Pour chaque point, on garde, parmi tous les décalages $i$ le résultat de $S_i$ qui a donné la plus faible valeur
![[image 31 2.png|image 31 2.png]]
Permet de détecter les contours. On a un cas particulier dans les coins → on va avoir un gradient fort en $x$ et en $y$. Ne marche que si on est bien orienté.
  
**Calcul d’un critère sur toute l’image**
![[image 32 2.png|image 32 2.png]]
**Calcul d’un critère pour chaque point**
![[image 33 2.png|image 33 2.png]]
**Un coin maximal local de** $c(x,y)$
  
Sensible au bruit (des petites imperfections peuvent être prises pour des coins)
Contours de certaines directions peuvent être pris pour des coins (anisotrope car on considère que  
quelques directions)
  
  
### Harris
On va réviser le critère pour être plus robuste.
On va usuellement rajouter une gaussienne.
![[image 34 2.png|image 34 2.png]]
![[image 35 2.png|image 35 2.png]]
![[image 36 2.png|image 36 2.png]]
Nouveau critère $H$
- $H=det(M)-\alpha\ trace(M)^2$
- $\lambda_1\ \lambda_2$ les deux valeurs propres : $det(M)=\lambda_1\lambda_2$ et $trace(M)=\lambda_1+\lambda_2$
- $H=\lambda_1\lambda_2-\alpha(\lambda_1+\lambda_2)^2$
    - $H<0$ : contour
    - $H\rightarrow0$ : ras
    - $H>>0$ : coin
- $\alpha$ grand $\Rightarrow H$ dimunue et le détecteur est mois sensibles
- $\alpha$ petit $\Rightarrow H$ augmente et le détecteur est plus sensibles

> [!important] C’est le détecteur de coin le plus populaire.
  
### Achard, Bigorgne, Devars
  
Détection basée sur le produit vectoriel
- Près d'un coin, la norme du produit vectoriel entre deux vecteurs gradients est grande
- Dans une zone homogène elle est faible
    - La norme des vecteurs gradients est petite
- Sur un contour elle est faible aussi
    - L'angle formé entre deux vecteurs gradients proches est petit
  
**Pour chaque point** $i$**, avec un voisinage** $V_i$**, on détermine un critère** $k$ **:**
![[image 37.png]]
  
### Conclusion
Difficiles à parametrer
- Calcul de la dérivée
- Recherche du maximum
- Paramettres…

> [!important] Le détecteur de point doit être robuste au bruit
  
### Résultats
À prendre avec des pincettes car les paramètres varie. On ne peut pas dis qui est le meuilleurs ici.==Difficile à voi mais il y a des points rouges dans les coins.==
![[image 38.png]]
![[image 39.png]]
Points importants
- Stabilité (bruit, changement de point de vu)
- Pertinent pour le calcul de descripteurs (discriminent)
- Vitesse/performance
- Bonne localisation
Implémentation
- En pratique difficile à paramettrer
Autres
- Il existe une foule d’autres detecteurs (susan...)
  
### Applications
- Détection / reconnaissance d’objets
- Stéréovision
- Egomotion estimation
- Indexation d’image
![[image 40.png]]
  
## Amélioration de la netteté
### Laplacien
![[image 41.png]]
![[image 42.png]]
![[image 43.png]]
![[image 44.png]]
  
On augmente la netteté mais on renforce le bruit.
![[image 45.png]]
![[image 46.png]]
  
  
# Signal
  
### Signal
Représentation Mathématique d'un phénomène physique
  
### Traitement du signal
Élaboration, détection et interprétation des signaux
  
### Classification des signaux
- Morphologique : Continu/Discret
- Spectrale : Bande de fréquences BF/HF
- Énergie : Énergie finie/Puissance moyenne finie
- Typologie : déterministe/aléatoire
- Périodicité : non périodique/x(t) = x(t+T)

> [!important] Comme on est dans un domaine finis on pourras toujours calculer la transformé de Fourier.
  
### Énergie
![[image 47.png]]

> [!important] Bien à savoir mais ne va pas nous être très utilie.
  
### Puissance
![[image 48.png]]
  
## Signaux classiques
![[image 49.png]]
Le sinus cardinal est très important
  
## Séries et transformée de Fourier
  
![[image 50.png]]
Que vaut : Ce sont des vectuers orthogonaux donc elle vaut 0 si n diff m et 1 sinon
![[image 51.png]]
  
### Fréquence
**Basse fréquences**
- Lentes variations
- Zones presques uniformes
**Hautes fréquences**
- Variations rapides
- Contours / coins
  
### Spectre
![[image 52.png]]
  

> [!important]
> 
> ### Relation de Parseval
> 
> Il y a conservation de la puissance de la représentation temporelle à la représentation fréquentielle.
  
### Passage d’une reorésentation à l’autre
![[image 53.png]]
  
### Transformées usuelle
![[image 54.png]]
  
### Existence
- $f(t)$ bornée
- Intégrale de $f(t)dt$ existe
- Les discontinuités de $f(t)$ sont en nombre limité
  
### Propriété
![[image 55.png]]
  
  
# Filtrage : Transformée de Fourier
  
### Dans notre cas
  
- Le signal est borné et chantilloné
![[image 56.png]]
![[image 57.png]]
  
- Signal discret (échantillonné) + support borné : **TFD**
![[image 58.png]]

> [!important] On travail dans les complexes !
![[image 59.png]]
  
## Spectre
  
On est en complexe et le signal d’origine est réel.
- Amplitude : $|Cn|$
- Phase $Arg(Cn) = arctg (-bn/an)$
- Puissance $|Cn|²$
- $f(t)$ réel => spectre d'amplitude symétrique
  

> [!important]
> 
> ### Relation de Perseval
> 
> Il y a conservation de la puissance de la représentation temporelle à la représentation fréquentielle
  
  
## Existence
  
## Propriétés
  
  
## Signal borné et échantillonné
### Soit le pic de dirac
![[image 60.png]]
On va prendre une infinité de pic de dirac et les translaté d’une constante, on a un peigne de dirac $W$.
![[image 61.png]]
  
## TFD - Transformé de Fourier Discrète
  
On va l’utiliser car on a un signal discret (échantillonné) et un support borné.
![[image 62.png]]
  
### Notes
$F_e$ la fréquence d’échantillonage
![[image 63.png]]
  
### Calcul rapide
  
![[image 64.png]]
Pour calculer la TFD sur un signal de taille N, on calcul la transformée de Fourier sur les coefficients pairs (N/2) et la transformée de Fourier sur les coefficients impairs (N/2) … et récursivement.
On calcul on nouvelle tranformé de Fourier sur un sous-signal assez petit.
  
## Signal 2D - TF2D
  
### Visualisation du spectre
![[image 65.png]]
![[f99e868c-e55e-423b-834a-cadfdcb748d6.png]]
On interverti les cadrants. Les basses fréquences se retrouvent au centre.
  
  
# La convolution
  
  
![[image 66.png]]
Linéaire.
Si on connaît la réponse impultionnnelle on connaît la sortie du filtre à n’importe quel signal.
  
## Réponse impultionnelle
![[image 67.png]]
  
## Propriétés
  
### Commutative
$f(t)*g(t)=g(t)*f(t)$
### Distributive
$(x(t)+y(t))*g(t)=x(t)*g(t)+y(t)*g(t)$
### Associative
$(x(t)*y(t))*z(t)=x(t)*(y(t)*z(t))$
  
### Théorème de Plancherel
![[image 68.png]]

> [!important] Super important. R`pond à la question : Comment on applique le filtre ?
### Autre propriété (à connaître)
$f'*g=f*g'=(f*g)'$
  
## Conséquence du lien convolution ↔ multiplication
  
### Spectre d'un signal échantillonné
![[9022fe49-fafc-48d5-9097-f908fbaf93b2.png]]
Pas besoin de calculer une transformé de Fourier plus grande comme on a tout à l’infini.
  
### Revisite du filtrage
- Passe haut
- Passe bas
- Passe bande
- Réjecteur
![[7dd54bdb-44e4-4d92-885b-9e51318e7e3c.png]]
Ici c’est pénible. Hors on sait qu’on peut remplacer la multiplication du domaine fréquenciel par une convolution dans le domaine spatial.
![[image 69.png]]
  
### Déconvolution
**Convolution :** $f*h\Rightarrow F \times H$
En théorie on peu déconvolué : $F/H$
- Priblèmesz des $0$ (ou des valeurs très petites) dans $H$
- Très difficile si on ne connaît pas le filtre initial
  
### Détection de bord
$(f * \text{gauss})' → f * \text{gauss}'$ (la dérivée de la gaussienne est connue formellement)
  
### LoG
Laplassien de la Gaussienne
  
### DoG
Différence de Gaussienne
  
  
# Filtrage
  
Passe Bas
Description :
- Coef central supérieur ou égal aux autres
- Autres coefs positifs
Effet :
- Pixel central devient une moyenne pondérée des voisins
- Les régions homogènes sont peu changées
- Les frontières sont étalées
- Réduit le bruit
  
Passe Haut
Description :
- Coef central positif et élevé
- Autres coefs petits, négatifs ou nuls
- La somme des coefficients est nulle
Effet :
- Zones homogènes : perte de la notion d'intensité
- Frontières sont renforcées
  
## Propriété de la TF2D
  
![[image 70.png]]
### Translation
![[image 71.png]]
### Rotation
![[image 72.png]]

> [!important] Très utilie pour déterminer la rotation d’une image.
### Réduction
![[image 73.png]]
### Somme
![[image 74.png]]
  
## Impacte du Flou
  
On va voir si les gradients sont francs.
![[image 75.png]]
![[image 76.png]]
Problème dans les zones aux couleurs uniformes.
  
## [Skew estiation](https://fr.wikipedia.org/wiki/Asym%C3%A9trie_\(statistiques\))
  
![[image 77.png]]
  
  
# Autres transformations
  
  
- Short Term Fourier Transform
- Discret Cosinus Transform
- Ondelettes
- Radon
- Wigner
- Hilbert…
  
## DCT - Discret Cosinus Tranform
![[image 78.png]]
  
## Short Term Fourier Transform
### Problème
FT : soit le temps, soit la fréquence
### Solution
Ne considérer que les petits intervalles
![[9a0dcdb2-91f3-4f40-aa14-e7def405782f.png]]
### Impact de la taille de $W$
- $W$ étroit $⇒$ localisation temporelle correcte mais mauvaise résolution fréquentielle
- $W$ large $⇒$ localisation teporelle imprécise mais bonn résolution temporelle
  
## Transformé en ondelettes
Avantage :  
● FT : soit le temps, soit la fréquence  
● STFT : Difficulté de régler la taille de w et taille fixée  
une fois pour toutes.  
● Transformée en ondelettes :  
– Représentation temps-fréquence  
● la fréquence avec sa position spatiale  
– Adaptation de la résolution en fonction de la fréquence  
● Basses fréquences → Privilégie la résolution fréquentielle  
● Hautes fréquences → Privilégie la résolution temporelle  
– Analyse des signaux non stationnaires
  
### Définition
  
![[image 79.png]]
  
![[image 80.png]]