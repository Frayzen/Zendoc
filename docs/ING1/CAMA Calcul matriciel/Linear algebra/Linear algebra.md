---
title: Linear algebra
Owner: "Florian "
---
[[ING1/CAMA Calcul matriciel/Linear algebra/Definitions|Definitions]]

# Useful matrices
- Rotation matrix
    
    |   |   |
    |---|---|
    |cos|-sin|
    |sin|cos|
    
- Horizontal symmetry
    
    |   |   |
    |---|---|
    |1|0|
    |0|-1|
    
    ![[Untitled 107.png|Untitled 107.png]]

    
- Linear transform matrix without translation
```Python
P = np.array([(B-A), (C-A)]).T 
# matrice de passage
```
![[Untitled 1 75.png|Untitled 1 75.png]]

- Linear transformation matrix with translation (in 2D)
    
    ```Python
    P = np.identity(3) # defines the size and set the last line (others will be overwritten)
    P[:2, :2] = P2D    # deformation
    P[:2, 2] = A       # translation
    ```
    
## Eigen values (vecteurs & valeurs propres)
Les vecteurs propres sont des sortes d'attracteurs qui vont capturer tous les points si on fait un nombre infini de multiplication par A.
```Python
val_propre, vec_propre = lin.eig(A)
```
In the context of rotation matrices:
- les valeurs propres et vecteurs propres sont des complexes
- les valeurs propres sont de norme 1 (normal puisque c'est une isométrie)
- l'angle de rotation θ se retrouve dans les valeurs propres
  
## Diagonalize a matrix
![[Untitled 2 56.png|Untitled 2 56.png]]

## Covariance
![[Untitled 3 42.png|Untitled 3 42.png]]

```Python
cov = lambda x,y : np.dot((x - x.mean()), (y - y.mean())) / len(x)
Cov = lambda x,y : np.array([[cov(x,x), cov(x,y)], [cov(y,x), cov(y,y)]])
Cov(nuage[0], nuage[1]) # par défaut Numpy divise par (N-1), avec bias=True il divise par N et donne ce résultat
```
# Equation solving
```Python
# A est la quantité de chaque fruit achetée
# x est le prix de chaque fruit
# b est la somme qu'on a payé pour chaque course
A = np.array([[6,5,4], [5,3,2], [7,3,2]])
b = np.array([11.7, 7.9, 9.5])
x = lin.inv(A) @ b
x 
```
## gauss jordan
```Python
def solve_gauss_jordan(A,b):
    for i in range(len(A)):
        d1 = np.diag([1.,] * len(A))
        d1[:,i] = - A[:,i] / A[i,i]
        A = d1 @ A
        b = d1 @ b
    return b / np.diag(A)
```