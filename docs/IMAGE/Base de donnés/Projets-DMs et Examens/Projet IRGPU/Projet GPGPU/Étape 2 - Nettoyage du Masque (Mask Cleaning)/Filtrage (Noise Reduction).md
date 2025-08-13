# Median Filter
### Objectif
Supprimer le bruit impulsionnel (pixels aberrants isolés), tout en **préservant les contours nets** des zones de mouvement.
C’est un filtre non linéaire très efficace pour les heatmaps bruitées ou instables.
---
### Principe
Pour chaque pixel :
- On prend les valeurs de ses voisins dans une fenêtre carrée (ex: 3x3)
- On les trie
- On remplace la valeur centrale par la médiane (et non la moyenne)
---
### 🔁 Pseudocode
```C++
pour chaque pixel (x, y)
    voisinage = []
    pour dx ∈ [-r, r]
        pour dy ∈ [-r, r]
            si (x+dx, y+dy) est dans l’image
                voisinage.append(input[x+dx, y+dy])
    output[x, y] = médiane(voisinage)
```
---
### ✅ Avantages
- Très robuste au bruit localisé
- Ne crée pas de flou
- Simple à implémenter et à tester
---
### ❌ Inconvénients
- Plus coûteux qu’un filtre moyen (nécessite tri local)
- Moins efficace contre le bruit spatial structurel
---