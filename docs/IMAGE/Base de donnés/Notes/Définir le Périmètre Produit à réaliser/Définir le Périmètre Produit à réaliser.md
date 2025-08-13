---
title: Définir le Périmètre Produit à réaliser
Matière:
  - "[[Management et Pilotage de Projets]]"
Type: Cours
Date du cours: 2025-04-22
Supports:
  - "[[Module1_Scope_Produit.pdf]]"
---
# **1. Vision Produit et Objectifs**
- La **vision produit** est une projection dans le futur pour répondre aux objectifs du projet.
- Deux formes d’anticipation :
    - **Rationnelle** : logique, basée sur des données (ex : business case).
    - **Émotionnelle** : intuitive, souvent portée par un leader ou commanditaire.
- La vision peut être :
    - Produit neuf (forte incertitude)
    - Évolution d’un produit existant (plus simple)
    - Mise en conformité (vision cadrée)
---
# 2. **Exigences**
- **Fonctionnelles** : ce que le produit doit faire (ex : "le logiciel doit permettre l’authentification").
- **Non fonctionnelles** : qualité, performance, compatibilité, sécurité, disponibilité...
- **Contraintes** :
    - Techniques : environnement, interfaçage, matériel
    - Projet : budget, délais
    - Qualité : conformité, standards
- **Objectifs dérivés** : ajoutent de la valeur, mesurables (ex : réduire temps de traitement de 30%).
---
# 3. **Méthodes de recueil**
Méthodes issues du consulting pour collecter les besoins :
- 📄 **Analyse de documentation** (spécifs existantes, normes, rapports)
- 🧠 **Brainstorming**
- 🎤 **Entretiens** (formels ou informels)
- 👥 **Ateliers / Groupes de discussion**
- 📝 **Questionnaires, enquêtes**
- 🔍 **Benchmarking** (comparaison avec autres systèmes / concurrents)
---
# 4. **Structuration : méthode descendante / montante**
### **Méthode descendante**
- Part des **objectifs globaux**
- Détermine les **moyens** d’atteindre ces objectifs
- Traduit chaque moyen en **exigences**
- Permet de structurer clairement et rationnellement les attentes
### **Méthode montante**
- Part de **l’expression des besoins utilisateurs**
- Traduction en exigences
- Rattachement à un objectif produit

> [!important] Si une exigence ne se rattache à aucun objectif → exigence "orpheline" (à challenger)
---
# **5. Cahier des charges vs Product Backlog**
### **Méthode prédictive : Cahier des charges**
- Document unique qui formalise **exigences + livrables + contraintes**
- Support de planification, d’appel d’offres et de validation finale
- Exigences exprimées sous forme textuelle, parfois cas d’usage
### **Méthode agile : Product Backlog**
- Liste vivante de **User Stories**
- Priorisation continue, raffinement itératif
- Regroupe tout : exigences, bugs, évolutions, feedbacks
---
# **6. Priorisation des exigences (MoSCoW)**
### Outil pour classer les objectifs / exigences :
- **Mo** – Must have (obligatoire)
- **S** – Should have (important mais non vital)
- **Co** – Could have (nice to have)
- **W** – Won’t have (hors périmètre)

> [!important] En agile, ce classement aide à constituer les Sprints ; en prédictif, il aide à clarifier le périmètre minimal.
---
# **7. Qualité des exigences (SMART, autres critères)**
## **Qualités d’une exigence** :
- Concise
- Non ambiguë
- Nécessaire
- Exacte
- Atteignable
- Vérifiable
- Traçable
### Exigence suspecte :
- ambiguë
- non prioritaire
- redondante
- non atteignable
### Exigence à risque :
- non mesurable
- incertaine à mettre en œuvre
## **Règle SMART pour les objectifs** :
- **S** – Spécifique
- **M** – Mesurable
- **A** – Atteignable
- **R** – Pertinent
- **T** – Temporellement défini
---
# 8. **Exemples de User Stories**
## Structure classique :

> En tant que [_QUI_], je veux [_QUOI_] afin de [_POURQUOI_]
Stockées dans le **Product Backlog**
**Raffinées** au fil des itérations (affinage = "backlog grooming")
**Priorisées** selon la valeur, le risque, la complexité (souvent avec la suite de Fibonacci : 1, 2, 3, 5, 8, 13…)
### ==Exemples== :
- _==En tant que professeur, je veux pouvoir sélectionner le cours afin de pointer la présence.==_
- _==En tant qu’étudiant, je veux utiliser mon smartphone pour pointer afin de gagner du temps.==_