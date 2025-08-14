---
title: Morphologie brouillon
---

# Nettoyage du masque de mouvement - Morphologie math
Voici la **section sur la morphologie**, rédigée dans le même style que le reste de votre rapport :
Après détection du mouvement à l’aide des différents algorithmes (background estimation, moyenne glissante, etc.), le masque de mouvement brut peut contenir beaucoup de bruit : des pixels isolés, des zones non connectées, ou encore des artefacts dus à la compression vidéo ou à la lumière.
Pour améliorer la qualité de ce masque, une phase de **nettoyage** est effectuée, en deux étapes principales : **ouverture morphologique** et **seuillage par hystérésis**.
### Ouverture morphologique
L’ouverture est une opération issue de la morphologie mathématique. Elle consiste en une **érosion suivie d’une dilatation**, appliquée avec un même élément structurant.
- **Erosion** : on prend la **valeur minimale** dans le voisinage du pixel. Cela permet d'éliminer les petites zones bruitées.
- **Dilatation** : on prend ensuite la **valeur maximale** dans le même voisinage, ce qui permet de restaurer les zones pertinentes qui ont survécu à l’érosion.
Deux versions ont été codées :
- **Carré** : le voisinage est un carré centré sur le pixel, de rayon `r`.
- **Disque** : le voisinage est un disque (défini comme tous les pixels à une distance ≤ `r`), plus fidèle à la géométrie des objets réels.
Les deux opérations sont appliquées sur une image binaire (uint8), donc les minimums et maximums sont pris entre 0 et 255.
✅ **Avantages :**
- Supprime les faux positifs isolés
- Conserve la forme globale des objets détectés
- Évite les contours déformés
❌ **Inconvénients :**
- Peut éliminer les petits objets légitimes
- Plus lent avec un élément structurant en disque (calcul du masque de disque)
### Seuillage par hystérésis
Pour affiner encore le masque et supprimer les zones ambiguës, un seuillage d’hystérésis est utilisé, inspiré de la méthode de Canny.
- On commence par détecter les pixels **fortement activés** (au-dessus d’un seuil `th_high`), considérés comme fiables.
- Ensuite, on propage à leurs **voisins connectés** les pixels modérément activés (entre `th_low` et `th_high`).
- Les pixels en dessous de `th_low` sont ignorés.
Cela permet de **connecter des zones disjointes**, tout en **éliminant le bruit faible non connecté**.
### Implémentation
```C++
clean_motion_mask(input, output, width, height, opening_radius, th_low, th_high, use_disk_element);
```
1. Application de l’ouverture morphologique (disque ou carré)
2. Conversion en float
3. Application du seuillage par hystérésis via une propagation récursive
✅ **Avantages :**
- Résultats beaucoup plus propres visuellement
- Bords des objets mieux définis
- Supprime efficacement le bruit résiduel
❌ **Inconvénients :**
- Propagation coûteuse si l’image contient beaucoup de bords faibles
- Complexité $O(N)$ mais avec propagation itérative (plusieurs passes)