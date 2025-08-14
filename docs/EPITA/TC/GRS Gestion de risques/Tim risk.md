---
title: Tim risk
Owner: Tim Pearson
---
# Notes de révision – Gestion des risques (EPITA 2025)
## Séance 4 - Typologie et stratégies de gestion du risque
### Audit des risques
- Algo standard de management du risque IT:
    - Audit des vulnérabilités
    - Choix d’une politique de gestion
    - Choix d’une option de contrôle
    - Audit des menaces
    - Audit des assets
    - Audit des risques
    - Audit interne
- Politiques de gestion du risque
    - Accepter
    - Atténuer
    - Éviter
    - Transférer
- Option de contrôle
    - Dispositif de contrôle technique
    - Dispositif de contrôle opérationnel
    - Opérationnel > hiérarchique
- Définition générique du risque:
    
    > « Probabilité qu’un événement ou une situation ait des conséquences négatives pour l’atteinte d’un objectif donné »
    
    - Selon Kaplan & Garrick, 1981.
---
### 1. Les risques opérationnels (1/3)
- Management du risque _stricto sensu_ = gestion des risques opérationnels.
- Entrave l’organisation dans l’atteinte des objectifs de production.
- Trois axes d’analyse en IT:
    1. Les **systèmes techniques** (hardwares, softwares…) construits pour atteindre les objectifs $\rightarrow$ risques de panne.
    2. Les **collaborateurs** embauchés pour atteindre les objectifs $\rightarrow$ risques humains.
    3. Les **processus industriels** mis en œuvre (workflow, procédures internes, mode opératoire) $\rightarrow$ risques processus.
- Référence indicative: ISO 31000 (Principes généraux de management du risque).
---
### 1.1 Risques opérationnels: système technique
- Enjeu prioritaire pour des ingénieurs IT.
- Nature du risque: probabilité de survenue d’une panne ou d’un dysfonctionnement d’un équipement technique ou d’une application.
- Dommages potentiels: interruption de service, pertes financières, atteinte à l’image de marque…
- Exemples:
    - Panne d’un serveur de production lors d’une mise à jour critique.
    - Panne d’alimentation dans un data center AWS.
---
### 1.2 Risques opérationnels: risques humains
- Nature du risque: probabilité d’une erreur humaine ou d’un acte malveillant interne.
- Dommages potentiels: fuite ou perte de données, sabotage, ouverture de failles de sécurité…
- Exemples:
    - Un administrateur système supprime par erreur des fichiers critiques.
    - Email de phishing ouvert par un employé déclenchant une infection par ransomware.
---
### 1.3 Risques opérationnels: risques processus
- Nature du risque: probabilité de défaillance ou d’incohérence dans les procédures internes, workflow inadapté, non-respect de normes…
- Dommages potentiels: retards dans la production, qualité du service dégradée, non-respect de la réglementation, sanctions financières…
- Exemples:
    - Un processus d’approbation trop long retarde les mises à jour de sécurité.
    - Implémentation d’une application impliquant le passage de données sur les serveurs d’un prestataire ne respectant pas le RGPD.
---
### 2. Risques juridiques / de conformité
1. **Non-conformité réglementaire**:
    - Exemple: Non-respect du RGPD (UE) ou du CCPA (États-Unis).
    - Dommages: sanctions financières, pertes d’opportunités commerciales…
2. **Responsabilité contractuelle**:
    - Exemple: failles dans les contrats de service (SLA), obligations envers les partenaires.
    - Dommages: poursuites judiciaires, dommage réputationnel…
3. **Propriété intellectuelle (IP)**:
    - Exemple: utilisation non autorisée de logiciels ou de licences.
    - Dommages: contentieux, amendes, atteinte à l’image de marque…
- Référence européenne: ENISA.
---
### 3. Risques financiers
1. **Pertes financières directes**:
    - Exemple: fraude en ligne (phishing ciblé, détournement de fonds).
    - Conséquences: Impact comptable immédiat, risque de faillite pour les PME.
2. **Perte d’actifs immatériels**:
    - Exemple: vol de secrets commerciaux, espionnage industriel.
    - Conséquences: perte de compétitivité, baisse de la valorisation boursière.
3. **Refacturations clients / pénalités**:
    - Exemple: non-respect de délais contractuels liés à une indisponibilité du SI.
    - Conséquences: pénalités, rupture de contrats.
---
### 4. Risques stratégiques et réputationnels (1/2)
1. **Atteinte à l’image de marque**:
    - Exemple: divulgation médiatisée d’une brèche de sécurité.
    - Conséquences: Baisse de confiance des parties prenantes, dévalorisation boursière.
2. **Dépendance excessive à un fournisseur ou à une technologie**:
    - Exemple: monoculture technologique (all-in sur AWS).
    - Dommages: perte de compétences internes, vulnérabilité à une hausse de coûts ou à une défaillance du fournisseur.
3. **Manque d’anticipation ou d’innovation**:
    - Exemple: négligence des risques liés à l’IoT ou à l’IA.
    - Conséquences: Perte d’avantage concurrentiel, retard technologique.
---
### 4. Risques réputationnels (2/2)
- Service IT B to C $\rightarrow$ défaillance = forte probabilité de perte de clients.
- Service IT B to B $\rightarrow$ défaillance $\neq$ perte de client:
    - Intégration des systèmes IT = barrière à la sortie.
    - Compréhension des problématiques industrielles.
    - Relations de long terme.
    - Effet « too big to fail » (AWS, Microsoft, Google…).
---
### 5. Risques humains et organisationnels
1. **Compétences et formation**:
    - Exemple: manque de formation des utilisateurs (phishing).
    - Dommages: ouverture involontaire de brèches de sécurité, erreurs de saisie.
2. **Turnover et rétention des talents**:
    - Exemple: départ d’un expert clé de la cybersécurité.
    - Conséquences: Perte du savoir-faire, augmentation du risque de mauvaise configuration.
3. **Culture organisationnelle**:
    - Exemple: absence de collaboration entre services IT et métiers.
    - Conséquences: Communication lacunaire, projets mal sécurisés, prise de décision lente ou erronée.
---
### 6. Risques liés à l’écosystème (1/2) (fournisseurs, partenaires, sous-traitants)
1. **Cyber-risque tiers (supply chain)**:
    - Exemple: Accès non contrôlé d’un sous-traitant à l’infrastructure (cas Target en 2013).
    - Conséquences: Intrusion indirecte, propagation d’un malware à travers la chaîne logistique.
2. **Intégration logicielle**:
    - Exemple: utilisation de librairies open source compromises (ex: Log4Shell).
    - Conséquences: vulnérabilité propagée à travers tous les services dépendant de la librairie.
3. **Sous-traitance**:
    - Exemple: externalisation du support utilisateur dans des zones géographiques à risques (faibles contrôles).
    - Conséquences: fuite de données sensibles, dépendance opérationnelle.
- Référence indicative: NIST SP 800-161 (Supply Chain Risk Management Practices for Federal Information Systems and Organizations).
---
### 6. Risques écosystémique (2/2): very Black Friday pour Target
- Vulnérabilité sur l’interface permettant aux vendeurs-tiers du site [target.com](http://target.com/) de consulter leurs données.
- Réseau interne non segmenté, pas de firewall suffisant.
- Infiltration du Point of Sales System (POS) par des hackers lors du Black Friday (novembre 2013), occasionnant le vol de:
    - 41 millions d’empreintes de cartes bancaires.
    - 70 millions de dossiers-client.
- Pertes estimées à 292 millions d’USD.
---
### 6 catégories et c’est tout ?
- Chaque auteur / milieu professionnel propose sa propre typologie.
- Exemple dans l’industrie lourde:
    - Risques professionnels.
    - Risque industriel / technique.
    - Risques santé.
    - Risques individuels.
    - Risques spécifiques.
    - Risques dit « de menace ».
- Chaque organisation est libre d’organiser sa gestion des risques dans la mesure où elle respecte la législation et les normes en vigueur.
---
### Conclusion sur l’audit des risques
- Approche globale:
    - Les catégories de risque se recoupent souvent.
    - Aspects techniques Vs. aspects managériaux.
- Objectif de l’audit des risques:
    - Mesurer la probabilité d’occurrence pour chaque catégorie.
    - Estimer la gravité des conséquences.
    - Comparer ces risques à la tolérance acceptable définie par l’organisation.
---
### Comment gérer nos risques? Politiques de gestion du risque
- Algo standard de gestion du risque IT
    - Audit des vulnérabilités
    - Choix d’une politique de gestion
    - Choix d’une option de contrôle
    - Audit des menaces
    - Audit des assets
    - Audit des risques
    - Audit interne
- La responsabilité du manager IT:
    - Minimiser probabilité d’occurrence et impacts potentiels des 6 grands types de risque.
    - Pour cela, choisir une politique de contrôle appropriée selon les risques repérés et les ressources qu’on a sous la main.
    - Capacité d’évaluation des risques limitées (fréquence, impact).
    - Ressources organisationnelles limitées (temps, budget, expertise des collaborateurs…).
    - Gérer le risque = arbitrer entre 4 grandes options:
        1. Atténuer (mitigate)
        2. Transférer
        3. Éviter
        4. Accepter
---
### 1. Atténuer (mitigate)
- Principe: essayer de maintenir le risque dans une zone acceptable.
    - En jouant sur la probabilité d’occurrence.
    - Limite d’acceptabilité $\rightarrow$ fonction de la nature de l’organisation.
- Outils de mitigation:
    - Des dispositifs mis en place pour patcher des vulnérabilités…
    - … afin de limiter leur exposition au risque…
    - … ou de limiter les dommages potentiels liés à la réalisation du risque.
- Logique: ajouter un dispositif (patch) permettant qu’une vulnérabilité ne soient plus exposées.
- Dans un contexte cyber:
    - Wannacry exploitait le protocole SMB v1.
    - Mesure d’atténuation: mise en place d’un firewall sur le port 445 bloquant tout ce qui vient d’internet.
    - Ne supprime pas la cause racine du problème.
    - Ramène le risque à un niveau acceptable en attendant que Microsoft réagisse.
    - Atténuation: travail sur la probabilité d’occurrence.
- Pourquoi l’atténuation prime dans une perspective cyber:
    - Principe: ramener le risque à une probabilité jugée acceptable.
    - N’implique pas de changements fondamentaux dans l’architecture du système $\rightarrow$ impacts anticipables.
    - Faibles délais de mise en œuvre.
    - Faibles coûts.
    - Patch $\rightarrow$ évolutivité.
---
### 2. Transférer
- Contexte: quand l’organisation ne peut pas se permettre d’accepter, d’éviter ou d’atténuer le risque.
    - Pour des raisons financières.
    - Par manque de compétences techniques.
    - Par manque de temps.
- Principe: demander à une organisation tierce d’assumer pour nous un risque.
    - De faire en sorte que le risque ne se réalise pas.
    - De faire en sorte que la réalisation ait le moins de conséquence possible pour notre organisation.
    - D’être indemnisé si le risque survient.
- Logique: assurance / service après-vente.
- Dans un contexte cyber:
    - Marché mondial de l’assurance cybersécurité en 2023: 16,43 milliards d’USD.
    - Marché mondial de l’assurance cybersécurité en 2028: 88,8 milliards d’USD (CAGR = 20,5%).
    - Inclus des polices d’assurances contre la violation de données (data breaches insurances).
    - Principaux fournisseurs d’assurance cybersécurité: AIG, Chubb Cyber, Munich Re, Hiscox, AXA, Axis…
- Transfert de risque très courant pour la gestion des hardwares.
    - Contrats de mise à disposition.
    - Garanties.
    - Assurances.
    - Contrats de maintenance.
---
### 3. Éviter
- Contexte: le risque est considéré comme non acceptable par l’organisation, et celle-ci décide d’interdire l’exposition à celui-ci.
- Principe: changer l’architecture du système pour empêcher qu’un aléa se produise en exploitant une vulnérabilité.
- Logique:
    - Prévention drastique.
    - Contournement des points critiques.
    - NO GO.
- Dans un contexte cyber:
    - Contre le shadow IT: mise en place d’une politique d’accès contrôlés (whitelisting).
    - Contre Wannacry en 2017: désactiver totalement SMB v1 $\rightarrow$ supprime la vulnérabilité.
    - Contre les vulnérabilités de Windows 11: Passer à MacOS ou à Linux.
    - Contre les vulnérabilités d’Apache Struts: Utiliser un autre MVC non basé sur Java.
- Conséquences opérationnelles significatives:
    - Souvent coûteux en ressources (temps / budget / expertise mobilisée).
    - Risque de fortement perturber l’organisation (enjeu de continuité).
---
### 4. Accepter
- Principe: décider d’assumer d’un risque (ne chercher ni à l’atténuer, ni à l’éviter, ni à le transférer).
- Pas une option par défaut $\rightarrow$ accepter un risque implique:
    - D’avoir évalué de sa prévalence statistique.
    - D’avoir évalué les dommages consécutifs à sa réalisation.
    - D’être capable de justifier sa non prise en charge.
- Les risques pris en charge occasionnent un risque résiduel qui doit être acceptable.
- Acceptation = manière dont est envisagé le risque résiduel suite à la prise de mesure d’atténuation.
    - « On utilise Windows 11 Pro, on sait que cet OS n’est pas parfait mais nous avons la dernière version et faisons toutes les mises à jour, donc nous acceptons les risques associés à son usage ».
- Principe fondamental: celui qui décide du niveau de risque doit pouvoir en assumer les conséquences (Taleb, 2018).
    - Opérationnelles.
    - Financières.
    - Juridiques…
- Enjeu: qui est vraiment autorisé à accepter le risque
    - RSSI?
    - Cadre « C level »: CEO, CIO, CSO…?
    - Managers sans compétence technique?
    - Collaborateurs en front?
---
## Séance 1 - Introduction au risque dans l’écosystème numérique global
### Dans quels secteurs d’activité les professionnels de l’IT doivent-ils gérer des risques?
- Un risque IT omniprésent.
- Tous les secteurs d’activités peuvent être touchés.
    - Finance, santé, énergie, industrie, commerce…
- Impacts multiples: pertes financières, atteinte à la réputation, interruptions d’activité, fuite de données…
- Un niveau de gestion du risque très fluctuant.
- Gestion du risque: un enjeu global pour les tous professionnels de l’IT.
    - Experts en cybersécurité.
    - Développeurs.
    - Administrateurs systèmes et réseaux.
    - Managers et décideurs IT.
---
### Gestion du risque = problème complexe
- Choix des modalités de gestion du risque = interaction avec l’environnement.
- Implique des arbitrages.
    - Tension entre recherches d’interactions et de contrôle.
    - Tension entre prévention et préservation de capacités dynamiques.
    - Laisser certains accidents se produire.
    - Laisser certaines menaces adverses se concrétiser.
- D’où recherche active de guidelines chez les professionnels.
- Difficultés à comprendre le concept [risque]:
    - Terme polysémique / rarement défini.
    - Degré de connaissance et de compréhension des probabilités.
    - Biais d’actualisation / difficulté à prendre en compte le long terme.
    - Incertitude sur les effets.
    - Évolution constante des systèmes humains.
- Difficulté à comprendre les organisations.
    - Organisation: cadre permettant des interactions hyper-complexes entre:
        - Outils de production (dont IT).
        - Outils de gestion (dont IT).
        - Activité de production.
        - Activité de coordination / de support.
        - Hiérarchie et management.
        - Liens sociaux formels / réseaux informels.
        - Environnement.
    - Résultats:
        - Dynamique d’interaction avec l’environnement.
        - Apprentissage.
        - Emergences.
---
### Définir le risque (1/2): une perspective cyber / IT
- **Assets**: tout ce qui a de la valeur pour une organisation.
- **Vulnérabilités**: les faiblesses internes d’un système de production.
- **Menaces**: tout ce qui peut nuire, endommager, compromettre un asset.
- **Risque**: probabilité de la réalisation d’une menace.
---
### Définir le risque (2/2): perspective managériale
- Probabilité $\times$ Criticité $\times$ Impact potentiel
- « Séquence plus ou moins vraisemblables d’événements, de décisions, d’actions, non souhaitée, qui peut influencer l’atteinte d’un objectif du système. Un risque peut se manifester sous forme d’un accident, d’un incident. » - Deleuze et Ipperti, 2013, p. 20
- Deux grands axes de travail:
    1. Sécurité au travail
    2. Risques liés aux processus
- Criticité du risque = impact $\times$ probabilité.
---
### Concepts fondamentaux de la gestion du risque
- Risque, incertitude, danger, dommage, arbitrage.
- Définition générique du risque
    - « Probabilité qu’un événement ou une situation ait des conséquences négatives pour l’atteinte d’un objectif donné »
    - Selon Kaplan & Garrick, 1981 (adaptation par nos soins)
- **Conséquences (1/2): objectivation**
    - Le risque dépend des objectifs
        - Sécurité des données
        - Qualité logicielle
        - Conformité réglementaire / normative (RGPD, ISO 27001…)
        - Temps de déploiement
        - Rentabilité
        - …
    - Objectifs d’un système: arbitraires et contextuels
        - Construction sociale
        - Varient dans le temps ( exemple : RGPD et protection des données )
- **Conséquences (2/2): incertitude**
    1. Le risque est une probabilité
        - « Risque 0 » $\rightarrow$ $\emptyset$
        - Évaluation statistique rétrospective
        - Statistique $\neq$ probabilité
        - Réalisation du risque incertaine
    2. Compréhension des probabilités très fluctuante
        - Dépend de la capacité d’abstraction logique
        - Dépend du contexte (stress, charge de travail, pression temporelle…)
- [Risque]: phénomène incertain et concept difficile à appréhender
---
### Risque & incertitude
- D’après ISO 31000: risque = effet de l’incertitude sur l’atteinte des objectifs.
- Incertitude: manque d’informations ou d’outils permettant d’évaluer précisément ce qui pourrait se produire.
- Sources d’incertitude
    - Technique / technologie
    - Humains
    - Organisations
    - Réglementations
    - Environnement
    - …
- Définir simplement le danger et les dommages
    - Danger: « source potentielle de dommages à laquelle une activité nous expose ».
    - Dommage: « conséquence concrète et négative / préjudice qui résulte de la réalisation du risque ».
- Exemples de types de dommages liés à l’IT
    - Dommages matériels.
    - Dommages environnementaux.
    - Dommages sur les résultats.
    - Dommages économiques.
    - Dommages réputationnels.
---
### Role des référentiels normatifs
- Normes et gestion du risque
- À quoi servent les référentiels en gestion de risque
- Objectifs :
    - Structurer les pratiques de gestion des risques
        - Créer un vocabulaire commun
        - Offrir un cadre pour identifier, analyser et atténuer les risques
    - Alignements sur les meilleures pratiques = [isomorphisme] (DiMaggio & Powell, 1983)
        - Au sens large : tendance des organisations appartenant à un même secteur d’activité à adopter des pratiques, des structures ou des comportements similaires sous l'effet de pressions externes et internes.
        - En particulier « isomorphisme coercitif » : pressions formelles et informelles exercées par des entités influentes (État, régulateurs, grandes entreprises clientes) sur la conformité à certaines normes
- ISO 27005 : 2022 – Gestion des risques en cybersécurité
    - Objectif : définir une méthodologie pour gérer les risques liés à la sécurité de l'information
    - Principaux concepts :
        - Identification et évaluation des menaces et vulnérabilités
        - Définition des impacts et probabilité d’occurrence
        - Choix des stratégies de traitement du risque (accepter, atténuer, transférer, éviter)
    - Application : utilisée par les RSSI et experts en cybersécurité pour structurer leur approche
- NIST CSF 2.0 – Un cadre structurant pour la cybersécurité
    - Développé par National Institute of Standards and Technology (NIST, USA). Cinq objectifs-clés :
        - Identifier les assets et les risques
        - Protéger : mettre en place des mesures préventives
        - Détecter les activités suspectes
        - Répondre rapidement aux incidents
        - Récupérer : restaurer les services et améliorer la résilience
- En pratique (1/3) : un rôle structurant
    - Référentiels : des outils structurants qui définissent…
        - Des processus
        - Des catégories de risques
        - Des modalités de contrôles
        - Une architecture de gouvernance
    - Outils régulièrement mis en avant par les praticiens…
        - Revendication de l’utilisation des référentiels (effet label)
        - Parfois certifications des organisations (ISO/IEC 27 001, ISO/IEC 27 701 sur la protection des données personnelles, ISO 27 018 pour la sécurité des services cloud ; etc.)
        - « Support politique » pour susciter des investissements dans la gestion des risques
    - Favorisent l’adoption des bonnes pratiques de base
- En pratique (2/3) : standardisation approximative
    - Forte variance dans la compréhension des référentiels et les pratiques
        - Entre les organisations d’un même secteur : gage de sérieux ou vernis de respectabilité pour satisfaire à des approches contractuelles ?
        - Au sein des organisations : vision DG Vs. vision équipes IT
        - Au sein des équipes IT : priorisation des risques ?
    - Uniformisation des pratiques
        - Créé des comportements similaires d’une organisation à l’autre : ajoute du risque systémique
        - Quick wins à l’implémentation…
        - …Mais valeur ajoutée limitée sur des enjeux émergents
        - Exemple : appliquée seule ISO/IEC 27001 n’aide pas forcément à anticiper les attaques sur la supply chain logicielle
- En pratique (3/3) : réduction de l’incertitude Vs. Résolution des arbitrages
    - Utilité première des référentiels : réduire l’incertitude (évaluer les risques, mettre en place des contrôles, vérifier périodiquement l’efficacité…)
    - Assurent des pratiques convenables
    - Mais ne servent pas à trancher les besoins d’arbitrage
        - Définisse comment construire, entretenir et surveiller Le Mur
        - N’adressent pas les bonnes questions : « Avons-nous besoin du Mur ? Quelles autres options avons-nous ? »
---
### Séance 2 - Enquêter sur les pratiques de gestion du risque
- Enquêter sur le management du risque cyber
    - Management du risque cyber $\approx$ cybersécurité
    - Cybersécurité:
        - Enjeu critique pour les organisations: viabilité des systèmes
        - Enjeu critique pour l’IT et les ingénieurs en IT
        - Objectif de la présentation :
        - Clarifier l’importance de l’enquête
        - Expliquer le questionnaire
        - Fournir des conseils pour trouver des répondants et recueillir des données
- Exposition au danger provient souvent de l'interne
    1. Pratiques informelles
    2. Erreurs humaines
    3. Transgressions volontaires de procédures
---
### Travail prescrit Vs travail réel
- Travail réel
    - Contenu des tâches effectivement mis en œuvre par les opérateurs
    - Multitudes de petites décisions et d’initiatives fondées sur la connaissance empirique des postes de travail
    - Mobilise des connaissances, savoir-faire et savoir-être tirés de l’expérience
    - Rend opérationnel le travail prescrit
- Travail prescrit
    - Contenu des tâches décrit dans les fiches de postes et les procédures
    - Conception scientifique / optimisatrice
    - Produit d’analyse sur les modes d’action et les durées
    - Objectif : tendre vers la plus grande productivité
    - Cadre théorique
---
## Séance 3 - Auditer le risque : pratiques et référentiels
### Introduction : objectifs, définitions et ressources pour la gestion du risque IT
- Quels sont les objectifs de la gestion du risque IT ?
    - Objectifs génériques du management du risque (1/2) : continuité au meilleur coût
        1. Assurer la continuité de l’activité $\rightarrow$ recherche d’efficacité
        2. Minimiser les pertes de ressources / assets $\rightarrow$ recherche d’efficience
    - Objectifs génériques du management du risque (2/2) : la « sainte trinité » de l’IT
        - CIA : Confidentiality, Integrity, Availability
            - Confidentiality $\rightarrow$ seules les personnes autorisées ont accès à l’information et aux services
            - Integrity $\rightarrow$ les données ne sont pas altérées ni modifiées sans autorisation
            - Availability $\rightarrow$ systèmes et data accessible aux utilisateurs autorisés quand ils en ont besoin
---
### Perspective des consultants cyber / IT : focale sur la sécurité / safety
- Assets : tout ce qui a de la valeur pour une organisation
- Vulnérabilités : les faiblesses internes d’un système de production
- Menaces : tout ce qui peut nuire, endommager, compromettre un asset
- Risque : probabilité de la réalisation d’une menace
---
### [Management du risque] et [sécurité]
- Une perspective restreinte : sécurité / safety
    - Préservation des assets contre ce qui les affecte directement…
    - … Depuis la prévention des accidents et des menaces adverses…
    - … jusqu’à la gestion de crise à la suite d'une catastrophe
- Une perspective large : management du risque
    - Identification, analyse, évaluation et gestion de tous les risques relatifs à une activité
    - Inclus la sécurité / safety
    - Scope large (risque opérationnels, financiers, technologiques, légaux, environnementaux…)
- Management du risque IT : algo standard
    - Audit des vulnérabilités
    - Choix d’une politique de gestion
    - Accepter
    - Atténuer
    - Eviter
    - Transférer
    - Choix d’une option de contrôle
    - Dispositif de contrôle technique
    - Dispositif de contrôle opérationnel
    - Opérationnel > hiérarchique
    - Politique de gestion du risque
    - Options de contrôle du risque
    - Audit des menaces
    - Audit des assets
    - Audit des risques
    - Audit interne
---
### Les assets d’une organisation
- Tout ce qu’elle possède…
    - Hardwares
    - Softwares propriétaires
    - Réseaux
    - Data
    - Trésorerie
    - Connaissances documentées (SOP, process book, brevets…)
    - Etc.
- Et tout ce qu’elle ne possède pas à proprement parler mais qu’elle peut mobiliser pour produire
    - Collaborateurs
    - Image de marque
    - Clients – confiance des clients
    - SaaS
    - Cloud public
    - Connaissances tacites / non documentées
    - Etc.
---
### Audit des assets & référentiels (ISO 27005 & NIST CSF)
- ISO 27005 :
    - Identification des assets informationnels et des assets supports (systèmes, personnes, infrastructures)
    - Analyse de la valeur des assets (confidentialité, intégrité, disponibilité)
- NIST CSF (fonction IDENTIFY) :
    - Définition des business assets critiques
    - Liens entre les assets et les processus métier
    - Gestion des dépendances technologiques et interconnexions
- Recommandations partagées entre ISO 27005 et NIST CSF : identification exhaustive + évaluation criticité
---
### Audit des vulnérabilités & référentiels (ISO 27005 & NIST CSF)
- ISO 27005 :
    - Identification et classification
    - Evaluation du niveau d’exposition des assets
    - Lien entre vulnérabilité et menace potentielle
- NIST CSF (fonction PROTECT & DETECT) :
    - Identification des vulnérabilités via des audits réguliers
    - Gestion proactive des correctifs (« patch management »).
    - Surveillance des menaces exploitant des vulnérabilités (« threat intelligence »)
- Vulnérabilités d’un système IT [1/2]
    - Faiblesses / défauts de conception d’un système susceptibles d’être exploités par une menace adverse ou accidentelle
    - Difficulté : on juge les vulnérabilités à l’aune des menaces connues !
        - Angles morts difficiles à évaluer
        - Processus itératif (jamais terminé)
        - Surveillance / veille cybersécurité quasi-indispensable
    - Rôle des professionnels de la cybersécurité / de l’IT :
        1. Explorer activement les vulnérabilités potentielles du système
        2. Veiller sur les menaces émergentes
---
### Menaces : tout ce qui empêche le déroulement prévu des opérations
- [Menace] : concept qui connote une absence de contrôle direct sur les événements  attention, c’est loin d’être toujours vrai !
    1. Menaces adverses (adversarial threats) : actions malveillantes
        - Atteinte volontaire à l’intégrité, à la confidentialité et à la disponibilité des SI de l’organisation
        - Activités malveillantes d’individus / groupes aux intérêts antagonistes à une organisation (souvent criminelle…)
        - Parfois la menace adverse utilise un insider (« felony »)
        - Exemples : DDoS, phishing, ransomware, supply chain attack, espionnage…
    2. Menaces accidentelles : défaillances involontaires
        - Accidents sans intervention malveillante d’acteurs externes à l’organisation
        - Causes possibles : erreur humaine, défaillance structurelle, facteurs environnementaux
        - Exemples : erreurs de configuration, défaillance technique, mise à jour logicielle défectueuse, inondation de data centers…
---
### Audit des menaces & référentiels (ISO 27005 & NIST CSF)
- ISO 27005 :
    - Identification des attaques probables
    - Cartographie des acteurs malveillants et événements redoutés
    - Approche qualitative et quantitative du risque y compris pannes techniques et erreurs humaines
- NIST CSF (fonction PROTECT & RESPOND) :
    - Mise en place de SIEM (Security Information and Event Management) pour détecter les attaques en temps réel
    - Définition d’une politique de Cyber Threat Intelligence (CTI) pour anticiper les menaces
    - Définitions de plans de gestion des incidents IT , y compris pour les pannes techniques et erreurs de configuration
---
## Séance 5 - Outils, contrôle du risque et effets pervers
### Les outils : des « bicyclettes pour l'esprit »
- Outils de gestion du risque:
    - Ensemble structuré de dispositifs techniques, opérationnels ou administratifs utilisés par une organisation pour identifier, analyser, prévenir, réduire ou contrôler les risques susceptibles d’affecter ses objectifs stratégiques et opérationnels.
    - Visent à standardiser les comportements professionnels et à faciliter la prise de décision en matière de risque en fournissant des méthodes, des procédures et des indicateurs mesurables.
    - D’après : ISO 31000 (2018) ; NIST Cybersecurity Framework (2024)
- Quels effets de l'outillage sur la gestion du risque ?
    - Réduction de la variance dans les comportements
---
### Les effets des outils de gestion du risque
- Erik Hollnagel (1998, 2004) : Outils de gestion du risque = « barrières » permettant de…
    1. Prévenir l’exécution d’une action ou la survenue d’un évènement
    2. Prévenir ou diminuer les conséquences de la perte de contrôle d’une situation et/ou d’un accident
- Typologie des outils de gestion du risque (Hollnagel, 2004)
|   |   |   |
|---|---|---|
|Définition|Efficacité|Evaluation|
|Barrière matérielle / physique|Barrières qui préviennent physiquement une action ou bien limitent les conséquences d’un événement donné|Elevée|
|Barrière fonctionnelle / procédurale|Barrières qui empêchent la réalisation d’une action grâce à des processus / mécanismes (logiques, physiques, temporels) et des verrouillages (mots de passe, codes d’accès…)|Elevée|
|Barrière symbolique / signalétique|Barrières qui nécessitent un acte d’interprétation pour atteindre les buts pour lesquels elles ont été conçues (signes, signaux, alarmes, avertissements…)|Intermédiaire|
|Barrière immatérielle (cognitive / culturelle)|Barrières non présentes physiquement au sein de la situation de travail et dont l’atteinte des objectifs dépendent de la représentation que les opérateurs en ont (lois, règles, principes, procédures écrites, hiérarchie, formations…).|Faible|
- Exemple 2 : barrières matérielles, fonctionnelles, symboliques et immatérielles en IT
    1. Barrières matérielles (physiques)
        
        - Équipements physiques empêchant ou limitant l’accès à des systèmes ou des informations sensibles.
        
        ## Exemples :