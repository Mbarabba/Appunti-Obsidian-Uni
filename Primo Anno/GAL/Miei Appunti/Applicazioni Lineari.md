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