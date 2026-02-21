# Definizione
Siano $V,W$ due [[Spazi Vettoriali]] e sia <mark style="background: #FF5582A6;">$F:V\to W$ una funzione, $F$ si definisce applicazione lineare se</mark> :
1. $F(u+v)=F(u)+F(v) \quad \forall u,v\in V$
2. $F(\gamma u)=\gamma F(u)\quad\forall \gamma\in \mathbb{R},\quad \forall u\in V$
## Nucleo
Il nucleo di $F$ è l'insieme :
$$\Large
KerF=\{ v\in V:F(v)=0 \}
$$
<mark style="background: #FF5582A6;">Esso è [[Sottospazi Vettoriali|sottospazio vettoriale]] di $V$</mark>



## Immagine
L'immagine di $F$ è l'insieme :
$$\Large
ImF=\{ w\in W : \exists v\in V,f(u)=w\}
$$
<mark style="background: #FF5582A6;">Esso è [[Sottospazi Vettoriali|sottospazio vettoriale]] di $W$</mark>

- <mark style="background: #ADCCFFA6;">$\{ f(v_{1}),\dots ,f(v_{k}) \}$ genera $Imf$</mark>
- Se $\{ v_{1},\dots,v_{k} \}$ sono tali che $\{ f(v_{1}),\dots,f(v_{k}) \}$ è un sistema indipendente, allora $\{ v_{1},\dots,v_{k} \}$ è indipendente
---
# Iniettività e Suriettività
Sia $f:V\to W$ un'applicazione lineare
1. $f$ **inettiva** $\iff Kerf=\{ 0 \}\iff dim(Kerf)=0$
2. $f$ **suriettiva** $\iff Imf=W \iff dim(Imf)=W$
---
# Estensione lineare
Dati $V,W$ [[Spazi Vettoriali|spazi vettoriali]] sia $\{ v_{1},\dots,v_{n} \}=B$ una [[Base|base]] di $V$ e $\{ w_{1},\dots,w_{n} \}$ un insieme qualunque di vettori di $W$

Allora <mark style="background: #FF5582A6;">esiste un'unica applicazione lineare</mark> $f:V\to W$ tale che 
$$\LARGE
f(v_{i})=w_{i} \quad \forall i=1,\dots,n
$$
---
# Formula dimensionale
Sia $f:V\to W$ un'applicazione lineare vale:
$$\LARGE
dim(v)=dim(Kerf)+dim(Imf)
$$
---
# Composizione
Siano :
$$\begin{gather}f:V\to W \\
g:W\to U
\end{gather}
$$
<mark style="background: #ADCCFFA6;">due applicazioni lineari</mark>

<mark style="background: #FF5582A6;">La coposizione</mark>
$$g\cdot f:V\to U
$$
<mark style="background: #FF5582A6;">è lineare</mark>

---
# Invertibilità
Sia $f:V\to W$ un applicazione lineare diciamo che $f$ è **invertibile** se esiste una funzione lineare
$$
g:W\to V
$$
tale che
$$\Large
\begin{gather}
g \circ f = id_{V}  \\
f \circ g = id_{W}
\end{gather}
$$
La funzione $g=f^{-1}$ si dice **inversa** se$f$ è invertibile, $V$ e $W$ si dicono **isomorfi** e $f$ si chiama **isomorfismo**

## Teorema isomorfismo
Siano $V,W$ [[Spazi Vettoriali|spazi vettoriali]] $V,W \text{ sono isomorfi} \iff dim(V)=dim(W)$ 
## Endomorfismo
Un'applicazione lineare : 
$$\Large f:V\to V$$
si chiama **endomorfismo**
$$\Large End(V)=Hom(V,V)$$
1. $End(V)$ ha dimensione $dim(V)^2$
2. Se fisso $B$ base di $V$ ho che : 
   $$$$


---
# Matrice associata
Sia data $f:V\to W$ una applicazione lineare e siano $B = \{ v_{1},\dots,v_{n} \}$ base di $V$ e $D=\{ w_{1},\dots,w_{m} \}$ base di $W$

La matrice associata a f rispetto alle basi $B$ e $D$ è la matrice
$$\LARGE
M^D_{B}(f)\in M_{m,n}(\mathbb{R})
$$
il cui termine $(i,j)$ è il coefficiente di $f(v_{i})$ rispetto al vettore $w_{j}$

---
# Matrice del cambio base
Data $id_{V}:V\to V$ con basi $B$ e $D$ la matrice :
$$\LARGE M_{B}^D(id_{V})$$
si chiama matrice del cambio di base da $B$ a $D$

Siano $V,W$ [[Spazi Vettoriali|spazio vettoriale]] con base $B=\{ v_{1},\dots,v_{n} \},D=\{ w_{1},\dots,w_{m} \}$

Ho una funzione :
$$\Large
M^D_{B}:Hom(V,W)\to M_{m,n}(\mathbb{R})
$$
$$\Large f\to M^D_{B}(f)$$
1. $M^D_{B}$ è un **isomorfismo** di [[Spazi Vettoriali|spazi vettoriali]]
2. $M^D_{B}(f)\cdot[v]_{B}=[f(v)]_{D}$