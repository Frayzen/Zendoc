---
title: Introduction 5
Matière:
  - "[[Introduction au Machine Learning]]"
Type: Cours
Date du cours: 2025-02-25
Supports:
  - "[[intro_compressed.pdf]]"
---
# Motivation
  
Apprendre :
  

> How can we build computer systems that automatically improve with experience,
> 
> and what are the fundamental laws that govern all learning processes?
> 
> — Tom Mitchell, 2006
  
# Problemes de machine learning
  
### Exemple simple : chauffage
![[image 83.png|image 83.png]]
On a un parametre qui evolue au cours du temps.
Ici on peut faire en sorte d’avoir un parametre de tempperature “ideale” qui s’adapte selon l’utilisation du chaiffage.
  
## Formes de machine learning
Exploration-based: Generalization or specialization of rules.
Examples: Grammatical inference, heuristic discovery for SAT solvers. . .
→ Optimization-based: Topic of this course.
Examples: linear separators and SVMs, neural networks, decision trees, Bayesian networks,
HMMs. . .
→ Approximation-based: Data compression, analogy.
Examples: KNN, embedding spaces
  
## Machine learning Probabiliste
  
### Intelligence Artificielle VS Machine learning VS Deep Learning
IA $\supset$ Machine Learning $\supset$ Deep Learning
![[image 1 16.png|image 1 16.png]]
![[image 2 16.png|image 2 16.png]]
AI is a very fuzzy concept, much like “any computer program doing something useful”. Think “if-then” rules.
ML can be considered a subfield of AI since those algorithms can be seen as building blocks to make computers learn to behave more intelligently by somehow generalizing rather than just storing and retrieving data items like a database system would do.
Engineering point of view: ML is about building programs with tunable parameters (typically an array of floating point values) that are adjusted automatically so as to improve their behavior by adapting to previously seen data.
![[image 3 13.png|image 3 13.png]]
  
### Domaine liés
- Statistiques
- Sciences des données
- Pattern Recognition
- Traitement de signal
    
    - Optimisation
    
      
    
  
### The 3 main reasons why you may want to use Machine Learning:
- Avoid coding numerous complex rules by hand.  
    lower cost, more effective, faster reaction to changing problem
- Optimize the parameters of your system given a dataset of yours.  
    better accuracy
- Create systems for which you do not know the rules consciously (e.g. recognize a face).  
    greater potential
  
# Probleme de Machine Learning
## Pourquoi est-ce difficile
  
Given a finite amount of training data, you have to derive a relation for an infinite domain.
In fact, there is an infinite number of such relations.
![[image 4 12.png|image 4 12.png]]
![[image 5 12.png|image 5 12.png]]
![[image 6 12.png|image 6 12.png]]
Les données sont potentiellement bruitées.
Il faut trouver une facon de choisir 1 seule solution dans un grands nombre de solutions.
On ne veut pas etre trop generique, trop lisser les informations. Mais on ne veut pas non plus etre trop proche des données.
On veut minimiser le risques théoriques. ON souhaite miniser un maximum l’erreur.
On prends des points supplémentaires pour faire une mesure de l’erreur : erreur empirique.
  

> [!important] On va ‘cacher' une partie des données pour pouvoir vérifier la viabilité de notre modèle grâce au calcul de l’erreur.
  
### Biais d’apprentissage
  
It is always possible to find a model complex enough to fit all the examples.  
Example: polynomial with very high degree
But how would this help us with new samples?  
It should not generalize well.
We need to define a family of acceptable solutions to search from.  
It forces to learn a “smoothed” representation. But it should not smooth the representation too much!
  

> One should not increase, beyond what is necessary, the number of entities required to explain  
> anything.  
> — Occam’s Principle of Parsimony (14th century)
  
When many solutions are available for a given problem, we should select the simplest one.
We will use prior knowledge of the problem to solve to define what is a simple solution.  
Example of a prior: smoothness
  
## Learning as a search problem
  
On va devoir discrétiser l’espace possible.
![[image 7 11.png|image 7 11.png]]
  
### Problème intrinsec au bruit
Your data is not perfect (can have noisy or erroneous labels). (or “Every model is wrong.”) Even if there exist an optimal underlying model, the observations are corrupted by noise
![[image 8 9.png|image 8 9.png]]
### Biais (inductif), approximation de l’erreur
We are exploring a restricted subset of all possible solutions. Your classifier needs to drop some information about the training set to have generalization power (simplify to generalize).
![[image 9 9.png|image 9 9.png]]
### Variance, éstimation de l’erreur
You have many ways to explain your training dataset. It is hard to find an optimal solution among those many possibilities. Our exploration is not very accurate, we are limited by data we see during training.
![[image 10 8.png|image 10 8.png]]
  
### Compromis bias / variance
- Low bias $⇔$ high variance: large search set, can capture many useless details — ==overfitting==.
- High bias $⇔$ low variance: small search set, limited exploration, solution too simple —==underfitting.==
- Solutions: ==regularization== (penalize solutions which are too complex), ==early stopping== (stop  
    when no more progress
![[image 11 7.png|image 11 7.png]]
![[image 12 7.png|image 12 7.png]]
## Paramètres d’un prblème de ML
  
- Type de problème
- Protocol
- Mesure de l’errur
- Données
- Famille de solutions
## Les 3 types de problèmes de ML traditionnels
  
### Régresion
f(x) → dans R
Trouver une droite
![[image 13 7.png|image 13 7.png]]
input :
output :
  
### Classification
f(x) → y dans N
![[image 14 7.png|image 14 7.png]]
input
output:
  
### Éstimation de densité
P(x). Oncherche la proba de x dans son domaine. P(y|x)
![[image 15 7.png|image 15 7.png]]
input output
  
### Autre maniere de voir les chose
- Non supervise : Training data is raw, no class or target is givem
    
    beaucoup de feedback
    
- Apprentissage supervise : training data contains the desired behavior - desired calss outcome
    
    Medium feedback
    
- Apprentissage par renforcement : Est-ce que le systeme a bien fais ?
    
    Weak feedback
    
      
    
# ML Engineering
  
![[image 16 7.png|image 16 7.png]]
  
![[image 17 7.png|image 17 7.png]]
Simplified view of pre-2010 Machine Learning
  
### Scikit-Learn
  
![[image 18 7.png|image 18 7.png]]
  
### Representer les donnees
![[image 19 7.png|image 19 7.png]]