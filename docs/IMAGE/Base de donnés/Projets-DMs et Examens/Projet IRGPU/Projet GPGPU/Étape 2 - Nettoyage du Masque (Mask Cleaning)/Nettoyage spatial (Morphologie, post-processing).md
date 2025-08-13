## Morphological Opening (Square & Disk)

> [!info] Opening (morphology)  
> In mathematical morphology, opening is the dilation of the erosion of a set A by a structuring element B:  
> [https://en.wikipedia.org/wiki/Opening_(morphology)](https://en.wikipedia.org/wiki/Opening_(morphology))  
### Objectif
Supprimer le bruit localisé dans le masque de mouvement, tout en conservant les structures cohérentes.
L’ouverture morphologique est composée de :
1. **Érosion** : supprime les petits objets (réduction)
2. **Dilatation** : restaure les objets survivants à l’érosion
---
## 1. Square
### Principe
Utilise un voisinage carré de rayon `r`.
Chaque pixel est traité avec un carré de `(2r+1)x(2r+1)` centré sur lui.
### Pseudocode
```C++
// EROSION
pour chaque pixel (x, y)
    min_val = 255
    pour dx ∈ [-r, r]
        pour dy ∈ [-r, r]
            si (x+dx, y+dy) dans l'image
                min_val = min(min_val, input[x+dx, y+dy])
    eroded[x, y] = min_val
// DILATATION
pour chaque pixel (x, y)
    max_val = 0
    pour dx ∈ [-r, r]
        pour dy ∈ [-r, r]
            si (x+dx, y+dy) dans l'image
                max_val = max(max_val, eroded[x+dx, y+dy])
    output[x, y] = max_val
```
### ✅ Avantages
- Simple à implémenter
- Suffisant pour des bruits distribués uniformément
### ❌ Inconvénients
- Non isotrope : sensible à l’orientation du bruit
- Peut supprimer des formes diagonales ou circulaires
---
## 2. Disk
### Principe
Même procédure que la version carrée, mais uniquement sur les pixels à l’intérieur d’un disque (distance euclidienne ≤ r).
Un élément structurant circulaire est plus fidèle aux formes naturelles.
### Pseudocode
```C++
// PRÉCALCUL des offsets (dx, dy) dans le disque de rayon r
disk_offsets = []
pour dx ∈ [-r, r]
    pour dy ∈ [-r, r]
        si dx² + dy² ≤ r²
            disk_offsets.append((dx, dy))
// EROSION
pour chaque pixel (x, y)
    min_val = 255
    pour (dx, dy) ∈ disk_offsets
        si (x+dx, y+dy) dans l'image
            min_val = min(min_val, input[x+dx, y+dy])
    eroded[x, y] = min_val
// DILATATION (même principe)
```
### ✅ Avantages
- Isotrope : meilleure conservation des formes circulaires/irrégulières
- Plus proche de la morphologie mathématique "idéale"
### ❌ Inconvénients
- Légèrement plus lent à cause du pré-calcul et filtrage spatial
- Moins facile à vectoriser que la version carrée
---
## Conclusion
|   |   |   |   |   |
|---|---|---|---|---|
|Méthode|Élément structurant|Rapidité|Qualité nettoyage|Forme préservée|
|Opening carré|Carré|✅ Rapide|✅ Bon|⚠️ Moyenne|
|Opening disque|Disque (euclidien)|⚠️ Moyenne|✅ Très bon|✅ Oui|
Ces deux versions sont utiles selon le type de scène ou de bruit.
---