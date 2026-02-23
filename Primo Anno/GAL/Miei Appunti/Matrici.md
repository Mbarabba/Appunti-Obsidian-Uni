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
## Prodotto fra Matrici
- Sia **$A=(a_{ik})$** una <mark style="background: #ADCCFFA6;">matrice di ordine $m \times p$</mark>
- Sia $B=(b_{kj})$ una <mark style="background: #ADCCFFA6;">matrice di ordine $p \times n$</mark>
Defini