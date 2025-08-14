---
title: Benchmark
---

### Objectifs
- Comparer les performances du filtre en **CPU** vs **GPU**.
- Identifier les **goulots d’étranglement** avec **Nsight Systems** ou **nvprof**.
- Générer des **graphiques** et une **analyse commentée** pour le rapport final et la soutenance.
---
### Plan de Benchmark
### Procédure
- Lancer chaque version avec la même vidéo d’entrée
- Faire varier les **paramètres** (`opening_size`, `th_low`, `th_high`) et comparer.
- Observer les FPS
### Collecte des données
Créer un tableau :
|   |   |   |   |   |
|---|---|---|---|---|
|Version|FPS moyen|Taille ouverture|Seuils|Remarques|
|CPU|||||
|GPU|||||
|GPU (opt1)|||||
|GPU (opt2)|||||
### Graphiques à produire
- **Courbe FPS vs Taille ouverture**
- **Histogramme CPU vs GPU**
- **Comparaison avant/après optimisation**
---
### Plan d’Analyse de Performance
### Outils à utiliser
- [Nsight Systems](https://developer.nvidia.com/nsight-systems) — Vue d’ensemble
- [Nsight Compute](https://developer.nvidia.com/nsight-compute) — Analyse fine
- `nvprof` — (outil plus ancien mais rapide à utiliser)
### Étapes
1. Profiler l’exécution du filtre CUDA :
    
    ```Shell
    nsys profile --trace=cuda,nvtx -o rapport_profil \
      gst-launch-1.0 uridecodebin uri=file://$(pwd)/video03.avi ! videoconvert ! \
      "video/x-raw, format=(string)RGB" ! cudafilter ! videoconvert ! \
      fpsdisplaysink video-sink=fakesink sync=false
    ```
    
2. Identifier :
    - Durée des kernels CUDA
    - Occupation du GPU
    - Transferts mémoire entre CPU/GPU
3. Si besoin, ajouter des **annotations NVTX** dans le code :
    
    ```C++
    nvtxRangePush("Debut filtre");
    // traitement CUDA
    nvtxRangePop();
    ```
    
### Résultats à documenter
- Captures d’écran des profils (timeline, kernel activity)
- Tableaux de mesures clés (durée, transfert mémoire, etc.)
- Explication des optimisations testées et de leur impact
---
### Notes complémentaires
- Créer des **tags Git** pour chaque version testée : `v0-cpu`, `v1-gpu`, `v2-gpu-optim`
- Noter les **paramètres de compilation** utilisés (Release/Debug, archi CUDA)
- Tester sur plusieurs tailles de vidéo pour voir la **scalabilité**
- Tous les benchmarks doivent être **reproductibles** (documenter les commandes exactes)
  
---
## Analyse de performance - Détail des outils
  
- **Nsight Systems** : vue globale (timings, threads, synchronisation)
    
    ### Lancement avec Nsight Systems
    
    ```Shell
    nsys profile --trace=cuda,nvtx,osrt -o profile_nsys \
      gst-launch-1.0 uridecodebin uri=file://$(pwd)/video03.avi ! videoconvert ! \
      "video/x-raw, format=(string)RGB" ! cudafilter ! videoconvert ! \
      fpsdisplaysink video-sink=fakesink sync=false
    ```
    
      
    
- **Nsight Compute** : analyse des kernels CUDA (occupation, mémoire, instructions)
    
    ### Lancement avec Nsight Compute (kernel spécifique)
    
    1. Repérer le nom du kernel avec Nsight Systems ou `nvprof`
    2. Lancer Nsight Compute :
    
    ```Shell
    ncu --kernel-name <nom_kernel> --launch-count 1 \
      gst-launch-1.0 uridecodebin uri=file://$(pwd)/video03.avi ! videoconvert ! \
      "video/x-raw, format=(string)RGB" ! cudafilter ! videoconvert ! \
      fpsdisplaysink video-sink=fakesink sync=false
    ```
    
### Ce qu’on cherche :
- Quels kernels prennent le plus de temps ?
- Le GPU est-il **pleinement occupé** ?
- Y a-t-il des **délais de synchronisation** ?
- Les transferts **CPU ↔ GPU** sont-ils un goulot d’étranglement ?
- L'utilisation de **shared memory** ou **coalesced memory access** est-elle optimale ?
### A faire
- Annoter le code CUDA avec `nvtxRangePush/Pop` :
```C++
nvtxRangePush("Debut traitement");
<<<kernel>>>();
nvtxRangePop();
```
- Regarder les “CUDA Streams” pour voir si les traitements peuvent être parallélisés.
---
### Analyse avec `nvprof`
  
`nvprof` est un profiler en ligne de commande simple et rapide pour identifier :
- Les fonctions CUDA appelées
- Leur durée d'exécution
- Les transferts mémoire
### Commande de base
```Shell
nvprof gst-launch-1.0 uridecodebin uri=file://$(pwd)/video03.avi ! videoconvert ! \ 
  "video/x-raw, format=(string)RGB" ! cudafilter ! videoconvert ! \
  fpsdisplaysink video-sink=fakesink sync=false
```
### Exemple de sortie
```Plain
==12345== Profiling application: gst-launch-1.0 ...
==12345== Profiling result:
Time(%)  Time     Calls  Avg     Min     Max  Name
 60.00%  30.00ms     10  3.00ms  2.9ms  3.1ms  kernel_reconstruction
 30.00%  15.00ms      5  3.00ms  2.5ms  3.5ms  cudaMemcpy
```
### Ce qu'on cherche :
- Temps total passé dans les **kernels**
- Temps passé dans les **transferts mémoire**
- Répétitions inutiles de calcul
- Comparer CPU vs GPU : le GPU accélère-t-il réellement le traitement ?
---