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
## Rappresentazione Cartesiana di una retta
Possiamo definire una **retta** all'interno della struttura lineare in <mark style="background: #BBFABBA6;">2 forme distinte</mark>
1. Forma Implicita
   $$
   a_{1}x_{1}+a_{2}x_{2}=c
   $$
   Dove :
	- **$\vec{a}$** : è il <mark style="background: #ADCCFFA6;">vettore perpendicolare alla retta</mark>, cambiando il valore di $a_{1},a_{2}$ si <mark style="background: #BBFABBA6;">cambia la l'**inclinazione** della retta</mark>
	- **$\vec{x}$** : è il <mark style="background: #ADCCFFA6;">vettore delle coordinate variabili</mark>, rappresentano un punto generico.
	  <mark style="background: #BBFABBA6;">Un punto appartiene alla retta se sostituendo i suoi valori ad $\vec{x}$ rendono vera l'uguaglianza</mark>
	- **$c$** : è il <mark style="background: #ADCCFFA6;">termine noto</mark>, determina la <mark style="background: #BBFABBA6;">distanza dall'origine</mark>
2. Forma Esplicita
   $$x_{2}=-\frac{{a_{1}}}{a_{2}}x_{1}+\frac{{c}}{a_{2}}$$
   Dove : 
	- **$-\frac{{a_{1}}}{a_{2}}(m)$** : è il <mark style="background: #ABF7F7A6;">coefficiente angolare</mark>, rappresenta la <mark style="background: #BBFABBA6;">pendenza della retta</mark>
	- **$\frac{c}{a_{2}}(q)$** : è il <mark style="background: #BBFABBA6;">punto di intersezione con l'asse verticale</mark> 
	- **$x_{1}$** : Funge da variabile indipendente (input)
	- **$x_{2}$** : È la variabile dipendente (output), cioè il valore  che calcoli una volta scelto un punto sull'asse orizzontale
##  Rappresentazione parametrica
La rappresentazione parametrica descrive la retta come l'insieme di tutti i punti $\vec{x}$ che si ottengono partendo da un insieme di punti $\vec{x_{0}}$ e muovendosi lungo la direzione di $\vec{v}$

Si scrive in forma :
$$
\begin{cases}
x_{1} = x^0_{1}+v_{1}t \\
x_{2}=x^0_{2}+v_{2}t
\end{cases}
$$
Composta da : 
- **$\vec{x_{0}}$** : È un punto qualsiasi <mark style="background: #BBFABBA6;">appartenente alla retta</mark>
- **$\vec{v}$** : È il vettore direzione, indica <mark style="background: #BBFABBA6;">dove "punta" la retta</mark>
- **$t\in \mathbb{R}$** : È il parametro

## Rappresentazione Parametrica $\iff$ Rappresentazione Cartesiana
### Rappresentazione Parametrica $\to$ Rappresentazione Cartesiana 
Partiamo dal sistema
$$
\begin{cases}
x_{1}=x^0_{1}+tv_{1} \\
x_{2}=x^0_{2}+tv_{2}
\end{cases}
$$
1. **Isoliamo $t$** dalla prima equazione (assumendo $v_{1}\not=0$)
   $$t=\frac{{x_{1}-x^0_{1}}}{v_{1}}$$
2. **Sostituiamo** il valore di $t$ nella seconda equazione
   $$x_{2}=x^0_{2}+v_{2}\left( \frac{{x_{1}-x^0_{1}}}{v_{1}} \right)$$
3. **Riordiniamo** i termini per portarli in forma cartesiana
   $$-v_{2}x_{1}+v_{1}x_{2}=v_{1}x^0_{2}-v_{2}x^0_{2}$$
### Rappresentazione Cartesiana $\to$ Rappresentazione Parametrica
1. **Trovare** $\vec{v}$
   $$\vec{v}=\begin{pmatrix}
-a_{2} \\
a_{1}
\end{pmatrix}$$
2. **Trovare** $\vec{x_{0}}$
	1. Poni una variabile a zero (esempio $x_{1}=0$)
	2. Risolvi l'equazione per trovare l'altra variabile ($x_{2}=\frac{c}{a_{2}}$)
	3. $\vec{x_{0}}=\begin{pmatrix}0 \\ \frac{c}{a_{2}}\end{pmatrix}$
3. **Riscrivi** il sistema
   $$
   \begin{cases}
x_{1} = 0 + t \cdot t(-a_{2}) \\
x_{2} = \frac{c}{a_{2}} + ta_{1}
\end{cases}
   $$
## Possibili casi dell'equazione di una retta
### $c=0$
In questo caso abbiamo una <mark style="background: #ADCCFFA6;">retta passante per l'origine </mark>
![[Pasted image 20260303185811.png]]
E possiamo leggere l'equazione
$$\Large
a_{1}x_{1}+a_{2}x_{2}=0
$$
come [[#Definizione Prodotto Scalare (Coordinate Polari)|prodotto scalare]] 
$$\Large \vec{a} \cdot \vec{x}=0$$
La retta è <mark style="background: #BBFABBA6;">composta da tutti i vettori [[#Cosa significa ortogonalità?|ortogonali]] ad $\vec{a}$</mark>

### $c \not = 0$
In questo caso traslo la mia retta in modo tale che passi per l'origine

1. **Ipotizzo** che ${\vec{x_{0}}=\begin{pmatrix}x^0_{1}  \\ x^0_{2}\end{pmatrix}}$ sia un 
2. **Avrò**
   $$\begin{gather} a_{1}x^0_{1}+a_{2}x^0_{2}=c \\
   a_{1}x_{1}+a_{2}x_{2}=a_{1}x^0_{1}+a_{2}x^0_{2} \\
   a_{1}(x_{1}-x^0_{1})+a_{2}(x_{2}-x^0_{2})=0 \quad \text{Questo è un prodotto scalare}
 \\ \\
\vec{a} \cdot(\vec{x}-\vec{x_{0}})=0
\end{gather}$$
---
# Sistemi Lineari di Rette
Dato
$$
\begin{cases}
a_{11}x_{1}+a_{12}x_{2}=b_{1} \\
a_{21}x_{1}+a_{22}x_{2}=b_{2}
\end{cases}
$$
Questo sistema composto da 2 [[#Retta nel piano|rette nel piano]] ha <mark style="background: #BBFABBA6;">3 possibili soluzioni</mark> che <mark style="background: #ADCCFFA6;">dipendo dalla presenza di **parallelità**</mark> tra le rette o meno
## Quando 2 rette sono parallele?
### Parallelismo nella rappresentazione Cartesiana
Posso dire che due rette sono parallele quando $\vec{a_{1}},\vec{a_{2}}$ sono proporzionali, ossia :
$$
\exists k\in \mathbb{R} \setminus \{ 0 \} \text{ tale che}
$$
$$

$$

### Parallelismo nella Rappresentazione Parametrica
Posso dire che 2 rette sono parallele se i loro vettori direzione ($\vec{v}$) sono proporzionali
$$
\begin{cases}
x_{1} = x^0_{1}+tv_{1} \\
x_{2}=x^0_{2}+sv_{2}
\end{cases}
$$
sono parallele se :
$$\exists k\in \mathbb{R} \setminus \{ 0 \}:v_{1}=kv_{2}$$