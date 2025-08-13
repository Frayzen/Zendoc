---
Matiére:
  - "[[Introduction aux Réseaux de Neuronnes]]"
Date: 2025-06-02
Status: Finis
Pourcentage: "0.5"
Note: 10
Note maximale: 20
Overall: "0.5"
---
[https://www.ricou.eu.org/iren/notes_rn.html](https://www.ricou.eu.org/iren/notes_rn.html)
  
## Projet navires 2025
Il s'agit de faire un réseau de neurones convolutifs qui classe le mieux possible des images de navire. La précision des réseaux donne la note de base. Cette note peut être modifiée par la qualité des documents rendues.
## Les données
Les images rangées par catégories dans des sous-répertoires. Un fichier contient les images a évaluer pour être noté.
Il vous appartient de séparer les images du répertoire en 3 groupes :
- les images d'entrainement
- les images de validation
- les images de test
Vous pouvez aussi ne faire que deux groupe et considérer que le test est les données que vous soumettez à Kaggle.
## La compétition Kaggle
Aller sur ce lien pour entrer dans la compétition : [Competition](https://www.kaggle.com/t/c46f7039abda4161aa8cdf45dab7c20a)
Faire `New Notebook` depuis l'onglet `Code` pour avoir les données chargées.
- Écrire un CNN à la main en moins de 30 couches (ayez `print("Nombre de couches : ", len(model.layers))` dans votre feuille, je ferai un grep dessus).
- Soumettre ses résultats.
- Regarder son classement (et éventuellement recommencer)
Cette feuille devrait vous aider : [https://www.lrde.epita.fr/~ricou/iren/skeleton-ships25.html](https://www.lrde.epita.fr/~ricou/iren/skeleton-ships25.html)
## Rendu
Le projet peut être fait en binôme ou seul. **Indiquez votre groupe seul ou à deux [ici](https://moodle.epita.fr/mod/groupselect/view.php?id=62090). Utilisez le même nom de groupe pour Kaggle**. J'ai un script qui attribue un classement à chaque élève en fonction de son groupe sur Kaggle et Moodle. Si cela ne marche pas pour vous, vous perdez des points.
Les feuilles Jupyter que vous rendez doivent être agréables à lire avec des commentaires, une mise en page et riches avec une analyse complète de vos résultats (score, courbes de convergence, matrice de confusion...).
**Le rendu est début juin** (cf Kaggle) :
- Soumettre ses résultats pour apparaître dans les classments
- **Partager** sa feuille Jupyter avec [moi](https://www.kaggle.com/oricou) **sur Kaggle** avec
    - comme nom des feuilles : `nom du groupe` – `nom compétition`
    - dans la première cellule le nom du ou des auteurs.
  
## Trucs et astuces pour le projet
## Lecture des données
Lorsque les images sont rangées dans des sous-répertoires portant le type de navire, alors on peut utiliser [image_dataset_from_directory](https://keras.io/api/data_loading/image/) pour charger les données et avoir la vérité terrain en même temps.
## Création du réseau
Quelle forme donner à mon réseau ?
1. Je teste et je le fais évoluer en ajoutant des couches, en changeant les fonctions d'activation, en ajoutant des nouveaux types de couches. C'est bien pour apprendre mais on met du temps à arriver à un bon réseau. Je conseille quand même de commencer par là car à copier directement les bon on ne comprends pas les raisons de leurs choix.
2. Copier ce qui a été fait pour les autres
Parmi les types de couches
- les convolutions permettent d'extraire les caractéristiques des images. On peut changer la taille de la fenêtre de convolution (3x3 est classique). On peut enchaîner les convolutions ce qui étant la zone prise en compte pour un point.
- les couches denses servent au classement. Plus il y a de couches dense et plus il est possible de découvrir les non linéarités (mais 3 couches doivent largement suffire pour notre problème).
- les couches qui réduisent la taille des images pour limiter la taille du réseau (MaxPooling)
- les couches qui amérliorent la convergence à l'entrainement
    - Dropout annule certains poids lors de l'entrainement ce qui stabilise le système en répartissant mieux l'apprentissage sur les noeuds (on ne peut pas compter sur un seul noeud)
    - BatchNormalization normalise les données et si c'est bon à l'entrée du réseau, c'est aussi bon dans le réseau. Il y a un débat s'il faut normaliser avant la fonction d'activation ou après mais après semble l'emporter. L'article initial dit que la normalisation permet de se passer de Dropout
    - Regularisation permet d'ajouter un poid localement à la fonction d'erreur pour garantir que certains poids ne vont pas devenir trop gros et donc prépondérant. Là encore l'idée est de répartir l'apprentissage sur plusieurs noeuds.
### Copier les autres
Il est possible de lire des articles et de refaire leur réseau. On peut aussi utiliser les [réseaux existants dans Keras](https://keras.io/applications/). Cette page explique bien comment faire et en particulier comment transférer l'expérience d'un réseau entrainé sur un jeu de données à vos données (on regardera en détail la section _Fine-tune InceptionV3 on a new set of classes_).
## Entrainement
Ce qui aide à la convergence du réseau :
- Augmenter les données (cf example MNIST cité dans mon noyau MNIST)
- Mettre des couches de stabilisation (cf ci-dessus)
- Avoir un taux d'apprentissage assez bas (si vous convergez puis divergez, alors baissez le taux d'apprentissage).
- Avoir de bons poids initiaux (pas de reccette mais une graine (seed) fixée permet de reproduire le même réseau)
### Le danger du sur-apprentissage
Regardez le nombre d'images de votre jeu de données et le nombre de degré de liberté de votre réseau. Peut-il apprendre par coeur la catégorie de chaque image ? Si oui alors il y a un risque de sur-apprentissage.
Dans la courbe de convergence on note le sur-apprentissage lorsqu'on continue de converger sur les données d'entrainement mais qu'on ne converge plus sur les données de validation. Pour éviter cela on peut mettre une alerte qui arrête l'entrainement, il s'agit d'[EarlyStopping](https://keras.io/callbacks/) dans Keras.
```Plain
early_stopping = EarlyStopping(monitor='val_loss', patience=2, verbose=2, mode='auto')
model.fit( X_train, Y_train, nb_epoch=50, batch_size=32, callbacks = [early_stopping])
```
## Analyse des résultats
La première chose à regarder est la **courbe de convergence** tant sur les données d'apprentisage que sur les données de validation. Le risque est le sur-apprentissage. Si tout va bien peut-être qu'on peut faire quelques époques de plus pour améliorer les résultats.
Il est bien de **regarder les cas qui n'ont pas marché**. Peut-être que vous verrez quelque chose qui permettra de corriger le réseau pour l'améliorer (difficile).
On peut aussi faire des statistiques sur les résultats avec une **matrice de confusion**. On peut imaginer un post-traitement pour corriger le tir comme un second réseau neuronal spécialisé pour certains cas.
### C'est vraiment bon
J'ai de super résultat, 99%, je suis génial ! C'est possible, il est aussi possible qu'il s'agit d'un problème vraiment simple ou qu'il y ait un truc bizarre.
Pour savoir si c'est simple, il faut regarder l'état de l'art.
Si c'est suspect alors il faut analyser le résultats. Le premier risque est que les données de test aient un lien avec les données d'apprentissage qui fausse le problème :
- les données du jeu de test sont aussi dans le jeu d'apprentissage !
- les catégories viennent de différentes sources qui n'ont pas généré les données de la même facon (toutes les images de la catégorie 1 sont plus claire, ont été compressées par un autre algo, ont un cadre, on été faites le même jour donc même météo...)
- il existe des indices que le réseau voit mais qui ne sont pas ce qu'on cherche (cela peut être intéressant parfois)