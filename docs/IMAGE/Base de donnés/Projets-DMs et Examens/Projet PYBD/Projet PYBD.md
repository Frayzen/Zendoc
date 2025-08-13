---
title: Projet PYBD
Matiére:
  - "[[Python pour le Big Data]]"
Date: 2025-04-27
Status: Finis
Pourcentage: "0.85"
Note: 17
Note maximale: 20
Overall: "0.638"
---
[https://www.lrde.epita.fr/~ricou/#PYBD projet 2025](https://www.lrde.epita.fr/~ricou/#PYBD%20projet%202025)
  
```Bash
sudo lsof -i :5432
```
```Bash
sudo kill -9 <PID>
```
```SQL
SELECT DISTINCT * FROM daystocks WHERE cid = 35 AND date BETWEEN '06/01/2020' AND '06/30/2020'
```
  
### To Dos
- [ ]
  
## Outils
- [TimescaleDB](https://docs.timescale.com/) pour stocker les valeurs nettoyées.
    
    ==timescaledb_model.py. Ne pas modifier !==
    
- [Dash](https://dash.plotly.com/) pour l'interface graphique et quelques extension (voir requirement.txt)
- Panda-TA pour les chandeliers (japonais)
# To Dos
- [ ] Importer les donnees
- [ ] Netoyer les donnees
    - [ ] Gerer les doublons
    - [ ] Virer les trous
- [ ] Afficher le cours d'une action en échelle logarithmique avec une ligne ou avec des chandeliers (l'utilisateur doit pouvoir choisir). On doit pouvoir choisir le début et la fin de la période que l'on désire afficher.
- [ ]  
    • on doit pouvoir choisir plusieurs actions pour afficher leurs cours comme ci-dessus mais avec une couleur par action (pensez à la légende qui permet de désélectionner un cours)
  
[[PYBD]]