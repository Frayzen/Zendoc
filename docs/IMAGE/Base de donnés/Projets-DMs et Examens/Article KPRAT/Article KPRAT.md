---
title: Article KPRAT
Matiére:
  - "[[Étude de cas pratique en image et Rdf]]"
Date: 2025-06-17
Status: Finis
Pourcentage: "0.65"
Note: 13
Note maximale: 20
Overall: "0.65"
---
![[007.pdf]]

![[instructions_KPRAT_2025_(1).pdf]]

  

> Cet article s’intéresse à l’interpolation d’images pour les vidéos d’animation, un sujet encore peu exploré dans la littérature, contrairement aux vidéos naturelles.
### Pourquoi les méthodes classiques ne marchent pas bien ?
- Elles sont entraînées sur des vidéos **naturelles**, à **haute fréquence d’images**.
- Dans les dessins animés :
    - Il y a **peu d’images par seconde** (images "copiées/collées").
    - Les mouvements sont souvent **non linéaires et stylisé** (pas fluides ni réguliers).
- Du coup, les algorithmes traditionnels produisent des résultats **flous ou déformés**.
### **Comment l’article résout ce problème ?**
Il propose **deux idées complémentaires** :
1. **AutoFI**
    
    👉 Génère automatiquement des **séquences d’entraînement synthétiques réalistes** à partir de dessins animés.
    
    ✅ Résout le manque de données adaptées.
    
2. **SktFI**
    
    👉 Un module qui **corrige les erreurs** dans l’image interpolée, à l’aide d’une **esquisse** dessinée par l’utilisateur.
    
    ✅ Permet de rattraper les défauts dans les zones complexes (mouvements rapides, occlusions...).
    
## **Résultats expérimentaux**
Les auteurs comparent leurs méthodes **AutoFI** et **SktFI** avec plusieurs autres méthodes connues :
BMBC, AdaCoF, DAIN (vidéos naturelles), ANIN (animation manuelle).
Ils utilisent 3 indicateurs de qualité :
- **PSNR** : plus c’est haut, mieux c’est.
- **SSIM** : mesure la similarité structurelle.
- **LPIPS** : mesure la qualité perçue (plus c’est bas, mieux c’est).
### Résultats chiffrés :
|   |   |   |   |
|---|---|---|---|
|Méthode|PSNR ↑|SSIM ↑|LPIPS ↓|
|ANIN (existant)|29.28|0.9275|0.1036|
|**AutoFI-anin**|**30.10**|**0.9334**|**0.0646**|
|**SktFI-anin**|**32.22**|**0.9502**|**0.0486**|
👉 **AutoFI** fait mieux que ANIN de **+0.82 dB en PSNR**, ce qui est un vrai progrès.
👉 **SktFI**, en plus, améliore encore les images en les rendant plus nettes et réalistes.
### Visualisation :
Les images produites avec AutoFI + SktFI sont :
- plus **nettes**,
- les formes sont **plus fidèles**,
- les détails sont **mieux restaurés** (grâce à l’esquisse dans SktFI).
---
## **1. Générer un dataset d’animation réaliste**
**Objectif** : créer automatiquement des triplets d’images animées (avant - milieu - après) pour entraîner des modèles d’interpolation.
**Comment ?**
- On part d’un **film d’animation existant** (ex. : _Le Voyage de Chihiro_).
- On **extrait des images isolées**, sans avoir besoin qu’elles soient consécutives.
- À partir de ces images, AutoFI **synthétise de fausses séquences animées** réalistes (comme si l’objet bougeait naturellement dans le temps).
👉 Résultat : un **jeu de données d’entraînement énorme** et adapté à l’animation, **sans dessiner à la main**.
---
## **2. Mouvement & composition des images**
AutoFI construit chaque image **en couches**, un peu comme dans Photoshop :
- **1 couche de fond** (background)
- **1 ou plusieurs couches d’objet(s)** avec un **masque** (forme aléatoire)
Ensuite :
- Chaque objet **se déplace** de manière contrôlée, grâce à un **champ de mouvement simulé** (homographie = zoom, rotation, déplacement...).
- On applique un **flou léger** sur les objets et les masques pour que les images aient l’air naturelles.
- Les couches sont **combinées (composées)** pour créer trois images (début, milieu, fin) avec un mouvement **linéaire** réaliste.
---
## **But de SktFI (pourquoi ça existe)**
Même avec un bon modèle d’interpolation (comme ceux entraînés avec AutoFI), il y a des cas où **le résultat est flou, imprécis ou faux** :
- Quand il y a un **grand mouvement** entre les images,
- Quand il y a une **occlusion** (quelque chose qui cache une partie de l’image),
- Ou quand la scène a **beaucoup de détails**.
👉 Pour ces cas-là, les auteurs ont inventé **SktFI**, un **module de correction**.
Il permet à un **utilisateur (ou un algorithme)** de donner une **esquisse** de l’image intermédiaire — une sorte de **contour simplifié**.
---
## ✏️ **Ce que SktFI reçoit comme entrée**
SktFI prend **4 éléments** :
1. I$_1$ – l’image du début
2. $I_3$ – l’image de fin
3. $\hat{I}_2$ – l’image interpolée (faite par un autre modèle, comme ANIN ou DAIN)
4. $S_2$ – l’**esquisse** de l’image intermédiaire (faite par l’utilisateur ou générée automatiquement)
---
## **Comment ça marche (étapes internes)**
### 1. **Extraction de caractéristiques**
Il extrait les **informations visuelles** (contours, textures, formes) à partir des 4 images :
$I_1, I_3, \hat{I}_2, S_2$
### 2. **Corrélation**
Il compare ces caractéristiques entre elles pour comprendre **comment les pixels sont liés** entre les images.
Ça permet de savoir **où chaque élément de l’esquisse devrait apparaître**.
### 3. **Flux optique inversé (backward flow)**
Le réseau estime **comment revenir en arrière** depuis le temps t = 2 vers t = 1 et t = 3.
C’est comme si on “recalait” les infos du début et de la fin **vers le milieu**, guidé par le sketch.
### 4. **Recalage (warping)**
On **déforme** les images I1 et I3 (et même l’image interpolée) pour qu’elles **correspondent à l’esquisse**.
### 5. **Fusion / Synthèse**
Toutes les images recalées sont **fusionnées** pour générer une **image corrigée I~2\tilde{I}_2**, plus nette, avec de **meilleures formes**, respectant **les contours dessinés dans l’esquisse**.
---
## ✅ **Résultat :**
On obtient une image intermédiaire :
- plus précise (meilleure forme),
- plus nette (moins floue),
- plus cohérente (meilleures structures).
---
## 🧠 En résumé
Tu peux retenir :

> SktFI permet de corriger les erreurs d’interpolation en utilisant une esquisse de l’image intermédiaire comme guide.
> 
> Il utilise des outils classiques du deep learning (features, warping, fusion) pour produire une image **visuellement plus fidèle**, surtout utile dans les **dessins animés où les formes stylisées sont importantes**.
Souhaites-tu que je reformule ça sous forme de texte court à mettre dans ta slide + notes orales ?
---
## 🚀 Pourquoi leur solution est meilleure ?
|   |   |   |
|---|---|---|
|Problème|Solutions existantes|AutoFI + SktFI|
|Données mal adaptées|Datasets naturels|Données synthétiques adaptées à l’animation|
|Hypothèse de mouvement|Supposent linéarité|Respectent cette hypothèse via génération|
|Zones complexes (occlusion)|Modèles flous|Correction fine via esquisse utilisateur|
|Qualité perceptuelle|Moyenne|Plus nette, contours mieux restaurés|
👉 **Conclusion finale** :

> L’approche AutoFI + SktFI dépasse les méthodes existantes en s’adaptant mieux à l’univers de l’animation, en corrigeant intelligemment les erreurs, et en produisant des résultats de meilleure qualité visuelle.
## 🧾 **Conclusion (simple)**
Les auteurs montrent que :
- Il est **difficile d’appliquer les méthodes classiques** à l’animation.
- Leur méthode **AutoFI** permet d’entraîner les modèles avec de **meilleures données synthétiques**.
- Leur module **SktFI** permet de **corriger les erreurs** dans les images intermédiaires.
En combinant les deux :

> On obtient une interpolation plus fluide, plus précise, et visuellement plus agréable, même dans les zones difficiles.
---
## 🔮 **Perspectives (futures directions)**
1. **Production assistée** :
    - Ces outils pourraient être intégrés dans des logiciels pour aider les **studios d’animation** à générer automatiquement des images "in-between".
2. **Utilisation des esquisses réelles** :
    - SktFI pourrait être utilisé avec de **vraies esquisses de dessinateurs**, et non générées automatiquement.
3. **Extension à d'autres styles visuels** :
    - Adapter AutoFI/SktFI à différents types d’animation : 3D stylisée, anime, rotoscopie...
---