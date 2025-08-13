---
title: Tour d’horizon
Matière:
  - "[[Introduction aux Réseaux de Neuronnes]]"
Type: Cours
Date du cours: 2025-03-20
Supports:
  - "[[tour_horizon_compressed.pdf]]"
---
# Types d’apprentissages
  
## Supervisé
  
Pour ce type d'apprentissage on dispose de deux jeux de données :
- $X = \{X_i\}^N_{i=1}$  qui sont des entrées de la fonction $f$ que l'on apprend
- $Y = \{Y_i\}^N_{i=1}$ qui sont les sorties attendues de $f(X)$
Pour diriger l'apprentissage on cherche à minimiser l'erreur entre $f(X)$ et $Y$.
Pour les réseaux neuronnaux on utilise la **[Rétropropagation du gradient](https://www.ricou.eu.org/iren/notes_rn.html#R%C3%A9tropropagation%20du%20gradient)**.
  
Pour les autre problèmes voici quelques exemples :
|**Régression**|**Classification**|
|---|---|
|**[Moindres carrés](https://www.ricou.eu.org/iren/notes_rn.html#Approximation%20aux%20moindres%20carr%C3%A9s)** (linéaire voire polynomial)|**[SVM](https://www.ricou.eu.org/iren/notes_rn.html#SVM)** (linéaire)|
|**[Régression polynomiale](https://www.ricou.eu.org/iren/notes_rn.html#R%C3%A9gression%20polynomiale)** (polynôme)|**[Régression logistique](https://www.ricou.eu.org/iren/notes_rn.html#R%C3%A9gression%20logistique)** (binaire)|
||**[Arbre de décision](https://www.ricou.eu.org/iren/notes_rn.html#Arbre%20de%20d%C3%A9cision%20%28classification%29)** (zones)|
  
## Renforcé
  
### Principes
L'apprentissage renforcé (_Reinforcement learning_ ou RL) est lié à la notion d'état entre le début et le but final. Il s'agit de passer d'état en état avec la possibilité
- d'**[évaluer chaque état](https://www.ricou.eu.org/iren/notes_rn.html#RL%20--%20Evaluation%20d%27un%20%C3%A9tat)** pour savoir si on finira bien
- de **[choisir l'action à faire](https://www.ricou.eu.org/iren/notes_rn.html#RL%20--%20Choix%20de%20l%27action)** pour arriver au prochain état
Une fois arrivée à la fin on a un évaluation correcte que l'on peut _**[rétropropager](https://www.ricou.eu.org/iren/notes_rn.html#RL%20--%20R%C3%A9tropropagation)**_ à tous les coups précédants et donc corriger l'algorithme qui évalue chaque état.
Ce fonctionnement est parfaitement adapté au jeu avec des coups. Après chaque coup le jeu est dans un état que l'on peut juger plus ou moins bon. Choisir le bon coup mène à un état qui sera évalué comme meilleur que le précédant.
  
## Auto supervisé
  
### Méthodes
On apprend à partir de l'image sans étiquette
1. méthode générative (on fabrique les images puis on généraliste) – 2006 - 2014
2. méthode discriminante (on trouve une info dans l'image qu'on exploite pour entrainer les premières couches du réseau)
    - Context : on prends des morceaux d'une image et le réseau doit les positionner par rapport au morceau central
    - RotNet comme les images sont bien orienté par défaut, le réseau doit apprendre à deviner l'angle de l'image et pour cela il doit comprendre la structure de l'image
    - Coloriage : on apprend au réseau à colorier les images ce qui l'oblige à comprendre que le ciel est bleu, l'herbe verte, les villes grises...
3. méthode discriminante au niveau de l'espace latent
  
## Non-supervisé
  
Regroupement : **[k-moyennes](https://www.ricou.eu.org/iren/notes_rn.html#k-moyennes)**
Réduction de dimension : _**[ACP](https://www.ricou.eu.org/iren/notes_rn.html#ACP)**_
  
  
## Conslusion
  
- **[Apprentissage supervisé](https://www.ricou.eu.org/iren/notes_rn.html#Apprentissage%20supervis%C3%A9)** Apprend à prédire le résultat pour une donnée
- **[Apprentissage renforcé](https://www.ricou.eu.org/iren/notes_rn.html#Apprentissage%20renforc%C3%A9)** Apprend l'action qui offre le meilleur rendement
- _**[Apprentissage non supervisé](https://www.ricou.eu.org/iren/notes_rn.html#Apprentissage%20non%20supervis%C3%A9)**_ Apprend à trouver une représentation interne pour classer
- **[Apprentissage auto-supervisé](https://www.ricou.eu.org/iren/notes_rn.html#Apprentissage%20auto-supervis%C3%A9)** qui apprend le monde à partir des données mais sans vérité terrain
Un problème peut être une
- **régression** à savoir chercher à simuler une fonction $f:ℝ^n→ℝ^m$  et donc estimer $f(x)$ la valeur de  pour une valeur $x$
- **classification** à savoir classer la valeur entrée parmi $m$ classes connues.
- **regroupement** qui est une classification avec des classes non connues
- **réduction de dimension** pour simplifier des données