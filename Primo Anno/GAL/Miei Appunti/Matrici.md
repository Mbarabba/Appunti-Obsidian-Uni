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
Gli elementi della diagonale sono : 
$$\large a_{11} = 3 \quad a_{22}=4 \quad a_{33}=-2$$
mentre il resto degli elementi sono pari a 0
## Matrici Uguali
Due matrici $A,B$ sono uguali se hanno le stesse dimensioni
