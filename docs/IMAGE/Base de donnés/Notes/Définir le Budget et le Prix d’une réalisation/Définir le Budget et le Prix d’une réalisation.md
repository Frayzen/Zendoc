---
title: Définir le Budget et le Prix d’une réalisation
Matière:
  - "[[Management et Pilotage de Projets]]"
Type: Cours
Date du cours: 2025-04-22
Supports:
  - "[[Module2-Costs_V1.1.pdf]]"
---
# 1. **Construction d’un budget projet**
### **Objectif :**
Établir une **Cost Baseline** (= budget de référence) avant exécution.
### Étapes :
1. **Décomposer le périmètre** en **WBS** (Work Breakdown Structure)
2. Estimer les **charges** (effort en jours)
3. Associer les **ressources** (qui fait quoi)
4. Construire un **planning GANTT**
5. Appliquer les **taux journaliers** pour estimer les **coûts**

> [!important] Un **lot de travaux (WP)** = unité de suivi budgétaire
---
# **2. Notion de WBS et de charge**
### **WBS** = arborescence de tout le travail à faire
- Chaque **lot de travaux (WP)** est décomposé en **activités**
- Estimation de charge = effort ≠ durée
    - ==Ex : 30 j.h de charge ≠ 30 jours calendaires si on a plusieurs personnes==

> [!important] Bonne granularité = activité de quelques jours, évite les micro-tâches
---
# **3. Estimations**
### Plusieurs méthodes disponibles pour estimer les charges :
- **Jugement d’expert**
- **Méthode Delphi** : consultation anonyme d’experts pour converger sur une estimation
- **Analogie** : comparaison avec projets similaires
- **Paramétrique** : formule basée sur métriques (==ex : lignes de code, écrans…==)
### **3 points** :
- Optimiste ($tO$), Pessimiste ($tP$), Plus probable ($tM$)
- Moyenne : $tE = (tO + tM + tP) / 3$
- Ajouter des **réserves** (temps tampon) pour les incertitudes
---
# 4. **Coûts directs et indirects**
### **Directs** (liés aux activités) :
- Ressources humaines (taux jour)
- Matériel, licences, sous-traitance
- Déplacements, formation
### **Indirects** (souvent intégrés dans TJM) :
- Management
- Coût des locaux
- Outils, support, RH, etc.
---
# **5. Cost Baseline et provision pour risques**
**Cost Baseline** = somme des coûts planifiés pour toutes les activités + provisions pour risques
### Deux types de provisions :
- **Risque individuel** : spécifique à un WP (ex : instabilité d’un module)
- **Risque global** : selon niveau de risque global du projet (faible à très élevé → 2% à 20% du budget)
### **Reserve management**
Budget supplémentaire hors de portée du chef de projet, utilisé uniquement en cas d’aléas majeurs
---
# **6. Taux journalier et calculs (exemples pratiques)**
### Calcul d’un TJM (Taux Journalier Moyen) :
```Python
TJM = (salaire brut annuel + charges + frais fixes) / jours effectifs travaillés
```
### ==Exemple :==
- ==Salaire brut mensuel = 3000 €==
- ==Coût total avec charges et frais = 72 000 €/an==
- ==Jours utiles = 172 → TJM === ==**419 €**==
==Coût d’un PFE de 4 personnes sur 6 mois :==
- ==4 pers × 4 j/mois × 6 mois = 96 j.h==
- ==TJM 300 € → coût total ≈== ==**28 800 €**==
---
# **7. Suivi des coûts pendant l’exécution**
### Suivi périodique (souvent mensuel) :
- Comparer **coût réel (AC)** vs **prévu (PV)** vs **valeur acquise (EV)**

> [!important] Indicateurs de **valeur acquise (Earned Value Management - EVM)** :
- **EV** = valeur du travail réellement accompli
- **AC** = coût réel à date
- **PV** = valeur prévue dans le budget
### Indicateurs :
- **CV (Cost Variance)** = EV - AC
- **SV (Schedule Variance)** = EV - PV
- **SPI (Schedule Performance Index)** = EV / PV
- **CPI (Cost Performance Index)** = EV / AC
---
# **8. Exemples chiffrés**
### Exemple simple :
- Objectif : carreler 200 m²
- Budget = 6000 € (30 €/m² × 200)
- En 1 semaine : 40h travaillées, 30 m² posés
    - AC = 1200 €
    - PV = 1200 €
    - EV = 30 m² × 30 € = 900 €
    - CV = -300 € → surcoût
    - SV = -300 € → retard
### Exemple IT :
- Frontend : 50% des écrans faits (EV = 12 000 €)
- Backend : 25/30 endpoints (EV = 41 667 €)
- Total EV = 53 667 € vs AC = 55 800 € → CV = -2133 €