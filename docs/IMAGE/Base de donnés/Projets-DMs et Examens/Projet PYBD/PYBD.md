# 5 ans de données financières
Le travail se fait en deux étapes :
1. Lire les données, les nettoyer et les stocker de facon intelligente dans une base de données,
2. Faire un tableau de bord qui permet de visualiser les donner et d'effectuer quelques analyses
## Les données
Les données sont les cours d'entreprises de la bourse de Paris extraites de deux sources :
- Euronext (données journalières),
- Boursorama (valeur toutes les 10 mn).
vous devez les ranger dans `data/euronext` et `data/boursorama/` avec le data indiqué dans le `docker-compose.yml`.
Certains fichiers sont dest DataFrame stockés en mode pickle (`pd.read_pickle`), d'aurtes dans fichier Excel.
Les données et un début de projet sont sur [https://www.lrde.epita.fr/~ricou/pybd/projet](https://www.lrde.epita.fr/~ricou/pybd/projet)
Attention a bien nettoyer les données, boucher les trous si possible, gérer les doublons (en particulier dans la table `companies`) et les incohérences entre les deux sources.
## Outils
Les outils sont les mêmes pour tout le monde afin que vous puissiez plus facilement comprendre et juger le travail des autres groupes.
Je vous donne des dockers presque vides, à vous de les remplir en respectant cette structure.
Vous disposez de
- [TimescaleDB](https://docs.timescale.com/) pour stocker les valeurs nettoyées. Les tables sont définies dans `timescaledb_model.py` de l'_analyzer_, veuillez ne pas les changer. Si vous désirez vraiment les changer, demandez le moi afin que tout le monde profite du changement.
- [Dash](https://dash.plotly.com/) pour l'interface graphique et quelques extension que vous trouverez dans le `requirement.txt` du docker.
Si vous désirez utiliser d'autres bibliothèques, veuillez me le demander afin que je les ajoute aux dockers si j'en approuve leur usage.
Lors de la correction vous aurez tous la même structure ce qui devrait simplifier votre travail.
## Les graphiques
Il est attendu
- d'afficher le cours d'une action en échelle logarithmique avec une ligne ou avec des chandeliers (l'utilisateur doit pouvoir choisir). On doit pouvoir choisir le début et la fin de la période que l'on désire afficher.
- on doit pouvoir choisir plusieurs actions pour afficher leurs cours comme ci-dessus mais avec une couleur par action (pensez à la légende qui permet de désélectionner un cours)
- afficher des [bandes de Bollinger](https://fr.wikipedia.org/wiki/Bandes_de_Bollinger) pour un cours choisi
- afficher les données brutes dans un tableau pour les cours choisis avec en colonne le min, max, début, fin, moyenne, écart type pour chaque jour (une ligne = un jour).
- une fonctionnalité de votre choix
## FAQ
- Depuis l'école je ne peux pas récupérer le docker de TimeScaleDB. C'est dû au fait qu'on est sur liste noire temporairement, donc utiliser le cache `docker pull reg.undercloud.cri.epita.fr/docker/timescale/timescaledb` (ou à mettre dans le docker-compose.yml).