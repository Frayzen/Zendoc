---
Code: IRGPU
UE: Outils et Modélisation
URL Moodle: https://moodle.epita.fr/course/view.php?id=4002
Status: 0 Projets/DM, 0 Examens
Moyenne: "0.728"
Professeur: Edwin CARLINET & Joseph CHAZALON
Coefficient: 1.5
Moyenne /20: "14.56"
Semestre:
  - S8
Commencé ?: Terminé
Projets/DM: "1"
Moyenne pondérée: "21.84"
Notes:
  - "[[Introduction aux modèles de programmation parallèle et massivement parallèle]]"
  - "[[Introduction - Architectures GPU]]"
  - "[[Premiers pas dans le calcul GPU avec CUDA]]"
  - "[[Modèles de programmation massivement parallèle - 1]]"
  - "[[Modèles de programmation massivement parallèle - 2]]"
Assignments/Exams:
  - "[[QCM1 IRGPU]]"
  - "[[QCM2 IRGPU]]"
  - "[[Projet IRGPU]]"
---
## 📖 Résumé et contexte
Les évolutions en matière d'architecture des processeurs tendent à pousser vers une généralisation des architectures multicœurs et massivement parallèle tels que les GPUs. Dans ce contexte, la maîtrise des techniques de programmation massivement parallèle est devenue obligatoire pour tirer parti des performances de ces nouveaux systèmes. L'objectif de ce cours est de poser les bases nécessaires à la programmation de GPUs avec CUDA et d'aborder les motifs récurrents d'optimisation GPU illustrés sur des problèmes de traitement d'images.
## 🎯 Acquis d'apprentissages visés (AAVs)
À l’issue de ce cours, les étudiants sont capables dans le cadre du développement d'une application exploitant les capacités d'une architecture massivement parallèle de :
- Comprendre les différences fondamentales entre des architectures CPUs et GPUs et leurs implications sur la programmation
- Mettre en oeuvre des benchmarks de performance et identifier les parties critiques d'un programme en termes de performances.
- Identifier les parties massivement parallélisables d'un programme et leurs motifs GPU correspondant.
- Déporter des parties critiques d'un programme sur GPU en utilisant CUDA.
- Analyser les performances d'un kernel GPU et identifier ses goulots d'étranglement
- Optimiser un kernel GPU en appliquant les techniques d'optimisations standard vues en cours.
## 📑 Plan cours
Le cours est organisé sur deux axes : fondements théoriques et applications à la programmation.
### **Chapitre 1 : Introduction aux modèles de programmation parallèle et massivement parallèle**
Après un rapide historique de l'évolution des cartes graphiques en tant qu'accélérateur de calcul, l'étudiant verra les différents modèles le parallélisme et leur correspondance hardware. En particulier, il verra le modèle de programmation CUDA pour les architectures GPU NVidia.
### **Chapitre 2 : Introduction pratique à CUDA (2h CM + 2h TP)**
Après la vision formelle du modèle de programmation CUDA, l'étudiant aura une formation pratique à CUDA au cours de laquelle il verra comment lancer des kernels pour paralléliser des calculs simples sur des données 1D et 2D.
### **Chapitre 3 : Programmation efficace des GPUs (1e partie)**
L'étudiant verra comment paralléliser des motifs simples pour résoudre des problèmes récurrents (illustrés par des problèmes de traitement d'images). Pendant cette visite, il prendra conscience des problèmes potentiels de performances (notamment liées à la mémoire) et comment les résoudre.
Il s'ensuit un TP d'application où l'étudiant doit paralléliser le calcul d'une synthèse d'image avec CUDA.
### **Chapitre 4 : Programmation efficace des GPUs (2e partie)**
Cette deuxième partie se concentre sur les motifs de réductions dont la parallélisation est moins triviale.
L'étudiant devra ensuite appliquer ces connaissances dans le cadre d'un exercice de réduction du TP précédent.
  
  
## **🏃Format des activités**
Formats des activités pédagogiques:
- Cours magistraux: 8 heures
- Travaux pratiques: 6 heures
## **🖊️ Évaluation des AAVs**
- 2 QCMs
- Projet
## **🔢 Calcul de note finale**
- Contrôle continu (QCM): 2 points
- Projet & soutenance: 18 points
  
### Assignments
#### Projets/DMs et Examens
|Nom|Date|Status|
|---|---|---|
|[[QCM1 IRGPU]]|April 9, 2025|Finis|
|[[QCM2 IRGPU]]|April 27, 2025|Finis|
|[[Projet IRGPU]]|June 19, 2025|Finis|
  
  
  
### Notes
#### Notes
|Nom|
|---|
|[[Introduction - Architectures GPU]]|
|[[Introduction aux modèles de programmation parallèle et massivement parallèle]]|
|[[Modèles de programmation massivement parallèle - 1]]|
|[[Modèles de programmation massivement parallèle - 2]]|
|[[Premiers pas dans le calcul GPU avec CUDA]]|
  
  
  
### Exams