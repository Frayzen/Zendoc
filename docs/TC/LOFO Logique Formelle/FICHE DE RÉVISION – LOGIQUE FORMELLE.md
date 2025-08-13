---
Owner: Matcha
---
### 1. Définitions Fondamentales
- **Système de preuve** : Ensemble de règles permettant de dériver des formules à partir d'axiomes.
- **Théorème** : Formule dérivable sans hypothèses.
- **Cohérence (Soundness)** : Si une formule est démontrable, alors elle est vraie dans tous les modèles (sémantique).
    - $\vdash A \Rightarrow \models A$
- **Complétude (Completeness)** : Si une formule est vraie dans tous les modèles, alors elle est démontrable.
    - $\models A \Rightarrow \vdash A$
- **Normalisation** : Toute suite de réductions aboutit à une forme normale (irréductible).
- **Coupure (Cut)** : Insertion d’un lemme intermédiaire immédiatement éliminé.
- **Élimination de la coupure** : Transformation d’une preuve en une preuve équivalente sans lemme intermédiaire.
---
### 2. Propriétés des Systèmes
|   |   |   |   |
|---|---|---|---|
|Système|Cohérent|Complet|Notes|
|**Hilbert Intuitionniste**|✅ Oui|❌ Non|Forme axiomatique, difficile à manipuler.|
|**Déduction Naturelle Intuitionniste**|✅ Oui|✅ Oui|Basée sur la structure logique du raisonnement.|
|**Déduction Naturelle Classique**|✅ Oui|✅ Oui|Inclut le tiers exclu.|
|**Hilbert Classique**|✅ Oui|✅ Oui|Basé sur le principe du tiers exclu.|
---
### 3. Typage et Normalisation
- **Terme typable** (en $λ$-calcul) :
    - **Fortement normalisable** : Toutes les réductions finissent.
    - Typage assure la terminaison des programmes.
- **Pas nécessairement normalisable** : Faux si typable.
- $\text{Typable} \Rightarrow \text{Fortement normalisable}$
---
### 4. Coupure dans les preuves
- **Définition** : Insertion d’un énoncé intermédiaire $B$, prouvé à partir de $A$, puis utilisé pour prouver $C$.
    - Forme : $\frac{A \vdash B \quad B \vdash C}{A \vdash C}$
- **Objectif** : La supprimer pour obtenir une preuve plus directe (cut-elimination).
- **Théorème d’élimination de la coupure** (Gentzen) : Toute preuve contenant des coupures peut être transformée en preuve sans coupures → assure cohérence.
---
### 5. Systèmes de Déduction
### **Hilbert (Intuitionniste)**
- Très formel, basé sur axiomes + modus ponens.
- Moins pratique pour des preuves humaines.
- **Cohérent mais incomplet** (au sens constructif).
### **Déduction Naturelle**
- Approche syntaxique basée sur règles :
    - Introduction/élimination des connecteurs logiques.
- Similaire au raisonnement humain.
- **Cohérente et complète**.
---
### 6. Tableaux synthétiques de révision
### Statuts logiques des systèmes
|   |   |   |
|---|---|---|
|Propriété|Hilbert Intuitionniste|Déduction Naturelle|
|Cohérence|✅ Oui|✅ Oui|
|Complétude|❌ Non|✅ Oui|
### Coupure
|   |   |
|---|---|
|Élément|Définition|
|Coupure|Insertion + élimination d'un énoncé intermédiaire|
|Exemple|$A \vdash B,\ B \vdash C \rightarrow A \vdash C$|
|Objectif|Éliminer pour prouver plus directement|
---
### 7. Formes Normales et Réduction
- **Forme normale** : terme sans possibilité de réduction.
- **Réduction** : simplification d’un terme (ex: β-réduction en λ-calcul).
- **Théorème de normalisation forte** : tout terme typable atteint une forme normale _quel que soit_ le chemin de réduction.
---