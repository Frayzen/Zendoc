---
title: Fusion de caractéristiques
Matière:
  - "[[Introduction au Machine Learning]]"
Type: Cours
Date du cours: 2025-04-11
Supports:
  - "[[FeaturesFusion.pdf]]"
---
# Late Fusion (Décision tardive)
## ✅ Définition
Aussi appelée **fusion de décisions**, cette approche traite **chaque ensemble de caractéristiques séparément** avant de combiner les résultats des classifieurs.
## 📌 Avantages
- Simplicité de mise en œuvre
- Facilité de parallélisation
- Peut accélérer l’inférence via des cascades de classifieurs
## ⚠️ Inconvénients
- Moins efficace en termes de performance
- Perte d’information due à l’absence d’interaction entre les features
## 🎯 Méthodes courantes :
### **Vote majoritaire**
consensus, moyenne pondérée
![[image 96.png|image 96.png]]
  
### **Cascade de classifieurs**
(ex. : Haar cascade)
![[image 1 28.png|image 1 28.png]]
---
  
# Early Fusion (Fusion précoce)
## Définition
Aussi appelée **fusion de données**, cette approche combine les caractéristiques **avant** toute classification, créant une **représentation unifiée**.
![[image 2 28.png|image 2 28.png]]
## Contraintes :
- Conversion vers un **espace commun**
- **Normalisation** des données
- **Agrégation** cohérente des features
---
## Étapes d’une early fusion :
### 1. Conversion
Uniformiser les types :
- `int → float32`
- `qualitatif → quantitatif` (via encodage, par ex. One-hot)
### 2. Normalisation
|Méthode|Avantages|Formule|
|---|---|---|
|**Min-Max**|Simple, intuitif|$Xi′=Xi−min⁡(X)max⁡(X)−min⁡(X)X'_i = \frac{X_i - \min(X)}{\max(X) - \min(X)}$|
|**Z-score**|Très courant, statistique classique|$Xi′=Xi−μσX'_i = \frac{X_i - \mu}{\sigma}$|
|**Tanh-estimator**|Robuste, efficace|$Xi′=12(tanh⁡(0.01⋅Xi−μσ)+1)X'_i = \frac{1}{2} \left( \tanh(0.01 \cdot \frac{X_i - \mu}{\sigma}) + 1 \right)$|
|**MAD (Median Absolute Deviation)**|Insensible aux outliers|$( X'_i = \frac{X_i - \text{median}(X)}{\text{median}})$|
### 3. Agrégation
- **Concaténation** (fusion brute des vecteurs)
- **Moyenne**, **médiane**
- **Min/Max pooling**
- ... et autres méthodes statistiques
---
  
# Implicit Fusion (Fusion implicite)
## Définition
Contrairement à la **fusion explicite** (early fusion manuelle), ici la fusion des caractéristiques est **apprise automatiquement par le modèle**.
## 💡 Points clés :
- L’implicite fusion fait toujours partie d’un **early fusion**, mais elle **délègue la tâche de fusion au modèle** (souvent complexe).
- Cela dépend fortement du classifieur utilisé.
|Type de modèle|Capacité de fusion implicite|
|---|---|
|**Linear Models / Réseaux de neurones**|Besoin d’une fusion explicite préalable|
|**Arbres de décision, Random Forest, etc.**|Peuvent exploiter directement des features hétérogènes (qualitatifs + quantitatifs)|
---
  
# 📌 Résumé comparatif
|Méthode|Simplicité|Performance|Besoin de pré-traitement|Exemple|
|---|---|---|---|---|
|**Late Fusion**|✅✅✅|❌❌|Faible|Votes, Cascade|
|**Early Fusion**|❌|✅✅✅|Fort|Concaténation + Normalisation|
|**Implicit Fusion**|✅/❌|✅✅✅✅|Variable selon modèle|Réseaux, arbres|
---
## 🛠️ Applications typiques
- Reconnaissance d’objets en vision par ordinateur
- Analyse de documents multimodaux (texte + image)
- Bio-informatique (fusion de signaux hétérogènes)
- Systèmes biométriques (visage + empreinte + voix)