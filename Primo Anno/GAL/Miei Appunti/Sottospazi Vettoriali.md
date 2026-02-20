# Definizione
Sia $W$ un <mark style="background: #FF5582A6;">sottoinsieme dello spazio vettoriale</mark> $V$

Diremo che $W$ è un sottospazio vettoriale di $V$ se <mark style="background: #FF5582A6;">soddisfa le seguenti proprietà</mark> :
1. <mark style="background: #FFF3A3A6;">$W \not= \emptyset$</mark>
2. $W$ è <mark style="background: #FFF3A3A6;">chiuso rispetto alla somma</mark>, cioè $\forall u,v\in W$ si ha che <mark style="background: #BBFABBA6;">$u+v\in W$</mark>
3. $W$ è <mark style="background: #FFF3A3A6;">chiuso rispetto al prodotto</mark> per scalari, cioè $\forall u\in W$ e $\forall \gamma\in \mathbb{R}$ si ha ce <mark style="background: #BBFABBA6;">$\gamma u\in W$</mark>
---
# Giacitura
Dato il sottospazio $W=\{ Ax=b:x \in \mathbb{R}^n \}$ chiamiamo **giacitura** di $W$ il sottospazio vettoriale :
$$ \LARGE
W_{0}=\{ Ax=0:x\in R^n \}
$$
## Equazioni Cartesiane
Le equazioni date dal [[Sistemi Lineari|sistema lineare]]
$$\begin{cases}
a_{11}+\dots+a_{1n}x_{n}=b_{1} \\
\vdots \\
a_{m1}+\dots+a_{mn}+x_{n}=b_{n}
\end{cases}
$$
si chiamano <mark style="background: #FF5582A6;">equazioni cartesiane di $W$</mark>
### Da Equazioni cartesiane a Equazioni Parametriche
Da le equazioni cartesiane $Ax=b$ per ottenere quelle parametriche basta risolvere il sistema
## Equazioni parametriche
Se $\{ u_{1},\dots,u_{n-r} \}$ dove $r=r(A)$ è una [[Base|base]] della giacitura $W_{0}$ le equazioni associate a :
$$\Large
\begin{pmatrix}
x_{1} \\ \vdots \\ x_{n}
\end{pmatrix}
=
\overline x + s_{1}u_{1}+\dots+s_{n-r}u_{n-r}
$$
dove $A\overline x = b=$ e $s_{1},\dots,s_{n-r}\in \mathbb{R}$ si dicono <mark style="background: #FF5582A6;">equazioni parametriche di $W$
</mark>
---
# Sottospazi Vettoriali in $\mathbb{R}^n$
Si consideri una [[Matrici|matrice]] $A\in M_{m,n}(\mathbb{R})$

Lo spazio $W=\{x \in \times \mathbb{R}^n : Ax = 0\}=\{ \text{soluzioni del sistema omogeneo associato ad A} \}$

Se $r=r(A)$ e le soluzioni dipendono dai parametri $s_{1},\dots,s_{n-r}$, allora : 
1. $dim(W)=n-r$
2. Una **base** di $W$ si ottiene ponendo, uno alla volta, un parametro pari a $1$ e gli altri pari a 0

Dato un sistema lineare $Ax=b$ con $A \in M_{m,n}(\mathbb{R})$ e $b \in \mathbb{R}^M$ 
- Lo spazio $W = \{ x\in R^n:Ax=b \}$ non è un [[Sottospazi Vettoriali|sottospazio vettoriale]]
- $W_{0}=\{ x \in R^n:Ax=0 \}$ è un [[Sottospazi Vettoriali|sottospazio vettoriale]]

Inoltre, dato $Ax=b$ , sia $\overline{x}\in W$ una soluzione particolare 