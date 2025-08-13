---
Matiére:
  - "[[Introduction au Machine Learning]]"
Date: 2025-05-16
Status: Finis
Pourcentage: "0.8"
Note: 12.8
Note maximale: 16
Overall: "0.64"
---
Rendez ici le notebook contenant le détail de votre démarche et tout votre code (commenté de manière didactique). Le notebook doit pouvoir se ré-exécuter du début jusqu'à la fin (⚠️ si une cellule plante, on ne la débugge pas pour vous...).
En particulier, séparez clairement dans le notebook les différents étages de la chaîne de traitement, et présentez les entrées, sorties et l'évaluation pour chaque étage
En dernière partie de votre notebook, regroupez votre chaîne de traitement finale en une fonction unique qui prendra en entrée les deux images hyperspectrales et LiDAR + votre modèle entraîné, et qui effectuera l'inférence sur tous les pixels de la scène pour produire en sortie une carte de classification thématique au niveau pixel. Enregistrez cette carte de classification au format .npy dans le répertoire où est situé votre notebook (c'est cette carte de classification finale qui va nous servir à évaluer quantitativement votre solution sur le jeu de test).
De plus, vous devez spécifier dans votre notebook la manière dont vous vous êtes répartis les tâches au sein de votre groupe.
  
# **Critères d’évaluation**
La grille se base sur les AAVs du cours :
- identifier les **analyses et pré-traitements à appliquer sur un jeu de données** cible en amont de l’entraînement d’un modèle,
- reconnaître une tâche de **régression** d’une tâche de **classification** dans le cadre de l’apprentissage supervisé, et **choisir le ou les modèles pertinents** pour traiter cette tâche,
- régler les **hyperparamètres** d’un modèle pour **les adapter au mieux** à un jeu de données et une tâche précise,
- reconnaître un scénario de **sur-apprentissage**, et **comment l’éviter** en pratique,
- **benchmarker les performances** de plusieurs algorithmes équivalents pour une tâche cible, et conduire des **analyses qualitatives et quantitatives** de résultats obtenus.
Dans la grille, les différents niveaux sont cumulatifs : pour passer au niveau supérieur, il faut avoir validé tous les critères du niveau précédent.
  
### **Préparation des données**
|_**0 points**_|_**1 points**_|_**2 points**_|_**3 points**_ ✅|
|---|---|---|---|
|Ouverture et visualisation des données (déjà fourni dans le notebook)|Préparation des données d'entrainement $(x,y)$|Préparation des données d'entrainement $(x,y)$ en filtrant le fond (classe 0)|Séparation du jeu de données en deux ensembles train/test|
### **Choisir et entraîner un modèle**
|_**0 points**_|_**1 points**_|_**2 points**_|_**3 points**_ ✅|
|---|---|---|---|
|Aucun modèle entraîné|Un seul modèle entraîné|Deux modèles entraînés, de deux familles / fonctionnements différents (ex : linéaire vs non linéaire...)|Au moins trois modèles de familles différentes entraînés|
### **Évaluer la performance d'un modèle**
|_**0 points**_|_**1 points**_|_**2 points**_ ✅|_**3 points**_|
|---|---|---|---|
|Pas d'évaluation de performance|Évaluation globale des performances (score du classifieur) sur le jeu de test|Évaluation par classe des performances (matrice de confusion) sur le jeu de test|Analyse qualitative et quantitative des performances par classe|
### **Fiabiliser l'évaluation d'un modèle**
|_**0 points**_|_**1 points**_|_**2 points**_ ✅|_**3 points**_|
|---|---|---|---|
|Aucune démarche de fiabilisation du modèle|Les expériences sont reproductibles (seed fixées)|Évaluation de la variance des performances du modèle par validation croisée|Évaluation de la variance des performances du modèle par validation croisée avec stratification|
### **Optimisation du modèle**
|_**0 points**_|_**1 points**_|_**2 points**_|
|---|---|---|
|Pas d'optimisation du modèle|Identification des hyperparamètres pertinents|Optimisation des hyperparamètres pertinents|
### **Fusion des données HSI & LiDAR**
|_**0 points**_|_**1 points**_ ✅|_**2 points**_|_**4 points**_|
|---|---|---|---|
|Aucune fusion : une seule modalité est considérée pour la prédiction finale|Implémentation et évaluation d'une stratégie early fusion ou late fusion|Implémentation et évaluation de plusieurs stratégies early fusion et late fusion|Implémentation et évaluation de plusieurs stratégies early fusion et late fusion + utilisation du LiDAR en préprocessing ou postprocessing|
### **Livrer et expliquer le modèle**
|_**0 points**_|_**1 points**_|_**2 points**_ ✅|
|---|---|---|
|Le notebook ne s'exécute pas|Le notebook s'exécute et exporte les prédictions au bon format|Le notebook présente de manière claire et illustrée les différentes étapes, et des pistes d'amélioration sont identifiées|