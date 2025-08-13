---
title: Introduction - Architectures GPU
Matière:
  - "[[Implémentation Rapide GPGPU]]"
Type: Cours
Date du cours: 2025-03-19
Supports:
  - "[[j1-part1-history.slides.pdf]]"
  - "[[j1-part2-forms_of_parallelism.slides.pdf]]"
  - "[[j1-part3-gpu_vs_cpu_parallelism.slides.pdf]]"
  - "[[j1-part4-gpu_programming_model.slides.pdf]]"
---
# Histoire des GPU
  
## Introduction
Les GPU (Graphics Processing Units) ont évolué des processeurs graphiques des années 1970 à des unités de calcul parallèle puissantes, utilisées dans le gaming, la simulation scientifique, l'apprentissage profond, etc.
  
---
  
## Pourquoi Utiliser les GPU ?
  
![[image 91.png|image 91.png]]

### 1. **Développement Mobile : Optimisation de l'Énergie**
- Les GPU sont plus efficaces que les CPU pour les tâches graphiques et parallèles.
- Réduit la consommation d'énergie, crucial pour l'autonomie des smartphones.
- **Exemple** : Jeux mobiles où le GPU gère les calculs graphiques, laissant le CPU inactif.
![[image 1 24.png|image 1 24.png]]

### 2. **Big Data : Traitement de Données Massives**
- Les GPU traitent des milliers de threads simultanément, idéal pour les grands ensembles de données.
- **Exemple** : Algorithmes de machine learning (TensorFlow, PyTorch) optimisés pour GPU.
### 3. **Calcul en Temps Réel : Réponse Rapide**
- Les GPU doivent fournir des résultats dans un temps limité.
- **Exemple** : Jeux vidéo (calcul de frames), conduite autonome (traitement des capteurs en temps réel).
  
---
## Les Origines des GPU (Années 1970)
  
### Ikonas RDS-3000
- Premier GPU pour la synthèse d'images.
- Développé par Ikonas Graphics Systems (N. England & M. Whitton).
- **Tim Van Hook** : Microcode pour le ray tracing (SIGGRAPH '86).
  
---
## L'Émergence des GPGPU (1999-2001)
  
### Premiers GPU Programmables
- **Vertex Shaders** : Transformations de vertex en virgule flottante 32 bits.
- **Texturage Configurable** : Combinateurs de registres.
![[ikonas.mp4]]

### Applications Précoces
- **Hoff (1999)** : Diagrammes de Voronoi sur NVIDIA TNT2.
- **Larsen & McAllister (2001)** : Multiplication de matrices (8 bits).
- **Rumpf & Strzodka (2001)** : Résolution d'EDP (diffusion, segmentation d'images).
  
### GeForce 3 (2001)
- Introduit les **shaders programmables**.
- **Vertex Shaders** : Transformations de vertex.
- **Pixel Shaders** : Effets de texture et éclairage réalistes.
- **Impact** : Base pour les GPU programmables modernes.
![[738-front.jpg]]

  
---
## L'Ère de la Virgule Flottante (2003)
  
### GeForce FX
- Premier GPU avec calcul en **virgule flottante**.
- **Ray Tracing** : Lancé par Purcell (2002).
- **Radiosité** : Calculs d'éclairage global (Carr et al., 2003).
- **Simulations Physiques** : Fluides, nuages, tissus, cristaux de glace.
- **FFT** : Transformée de Fourier rapide (Moreland et Angel, 2003).
- **Brook for GPUs** : Langage de haut niveau (Buck et al., 2004).
![[s-l1200.jpg]]

  
---
## L'Explosion du GPGPU (2006)
### Architecture NVIDIA G80
- Conçue pour le calcul parallèle.
- **Mode de Calcul Dédié** : Threads indépendants.
- **Architecture Mémoire Générale** : Byte-adressable.
### CUDA
- Plateforme de programmation pour C/C++.
- Rend les GPU accessibles pour le calcul scientifique et industriel.
---
## Les Années 2010 : Calcul Haute Performance (HPC)
### Recherche Scientifique
- **Simulation du Virus HIV** : Première simulation atomique complète avec 3 000 GPU Tesla.
- **Centres de Données** : Adoption dans le pétrole, la finance, l'éducation.
### Apprentissage Profond
- Les GPU accélèrent l'entraînement des réseaux de neurones.
- **Impact** : Rendu obsolètes certaines méthodes traditionnelles de traitement d'images.
  
---
## Systèmes Embarqués et Temps Réel
- **Contraintes** : Temps réel et consommation d'énergie.
- **Exemple** : Étiquetage de scènes avec apprentissage hiérarchique (Farabet et al., 2013).
![[image 2 24.png|image 2 24.png]]

  
---
## Conclusion
Les GPU ont révolutionné le calcul parallèle, passant du rendu graphique à des applications scientifiques et industrielles. Leur évolution continue de repousser les limites de la performance et de l'efficacité énergétique.
---
  
  
# La Programmation Parallèle
  
  
## **Fifty Shades of Parallelism**
  
### 🏃‍♂️ Comment exécuter plus rapidement un programme ?
  
Il existe plusieurs manières d’accélérer un programme :
1. **Faire moins de travail** (optimisation des algorithmes et suppression des calculs inutiles).
2. **Faire mieux un travail donné** (en optimisant les structures de données et en ciblant les parties les plus coûteuses en temps).
3. **Effectuer plusieurs tâches en parallèle** (exploiter le parallélisme).
4. **Distribuer le travail sur plusieurs unités de calcul** (utilisation efficace des ressources matérielles).
  
⚡ **Enjeux du parallélisme :**
Avec la fin de la **loi de Moore**, les processeurs n’augmentent plus aussi vite en puissance, d’où la nécessité d’exploiter des architectures parallèles.
Les processeurs deviennent intelligents :
- Exécution hors service / renommage dynamique des registres
- Exécution spéculative avec prédiction de branchement
Les processeurs deviennent super-scalaires :
- pendant que la fréquence d'horloge du processeur est limitée…
- … la quantité de données à traiter a explosé !
Il nous faut une autre façon de concevoir la « vitesse ».
![[image 3 21.png|image 3 21.png]]

![[image 4 20.png|image 4 20.png]]

  
---
## **Exemple : La chaîne de montage des burgers 🍔**
  
Un bon exemple de parallélisme est une chaîne de production de sandwiches :
- **Optimisation de la latence** : minimiser le temps nécessaire pour produire **un seul** sandwich.
- **Optimisation du débit** : maximiser le nombre de sandwiches produits par unité de temps.
### 📌 **Deux types d'optimisation :**
1. **Latence** (MIMD collaboratif) : plusieurs personnes travaillent **ensemble** sur le même sandwich.
    
    ![[image 5 20.png|image 5 20.png]]

    
2. **Débit** (MIMD horizontal) : chaque personne fait son propre sandwich.
    
    ![[image 6 19.png|image 6 19.png]]

    
🔎 **Illustration avec différentes formes de parallélisme :**
- **Pipeline (MIMD vertical)** : chaque travailleur exécute une étape spécifique de la préparation en séquence.
    
    ![[image 7 18.png|image 7 18.png]]

    
- **SIMD (DLP - Data Level Parallelism)** : un travailleur avec plusieurs bras fait plusieurs sandwiches simultanément.
    
    ![[image 8 16.png|image 8 16.png]]

    

> [!important] Temps pour faire 1 sandwitch : $\frac{s}{4}$ (400% de speed-up)
  
---
## **Évolution des processeurs : Vers plus de cœurs**
  
L'évolution des processeurs suit une tendance :
- **Baisse de la fréquence d’horloge**.
- **Augmentation du nombre de cœurs**.
- **Utilisation d’instructions vectorielles (SIMD)**.
**Exemple d’évolution des processeurs Intel Xeon** :
![[image 9 16.png|image 9 16.png]]

![[image 10 15.png|image 10 15.png]]

**Tendance clé** :
- **Performance unitaire en baisse** (les cœurs sont moins rapides individuellement).
- **Performance globale en hausse** (grâce à l’augmentation du nombre de cœurs).
  
---
  
## **Comparaison CPU vs GPU**
  
![[image 11 14.png|image 11 14.png]]

- **Les CPU** sont optimisés pour la **latence** (exécution rapide de tâches séquentielles).
- **Les GPU** sont optimisés pour le **débit** (exécution massive de tâches parallèles).
### **Exemple d’application :**
Dans le calcul scientifique, on combine souvent **CPU et GPU** pour exploiter les avantages des deux architectures.
  
---
  
## **Vers des architectures hétérogènes (CPU + GPU)**
  
Un bon équilibre entre CPU et GPU est nécessaire pour maximiser les performances. On utilise :
1. **Le CPU pour les tâches séquentielles** (optimisé pour la latence).
2. **Le GPU pour les tâches massivement parallèles** (optimisé pour le débit).
### **Loi d’Amdahl** :
Le gain maximal obtenu avec un programme parallèle dépend de la fraction **P** du code qui est parallélisable.
Le speed-up pour $N$ processeurs :
$S = \frac{t_\text{old}}{t_\text{new}} = \frac{1}{(1 - P) + \frac{P}{N}}$
- $(1-P)$ : Temps pour faire tourner la partie ==**séquentielle**==
- $P/N$ : Temps pour faire tourner la partie ==**parallèle**==
Exemple avec $P = 80%$ (80% du code parallélisable) :
- **Si** $N → ∞$ **(cœurs infinis)**, le **speedup maximal** est **5x**.
- **Si** $N = 4$, le **speedup est limité** par la partie séquentielle restante.
![[image 12 14.png|image 12 14.png]]

### Optimisé pour la Latence - Multi-coeur CPU
👎 Mauvaises performances sur les portions parallèles
![[image 13 14.png|image 13 14.png]]

### Optimisé pour le débit - GPU
👎 Mauvaises performances sur les portions parallèles
![[image 14 14.png|image 14 14.png]]

### Hétérogène - CPU + GPU
👍 Utilisez le bon outil pour chaque tâche.
👍 Permet une optimisation agressive de la latence ou du débit.
![[image 15 14.png|image 15 14.png]]

### **Conclusion :**
Une approche hybride **CPU + GPU** permet d'optimiser à la fois la latence et le débit.
  
---
## **Résumé**
  
- **Le parallélisme est essentiel** pour compenser les limites des CPU modernes.
- **Différentes formes de parallélisme existent** (MIMD, SIMD, pipeline, etc.).
- **Les CPU et GPU sont complémentaires** : les CPU gèrent bien les tâches séquentielles, tandis que les GPU excellent dans le traitement parallèle.
- **Les architectures hétérogènes (CPU + GPU) sont l’avenir** pour maximiser la performance.
  
---
  
  
# Architecture CPU vs GPU
  
## Introduction
Les GPU (Graphics Processing Units) et CPU (Central Processing Units) sont conçus pour des tâches différentes, ce qui se reflète dans leurs architectures. Ce cours explore ces différences, en mettant l'accent sur le parallélisme massif des GPU et le concept clé des **warps**.
  
---
## Architectures CPU vs GPU : Philosophie de Conception
  
### CPU : Low-Latency
![[image 16 14.png|image 16 14.png]]

- **Optimisé pour** : Exécution rapide de tâches séquentielles complexes
- **Caractéristiques clés** :
    - Moins d'unités de calcul (ALU) mais très performantes
    - Hiérarchie de mémoire complexe (caches L1/L2/L3)
    - Logique de contrôle sophistiquée :
        - Exécution spéculative
        - Exécution "out-of-order"
==**Exemple :**== ==Intel i7 (8 ALUs, 4 cœurs physiques)==
### GPU : High-Throughput
![[image 17 14.png|image 17 14.png]]

- **Optimisé pour** : Traitement parallèle massif de données
- **Caractéristiques clés** :
    - Centaines d'ALUs simples
    - Mémoire globale partagée (moins de caches)
    - Tolérance à la latence mémoire via le parallélisme
==**Exemple :**== ==NVIDIA Kepler (128 cœurs CUDA, 16 multiprocesseurs)==

> [!important]
> 
> ### **Analogie** :
> 
> Le CPU est comme un chef étoilé préparant des plats complexes un par un.
> 
> Le GPU est comme une cantine scolaire produisant des milliers de repas simples en parallèle.
  
  
---
## Warps : Coeur du Modèle de Parallélisme des GPU
  
### Définition
Un **warp** est un groupe de 32 threads (sur NVIDIA) qui s'exécutent **en lockstep** (même instruction simultanément sur différentes données).
### Fonctionnement
- **SIMT (Single Instruction Multiple Threads)** :
    - Tous les threads d'un warp exécutent la même instruction au même cycle
    - Si divergence (branchements conditionnels), les chemins sont sérialisés → "warp divergence"
- **Gestion des warps** :
    - Chaque SM (Streaming Multiprocessor) gère plusieurs warps simultanément
    - Switch entre warps gratuit (état sauvegardé dans registres)
### Exemple Pratique
```C++
// Exemple CUDA : addition de vecteurs
__global__ void add(float *A, float *B, float *C) {
    int i = threadIdx.x;
    C[i] = A[i] + B[i]; // Exécuté en parallèle par tous les threads du warp
}
```
_==→ 32 additions exécutées en parallèle si warp complet==_
  
  
---
## Dissimulation de Latence : Approche CPU vs GPU
  
### CPU : Approche Traditionnelle
![[image 18 14.png|image 18 14.png]]

CPU core
- **Stratégie** :
    - Cache hierarchy réduisant les accès mémoire
    - Multithreading avec coût de changement de contexte
- **Schéma** :_Coût élevé du changement de contexte_
    
    ```Plain
    Thread 1: [Exec][Stall][Switch] → Thread 2: [Exec][Stall][Switch]...
    ```
    
### GPU : Parallélisme Massif
![[image 19 14.png|image 19 14.png]]

GPU SMP (Streaming Multiprocessor)
- **Stratégie** :
    - Exécuter d'autres warps pendant les accès mémoire
    - Pipeline profond masquant la latence
- **Schéma** :_Aucun cycle processeur perdu_
    
    ```Plain
    Warp 1: [Query][Stall][Exec]
    Warp 2:       [Query][Stall][Exec]
    Warp 3:             [Query][Stall][Exec]
    ```
    
### **Loi de Little** :
Taux d'arrivée des clients : Débit
Temps passé par le client : Latence
La **concurrence** correspond au nombre d'éléments traités simultanément.
Nombre moyen de clients :
$\text{Concurrency} = \text{Throughput} × \text{Latency}$
→ Un GPU nécessite des milliers de threads actifs pour saturer sa bande passante.
![[image 20 13.png|image 20 13.png]]

![[image 21 12.png|image 21 12.png]]

  
  
---
## Formes de Parallélisme
  
### Parallélisme Vertical (Pipelining)
**Objectif** : Masquer la latence en superposant des étapes de traitement**Mécanisme** :
- Découpage des instructions en phases séquentielles (Fetch, Decode, Execute, Write-back)
**Spécificité GPU** : Appliqué aux warps :
- Quand un warp attend des données, un autre prend sa place immédiatement
- **Coût de changement** : 0 cycle (vs ~10-100 cycles sur CPU)
### Parallélisme Horizontal
**Objectif** : Augmenter le débit par duplication d'unités de calcul
**Exemple GPU** :
- 100s d'ALUs travaillant en parallèle
- **Throughput** = Nombre d'opérations/cycle × Fréquence
  
  
---
## Niveaux de Parallélisme
  
### Instruction-Level Parallelism (ILP)
**Définition** : Exécution simultanée d'instructions indépendantes
**Exemple Slide 14** :
```Plain
1. add r3 ← r1, r2  \\
2. mul r0 ← r0, r1   → Exécution parallèle possible
3. sub r1 ← r3, r0  /
```
### Comparaison Architecturale
|   |   |   |
|---|---|---|
|Type|CPU (Haswell)|GPU (Kepler)|
|**ILP** (Instruction)|8 instructions|2 instructions|
|**TLP** (Thread)|4c/8t (HyperThread)|16 SM × 64 warps|
|**DLP** (Data)|AVX (8×32b)|SIMT (32 threads/warp)|
### Détails Clés :
- **ILP** : Exécution superscalaire sur CPU vs limitée sur GPU
- **TLP** : Warps permettent des milliers de threads légers
- **DLP** : SIMD (CPU) vs SIMT (GPU - plus flexible)
**Implémentation** :
- CPU : Exécution superscalaire (Slide 18 : 8 instructions/cycle sur Haswell)
- GPU : Dual-issue limité (2 instructions/cycle sur Kepler)
### Thread-Level Parallelism (TLP)
**Définition** : Exécution concurrente de threads indépendants
**Comparaison** :
|   |   |   |
|---|---|---|
||**CPU**|**GPU**|
|**Unité**|Thread OS|Warp (32 threads)|
|**Coût switch**|Lourd (sauvegarde contexte)|Nul (registres dédiés)|
|**Slide 15** : Illustration avec 2 threads CPU vs warps GPU|||
### Data-Level Parallelism (DLP)
**Définition** : Même opération appliquée à plusieurs données
**Modèles** :
- **SIMD** (CPU) : Opérations vectorielles (Slide 16 : AVX-256 = 8 floats)
    
    cpp
    
    Copy
    
    ```Plain
    _mm256_add_ps(a, b); // Addition sur 8 valeurs
    ```
    
- **SIMT** (GPU) : Warps exécutant la même instruction (Slide 19 : 32 threads/warp)
    
    ```C
    kernel<<<...>>>(input); // Exécuté sur 1000s de threads
    ```
    
---
## Extraction du Parallélisme
|   |   |   |
|---|---|---|
|**Type**|**Horizontal (Volume)**|**Vertical (Pipelining)**|
|**ILP**|Superscalar (CPU)|Pipeline d'instructions|
|**TLP**|Multi-cœurs / SMT|Interleaved multithreading|
|**DLP**|SIMD/SIMT|-|
**Key Insight** : Les GPU maximisent TLP/DLP horizontaux, tandis que les CPU équilibrent les trois.
---
## 4. Comparaison Architecturale (Slides 18-19)
### Intel Haswell (CPU)
- **ILP** : 8 instructions/cycle (8 ALUs)
- **TLP** : 4 cœurs physiques × 2 hyper-threads
- **DLP** : AVX-256 (8 floats/cycle)
### NVIDIA Kepler (GPU)
- **ILP** : 2 instructions/cycle (limité)
- **TLP** : 16 SMs × 4 warps/SM = 64 warps actifs
- **DLP** : 32 threads/warp × 128 cores = 4096 threads/SM
**Preuve Slide 19** :
"GPU: focus on DLP, TLP horizontal and vertical"
---
## Synthèse : Pourquoi les GPU Dominent en Throughput
1. **Spécialisation** :
    - 80% de la puce dédiée aux ALUs (vs 20% sur CPU)
    - Mémoire optimisée pour bande passante (GDDR6)
2. **Efficacité des Warps** :
    - Masquage de latence via 64 warps/SM prêts à s'exécuter
    - Exemple Slide 11 : 65KB de concurrency nécessaire → atteint par 2048 threads/SM
3. **Modèle de Programmation** :
    - SIMT permet d'exprimer facilement le DLP
    - Exemple : Kernel CUDA appliqué à 1M d'éléments
cuda
Copy
```Plain
__global__ void add(float *a, float *b) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    a[i] += b[i]; // Exécuté en parallèle sur tous les threads
}
```
Copy
```Plain
---
### À Intégrer dans Notion :
1. **Diagrammes Clés** :
   - Slide 16 : Illustration SIMD vs SIMT
   - Slide 19 : Tableau comparatif CPU/GPU
2. **Exemples Concrets** :
   ```python
   # Calcul de throughput théorique GPU
   alus_per_sm = 128
   clock_speed = 1e9 # 1 GHz
   throughput = alus_per_sm * clock_speed # 128 GFLOPs/SM
```
  
  
---
## Optimisation pour GPU : Bonnes Pratiques
  
1. **Maximiser l'occupation des warps** :
    - Éviter la divergence (if/else dans un warp)
    - Utiliser des warps complets (tailles de bloc multiples de 32)
2. **Accès mémoire coalescés** :
    - Les threads d'un warp doivent accéder à des adresses contiguës
3. **Masquer la latence** :
    - Avoir suffisamment de warps actifs par SM (typiquement 64 warps/SM)
  
---
## Conclusion
  
- **GPU** : Roi du throughput via warps et parallélisme massif
- **CPU** : Maître de la latence pour tâches complexes
- **Choix** : Dépend de l'application (algorithmes parallélisables vs séquentiels)
**Perspective** : Les architectures modernes (e.g., Grace Hopper) combinent les deux approches avec des CPU et GPU intégrés.
  
---
  
  
# Modèle de mémoire GPU
  
## Introduction
Ce cours plonge dans le modèle de programmation des GPU, révélant comment les concepts logiciels (threads, blocs, grids) se mappent sur l'architecture matérielle (SM, warps, cœurs CUDA). Nous explorerons également le modèle mémoire hiérarchique et les implications du paradigme SIMT.
---
## 1. Modèle de Programmation Hiérarchique
### 1.1 Les Trois Niveaux d'Abstraction
|   |   |   |
|---|---|---|
|Niveau|Description|Analogie|
|**Thread**|Unité de base d'exécution|Ouvrier sur une chaîne|
|**Block**|Groupe de threads coopérants (≤ 1024)|Équipe dans un atelier|
|**Grid**|Ensemble de blocs exécutant le même kernel|Usine entière|
**Exemple en CUDA** :
```C++
// Kernel 1D : N threads indépendants
__global__ void vecAdd(float* A, float* B, float* C) {
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    C[i] = A[i] + B[i]; // Chaque thread traite un élément
}
```
  
### 1.2 Mémoire Associée
|   |   |   |
|---|---|---|
|Niveau|Mémoire|Portée|
|Thread|Registres, mémoire locale|Privée|
|Block|Mémoire partagée (SMEM)|Tous les threads du bloc|
|Grid|Mémoire globale|Tous les threads|
  
---
## 2. Mapping Matériel : SMs et Warps
  
### 2.1 Streaming Multiprocessors (SMs)
- **Rôle** : Exécuter les blocs de threads
- **Exemple (GTX 980)** : 16 SMs indépendants
- **Propriétés clés** :
    - Un bloc est assigné à un SM pour toute sa durée de vie
    - Plusieurs blocs peuvent coexister sur un SM (si ressources suffisantes)
### 2.2 Warps : L'Unité Réelle d'Exécution
- **Définition** : Groupe de 32 threads exécutés en **lockstep** (SIMD)
- **Mécanisme** :
    - Chaque SM partitionne les threads en warps
    - 4 warps schedulers par SM (NVIDIA Kepler)
    - 2 instructions indépendantes peuvent être dispatchées par cycle (ILP)
**Exemple** :
- Bloc de 96 threads → 3 warps (32+32+32)
- Bloc de 50 threads → 2 warps (32+18, avec 14 threads inactifs)
  
---
## 3. Modèle d'Exécution SIMT
  
### 3.1 Principe SIMT vs SIMD
|   |   |   |
|---|---|---|
|Caractéristique|SIMD (CPU)|SIMT (GPU)|
|Flexibilité|Instructions rigides|Branchements par thread|
|Divergence|Coûteuse|Masquage par warp|
|Programmation|Explicitement vectoriel|Apparente scalarisation|
### 3.2 Gestion de la Divergence
- **Scénario idéal** : Tous les threads d'un warp suivent le même chemin
- **Divergence** :  
    → Exécution sérialisée des deux chemins avec masquage
    
    ```C++
    if (threadIdx.x % 2 == 0) {
        // Chemin A (50% des threads)
    } else {
        // Chemin B (50% des threads)
    }
    ```
    
**Coût** :
- Meilleur cas : 1 instruction (pas de divergence)
- Pire cas : N instructions (N chemins divergents)
  
---
## 4. Hiérarchie Mémoire : Optimisation Critique
  
### 4.1 Comparaison CPU/GPU
|   |   |   |
|---|---|---|
|Mémoire|CPU (i7)|GPU (Kepler)|
|Cache L1/L2|~256 KB/cœur|~16 KB/SM|
|Registres|16-32/cœur|65K/SM|
|Bande passante|~50 GB/s|~300 GB/s|
### 4.2 Stratégies d'Optimisation
1. **Coalescence** : Accès mémoire contigus par warp
    - Bon : `A[threadIdx.x]`
    - Mauvais : `A[threadIdx.x * stride]`
2. **Utilisation de la SMEM** :
    - Acte comme un cache programmable
    - Exemple : Réduction parallèle
3. **Éviter la "bank conflict"** :
    - 32 banks en mémoire partagée
    - Accès simultanés à la même bank → sérialisation
  
---
## 5. Considérations Énergétiques
  
**Données clés (NVIDIA GT200)** :
- 1 accès DRAM = 80 nJ (~90 W)
- 1 opération FMA = 3.6 nJ (~36 W)
→ **Ratio** : 1 accès mémoire ≈ 22 opérations flottantes
**Implications** :
- Optimiser d'abord les accès mémoire
- Réutiliser les données via les registres/SMEM
- Préférer le calcul au rechargement
  
---
## 6. Étude de Cas : Boucles sur GPU
  
### 6.1 Comportement des Warps
```Python
i = 0
while i < thread_id:  # thread_id varie par thread
    i += 1
```
→ **Exécution** :
- Le warp continue jusqu'à ce que **tous** les threads terminent
- Cycles gaspillés pour les threads déjà sortis
### 6.2 Optimisation
- **Préférer** les boucles avec bornes constantes
- **Utiliser** `#pragma unroll` quand possible
  
---
## Conclusion
  
- **Abstraction logicielle** : Threads/blocs/grids masquent la complexité matérielle
- **Réalité matérielle** : Warps et SMs dictent les performances
- **Règles d'or** :
    1. Minimiser la divergence des warps
    2. Maximiser l'occupation des SMs
    3. Optimiser la localité mémoire