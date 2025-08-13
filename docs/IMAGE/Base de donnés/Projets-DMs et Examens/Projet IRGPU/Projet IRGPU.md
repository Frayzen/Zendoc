---
title: Projet IRGPU
Matiére:
  - "[[Implémentation Rapide GPGPU]]"
Date: 2025-06-19
Status: Finis
Pourcentage: "0.7"
Note: 14
Note maximale: 20
Overall: "0.595"
---
[[Projet GPGPU]]

## Rendus
1. slides au format PDF
2. code source, sans binaires ni ressources inutiles, au format .tar.gz ou .zip
3. rapport au format PDF
  
![[Projet_IRGPU-Spring_2024.pdf]]{ type=application/pdf }

$\text{Erosion}(p)=min(N(p))$
$\text{Dilatation}(p)=max(N(p))$
  
### 🎤 **Slide Morphologie – Script oral**

> "Une fois le masque de mouvement généré, on applique un nettoyage pour enlever le bruit : pixels isolés, artefacts, ou zones non connectées.
> 
> Deux techniques principales sont utilisées ici : **l’ouverture morphologique** et le **seuillage par hystérésis**."
---

> "L’ouverture, c’est une érosion suivie d’une dilatation.
> 
> L’érosion garde uniquement les pixels présents dans un voisinage défini, ce qui élimine les petits points de bruit.
> 
> La dilatation restaure ensuite les zones pertinentes.
> 
> On a testé deux formes de voisinage : carré ou disque. Le disque donne des contours plus réalistes, mais est plus coûteux à calculer."
---

> "Ensuite, on applique un seuillage par hystérésis :
> 
> On garde les pixels très actifs, puis on propage aux pixels voisins modérément actifs.
> 
> Ce qui est en dessous du seuil bas est supprimé.
> 
> Cette méthode permet de connecter les bonnes zones entre elles, tout en éliminant le bruit faible."
---

> "En résumé, cette étape améliore fortement la qualité du masque final, même si elle reste coûteuse, surtout sur des images avec beaucoup de détails."
---
### 📝 **Slide Morphologie – Notes orales**
### 🔹 **Intro rapide**
- Masque de mouvement brut (heat map) = souvent bruité (pixels isolés, zones floues)
- On applique deux étapes de nettoyage :
    
    **2. Seuillage par hystérésis**
    
    **1. Ouverture morphologique**
    
---
### 🔹 **Seuillage par hystérésis**
- Technique de **propagation** : on part des zones de mouvement sûres (beaucoup de mouvement) et on **étend** aux zones voisines cohérentes.
- Cela permet de **connecter les bonnes régions** du masque tout en **supprimant le bruit isolé**.
- Idéal pour améliorer la **cohérence visuelle** du masque sans conserver des pixels douteux.
---
### 🔹 **Ouverture morphologique**
- But : supprimer le bruit sans déformer les formes principales
- C’est une **érosion suivie d’une dilatation**
- **Érosion** = élimine les petits pixels isolés mais détériore les formes
- **Dilatation** = restaure les bonnes zones
- Deux formes testées :
    - **Carré** : plus rapide
    - **Disque** : plus précis mais plus lent
---
### 🔹 **Conclusion rapide**
- Ce nettoyage **améliore nettement** le masque final
- Coût modéré, sauf propagation si beaucoup de bords faibles
---
### 📝 **Slide 1 – Contexte matériel et protocole**
- Tous les benchmarks ont été réalisés sur **la même machine** pour garantir la cohérence des données.
- La vidéo utilisée est celle du sujet.
- Cela permet une comparaison équitable des algorithmes.
- On s’est concentrés sur deux indicateurs :
    - Le **temps moyen par opération CUDA**,
    - Et le **nombre de frames par seconde** (FPS).
---
### 📝 **Slide 2 – Temps CUDA moyen (sans optimisations)**
- Ce graphe montre les **temps d’exécution CUDA moyens** pour chaque algorithme par image en ms, avant toute optimisation.
- **Temporal Median** est **nettement plus lent** : environ **17 fois plus coûteux** que les autres.
- Cela s’explique par la **quantité de mémoire manipulée**, chaque pixel conservant un historique complet.
- **Frame Differencing** est le plus rapide, avec une logique simple et peu de transferts.
- **BG Estimator** et **Moving Average** ont des temps modérés et comparables.
- À ce stade, seuls les algorithmes **à fort potentiel temps réel** ont été envisagés pour l’optimisation.
---
### 📝 **Slide 3 – Temps CUDA moyen (après optimisations)**
- Ce graphe montre l’effet des optimisations CUDA.
- **Seuls BG Estimator et Moving Average** ont été optimisés.
- Ces deux algorithmes bénéficient de **réductions significatives de temps d’exécution**.
- **Frame Differencing** n’a pas été optimisé car il était déjà très performant.
- **Temporal Median** a été **volontairement écarté** de l’optimisation :
    - Trop lent de base,
    - Trop coûteux en mémoire pour être compétitif.
- Les résultats confirment le **bon choix de focaliser les efforts sur les algorithmes efficaces dès le départ**.
---
### 📝 **Slide 4 – FPS mesurés**
- Ce graphe montre les **FPS moyens** obtenus par chaque algorithme.
- **BG Estimator**, **Moving Average** et **Frame Differencing** atteignent **plus de 1000 FPS**,
    - Ce qui permet un traitement fluide
- **Temporal Median**, **30 fois moins performant** que les autres → pas beaucoup
- Ce faible framerate confirme qu’il **n’est pas adapté au traitement temps réel**.
- Ces résultats justifient pleinement notre stratégie d’optimisation ciblée.
---