---
Matière:
  - "[[Introduction aux Réseaux de Neuronnes]]"
Type: Cours
Date du cours: 2025-03-20
Supports:
  - "[[intro_nn.pdf]]"
---
# [Un neurone](https://www.ricou.eu.org/iren/notes_rn.html#Neurones)
  
![[image 93.png|image 93.png]]
![[image 1 26.png|image 1 26.png]]
On a quelque chose de linéaire → On va donc appliquer une fonction $f$ pour enlever la linéarité.
  
## Les maths
  
- $z=b+\sum_iw_ix_i$
- $y=\sigma(z)$ avec:
    - les $i$ entrée $x_i$
    - $b$ le biais
    - $w_i$ les poids
    - $\sigma$ la fonction d’activation
### Fonction d’activation
![[image 2 26.png|image 2 26.png]]
  
## Théorème d’approximation
  
Soit une fonction d’activation $𝜎 ∈ \mathscr{C}(ℝ)$ avec $𝜎$ non polynomiale, alors l’espace généré par une couche de neurones :
$\mathcal{M}_r(\sigma)=\Big\{ \sum_{i=1}^{r}c_i\sigma(w^i.x+b_i),W^i\in\mathbb{R}^d,c_i\text{ et }b_i\in\mathbb{R} \Big\}$
est dense dans $\mathscr{C}(\mathbb{R})$ au sens de la convergence uniforme sur tout $c$ c.a.d
  
## Un premier réseau neuronal
  
![[image 3 23.png|image 3 23.png]]
### Évaluer les couples d’entrée $(1,1), (0,1), (1,0)$ et $(0,0)$ avec $σ$ une logistique
On fais i x coef de la fleche puis on aditionne les fleches, puis on aditionne avec la fleche du haut, si > 0 alors on a 1.
  
  
# Construction d’un réseau neuronal
  
Pour construire un réseau neuronal par apprentissage supervisé il faut :
un grand jeu de données étiquetées par la sortie voulue
- définir l’architecture du réseau avec
    - le nombre de couches
    - les types de couches
    - le nombre de nœuds par couche
    - les fonctions d’activations
    - les connexions inter-couches
    - toutes astuces qui fonctionnent
- une fonction d’erreur pour guider la correction sur les poids
- une méthode pour faire converger le réseau (trouver les bons poids)
  

> [!important] On manque de mathématique lourdes dans ce domaine, donc il y a un aspet “artistique”
  

> En cas de problème, on sacrifie un poulet.
  
## Les données
  
Les données doivent être
- très nombreuses (assez pour définir toutes les inconnues du réseau)
- de bonne qualité (pour ne pas tromper le réseau)
On appronfondira avec des exemples et l’utilisation de Pandas pour nettoyer les données.
![[image 4 22.png|image 4 22.png]]
  
Si on trie les étiquettes au hasard on auras 0,5.
  
## L’architecture du réseau
  
C’est la partie tactique et artistique.

> [!important] L’étude des différents réseaux n’entre pas dans le cadre de ce cours d’introduction.
![[image 5 21.png|image 5 21.png]]
  
# [Fonction d’erreur](https://www.ricou.eu.org/iren/notes_rn.html#Fonction%20d%27erreur)
  
La fonction d’erreur indique de combien le réseau s’est trompé par rapport à la vérité terrain $(𝑦\text{ vs }𝑡)$. Elle doit être :
- dérivable
- correspondre au problème traité
Cette fonction est aussi appelée fonction de coût (cost function ou loss function).
  
**Exemples**
- L’erreur quadratique $𝐸 = (𝑦 − 𝑡)^2$
- $𝐸 = log(cosh(𝑦 − 𝑡))$ quadratique puis linéaire lorsque l’écart croît
- L’entropie croisée pour des probabilités (valeurs entre 0 et 1)
    
    $E=-\sum_kt_k\ log(y_k)+(1-t_k)\ log(1-y_k)$