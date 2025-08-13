---
title: Les Bases
Matière:
  - "[[Programmation OpenGL]]"
Type: Cours
Date du cours: 2025-04-16
Supports:
  - "[[opengl-fr.pdf]]"
---
# Introduction
  
GL (1992) développée initialement par SGI puis maintenant Khronos Group
- Permet le rendu d’images par rasterisation
- OpenGL est une spécification
- La version N-1 de GL est libre (OpenGL)...
- Une implémentation libre : MESA

> [!important] OpenGL n’est pas un moteur mais une API
  
### Ce qu’OpenGL ne fait pas ❌ :
- Ne gère pas l’interaction avec le système/l’utilisateur
- Ne traite pas les ombres
- Repose sur le modèle de Lambert ou de Gouraud mais pas le modèle de Phong
- A partir de la version 3, il n’y a même plus aucun modèle
- N’a aucun modèle physique
- N’a aucun détecteur de collision
  
## Les temps anciens
  
Pipeline graphique fixe (OpenGL <2.0)
![[image 97.png|image 97.png]]

Manque de liberté. On devait se cantonner à des
### Ne pas utiliser ces primitives
![[image 1 29.png|image 1 29.png]]

  
## La fin des temps anciens
  
Pipeline fixe toujours disponible mais introduction des vertex shader et fragment shader
![[image 2 29.png|image 2 29.png]]

==Vert:== programable
==Jaune:== fixe
  
## Le début d’une aire nouvelle
  
Pipeline exclusivement programmable (opengl >=3.1).
![[image 3 25.png|image 3 25.png]]

Le code seras executé sur la carte vidéo, on aura donc une bonne parallélisation. Presque toute la données résident dans le GPU, car on perd beaucoup de temps à transférer les données du CPU au GPU et inversement.
### Versions OpenGL
**OpenGL 3.2**
- Geometry shader (Permet la modification/génération de formes)
**OpenGL 4.1**
- Tessellation-control shader
- Tessellation-evaluation shader
**OpenGL 4.3/4.5**
- Compute shader: permet de faire du calcul en dehors du pipeline ==(ex: animation)==
  
### ⚠️ Les normes changent beaucoup
Aller sur le site : [https://www.khronos.org/](https://www.khronos.org/)
  
---
  
# Principe général
  
## Simplifié
  
**Vertex shader:** récupère une primitive et ==(usuellement)== il prépare sa projection (on peut faire les calcul d’illumination à ce moment là)
**Fragment shader:** peint les élément individuels
**En sortie:** projection de notre maillage, éventuellement un z-buffer
  
**VBO (Vertex Buffer Object):** gros buffer avec les données bruts que l’on passe à OpenGL, peut contenier les normales, la texture…
On peut mettre les données que l’on veut car c’est le Vertex shader qui les récupère, c’est donc à nous des les gérer.
OpenGL se fiche de ce qu’il y a dedans mais il a besoin de savoir comment les données sont organiées et comment les passer au Vertex shader. ==ex: il faut donc lui indiquer si les données sont gourper par 3==
On va devoir fournir le cde de ce qu’on va mettre dans le vertex et Fragment shader. On doit même les compiler. Il va passer a chaque instence un sommet pour paralléliser la tâche.
En parallèle du pipeline les texture unit vont prendre en charge la texture. On va pouvoir leur demander la texture à tel endroit. Accessible depuis notre programme.
  
### 📦 VBO – Vertex Buffer Object
- Contient les **données brutes** envoyées à OpenGL (positions, normales, coordonnées de texture, etc.).
- On peut y mettre **n'importe quelles données**, tant qu’on les gère nous-mêmes dans le **Vertex Shader**.
- OpenGL **ne se soucie pas du contenu**, mais a besoin de connaître :
    - Comment les données sont **organisées**.
    - Comment elles sont **passées** au Vertex Shader (par exemple : données groupées par 3 pour des vecteurs 3D).
---
### 🧮 Shaders
### Vertex Shader
- Reçoit **une primitive** (souvent un sommet).
- Prépare la **projection** de ce sommet dans l’espace 2D (transformation géométrique).
- Peut également effectuer des **calculs d’illumination** (optionnel).
- Fonctionne en **parallèle**, OpenGL exécute un Vertex Shader **par sommet**.
### Fragment Shader
- Reçoit les fragments (pixels candidats à l’affichage).
- S’occupe de **peindre chaque fragment** individuellement (couleur, transparence, etc.).

> [!important]
> 
> - **Les shaders sont écrits manuellement** en langage GLSL (`.glsl`).
> - Il est **obligatoire de les compiler et les linker** pour obtenir un **Program** exécutable sur le GPU.
---
### 🔧 Programme GPU (Shaders)
- Le code GLSL est compilé (vertex et fragment séparément), puis **linké ensemble**.
- Une fois compilé, on obtient un **Program** utilisable dans la pipeline.
- Ce programme est activé via `use` avant de lancer le rendu.
---
### 🎮 Pipeline Graphique
- Composé principalement de :
    - Vertex Shader
    - Fragment Shader
- Gère l’**exécution** du programme GPU.
- Produit en sortie :
    - Une **projection 2D** du maillage (image affichée à l’écran).
    - Un **Z-buffer** (profondeur de chaque fragment pour gérer l’occlusion).
---
### 🖼️ Textures et Texture Units
- Les **Texture Units** sont des emplacements de texture utilisables dans le pipeline.
- Permettent de demander une **texture à une position donnée** dans un shader.
- Accessibles dans le code GLSL via `sampler2D`, etc.
- Plusieurs unités disponibles : `Texture unit 0`, `Texture unit 1`, etc.
---
![[image 4 24.png|image 4 24.png]]

  
  
### 1. Initialisation
Création du contexte OpenGL, chargement des extensions, création des buffers et textures. OpenGL gère pas mal de choses qu’il faut initialiser/activer : Z-buffer, Back face culling...
### 2. **Compilation des shaders**
Les shaders sont des programmes qui s’exécutent directement dans le pipeline graphique, ils sont liés dans un program. Le développeur fournit manuellement le code GLSL, qui est compilé et lié en un programme GPU.
### 3. Initialiser les données
Chargement des sommets, indices, textures dans les buffers (VBO, VAO, etc.).
Préparer les données du maillage dans un buffer (le VBO).
- sommets
- couleurs
- coordonnées textures
- normales…
Expliquer comment les données sont organisées/découpées dans le buffer
![[image 5 23.png|image 5 23.png]]

### 4. Activation du bon programme
Le programme GPU est utilisé pour envoyer les données à travers le pipeline, en associant correctement chaque type de donnée aux shaders.
- Envoie des données du maillage
- Vertex Shader - Changement de repère pour préparer la projection
- Tesselation Shaders - Enrichir le maillage ==(Optionnel)==
- Geometry Shader - Changer la nature/enrichir les primitives (Optionnel)
- Primitive setup/Rasterization - Préparer le dessin.
- Fragment Shader - Dessiner un fragment.
- Récupérer l’image.
  
![[image 6 21.png|image 6 21.png]]

  
---
# GLSL
  
### **Introduction**
- **Définition** : Langage de programmation utilisé pour écrire les _shaders_ dans OpenGL.
- **Fonctionnement** : Les shaders sont compilés pour s'exécuter directement sur le GPU.
- **Exemple de base** :
    
    ```GLSL
    \#version 450
    in vec4 vPosition;
    uniform mat4 my_matrix;
    out vec4 color;
    void main() {
        gl_Position = my_matrix * vPosition;
        color = vec4(1.0, 0.0, 0.0, 1.0);
    }
    ```
    
![[image 7 20.png|image 7 20.png]]

---
### **Variables**
- **Types de variables** :
    - **Scalaires** : `bool`, `int`, `uint`, `float`, `double`.
    - **Vecteurs** : `bvecn`, `ivecn`, `uvecn`, `vecn`, `dvecn` (où `n = 2, 3, 4`).
    - **Matrices** : `matn`, `matnxm`, `dmatn`, `dmatnxm` (tailles 2x2 à 4x4).
    - **Samplers/Images** : Utilisés pour les textures (`sampler2D`, etc.).
- **Accès aux composants** :
    - Pour un vecteur `vec4 t` : `t[2]`, `t.r`, `t.rgb`, `t.xy`, etc.
- **Structures et tableaux** :
    - **Structures** :
        
        ```GLSL
        struct Light {
            vec3 eyePosOrDir;
            bool isDirectional;
        } light;
        ```
        
    - **Tableaux multidimensionnels** : `vec3[5][2]`.
## Principale données
**Uniformes:** Partagées entre toutes les instances
- variables uniform
- UBO
- SSBO
- Textures (sampler)
- Images
**Vertex Shader:** Spécifiques à chaque instance
- VBO
**Sorties**
- FBO
Communication avec et entre shaders
- in/out
- shared
---
### **Instructions en GLSL**
- **Structures de contrôle** :
    - Branchements : `if`, `switch`.
    - Boucles : `for`, `while`, `do-while`.
- **Fonctions** :
    
    ```GLSL
    int maFonction(int a) {
        return a * 2;
    }
    ```
    
- **Préprocesseur** : Directives comme `#define`, `#ifdef`, etc.
- **Fonctions intégrées** : `clamp()`, `normalize()`, `dot()`, etc.
---
### **Données dans les Shaders**
- **Variables partagées (Uniform)** :
    - **Uniforms** : Variables constantes pour tous les vertices/fragments.
        
        ```GLSL
        uniform mat4 model_view_matrix;
        ```
        
    - **UBO (Uniform Buffer Object)** : Regroupe plusieurs uniforms pour un accès efficace.
        
        ```GLSL
        layout(std140) uniform shader_data {
            vec4 light_position;
            vec4 light_color;
        };
        ```
        
    - **SSBO (Shader Storage Buffer Object)** : Pour de gros blocs de données modifiables (OpenGL 4.3+).
        
        ```GLSL
        layout(std430, binding=1) buffer shader_data {
            vec4 light_position;
            vec4 light_color;
        };
        ```
        
- **Données spécifiques aux instances (VBO)** :
    - Stockent les attributs des vertices (positions, normales, couleurs, etc.).
    - Exemple :
        
        ```GLSL
        layout(location=0) in vec3 vertex_position;
        ```
        
---
  
  
### Uniform
Partagée entre toutes les instances  
• Read-only coté GLSL
Coté CPU
Il faut connaitre ou récuperer (`glGetUniformLocation()`) l’adresse de la variable
Puis faire l’assignation : `glUniform∗( location , value)` ;
  
Coté GPU
Déclaration de la variable :  
```C++
uniform int v;
layout(location = 1 ) uniform float t;
```
---
## Buffers
  
### **Bloc de mémoire**
- **Déclaration :**
    
    ```C
    GLuint buffer_id;
    glGenBuffers(1, &buffer_id);
    ```
    
- **Activation / Désactivation**
```C++
glBindBuffer(--TYPE--, buffer_id);
glBindBuffer(--TYPE--, 0);
```
- **Allocation**
```C++
glBufferData(...);
```
- **Écriture / Modification**
```C++
glBufferData(...)
glMapBuffer(...) / glUnmapBuffer(...)
```
- **Déstruction**
```C++
glDeleteBuffers(1, &buffer_id);
```
Ce sont les brique de base des FBOs, UBOs, TextureBuffer…
  
### UBO : Uniform Buffer Object
  
## Vertex Buffer Objects (VBO)
### Définition
Les VBO sont des buffers GPU pour stocker les données des sommets (positions, normales, couleurs, coordonnées de texture...).
### Création et gestion
```C
// Création
GLuint vbo_id;
glGenBuffers(1, &vbo_id);
// Activation
glBindBuffer(GL_ARRAY_BUFFER, vbo_id);
// Envoi des données
glBufferData(GL_ARRAY_BUFFER, size, data, usage); // GL_STATIC_DRAW, GL_DYNAMIC_DRAW...
// Désactivation
glBindBuffer(GL_ARRAY_BUFFER, 0);
// Destruction
glDeleteBuffers(1, &vbo_id);
```
### Organisation des données
![[image 8 18.png|image 8 18.png]]

Deux approches principales :
1. **Données entrelacées** :
    
    ```C
    // Structure : xyzrgbstxyzrgbst...
    glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 8*sizeof(GLfloat), (void*)0); // positions
    glVertexAttribPointer(1, 3, GL_FLOAT, GL_FALSE, 8*sizeof(GLfloat), (void*)(3*sizeof(GLfloat))); // couleurs
    glVertexAttribPointer(2, 2, GL_FLOAT, GL_FALSE, 8*sizeof(GLfloat), (void*)(6*sizeof(GLfloat))); // UVs
    ```
    
2. **Données par blocs** :
    
    ```C
    // Bloc positions : xyzxyzxyz...
    glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 0, (void*)0);
    
    // Bloc couleurs : rgbrgbrgb...
    glVertexAttribPointer(1, 3, GL_FLOAT, GL_FALSE, 0, (void*)(3*nb_vertices*sizeof(GLfloat)));
    ```
    
### Vertex Array Objects (VAO) - Obligatoire en OpenGL 4
```C
GLuint vao_id;
glGenVertexArrays(1, &vao_id);
glBindVertexArray(vao_id);
// Configuration des VBOs ici...
glBindVertexArray(0); // Désactivation
// Pour dessiner :
glBindVertexArray(vao_id);
glDrawArrays(GL_TRIANGLES, 0, vertex_count);
glBindVertexArray(0);
```
### Bonnes pratiques
- ✔️ Uniformiser les formats de données
- ✔️ Minimiser la taille des données
- ✔️ Utiliser l'adressage indexé quand possible (`glDrawElements`)
- ✔️ Préférer les VAO pour encapsuler la configuration
- ✔️ Choisir le bon usage (STATIC, DYNAMIC, STREAM)
### Remplissage depuis un Compute Shader
Possible en liant le même buffer à :
```C
glBindBuffer(GL_SHADER_STORAGE_BUFFER, buffer_id); // Compute shader
glBindBuffer(GL_ARRAY_BUFFER, buffer_id);          // VBO
```
### Paramètres clés de glVertexAttribPointer
- `location`: Correspond au layout dans le shader
- `nb_comp`: Nombre de composants (3 pour vec3)
- `type`: Type de données (GL_FLOAT...)
- `normalize`: Normalisation des valeurs
- `stride`: Octets entre deux attributs (0 = consécutifs)
- `offset`: Décalage initial dans le buffer
  
---
## **UBO (Uniform Buffer Object)**
### **Définition et Utilité**
- **UBO** : Bloc de mémoire partagé entre le CPU et le GPU pour stocker des variables `uniform` de manière structurée.
- **Avantages** :
    - Regroupe plusieurs uniforms en un seul bloc.
    - Partageable entre plusieurs programmes shaders.
    - Plus efficace que les uniforms individuels pour les données fréquemment mises à jour.
![[image 9 18.png|image 9 18.png]]

### **Limitations**
- **Taille maximale** : Quelques dizaines de Ko (vérifier via `GL_MAX_UNIFORM_BLOCK_SIZE`).
- **Nombre limité** :
    - Buffers actifs par type de shader (`GL_MAX_*_UNIFORM_BLOCKS`).
    - Bindings simultanés (`GL_MAX_UNIFORM_BUFFER_BINDINGS`).
- **Lecture seule** côté shader.
- **Taille fixe** : Doit être définie à l'avance.
### **Déclaration dans le Shader**
```GLSL
layout(std140) uniform shader_data {
    vec4 light_position;
    vec4 light_color;
};
```
- `**std140**` : Standard d'alignement mémoire pour éviter les problèmes de padding.
### **Utilisation côté CPU (OpenGL)**
- **Création et allocation** :
    
    ```C++
    GLuint ubo_id;
    glGenBuffers(1, &ubo_id);
    glBindBuffer(GL_UNIFORM_BUFFER, ubo_id);
    glBufferData(GL_UNIFORM_BUFFER, size, data, GL_DYNAMIC_DRAW);
    ```
    
- **Liaison au point de binding** :
    
    ```C++
    glBindBufferBase(GL_UNIFORM_BUFFER, binding_point_index, ubo_id);
    ```
    
    - **Binding index** : Peut être défini dans le shader (`binding = X`) ou via `glUniformBlockBinding`.
### **Alignement Mémoire (**`**std140**`**)**
- **Règles** :
    - Les `vec4`/`mat4` s'alignent sur 16 octets.
    - Les `vec3` sont traités comme `vec4` (padding ajouté).
- **Exemple** :
    
    ```GLSL
    layout(std140) uniform Data {
      vec3 pos;      // → 16 octets (padding +1 float)
      float intensity; // → 4 octets
    };
    ```
    
### **Best Practices**
- **Regrouper les uniforms** par fréquence de mise à jour.
- **Éviter les** `**vec3**` dans les UBO (préférer `vec4` pour éviter le padding).
---
## **SSBO (Shader Storage Buffer Object)**
### **Définition et Utilité**
- **SSBO** : Bloc de mémoire accessible en lecture/écriture depuis les shaders.
- **Cas d'usage** :
    - Données volumineuses (ex : particules, maillages dynamiques).
    - Calculs GPGPU (General-Purpose GPU).
![[image 10 17.png|image 10 17.png]]

### **Avantages vs UBO**
- **Lecture/écriture** : Modifiable côté shader.
- **Taille variable** : Pas de taille fixe prédéfinie.
- **Capacité** : Jusqu'à 16 Mo (minimum garanti), souvent plus.
### **Limitations**
- **OpenGL 4.3+** requis.
- **Nombre limité** de bindings (`GL_MAX_SHADER_STORAGE_BUFFER_BINDINGS`).
- **Performance** : Légèrement plus lent que les UBO (accès moins optimisé).
---
### **Déclaration dans le Shader**
```GLSL
layout(std430, binding = 1) buffer shader_data {
    vec4 light_position;
    vec4 light_color[];
}; // Taille dynamique possible !
```
- `**std430**` : Alignement mémoire plus flexible que `std140` (pas de padding pour les `vec3`).
---
### **Utilisation côté CPU (OpenGL)**
- **Création** :
    
    ```C++
    GLuint ssbo_id;
    glGenBuffers(1, &ssbo_id);
    glBindBuffer(GL_SHADER_STORAGE_BUFFER, ssbo_id);
    glBufferData(GL_SHADER_STORAGE_BUFFER, size, data, GL_DYNAMIC_COPY);
    ```
    
- **Liaison** :
    
    ```C++
    glBindBufferBase(GL_SHADER_STORAGE_BUFFER, binding_point_index, ssbo_id);
    ```
    
    - **Binding index** : Défini dans le shader ou via `glShaderStorageBlockBinding`.
### **Accès côté Shader**
- **Exemple (Compute Shader)** :
    
    ```GLSL
    layout(std430, binding=0) buffer ParticleBuffer {
      vec4 positions[];
    };
    void main() {
      positions[gl_GlobalInvocationID.x].xyz *= 2.0;
    }
    ```
    
### **Alignement Mémoire (**`**std430**`**)**
- **Règles** :
    - Les `vec3` occupent 12 octets (pas de padding).
    - Les structures doivent être organisées pour éviter les décalages.
- **Exemple d'erreur** :
    
    ```C++
    // CPU : struct { float[3] pos; float color[3]; } → GPU : vec3 pos + vec3 color → Padding entre les deux !
    ```
    
### **Best Practices**
- **Préférer** `**std430**` pour les SSBO (meilleure utilisation de la mémoire).
- **Synchronisation** : Utiliser `glMemoryBarrier()` si accès concurrents.
- **Optimisation** : Accès séquentiel pour profiter du cache GPU.
### **Cas Concret : Particules**
```GLSL
// Shader
layout(std430) buffer Particles {
    vec4 position[];
    vec4 velocity[];
};
// CPU : Mise à jour via glMapBuffer() ou compute shader.
```
### **Résumé Comparatif UBO vs SSBO**
|**Critère**|**UBO**|**SSBO**|
|---|---|---|
|Accès|Lecture seule|Lecture/écriture|
|Taille|Limitée (Ko)|Grande (Mo)|
|Flexibilité|Taille fixe|Taille dynamique|
|Performance|Optimisé|Légèrement plus lent|
|Version OpenGL|3.1+|4.3+|
---
## **Alignement des Données (UBO/SSBO)**
- **Problématique** : L'alignement des données en mémoire doit être cohérent entre le CPU et le GPU.
- **Exemple de problème** :
    - **CPU** :
        
        ```C++
        struct Line { float pos[3]; float color[3]; };
        ```
        
    - **GPU** :
        
        ```GLSL
        struct Line { vec3 pos; float padding; vec3 color; }; // Padding ajouté automatiquement.
        ```
        
- **Solution** : Réorganiser les structures pour éviter le _padding_ non désiré.
---
  
# Textures
  
On peut réserver des textures mais l’objet en lui même n’existe pas.
- Déclaration
    - `glGenTextures(1, &id);`
- Activer/Descativer
    - `glBindTexture(...);`
- Allocation
    - `glTexStorage2D();` Best
    - `glTexImage2D();` Déclaration of the bitmap.
- Remplissage
    - `glTexImage2D();`
    - `glTexSubImage2D();`
    - Éventuellement texture buffers : `glTexBuffer(...);`
- Destruction  
    • `glDeleteTextures(...);`
Pour utiliser une texture, il faut d’abord l’activer (glBindTexture()) sur un texture unit ( glActivateTexture ()).
Il faut indiquer au sampler du shader sur quel texture unit il doit travailler.
![[image 11 16.png|image 11 16.png]]


> [!important] Faire attention à la texture que l’on bind, si on a activer un texture avant de bind c’est celle-ci qui seras utilisée.
  
### Attention
Pour une texture 2D, l’origine est en bas à gauche !
Contrairement à un buffer, le premier bind determine le type de la texture (`GL_TEXURE_2D`, `GL_TEXTURE_CUBE_MAP`...). Après il n’est plus posssible d’en changer.
Pour activer un texture unit : `glActiveTexture(GL_TEXTURE0 + i);` plutôt que `glActiveTexture(GL_TEXTUREi);` car pas assez de constantes (jusqu’à `GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS`)