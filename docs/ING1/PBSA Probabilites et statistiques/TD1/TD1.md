---
title: TD1
Owner: Matcha
---
![[PBS1_EN_CH1_Continuous_distribution 2.pdf|PBS1_EN_CH1_Continuous_distribution 2.pdf]]
  
# Correction
![[PBS1_FR_CH1_SOL_Loi_continue.pdf]]
## Exercice 1
### 1.
  
$Si\ k \neq0\\ \int_1^{\infty}f(x)dx=k\int_1^{\infty}dx/x$Diverging Rieman integral $\alpha=1$
  
$Si\ k=0,\ f(x)=0\\ \int_1^{+\infty}f(x)dx\neq1$
$f(x)$ is not a density
  
### 2.
  
Il faut que $k \geq0\\ \int_{\mathbb{R}}f()dx=k\int_1^{+\infty}(1/x^2)dx=k[-1/x]_1^{+\infty}=k=1$
Donc :
$f(x)=\Biggl\{ \begin{array}{rcl} 1/x^2\ \ x\geq1\\ 0\ \ \ sinon \end{array}$
Fonction de repartition de $X$
$F(x)=\int_{-\infty}^xf(t)dt=P(X<x)$
$Si\ x<1\\ F(x)=\int_{-\infty}^x(1/t^2)dt=[-1/t]_1^x=1-(1/x)$
Donc:
$F(x)=\Biggl\{ \begin{array}{rcl} 0\ \ x<1\\ 1-(1/x)\ \ \ sinon \end{array}$
$F(a)=1/40\\ \Longleftrightarrow\ 1-(1/a)=1/40\\ \Longleftrightarrow\ 1/a=1-(1/40)=39/40\\ \Longleftrightarrow\ a = 40/39$
  
$P(X>b)=1/40\\ 1-F(b)=1/40\ \Longleftrightarrow\ 1/b=1/40 \Longrightarrow b=40$
  
$I=[40/39,40]\\ P(X\in I)=95\%$
  
  
### 3.
  
$k\geq0\\ k[-1/2x^2]_2^{+\infty}=1\\ k/-8=1 \Longrightarrow k=8$
  
$F(x)=\int_{-\infty}^xf(t)dt$
$Si\ x<2\ \Longrightarrow\ F(x)=0$
$Sinon :\\ F(x)=8\big[-1/2t^2\big]_2^x=4(1/4-1/x^2)=1-4/x^2$
$F(x)=\Biggl\{ \begin{array}{rcl} 0\ \ x<2\\ 1-(4/x^2)\ \ \ sinon \end{array}$
  
$F(a)=1/40$1-4/a^2=1/40\ \Longrightarrow\ 4/a^2=39/40\ \Longrightarrow\ a^2=160/39\\ a=4\sqrt{10}/\sqrt{39}$
  
$P(X>b)=1/40\ \Longrightarrow\ b=4\sqrt{10}$
$I=\big[\frac{4\sqrt{10}}{39},4\sqrt{10}\big]\\P(x\in I)=95\%$
  
### 4.
  
$Si\ k\neq0\\ k\int_{-\infty}^0e^{-2x}dx+\int_0^{+\infty}e^{-2x}dx$
div cv → div
  
Si $k=0\ \Longrightarrow\ \int_{\mathbb{R}}f(x)dx\neq1$
Not a density
  
  
### 5.
  
$k\geq0\ and \ \int_{\mathbb{R}}f(x)dx=1\\ k[(-1/2)e^{-2x}]_0^{+\infty}\\ k/2=1\ \Longrightarrow\ k=2$
  
Si $x<0,\ F(x)=0$
Si $x\geq0\\ F(x)=[-e^{-2t}]_0^x=1-e^{-2t}$
  
$F(a)=1/40 \ \Longrightarrow\ a=(-1/2)\ ln(39/40)$
$1-F(b)=1/40\ \Longrightarrow\ b=(1/2)ln(40)$
  
  
### 6.
  
$\int_A^Bkdx=1\ \Longrightarrow\ k(B-A)=1\ \Longrightarrow\ k=\frac{1}{(B-A)}$
  
- $x<A\ \Longrightarrow\ F(x)=0$
- $A\leq x\leq B\ \Longrightarrow\ F(x)=\int_A^x\frac{1}{B-A}dx=\frac{x-A}{B-A}$
- $x>B\ \Longrightarrow\ F(x)=\int_A^B\frac{1}{B-A}dx=\frac{B-A}{B-A}=1$
  
$F(a)=1/40\ \Longrightarrow\ a=\frac{B-A}{40}+A$
$1-F(b)=\frac{1}{40}\ \Longrightarrow\ b=A+\frac{39}{40}(B-A)$
  
  
  
## Exercice 2
  
### 1.
  
See exercise 1.6 :
$F(x)=\int_{-\infty}^xf(t)dt=\Biggl\{ \begin{array}{rcl} \frac{1}{b-a}\ \ a\leq x\leq b\\ 1\ \ \ x>b\\ 0\ \ \ sinon \end{array}$
  
  
### 2.
  
$G(z)=P(Z<z)=P\big(X<z(b-a)+a\big)=F(a+(b-a)z)$
$G(z)=\Biggl\{ \begin{array}{rcl} 0\ \ \ \ z<0\\ z\ \ \ \ \ 0\leq z\leq1\\ 1\ \ \ \ z>1 \end{array}$
A density of $Z$ is :$g(z)=G'(z)=\Biggl\{\begin{array}{rcl} 1\ \ \ \ \ 0\leq z\leq1\\ 0\ \ \ \ sinon \end{array}$
$Z$ follows an uniform law on $[0,1]$
  
### 3.
  
rand( ) tire $Z$
$x=25+5\times rand(\ )$
tire x
  
  
## Exercise 3
  
### 1.
  
**a)**
$f(t)\geq0\ \forall t$
$\int_0^{+\infty}\lambda e^{-\lambda t}dt=\big[-e^{-\lambda t}\big]_0^{+\infty}=1$
  
$Si\ t<0\ \Rightarrow\ F(t)=0\\ Si\ t\geq0\ \Rightarrow\ F(t)=\big[-e^{-\lambda t}\big]_0^t=1-e^{-\lambda t}$
  
b)
$P(X\le a)=0,95=F(a)=1-e^{-\lambda a}$
$\Leftrightarrow a=-\frac{1}{\lambda}\ ln(0,95)$
  
c)
$P(T>t_0+\Delta t\ |\ T>t_0)=\frac{P((T>t_0+\Delta t)\bigcap(T>t_0))}{P(T>t_0)}$
  
- $\Delta t \le 0\\ =\frac{P(T>t_0)}{P(T>t_0)}=1$
- $\Delta t>0\\ P(T>t_0+\Delta t\ |\ T>t_0)=\frac{P(T>t_0+\Delta t)}{P(T>t_0)}=\frac{1-F(t_0+\Delta t)}{1-F(t_0)}=\frac{e^{-\lambda(t_0+\Delta t)}}{e^{-\lambda t_0}}=e^{-\lambda \Delta t}$
  
Donc $P(T>t_0+\Delta t\ |\ T>t_0)=P(T>\Delta t)$