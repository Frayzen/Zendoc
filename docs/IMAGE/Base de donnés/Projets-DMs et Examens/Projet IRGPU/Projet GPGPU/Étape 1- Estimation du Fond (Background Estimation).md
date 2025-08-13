## 1. Estimation du Fond (Background Estimation)
L’estimation du fond est une étape cruciale permettant de **construire un modèle d’arrière-plan stable**, même lorsque la caméra reste fixe mais que des objets en mouvement traversent la scène.
### Objectif
Identifier pour chaque pixel une **valeur de référence "de fond"** qui reste stable dans le temps, et ignorer les éléments mobiles passagers.
### Méthode utilisée
L’approche est **itérative et pixel-wise** : chaque pixel garde en mémoire un **état interne** composé de :
- une **valeur de fond**
- une **valeur candidate**
- un **temps depuis le dernier match (t)**
La logique repose sur une **mesure de similarité** (distance dans l’espace couleur Lab) entre la valeur courante et la valeur de fond. Si la valeur diffère trop souvent, elle peut devenir une nouvelle valeur de fond.
---
### Pseudocode de l'algorithme
```Plain
Entrée : pixel courant P(t), état du pixel (bg, candidate, t)
1. Calculer la distance entre bg et P(t) (dans l’espace Lab)
2. Si distance < seuil (ex: 25) alors
     - match ← vrai
     - bg ← moyenne(bg, P(t))
     - t ← 0
3. Sinon
     - match ← faux
     - Si t == 0
         - candidate ← P(t)
         - t ← t + 1
     - Sinon si t < 100
         - candidate ← moyenne(candidate, P(t))
         - t ← t + 1
     - Sinon
         - bg ← candidate
         - candidate ← P(t)
         - t ← 0
4. Retourner match et distance
```