---
Owner: Tim Pearson
---
## Banach Space
$(X, || \cdot ||)$ over $\mathbb{F}$ with
every **Cauchy Sequence** $(x_n)$ in $X$ **converges** to a limit in $X$ :
$\forall \varepsilon \gt 0, \exists N \in \mathbb{N} s.t. \forall m,n \gt N, ||x_n -x_m || \lt \varepsilon$
if there exists $x \in X$ such that
$\lim _{n \rightarrow \inf} x_n = x$ $(i.e, ||x_n -x|| \rightarrow 0 \ as \ \rightarrow \inf )$
then $X$ is **complete**, thus a **Banach Space**
  
## Hilbert Space
$(X, \langle \cdot , \cdot \rangle)$
where
- $X \in\mathbb{F}$
- $\langle \cdot , \cdot \rangle : X \times X \rightarrow \mathbb{F}$
- $(X, || \cdot ||)$ is a **Banach space** wth respect to the norm $||x|| := \sqrt{\langle x , x \rangle }$
- **AXIOMS**
    - ==**closed under addition:**== ==$x,y \in H$== ==then== ==$x + y \in H$==
    - ==**closed under scalar multiplication**====:== ==$x \in H$== ==and== ==$\alpha \in \mathbb{C}$== ==then== ==$\alpha x \in H$==
    - ==**Linearity in the First Argument:**== ==$x,y,z \in H$== ==and scalars== ==$\alpha, \beta$====:==
        
        ==$\langle \alpha x + \beta y, z \rangle = \alpha \langle x,z \rangle + \beta \langle y, z \rangle$==
        
    - ==**conjugate symmetry:**== ==$\forall x,y \in H$==
        
        ==$\langle x, y \rangle = \overline{\langle y, x \rangle}$==
        
    - ==**positive definite:**== ==$x \in H$====,==
        
        ==$\langle x, x \rangle \ge 0, \ and \ \langle x,x \rangle = 0 \Leftrightarrow x = 0$==
        
    - ==**induced inner norm:**== ==$||x|| = \sqrt{\langle x,x \rangle}$==
        
        ==which must satisfy:==
        
        - ==**positivity:**== ==$|x|| \ge 0 \ and \ ||x|| = 0 \Leftrightarrow x = 0$==
        - ==**triangle inequality:**== ==$||x + y || \le ||x || + ||y||$==
        - ==**homogeneity:**== ==$|\alpha x|| = |\alpha | ||x|| \forall \alpha \in \mathbb{C}$==
        
    - ==**completeness (banach property):**== ==$\forall \varepsilon \gt 0, \exists N \in \mathbb{N} s.t. \forall m,n \gt N, ||x_n -x_m || \lt \varepsilon$==
    - ==**orthogonality :**== ==$x \perp y \Rightarrow \langle x, y, \rangle = 0$==
    - ==**projection:**== ==for any vector== ==$x \in H$== ==and a closed subspace== ==$M \subset H$====,== ==$\exists p \in M : ||x -p || = \min _{y \in M} || x - y||$==
    - ==**orthonormal basis**== ==$\{e_i \}$====**:**== ==meaning==
        
        ==$\forall x \in H, x = \sum_i \langle x,x_i \rangle e_i$==
        
        ==(This generalizes== ==**Fourier series**== ==and defines== ==**Hilbert space expansions)**==
        
    - ==**spectral theorum (for compact operators):**==
        
        ==$T : H \rightarrow H$== ==is== ==**compact, self-adjoint operator**====, then there exists an== ==**orthonormal eigenbasis**== ==for== ==$H$====, meaning==
        
        ==$Tx = \lambda x$==
        
        ==for some== ==**eigenvalues**== ==$\lambda$== ==and== ==**eigenvectors**== ==$x$==