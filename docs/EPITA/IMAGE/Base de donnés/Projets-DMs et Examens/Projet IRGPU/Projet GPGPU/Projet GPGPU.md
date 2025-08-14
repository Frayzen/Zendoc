---
title: Projet GPGPU
---
# Description du sujet
## Approche Générale
Le système repose sur une **chaîne de traitement vidéo** visant à détecter les zones en mouvement par rapport à un fond statique ou estimé. Ce processus est divisé en plusieurs étapes successives et complémentaires :
### 1. Acquisition de l'image
Chaque **frame** de la vidéo est récupérée avec ses métadonnées temporelles. C’est l’entrée principale du plugin.
### 2. Estimation du fond (Background Estimation)
Un **modèle de fond** est généré ou mis à jour dynamiquement à partir des images passées, permettant d’avoir une référence stable pour détecter les changements.
[[Étape 1- Estimation du Fond (Background Estimation)]]

### 3. Génération du masque de mouvement
En comparant la frame courante au fond, un **masque de mouvement brut** est calculé, indiquant les pixels suspects de changement.
### 4. Nettoyage du masque (Mask Cleaning)
Ce masque est ensuite **filtré et raffiné** pour supprimer le bruit, combler les trous et lisser les contours à l’aide de techniques comme :
- ouverture morphologique
- seuillage d’hystérésis
[[Étape 2 - Nettoyage du Masque (Mask Cleaning)]]

### 5. Détection d’alerte
Une étape d’analyse permet de **déterminer si un événement significatif** est détecté, sur la base de la quantité ou distribution du mouvement.
### 6. Production de la sortie
Le système émet en sortie une **frame annotée** et un **masque propre** indiquant les objets en mouvement. Ces données peuvent être utilisées dans des systèmes de surveillance, de vision intelligente, ou comme prétraitement.
---
# Benchmark
[[Benchmark]]

---
  
  
[[Brouillon]]


> [!info] NVIDIA Nsight Systems  
> Link to section &#039;NVIDIA Nsight Systems&#039; of &#039;NVIDIA Nsight Systems&#039; NVIDIA Nsight Systems Link to section &#039;Table of Contents&#039; of &#039;NVIDIA Nsig.  
> [https://www.rcac.purdue.edu/knowledge/profilers/nvidia_nsight_systems?utm_source=chatgpt.com](https://www.rcac.purdue.edu/knowledge/profilers/nvidia_nsight_systems?utm_source=chatgpt.com)  
On lance avec:
`--trace=cuda,nvtx` – Specify tracing for CUDA, NVTX runtime
  
The `nsys stats` command can be used post analysis to generate specific or personalized  
reports. For a default fixed set of summary statistics to be automatically generated, you can use the `--stats` option with the `nsys profile` or `nsys start` command to generate a fixed set of useful summary statistics.
  
La dénomination des ressources NVTX **permet**  
**d'associer des noms personnalisés aux threads du système d'exploitation**  
**hôte et aux ressources CUDA telles que les périphériques, les contextes**  
**et les flux** . Les noms attribués via NVTX sont affichés par NVIDIA Nsight
