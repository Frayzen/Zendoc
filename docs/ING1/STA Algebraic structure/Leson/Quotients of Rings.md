---
Owner: Matcha
---
  
# Quotients of Ring
$A$ a Euclidean domain and $a\in A^*$, we denote $A/(a)$ the ring defined as :
- the elements of $A/(a)$are remainders of $x[a]$ of elements $x\in A$ by division with $a$
- addition is defined by : $(x[a])+(y[a])=(x+y)[a]$
- multiplication is defined by : $(x[a]).(y[a])=(x.y)[a]$
$\mathbb{Z}/n\mathbb{Z}$ is the case where $A=\mathbb{Z}$ and $a=n\in \mathbb{Z}^*$
  
  
## Extensions over $\mathbb{Z}$
Let $d\in \mathbb{N}^*$ be square free, $\mathbb{Z}[i \sqrt d]=\mathbb{Z}[X]/(X^2+d)$
$\mathbb{Z}[i \sqrt d]$ consist of polynomial over $\mathbb{Z}$ modulo the equality of $X^2=-d$
i.e it is the subring of $\mathbb{C}$ composed of elements of the form $a+ib\sqrt d$ where $a,b\in \mathbb{Z}$
  
  
### Proposition
The set of units of $\mathbb{Z}[i\sqrt d]$ is $\{-1,1\}$, except in case $d = 1$ where it is $\{1,-1,i,-i\}$
- Proof
    
    An element $\alpha = a+ib\sqrt d$ is a unit iff $a^2+b^2d=1$
    
    If $d>1\ \Rightarrow$ $b=0\ \Rightarrow\ a=\pm 1$
    
    If $d=1\ \Rightarrow\ b=0$ or $a=0$, so $\alpha=\pm 1$ or $\alpha = \pm i$
    
      
    
  
  
### Proposition
An element of $\alpha \in \mathbb{Z}[i\sqrt d]$ for wich $N(\alpha)\in \mathbb{N}$ is a prime number, is irreductible
- Proof
    
    Take $\alpha \in \mathbb{Z}[i\sqrt d]\ \ |\ \ N(\alpha)=p\in \mathbb{N}$ a prime numbrer
    
    $