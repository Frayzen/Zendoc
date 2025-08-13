---
title: Compte rendu TP OCVX1
Matiére:
  - "[[Optimisation Convexe 1]]"
Date: 2025-06-02
Status: Finis
Pourcentage: "0.75"
Note: 9
Note maximale: 12
Overall: "0.45"
---
[[Sujet]]
[[Étude de l’influence du pas d’apprentissage sur la convergence de la descente de gradient à pas constant - Salomé Berger]]
# Sujet
Il est aujourd'hui très facile d'implémenter n'importe quel algorithme de descente, en n'importe quel langage (ChatGPT le fait très bien, encore faut-il avoir les connaissances nécessaire pour s'en assurer...). Les attendus de ce TP ne concernent donc pas la véracité du code que vous aller écrire est correct (car il n'est plus possible d'en garantir la source (sachant que ça n'était déjà pas évident par le passé...)).
Cependant, la capacité à produire un benchmark de qualité, et surtout à l'analyser de manière rigoureuse et d'en tirer des conclusions pertinentes, reste quand même propre à l'humain.
  
**Votre rendu sera donc jugé sur :**
- l'étude effectuée concernant la sensibilité de vos algorithmes de descente aux hyperparamètres et conditions initiales
- l'analyse comparative proposée pour les différentes implémentations suggérées
- la précision et concision des résultats présentés (par exemple, dans les choix que vous ferez pour visualiser l'influence de tel ou tel paramètre sur telle ou telle métrique attestant de la convergence de votre algorithme).
  
Comme vous allez le découvrir, ce TP est très riche et très long. Il n'est pas attendu de vous que vous implémentiez nécessairement **toutes** les méthodes demandées, ni que vous benchmarkiez pour une méthode donnée, l'influence de **tous** les hyperparamètres. C'est à vous de choisir ce que vous voulez comparer, en fonction de ce qui a le plus éveillé votre curiosité lors des cours en lien avec les méthodes de descente.
Sujet:
- Influence du pas sur le nombre d'itérations dans le cas de la descente de gradient à pas constant et adéquation avec la théorie (⭐)
  
⚠️ Un benchmark bien conduit, c'est bien. Mais un benchmark bien conduit **et** bien analysé, c'est mieux ! Pour chaque benchmark que vous produirez, chaque courbe que vous tracerez, vous devez donc vous poser la question "Que puis-je en déduire ? Est-ce conforme à ce que prédit la théorie (ou à minima, l'intuition que j'ai du fonctionnement de la méthode qui est benchmarkée) ?
Pour chaque benchmark, vous êtes vivement encouragés à mettre en correspondance toutes les courbes et graphiques que vous pourrez tracer de manière empirique avec les propriétés théoriques des méthodes de descente vues en cours.
  
## **Critères d’évaluation**
### Benchmark 1/2/3
|_**0 points**_|_**1 point**_|_**2 points**_|_**3 points**_|
|---|---|---|---|
|Benchmark non effectué _**0 points**_|Le benchmark est effectué de manière minimaliste. Les illustrations (figures, courbes) sont peu convaincantes et ne supportent pas (ou pas assez) le comportement empirique de la méthode étudiée. Les fonctions testées sont trop restreintes et ne permettent pas de tirer des conclusions suffisamment générales pour le benchmark en question _**1 points**_|Le benchmark est bien effectué. Les illustrations présentées (figures, courbes) sont bien choisies et analysées de manière pertinente. Les fonctions testées sont suffisamment diverses pour permettre d'énoncer de manière convaincante des conclusions (au moins partielles) sur le comportement de la méthode étudiée _**2 points**_|Le benchmark est très bien effectué. Les illustrations présentées (figures, courbes) sont bien choisies. Leur analyse est pertinente, et des liens entre le comportement empirique de la méthode étudiée et certaines propriétés théoriques du cours sont énoncés. Les fonctions sont testées de manière exhaustives et permettent de conclure de manière convaincante sur le comportement de la méthode étudiée_**3 points**_|
**Qualité générale du rapport**
|_**0 points**_|_**1 point**_|_**2 points**_|
|---|---|---|
|Rapport de mauvaise qualité, dans le fond (contenu trop pauvre ou pas assez synthétique) ou dans la forme (orthographe, absence d'introduction ou de conclusion)|Rapport de qualité acceptable. La longueur est bien proportionnée. Présence d'une introduction et d'une conclusion. Certains points du fond ou de la forme pourraient cependant être améliorés|Rapport de très bonne qualité, avec un bon équilibre entre les parties de texte (descriptives) et les figures (illustratives). Les figures ont systématiquement des légendes. Présence d'une introduction, d"une conclusion et de perspectives|
**Répartition du travail**
|   |   |
|---|---|
|_**0 points**_|_**1 point**_|
|La répartition du travail au sein du groupe n'est pas donnée|La répartition du travail au sein du groupe est donnée|
![[image 17.png|image 17.png]]
![[image 1 8.png|image 1 8.png]]
![[image 2 8.png|image 2 8.png]]
![[image 3 5.png|image 3 5.png]]