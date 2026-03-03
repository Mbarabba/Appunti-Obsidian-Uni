# Struttura Lineare
Definiamo con $\overrightarrow{a} = \begin{pmatrix}a_{1} \\ a_{2}\end{pmatrix}$ il **generico** <mark style="background: #ADCCFFA6;">vettore colonna</mark>
che rispetta 2 regole
1. <mark style="background: #BBFABBA6;">Moltiplicazione per scalare $c\in \mathbb{R}$</mark>
  $$c \overrightarrow{a}=c\begin{pmatrix}
a_{1} \\
a_{2}
\end{pmatrix}=\begin{pmatrix}
ca_{1} \\
ca_{2}
\end{pmatrix}$$
se $c=-1 \to -1 \overrightarrow{a}=\begin{pmatrix}-a_{1} \\ -a_{2}\end{pmatrix} = -\overrightarrow{a}$
2. <mark style="background: #BBFABBA6;">Somma di vettori</mark>
   $$\overrightarrow{a}+\overrightarrow{b}=\begin{pmatrix}
a_{1} \\
a_{2}
\end{pmatrix} + \begin{pmatrix}
b1 \\
b_{2}
\end{pmatrix}=\begin{pmatrix}
a_{1}+b_{1} \\
a_{2}+b_{2}
\end{pmatrix}$$
Questa è anche chiamata <mark style="background: #ADCCFFA6;">regola del parallelogramma</mark>
---
# Definizione
Si definisce struttura euclidea uno [[#Struttura Lineare|struttura lineare]] (nel nostro caso $\mathbb{R}^2$) dotata del **prodotto scalare**

## Definizione Prodotto Scalare
$$\begin{gather} \text{Dati 2 vettori} \\ \\
\vec{a} = \begin{pmatrix}
a_{1} \\
a_{2}
\end{pmatrix}, \vec{b}=\begin{pmatrix}
b_{1} \\
b_{2}
\end{pmatrix}\\  \\
\vec{a} \cdot \vec{b} = a_{1}b_{1} + a_{2}b_{2}
 \\
 \\
\text{ Se } \vec{a} \cdot  \vec{b} = 0 \qquad \vec{a},\vec{b} \text{ si dicono ortogonali}
\end{gather}$$
### Cosa significa ortogonalità?
**L'ortogonalità** è una relazione tra 2 vettori che indica una <mark style="background: #ADCCFFA6;">totale mancanza di "sovrapposizione" nelle loro direzioni</mark>.

---
# Lunghezza di un vettore 
## Definizione
È la misura di intensità di un vettore, rappresenta la distanza geometrica tra il punto di partenza e la punta della freccia

La lunghezza è un numero scalare $\in \mathbb{R}$
## Come calcolarla
$$\Large||\vec{a}||=\sqrt{ \vec{a} \cdot  \vec{a} }$$
## Rappresentazione Grafica
![[Drawing 2026-03-03 11.49.05.excalidraw]]

---
# Distanza tra 2 punti
## Cos'è?
La distanza tra due punti $a_{1}$ e $a_{2}$ è la **lunghezza** del segmento più breve che li congiunge.

Non è altro che la <mark style="background: #BBFABBA6;">lunghezza del vettore differenza tra i 2 punti</mark>
## Come calcolarla
$$\Large d(a_{1},a_{2})=||\vec{b} - \vec{a}||$$
## Rappresentazione Grafica