---
title: MAGMA 🌋
Owner: Matcha
---
## Qu’est-ce que MAGMA ?
  
MAGMA est une **librairie de calcul linéaire haute performance** conçue pour tirer parti à la fois du **GPU** (via CUDA) et du **CPU multicoeurs**. On peut la considerer comme une extension de LAPACK, adaptée aux architectures hybrides modernes.
Si on veux faire du calcul matriciel lourd (facto LU/QR/Cholesky, inversion, systèmes linéaires, etc.) en utilisant au maximum le GPU **et** le CPU, MAGMA est un super outil.
---
## Installation rapide
MAGMA peut être compilé depuis les sources. Elle dépend de :
- CUDA (obligatoire)
- LAPACK et BLAS (souvent via MKL, OpenBLAS ou cuBLAS)
- CMake (ou Makefile)

> [!important] **Attention** : la documentation peut être compilée avec `make doc`, mais **certaines définitions ou paramètres manquent** dans les fichiers `.md` ou dans les commentaires Doxygen. N’hésitez pas à lire directement les `.cpp` et `.h` si tu veux comprendre comment certains wrappers fonctionnent.
---
## Tips and Tricks
- Utiliser `magma_init()` et `magma_finalize()` en début et fin de programme.
- Allouer la mémoire sur GPU **et** CPU. MAGMA n’alloue pas tout automatiquement.
- Utiliser `magma_queue_create()` pour gérer plusieurs streams CUDA de manière explicite.
- Si on as plusieurs GPUs, il faut penser à `magma_setdevice()` pour contrôler sur quel GPU on travailles.
- Si on connais déjà LAPACK, utiliser MAGMA est simple : il suffit souvent de copier les données sur le GPU, puis d’appeler la version MAGMA de la fonction LAPACK en ajoutant le préfixe `magma_` (ex. `dgesv` → `magma_dgesv_gpu`).
  
---
## Utilisation simple en C++
Voici un exemple d’utilisation de MAGMA pour résoudre un système linéaire $Ax = B$ avec la factorisation LU (comme `dgesv` en LAPACK) :
```C++
\#include <magma_v2.h>
\#include <magma_lapack.h>
int main() {
    magma_init(); // initialise MAGMA
    magma_int_t N = 1000;
    magma_int_t lda = N, ldb = N, info;
    magma_int_t *ipiv;
    double *h_A, *h_B;
    magmaDouble_ptr d_A, d_B;
		// Création d'une queue MAGMA liée au GPU courant.
		// Utile pour gérer explicitement les opérations asynchrones sur le GPU.
    magma_queue_t queue = NULL;
    magma_device_t device;
		magma_getdevice(&device);             // Récupère le GPU actif
    magma_queue_create(device, &queue);   // Crée une queue associée à ce GPU
    // Allocation CPU
    magma_dmalloc_cpu(&h_A, N * N);
    magma_dmalloc_cpu(&h_B, N);
    magma_imalloc_cpu(&ipiv, N);
    // Allocation GPU
    magma_dmalloc(&d_A, N * N);
    magma_dmalloc(&d_B, N);
    // Remplir les matrices ici...
    // Copie CPU -> GPU
    magma_dsetmatrix(N, N, h_A, lda, d_A, lda, queue);
    magma_dsetvector(N, h_B, 1, d_B, 1, queue);
    // Factorisation + résolution
    magma_dgesv_gpu(N, 1, d_A, lda, ipiv, d_B, ldb, &info);
    // Résultat dans d_B → copier vers h_B
    magma_dgetvector(N, d_B, 1, h_B, 1, queue);
    // Nettoyage
    magma_free_cpu(h_A);
    magma_free_cpu(h_B);
    magma_free_cpu(ipiv);
    magma_free(d_A);
    magma_free(d_B);
    magma_queue_destroy(queue);
    magma_finalize();
}
```

