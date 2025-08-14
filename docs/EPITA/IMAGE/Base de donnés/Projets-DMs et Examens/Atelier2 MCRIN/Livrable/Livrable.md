---
title: Livrable
---

### Participants:
- Corentin Colmel
- Salomé Berger
- Antoine Havard
- Flavien Baron
- Celian Aldehuelo-Mateos
  
# Répartition des rôles
  
### Antoine : Critique
Cherche les limites des idées proposé
### Flavien : Modérateur
Gère le temps et orchestre la séance
### Salomé : Secrétaire
Prends en note
### Corentin : Analyste
Essaie de justifier les idéés (avec des chiffres)
### Célian : Utilisateur
Apporte un retour du point de vue de l’utilisateur
## Sujet
Google, a présenté le projet Gameface, une souris de jeu contrôlée par les mouvements de tête et les expressions faciales de l’utilisateur. Cette technologie permet, par exemple, de cliquer en levant les sourcils ou de déplacer le curseur en ouvrant la bouche.
Dans ce contexte réfléchissez à une solution envisageable pour le domaine Médical.
Plus précisement dans un hôpital pour enfant, dans la chambre d’hôpital des patients ou chez eux si ils sont hospitalisé à domicile. Centrer sur l’assistance médical, pour aider les aides médicales.
example: relever le lit avec un movement de tête.
  
---
# Déroulé de la séance
  
- Recherche d’une application selon le sujet. (15 minutes)
- Production
    - Chapeau de Bono (1h)
- PPCO (30 minutes)
- Scénario d’utilisation (25 minutes)
  
  
---
# Production
  
## Application
Notifie les soignant / résonsable des besoins du patients.
Si il n’y a pas de risques ou besoin d’assisatance, execute directement la demande (ex: relever le lit, `teindre la lumière).
Besoin de pouvoir choisir la ou les personnes notifiés.
Pouvoir gérer les actions faisable sans assistance (ex: pouvoir désactiver le lever du lit si risque médical).
Mobilité: pouvoir déplacer le système facilement.
Configuration / personalisation des mouvements.
Caméra infrarouge, batterie de secour, chiffrement des données, connection wifi.
  
## Chapeaux de Bono
### Blanc : objectif
**Enfants atteints de paralysie cérébrale** (cause majeure de handicap moteur) :
- **17 millions** dans le monde (source : Global Burden of Disease Study, 2023).
- **1 cas pour 500 naissances** en moyenne (chiffres OMS).
40% des enfants paralysés moteurs sévères ne peuvent pas parler ni utiliser un clavier standard
**En Europe/Amérique du Nord** : 60 à 70% des enfants paralysés utilisent une technologie d’assistance, mais seulement 20% pour les interfaces avancées (eye-tracking, commande faciale) – rapport EU Disability Forum, 2024.

> _Chaque année, 250 000 nouveaux enfants diagnostiqués avec une paralysie motrice pourraient bénéficier d’une interface faciale simple et peu coûteuse – mais moins de 5% y ont aujourd’hui accès._
Le taux de précision entre 80-95% selon plusieures études.
1,5 à 3 fois plus lent qu’une souris.
Moins précis qu’une souris.
Si la technologie a une bonne compatibilité il est possible d’utiliser des caméra calssique et réduire le budget.
  
### Vert : crétif
Actions possible avec le dispositif:
- À faim / soif
- Gestion de la lumière, volet, chauffage, clim…
- Demander à aller au toilettes
- Appel à la ou les personnes référantes
- Possibilité de dire où le patient à mal (séléction d’une partie du corps sur un diagramme digital)
Détection de malaise.
Clavier virtuel et écran.
Micro et hauts parleurs pour communication vocal.
Personne notifier a accès au flux vidéo.
Tutoriel.
Interface simple et adapter au enfants.
Notifier l’enfant que se demande à bien été envoyée / intercepté
  
### Noir : négatif
Plus tu as d’action plus tu dois avoir d’expression faciales ou mouvement différents.
Si trop de commandes, l’enfant ne se souviendra pas de tout.
Besoin d’une confirmation pour éviter les mauvaise commande.
Si l’enfant ne sais pas lire ou écrire (interface texte).
Devrais fonctionner en local, pour la sécurité des données du patients.
Risque d’abus d’appel de la part du patient.
  
### Rouge : intiutif
Perturbation du rythme / habitudes du personnel.
Anxiété du produit : déclancher une action non voulue.
Angoisse de la panne.
Méfiance des parent vis à vis de la sécurité des données de l’enfant.
Peur qu’on ne vienne te voir que si tu appel: isolation.
Sensation d’être constamment observé,
Soulagement pour les parents et soignants.
Découragement si mouvement trop fatiguant ou compliqués.
  
### Jaune : positif
Aide le personnel à être plus efficace, pas besoin de venir voir l’enfant régulièrement.
Soulage la charge mentale des parents.
Facilite les soins personnalisés.
Permets à l’enfant de préciser où il ressent un inconfort / douleur.
Permet de l’autonomie physique à l’enfant (relever le lit).
  
### Bleu : focus
Séquence d’activation + demande confirmation: évite les demandes inintentionnelles.
Demande de confirmation pour les actions avec plus hautes conséquence (appel).
Télécharger le réseau de neuronnes en local pour fonction sans réseau.
Plusieurs réseau avec possibilité de basculer d’un réseau à un autre si un est défaillant.
Interface vocale pour les enfants ne sachant pas lire et/ou écrire.
Ne pas stocké les données des demandes et vidéo/audio.
Configurer la séquence d’activation.
Avoir un geste simple qui permets de voir les gestes à faire pour les autres commandes : mémo.
Icône avec le text pour les enfant.
Privilegier des geste simple (fleche directionnelle) plutôt que la souris pour l`interface.
  
  
  
---
# PPCO
  
## Plus
  
### **Autonomie améliorée** :
- Permet aux enfants paralysés de communiquer et d’interagir avec leur environnement (ex : appeler l’infirmière, exprimer une douleur).
- Réduit la frustration liée à l’incapacité d’utiliser des interfaces classiques.
### **Efficacité pour le personnel médical** :
- Aide les soignants à prioriser les demandes (ex : détection de malaise, localisation de la douleur).
- Réduit les allers-retours inutiles grâce à des notifications précises.
### **Accessibilité** :
- Fonctionne avec des caméras standard (réduction des coûts).
- Interface adaptée aux enfants (icônes, tutoriels, gestes simples).
  
---
## Potentiels
  
### **Personnalisation avancée** :
- Adapter les gestes en fonction des capacités motrices résiduelles de chaque enfant (ex : clin d’œil, mouvement des lèvres).
- Utiliser l’IA pour améliorer la précision et réduire la fatigue (ex : calibration automatique).
### **Extensions possibles** :
- Intégration avec d’autres dispositifs médicaux (ex : contrôle d’un fauteuil roulant, gestion de la perfusion).
- Version pour d’autres handicaps (ex : SLA, traumatismes crâniens).
### **Marché élargi** :
- Applicable en milieu scolaire ou à domicile pour les enfants handicapés non hospitalisés.
- Solution exportable dans les pays à revenus limités (low-tech, coût maîtrisé).
  
---
## Contraintes & Critiques
  
### **Complexité et fatigue** :
- Trop de gestes différents peuvent rendre l’interface confuse ou épuisante.
- Risque de découragement si les actions demandent trop d’efforts (ex : 3 clignements pour valider).
### **Acceptabilité et confiance** :
- Méfiance des parents et soignants vis-à-vis de la surveillance vidéo/audio.
- Crainte des faux positifs (ex : détection d’une action).
### Risques comportementaux
- Abus des appels par l’enfant (ex : appels répétés par ennui).
- Isolement si le personnel réduit les interactions humaines.
  
---
## Options
  
### **Simplifier l’interface** :
- Limiter le nombre de gestes (ex : 4 mouvements max : haut/bas/gauche/droite + validation).
- Ajouter une "commande mémo" pour afficher les gestes disponibles.
### **Renforcer la sécurité et la confiance** :
- Option "mode privé" pour désactiver la vidéo quand l’enfant le souhaite.
- Confirmation obligatoire pour les actions critiques (ex : "Voulez-vous vraiment appeler l’infirmière ?").
### **Gérer les abus** :
- Limiter les appels répétés via un délai minimum entre deux demandes.
- Ajouter un bouton "urgence réelle" pour prioriser les besoins vitaux.
  
  
---
# Scénario d’utilisation
  
## Léa, 8ans, paralysie cérébrale
  
### Contexte
Léa veut appeler l’infirmière car elle a mal au ventre.
  
- Elle se tourne vers l’écran et tire la langue pour lancer la séquence d’activation.
- Le menu principal s’ouvre
![[image 107.png|image 107.png]]

- Avec ses yeux elle séléctionne l’option “_Douleur_” notifier par le logo: 🩹 et confirme (clique) en haussant des sourcil
- Elle pose la souris sur le ventre du diagramme suivant et hausse les sourcil pour indiquer le lieux de sa douleur
    
    ![[Capture-d-e-cran-2017-10-03-a-15.35.48_w715h1050.png]]

    
- L’infirmière recois une notification l’informant que Léa à mal au ventre.
- L’écran confirme l’arrivé de l’infirmière en affichangt ansi qu’en emettant un message vocal: “L’infimière _nom de l’infimière_ arrive”
- Léa redresse son lit à l’aide du système à l’arriver de l’infirmière
  
## **Infirmière Julie**, 35 ans, travaille en pédiatrie neurologique.
  
- Julie recois la notification que Léa à mal au ventre
- Elle priorise donc sa chambre et s’y rend le plus rapidement possible
- Elle gagne du temps car elle sait exactement où examiner