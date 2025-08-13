---
title: Assemblage + adaptation (ou pas)
---

En gros les implémentations de clean_mask
## 1. Version a paramètres fixe
### Fonctionnement
Pipeline en deux étapes avec paramètres définis manuellement :
1. **Morphological Opening**
    - Nettoyage spatial des petits objets et trous internes
    - Utilise disque ou carré selon `use_disk_element`
2. **Hysteresis Thresholding**
    - Convertit le masque nettoyé en sortie binaire cohérente
    - Utilise les seuils `th_low` / `th_high` fournis
### Pseudocode
```C++
// Étape 1 : Nettoyage spatial
opened = opening(input, rayon=opening_radius, forme=disk ou carré)
// Étape 2 : Hysteresis pour robustesse des objets
output = hysteresis_threshold(opened, th_low, th_high)
```
### ✅ Avantages
- Contrôle total via les paramètres
- Idéal pour le benchmark et ajustement fin
- Plus rapide
### ❌ Inconvénients
- Nécessite un tuning manuel des seuils et du rayon
- Peu robuste en conditions variables (bruit, type de scène)
---
## 2. Version intelligente
### Fonctionnement
Pipeline adaptatif basé sur une analyse du bruit :
- Compte le nombre de pixels isolés (sans voisins foreground)
- Calcule le taux de bruit sur l'image
- Sélectionne dynamiquement :
    - `opening_radius`
    - `th_low`, `th_high`
Puis appelle la version `clean_motion_mask(...)` avec les bons paramètres.
### Pseudocode
```C++
// Étape 1 : Analyse du bruit
noise_ratio = ratio(pixels isolés / pixels foreground)
// Étape 2 : Choix automatique des paramètres
si bruit élevé : rayon=3, seuils hauts
si bruit moyen : rayon=2, seuils modérés
si faible bruit : rayon=1, seuils bas
// Étape 3 : Application du nettoyage avec les bons paramètres
clean_motion_mask(input, output, width, height,
                  opening_radius, th_low, th_high, use_disk=true)
```
### ✅ Avantages
- S’adapte automatiquement à la qualité du masque
- Moins de réglage manuel nécessaire
- Robuste à différents types de scènes
### ❌ Inconvénients
- Un peu plus lourd en calcul (parcourt l’image une fois de plus)
- Les règles de choix sont empiriques (basées sur heuristiques)
---
## Comparaison
|   |   |   |   |   |
|---|---|---|---|---|
|Implémentation|Paramètres|Robustesse bruit|Adaptativité|Usage idéal|
|`clean_motion_mask(...)`|Manuels (`th`, `radius`)|⚠️ Moyenne|❌ Non|Benchmark, scènes stables|
|`adaptive_clean_motion_mask(...)`|Automatiques (via analyse)|✅ Bonne|✅ Oui|Pipeline intelligent|