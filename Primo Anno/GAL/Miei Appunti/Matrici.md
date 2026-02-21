# Cosa sono?
Dati $m,n\in \mathbb{N}$, si chiama matrice $m\times n$ a coefficienti reali una tabella di $mn$ numeri reali collocati su $m$ righe e $n$ colonne

>[!example] Esempio di matrice
>$$
>\begin{pmatrix} 5 & -6 & 0  \\
>4 & 3 & -1
\end{pmatrix}
>$$
>Questa è una <mark style="background: #FF5582A6;">matrice $2 \times 3$</mark>
>- $m$ (righe) = $2$
>- $n$ (colonne) = $3$
## Notazione
 - Definiamo con $M_{m,n}(\mathbb{R})$ la <mark style="background: #BBFABBA6;">matrice con $m$ righe e $n$ colonne</mark>
 - Data $A \in M_{m,n}(\mathbb{R})$ e $i,j \in \mathbb{N}$ con :
	 - $1 \leq i \leq m$
	 - $1 \leq j \leq n$
	 - Denotiamo l'elemento al di posto $(i,j)$ è il numero in <mark style="background: #FF5582A6;">riga $i$</mark> e <mark style="background: #FF5582A6;">colonna $j$</mark>
- Se $a_{i,j}$ è tale elemento scriviamo formalmente 
  $A=(a_{i,j})$
---
# Tipi di matrici
## Matrici Quadrate
Se <mark style="background: #FF5582A6;">$m=n$</mark> la matrice si dice **quadrata** di ordine $n$
>[!example] Esempio di matrice Quadrata
>$$m=n=2 \implies \begin{pmatrix}1 &0 \\ \frac{2}{3} & 3\end{pmatrix}$$

### Proprietà delle Matrici Quadrate
1. $A$ è **invertibile**
2. $L_{A}$ è un **isomorfismo**
3. $n=r(A)=dim(col(A))=dim(Row(A))$

## Matrici Uguali
Date 2 matrici :
$$
\begin{gathered}
A \in M_{m,n}(\mathbb{R})\\
B \in M_{l,s}(\mathbb{R})
\end{gathered}
$$
Sono **uguali** se : 
1. $m=l, n=s$
2. $a_{i,j}=b_{i,j} \qquad \forall 1\leq i\leq m \quad \forall 1\leq j\leq n$

>[!example] Esempio di matrici uguali
>$$A = \begin{pmatrix} 1 & 2 \\ 3 & 4 \end{pmatrix}$$
>$$B = \begin{pmatrix} 1 & 2 \\ 3 & 4 \end{pmatrix}$$
>$$
>\begin{cases}
>m=l,n=s  \\
>a_{i,j}=b_{i,j} \qquad \forall 1\leq i\leq m \quad \forall 1\leq j\leq n
\end{cases} \implies A=B
>$$
## Matrici ridotte a scala
Una matrice si dice in forma a scala se sono soddisfatte le seguenti condizioni
1. Eventuali righe nulle si trovano <mark style="background: #ADCCFFA6;">in fondo alla matrice</mark>
2. Il primo elemento non nullo di ogni riga (non nulla) si trova **più a destra** del primo elemento non nullo della <mark style="background: #ADCCFFA6;">riga precedente</mark>

>[!example] Esempio di matrice ridotta a scala
>$$
>\begin{pmatrix} 
> 1 & -1 & -1 & 2 & -4 \\ 
> 0 & 0 & -1& 3 & 5 \\
> 0 & 0 & 0 & \frac{1}{3} & 1 \\
> 0 & 0 & 0 & 0 & 0
\end{pmatrix}
>$$

### Pivot
Si definisce come pivot di $A$ il <mark style="background: #FF5582A6;">primo elemento non nullo</mark> di ogni riga (non nulla) di $A$

I pivot della matrice precedente sono :
$$1, -1, \frac{1}{3}$$

### Rango per righe
Si definisce rango per righe di una matrice ridotta a scala il numero di pivot

Denotiamo il rango con $r(A)$

Il rango della matrice precedente è pari a $3$

## Matrice trasposta
Data una matrice $A \in M_{m,n}(\mathbb{R})$ la matrice trosposta è la matrice : 
$$\LARGE
(A^T)_{ij}=A_{ji}
$$
## Matrice Identità
La matrice identità è la matrice $n \times n$ avente tutti gli elementi della <mark style="background: #FF5582A6;">diagonale principale uguali a $1$</mark>, mentre i <mark style="background: #FF5582A6;">restanti elementi sono uguali a $0$</mark>

Viene indicata con **$I_{n}$**
>[!example] Esempio di matrice identità
>$$I_{n}=
>\begin{pmatrix} 1 & 0 & 0 \\ 0 & 1 & 0 \\ 0 & 0 & 1
\end{pmatrix}
>$$
## Matrice Inversa
Data $A \in M_{n}(\mathbb{R})$ diciamo che $A$ è **invertibile** se esiste $B \in M_{n}(\mathbb{R})$ tale che :
$$\LARGE
AB=BA=I_{n}
$$
In questo caso scriviamo $B=A^{-1}$
### Come verificare che una matrice sia invertibile?
#### Algoritmo di Gauss
Supponiamo di avere $A \in M_{n}(\mathbb{R})$ ivertibile

---
# Spazi di una matrice
## Spazio delle colonne
Data $A \in M_{m,n}(\mathbb{R})$ lo **spazio delle colonne** è il [[Sottospazi Vettoriali|sottospazio vettoriale]] di $\mathbb{R}^m$ cosi' definito :
$$\large
Col(A)=Span(\text{Colonne di A})
$$
## Spazio delle righe
Data $A \in M_{m,n}(\mathbb{R})$ lo **spazio delle righe** è il [[Sottospazi Vettoriali|sottospazio vettoriale]] di $\mathbb{R}^m$ cosi' definito :
$$\large
Row(A)=Col(A^T)
$$


---
# Operazioni tra matrici
## Somma
Date 2 matrici $A,B\in M_{m,n}(\mathbb{R})$, è possibile effettuare la loro **somma**, <mark style="background: #FF5582A6;">coefficiente per coefficiente</mark>

La Matrice $C=A+B$ <u>ha come coefficiente di posto $(i,j)$</u> l'elemento <mark style="background: #FF5582A6;">$c_{i,j}=a_{i,j}+b_{i,n}$</mark>

>[!example] Esempio di somma tra matrici
>$$\begin{pmatrix}1 & 0 & -1 \\ 3 & -5 & 1\end{pmatrix} +
>\begin{pmatrix}-1 & 2 & -1 \\ 1 & 7 & 2\end{pmatrix} = 
>\begin{pmatrix}0 & 2 & -2 \\ 4 & 2 & -1 \end{pmatrix}
>$$

## Prodotto
Se $A \in M_{m,s}(\mathbb{R})$ e $B\in M_{s,n}$, definiamo il **prodotto** $c_{i,j}$ della riga $i$ di $A$ e della colonna $j$ di $B$ come :
$$
c_{ij}=(a_{i1}\quad a_{i2} \quad \dots \quad a_{is}) \begin{pmatrix}b_{ij} \\ b_{2j} \\ \vdots \\ b_{sj}\end{pmatrix} = 
a_{i1}b_{1j}+a_{i2}b_{2j}+\dots+a_{is}b_{sj}
$$
indicato in forma compatta come :
$$
\large c_{ij}=\sum^s_{h=1}a_{ih}b_{hj}
$$
**In pratica** l'elemento $c_{i,j}$, ($i-$esima riga, $j-$esima colonna del risultato) è la <mark style="background: #FF5582A6;">somma dei prodotti tra tutta la  $i-$esima Riga della prima matrice e tutta la  $j-$esima colonna Colonna della seconda</mark>

<mark style="background: #FF5582A6;">Il prodotto non è commutativo</mark>
$$\LARGE AB\not=BA
$$


A questo punto definiamo il <u>prodotto di $A$ e $B$</u> come : <mark style="background: #FF5582A6;">$C=AB=(c_{ij})_{\substack{i=1,\dots m\\ j=1,\dots ,n}}$</mark>
>[!example] Esempio di prodotto
>$$
>C =
>\begin{pmatrix}
>1 & 0 & 3 & -1 \\
>0 & -2 & 2 & 1 \\
>1 & 0 & -1 & 0
>\end{pmatrix}
>\begin{pmatrix}
>0 & 1 \\
>-3 & 5 \\
>1 & 0 \\
>2 & -1
>\end{pmatrix}
>=
>\begin{pmatrix}
>1 & 2 \\
>10 & -11 \\
>-1 & 1
>\end{pmatrix}
>$$

---
# Trasformare un [[Sistemi Lineari|sistema lineare]] in matrice
Prendendo in considerazione il sistema lineare della forma :
$$
\begin{cases}
a_{11}x_{1}+a_{12}+x_{2}+\dots+a_{1n}+x_{n}=b_{1} \\
a_{21}x_{1}+a_{22}+x_{2}+\dots+a_{2n}+x_{n}=b_{2}  \\
\vdots \\
a_{m1}x_{1}+a_{m2}+x_{2}+\dots+a_{mn}+x_{n}=b_{m}  
\end{cases}
$$
e lo vogliamo trasformare in una matrice nella forma
$$ \LARGE
Ax=b \qquad (A|b) \text{ matrice completa}
$$
Dove : 
- **$A=(a_{ij})$** è la matrice $m \times n$ dei <mark style="background: #FFB86CA6;">coefficienti delle incognite</mark>
- **$x$** è la colonna delle <mark style="background: #FFB86CA6;">$n$ incognite</mark>
- **$b$** è la colonna degli <mark style="background: #FFB86CA6;">$m$ termini noit</mark>

$$
\begin{cases}
a_{11}x_{1}+a_{12}+x_{2}+\dots+a_{1n}+x_{n}=b_{1} \\
a_{21}x_{1}+a_{22}+x_{2}+\dots+a_{2n}+x_{n}=b_{2}  \\
\vdots \\
a_{m1}x_{1}+a_{m2}+x_{2}+\dots+a_{mn}+x_{n}=b_{m}  
\end{cases}
\to
\left( \begin{array}{cccc|c} a_{11} & a_{12} & \dots & a_{1n} & b_1 \\ a_{21} & a_{22} & \dots & a_{2n} & b_2 \\ \vdots & \vdots & & \vdots & \vdots \\ a_{m1} & a_{m2} & \dots & a_{mn} & b_m \end{array} \right)
$$
>[!example] Esempio di trasformazione
>$$
>\begin{cases}
>2x-3y+z=5 \\
>y-4z=-2 \\
-x+2y=0
\end{cases}
>\to
\left(\begin{array}{ccc|c}
>2 & -3 & 1 & 5  \\
>0 & 1 & -4 & -2  \\
>-1 & 2 & 0 & 0
\end{array}\right)
>$$

---
# Risolvere un [[Sistemi Lineari|sistema lineare]] con le matrici
## Teorema di Rouché Capelli per matrici ridotte a scala
Si consideri una [[Matrici#Matrici ridotte a scala|matrice ridotta a scala]] si ha <mark style="background: #FF5582A6;">una sola</mark> delle seguenti possibilità :
1. $r(A)\not=r(A|b)$ il sistema <mark style="background: #FF5582A6;">non ha soluzioni</mark>
2. $r(A)=r(A|b)$ il sistema ammette un <mark style="background: #FF5582A6;">unica soluzione</mark>
3. $r(A)=r(A|b)=r\text{(rango)}<n\text{(n. incognite)}$ il sistema ammette <mark style="background: #FF5582A6;">infinite soluzioni</mark> dipendenti da $n-r$ parametri

>[!example] Esempio $r(A)=r(A|b)=n$
>$$
>\begin{cases}
>x_{1}-x_{2}+x_{3}=2 \\
>x_{2}-x_{3}=0 \\
>x_{3}=1
\end{cases}
>\to (A|b) = 
>\left(\begin{array}{ccc|c}
>1 & -1 & 1 & 2  \\
>0 & 1 & -1 & 0 \\
>0 & 0 & 1 & 1
\end{array}\right)
>$$
>$(A|b)$ è una <mark style="background: #FF5582A6;">matrice ridotta a scala</mark>, inoltre :
>$$
>r(A)=r(A|b)=3=n
>$$
>Ha un unica soluzione data $(2,1,1)$

>[!example] Esempio $r(A)=r(A|b)=r<n$
>$$
>\begin{cases}
>x_{1}-x_{2}+3x_{3}-2x_{4}=0 \\
>x_{2}-4x_{4}=0 \\
>x_{4}=1
\end{cases}
>\to(A|b) =
>\left(\begin{array}{cccc|c} 
>1 & -1 & 3 & -2 & 0 \\
>0 & 1 & 0 & -4 & 0  \\
>0 & 0 & 0 & 1 & 1
\end{array}\right)
>$$
>La matrice è <mark style="background: #FF5582A6;">ridotta a scala</mark>
>$$r(A)=r(A|b)=3(r)<4(n)$$
>Ho <mark style="background: #FF5582A6;">infinite soluzioni</mark> dipendenti da : <mark style="background: #ADCCFFA6;">$4-3=1$ parametri</mark>

## Algoritmo di gauss per matrici generiche
Permette di passare da una matrice $A$ a una matrice $A'$ [[#Matrici ridotte a scala|ridotta a scala]] attraverso operazioni elementari
### Operazioni elementari permesse
1. **Scambiare** 2 righe
2. **Moltiplicare** una riga per $\alpha \not=0$
3. **Sostituire** la i-esima riga $R_{i}$ con la somma <mark style="background: #ADCCFFA6;">$R_{i}+\alpha R_{j}$ con $\alpha \not=0$ </mark>