# Definizione
Sia $\mathbb{R}$ l'insieme de numeri reali e siano $m,n\in N$

La tabella cosi' composta è chiamata **matrice** $m \times n$ in $\mathbb{R}$
$$
A = \begin{pmatrix}
a_{11} & a_{12} & \dots & a_{1n}  \\
\vdots & \vdots & \vdots & \vdots \\
a_{m1} & \dots & \dots & a_{mn}
\end{pmatrix}
$$
---
# Notazione
- **$A_{i}$** la <mark style="background: #ADCCFFA6;">$i$-esima riga</mark>
- **$A_{j}$** la <mark style="background: #ADCCFFA6;">$j$-esima colonna</mark>
- **$a_{ij}$** il numero reale alla <mark style="background: #ADCCFFA6;">$i$-esima riga della $j$-esima colonna</mark>
---
# Tipi di Matrice
## Matrice Quadrata
Se **$m=n$** la matrice $A$ viene detta <mark style="background: #ADCCFFA6;">matrice quadrata di ordine n</mark>
$$
\begin{pmatrix}
1 & 0 &2 \\
-6 & 4 & 5 \\
3 & -4&-2
\end{pmatrix}
$$
## Matrice Diagonale
Data una [[#Tipi di Matrice#Matrice Quadrata|matrice quadrata]] essa si definisce **matrice diagonale** se :
$$a_{ij}=0, \text{ per } i\not= j \quad \text{(gli elementi non appartenenti alla diagonale sono nulli)}$$

Data la [[#Matrice Quadrata|matrice quadrata]]
$$
\begin{pmatrix}
3 & 0 & 0 \\
0 & 4 & 0 \\
0 & 0 & -2
\end{pmatrix}
$$
<mark style="background: #BBFABBA6;">Gli elementi della diagonale sono</mark> : 
$$\large a_{11} = 3 \quad a_{22}=4 \quad a_{33}=-2$$
mentre il <mark style="background: #BBFABBA6;">resto degli elementi sono pari a 0</mark>
## Matrici Uguali
Due matrici $A,B$ sono **uguali** se <mark style="background: #ADCCFFA6;">hanno le stesse dimensioni</mark> e se <mark style="background: #ADCCFFA6;">$a_{ij}=b_{ij}$ per ogni $i,j$</mark>

Le matrici
$$
A = \begin{pmatrix}
1 & 0 & -2 \\ \pi & 1 & 3 \\ 3 & -4 & -2
\end{pmatrix} \quad
B = \begin{pmatrix}
1 & 0 & -2 \\ \pi & 1 & 3 \\ 3 & -4 & -2
\end{pmatrix}
$$
<mark style="background: #BBFABBA6;">sono uguali</mark>
## Matrice Nulla
Una matrice <mark style="background: #ADCCFFA6;">i cui elementi sono nulli</mark> è detta matrice **nulla**
$$
A = \begin{pmatrix}
0 & 0 & 0  \\
\vdots & \vdots & \vdots \\
0 & 0 & 0
\end{pmatrix}
$$
## Matrice Trasposta
Data una matrice $A$, chiamiamo **trasposta** di $A$, e la <mark style="background: #BBFABBA6;">indichiamo con **$A^t$**</mark> la matrice le cui <mark style="background: #ADCCFFA6;">colonne sono ordinatamente le righe di $A$</mark>
$$
\begin{gather} 
A = \begin{pmatrix}
1 & 0 & -2 \\ \pi & 1 & 3 \\ 3 & -4 & -2
\end{pmatrix}  \\ \\ 
A^t = \begin{pmatrix}
1  &  \pi  & 3  \\
0 & 1 & -4 \\
3 & -4 & -2
\end{pmatrix}
\end{gather}
$$
## Matrice Simmetrica
Una [[#Matrice Quadrata|matrice quadrata]] di ordine $n$ è detta **simmetrica** se $A=A^t$, ovvero se la sua generica riga $i$-esima è uguale alla sua colonna $i$-esima
$$
\begin{gather}
A = \begin{pmatrix}
1 & 1 & -2 \\
1 & 3 & 5 \\
-2 & 5 & -6
\end{pmatrix} \\ \\
A^t=\begin{pmatrix}
1 & 1 & -2 \\
1 & 3 & 5 \\
-2 & 5 & -6
\end{pmatrix}\\ \\ 
\large A=A^t \implies A \text{ è simmetrica}
\end{gather}
$$
## Matrice Riga
Una <mark style="background: #ADCCFFA6;">matrice $A$ di ordine $1 \times n$</mark>, cioè una matrice del tipo 
$$A = \begin{pmatrix}
a_{11}  & a_{12}  & \dots  & a_{1n}
\end{pmatrix}$$
è detta **matrice riga**
## Matrice Colonna
Una <mark style="background: #ADCCFFA6;">matrice $A$ di ordine $n \times 1$</mark>, cioè una matrice del tipo 
$$
A = \begin{pmatrix}
a_{11}  \\
a_{12} \\
\vdots \\
a_{n_{1}}
\end{pmatrix}
$$
è detta **matrice colonna**
## Matrice Unità $I$
Data una [[#Matrice Quadrata|matrice quadrata]], la **matrice diagonale $I$** è caratterizzata dal fatto che gli elementi sulla diagonale sono pari a $1$, mentre il resto è pari a $0$
$$
I = \begin{pmatrix}
1 & 0 & 0 \\
0 & 1 & 0 \\
0 & 0 & 1
\end{pmatrix}
$$
Inoltre, <mark style="background: #ADCCFFA6;">data una generica matrice $A$</mark>
$$AI=IA=A$$
## Matrice Inversa $A^{-1}$
### Quando una matrice è invertibile?
Una [[#Matrice Quadrata|matrice quadrata]] viene definita **invertibile** se esiste $A^{-1}$ tale che
$$AA^{-1}=A^{-1}A=I$$
dove <mark style="background: #ADCCFFA6;">$I$ è la [[#Matrice Unità $I$|matrice unità]]</mark>
### Come invertire una matrice

---
# Operazioni fra matrici
## Somma
Date le matrici 
$$
A = \begin{pmatrix}
3 & 4 & 1 \\
2 & 5 & 0
\end{pmatrix}
\quad
B = \begin{pmatrix}
-1 & 2 & 3 \\
6 & 7 & -2
\end{pmatrix}
$$
Definiamo **somma** e la indichiamo con **$A+B$**, la <mark style="background: #ADCCFFA6;">matrice ottenuta sommando ciascun elemento di $A$ col corrispondente elemento di $B$</mark>
$$
A+B = \begin{pmatrix}
2 & 6 & 4 \\
8 & 12 & -2
\end{pmatrix}
$$
In generale
$$
\begin{gather}
A+B=C  \\ \\

\large C=(c_{ij})=(a_{ij}+b_{ij})
\end{gather}
$$
## Prodotto per uno Scalare
Data
$$A=\begin{pmatrix}
-2 & 3 & 1 \\
4 & 5 & 6 \\
-3 & 1 & -4
\end{pmatrix}$$
e sia $k=2$, abbiamo che 
$$kA=2A=\begin{pmatrix}
-4 & 6 & 2 \\
8 & 10 & 12 \\
-6 & 2 & -8
\end{pmatrix}$$
questa operazione viene definita come **prodotto per uno scalare**
## Prodotto righe per colonne
- Sia **$A=(a_{ik})$** una <mark style="background: #ADCCFFA6;">matrice di ordine $m \times p$</mark>
- Sia $B=(b_{kj})$ una <mark style="background: #ADCCFFA6;">matrice di ordine $p \times n$</mark>

<mark style="background: #FF5582A6;">L'operazione può essere eseguite se e solo se il numero di colonne di $A$ equivale al numero di righe di $B$</mark> 

Il prodotto tra matrici <mark style="background: #ADCCFFA6;">non gode della **proprietà commutativa**</mark>

$$AB \not = BA$$

Definiamo come prodotto righe per colonne della matrice $A$ per la matrice $B$ la matrice
$$
\begin{gather}
AB=C \text{ di ordine } m \times n \text{ cosi' definita} \\
\\
\large C=(c_{ij}) \text{ dove } c_{ij} = a_{i1}b_{1j}+\dots+a_{ip}b_{pj}
 \\
 \\ 1 \leq i\leq m \quad 1\leq j\leq n
\end{gather}
$$
### Esempio Pratico
$$
A = \begin{pmatrix}
-1 & 4 \\
6 & 1
\end{pmatrix}
\quad B=\begin{pmatrix}
3 & 2 & -4 \\
5 & 0 & 2
\end{pmatrix}
$$
$$
AB=\begin{pmatrix}
-1 \cdot3 + 4\cdot 5 & -1 \cdot 2+4 \cdot 0 & -1 \cdot -4 + 4 \cdot 2 \\
6 \cdot 3 + 1 \cdot 5  & 6 \cdot 2 + 1 \cdot 0 & 6 \cdot 4 + 1\cdot 2
\end{pmatrix} =\begin{pmatrix}
17 & -2 & 12 \\
23 & 12 & -22
\end{pmatrix}
$$
---
# Determinante
## Definizione
Il **determinante** di una [[#Matrice Quadrata|matrice quadrata]] $A$ è un numero, <mark style="background: #ADCCFFA6;">indicato come $\det(A)$</mark> (oppure come $|A|$) 
## Come calcolarlo?
Il **determinante** viene calcolato attraverso una <mark style="background: #ADCCFFA6;">funzione ricorsiva</mark>

- **Casi Base**
	1. Se $A=(a_{11})$ allora
	   $$\det(A)=a_{11}$$
	2. Se $A=\begin{pmatrix}a_{11} & a_{12} \\ a_{21}  & a_{22}\end{pmatrix}$ allora
	   $$\det(A)=a_{11}a_{22}-a_{21}a_{12}$$
- **Caso Ricorsivo**
  Per una matrice di qualsiasi dimensione 