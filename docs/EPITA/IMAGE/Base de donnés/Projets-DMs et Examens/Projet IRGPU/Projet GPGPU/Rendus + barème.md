---
title: Rendus + barème
---

## Livrables
### 1. Slides
- Format PDF
### 2. Code source
- .tar.gz ou .zip
- Implémentation C++ de référence (CPU)
- Implémentation CUDA (GPU)
- Outils de benchmark
- Scripts de build (CMake / Makefile)
- **Sans binaires** ni fichiers inutiles
### 3. Rapport technique
- Format PDF
- Description du sujet
- Répartition des tâches
- Benchmarks & graphiques (CPU vs GPU)
- Analyse des performances (profils avec Nsight ou nvprof)
## 🗣️ Soutenance
- Durée totale : **25 minutes**
    - 15 min de présentation
    - 5 min de démonstration
    - 5 min de questions/réponses
- Se déroule **sur Teams**
- **Tous les membres** du groupe doivent être présents
## 💯 Grille de notation
|   |   |
|---|---|
|Critère|Description|
|Fonctionnalité|Code correct produisant des **résultats acceptables** qualitativement|
|Performance|Plus le **framerate** est élevé, mieux c'est|
|Organisation & clarté|Version CPU fonctionnelle, suivi Git avec tags des versions optimisées|
|Analyse|Mesure d’impact des optimisations, analyse claire des **bottlenecks**|