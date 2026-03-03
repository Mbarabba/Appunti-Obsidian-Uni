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

## Definizione Prodotto Scalare (Coordinate Cartesiane)
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
\text{ Se } \vec{a} \cdot  \vec{b} = 0 \qquad \vec{a},\vec{b} \text{ si dicono ortogonali} \\
 \\
\end{gather}$$
## Definizione Prodotto Scalare (Coordinate Polari)
$$
\begin{gather}\text{Dati 2 vettori}  \\
 \\
\vec{a} = \begin{pmatrix}
||\vec{a}||\cos(\theta) \\
||\vec{a}||\sin(\theta)
\end{pmatrix}, \vec{b}=\begin{pmatrix}
||\vec{b}||\cos(\rho) \\
||\vec{b}||\sin(\rho)
\end{pmatrix} \\
 \\
\vec{a}  \cdot   \vec{b} = ||\vec{a}||||\vec{b}||\cos(\theta)\cos(\rho)+||\vec{a}||||\vec{b}|| \sin(\theta)\sin(\rho) =  \\
||\vec{a}||||\vec{b}||(\cos(\theta)\cos(\rho)+\sin(\theta)\sin(\rho)) \\
 \\
\text{Inoltre, } \theta-\rho=\alpha = \text{L'angolo compreso tra }\vec{a} \text{ e } \vec{b} \\
 \\
\text{ Se } \vec{a} \cdot  \vec{b} = 0 \qquad \vec{a},\vec{b} \text{ si dicono ortogonali}
\end{gather}
$$

Se leggo questa formula al contrario ho che 
$$
\cos(\alpha)=\frac{{\vec{a}  \cdot  \vec{b}}}{||\vec{a}||||\vec{b}||}
$$
![[Drawing 2026-03-03 15.06.05.excalidraw]]
## Come passare da una definizione all'altra
### Cartesiana $\to$ Polare
### Polare $\to$ Cartesiana
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
![[Drawing 2026-03-03 14.13.24.excalidraw]]

---
# Retta nel piano
## Definizione
Possiamo definire una **retta** all'interno della struttura lineare in <mark style="background: #BBFABBA6;">2 forme distinte</mark>
1. Forma Implicita
   $$
   a_{1}x_{1}+a_{2}x_{2}=c
   $$
   Dove 
	- $a_{i}$ 