---
title: Étape 2 - Nettoyage du Masque (Mask Cleaning)
---

La Phase 4 de notre pipeline intervient après la génération de la heatmap de mouvement.
Elle transforme cette carte de valeurs floues en un masque binaire propre, net et exploitable, prêt pour la visualisation ou des traitements en aval.
---
## Étapes
La phase se compose généralement de 4 étapes modulaires, que l’on peut assembler selon les besoins :
[[Filtrage (Noise Reduction)]]

➜ Réduction des artefacts visuels ou bruit aléatoire dans la heatmap
[[Seuillage (Thresholding)]]

➜ Binarisation de la heatmap : transformer des intensités en zones "mouvement / pas mouvement"
[[Nettoyage spatial (Morphologie, post-processing)]]

➜ Élimination des petits objets isolés, comblement des trous, renforcement de la structure
[[Assemblage + adaptation (ou pas)]]

➜ Ajustement dynamique des seuils ou tailles de filtre selon le contenu ou le bruit détecté
---