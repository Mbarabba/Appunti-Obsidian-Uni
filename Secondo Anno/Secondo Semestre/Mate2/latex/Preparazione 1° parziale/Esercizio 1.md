Richiede di trovare e analizzare la natura dei punti stazionari di una funzione

---
# Passo 1 : Derivate parziali
Prendo la funzione $f(x,y)$ e ne calcolo le derivate parziali $f_{x},f_{y}$
## Esempio
$$f(x,y)=x^3-y^3+xy$$
- $f_{x}=3x^2+y$
- $f_{y}=-3y^2+x$
# Passo 2 : Porre le derivate a sistema
Poniamo le derivate a sistema in modo tale che 
$$
\begin{cases}
f_{x}=0 \\
f_{y}=0
\end{cases}
$$
per trovare i punti stazionari
## Esempio
$$
\begin{cases} 
3x^2 + y = 0 \\ 
-3y^2 + x = 0 
\end{cases}
\implies
\begin{cases} 
3x^2 + y = 0 \\ 
x = 3y^2 
\end{cases}
$$

Sostituendo la seconda nella prima:
$$
3(3y^2)^2 + y = 0 \implies 3(9y^4) + y = 0 \implies 27y^4 + y = 0
$$

Raccogliendo a fattor comune:
$$
y(27y^3 + 1) = 0
$$

Le soluzioni per $y$ sono:
1. $y_1 = 0$
2. $27y^3 + 1 = 0 \implies 27y^3 = -1 \implies y^3 = -\frac{1}{27} \implies y_2 = -\frac{1}{3}$

Calcoliamo le corrispondenti $x$:
- Per $y = 0 \implies x = 3(0)^2 = 0 \implies P_1 = (0, 0)$
- Per $y = -\frac{1}{3} \implies x = 3\left(-\frac{1}{3}\right)^2 = 3 \cdot \frac{1}{9} = \frac{1}{3} \implies P_2 = \left(\frac{1}{3}, -\frac{1}{3}\right)$

**I 2 punti critici sonio :**
$$P_1 = (0, 0), \quad P_2 = \left(\frac{1}{3}, -\frac{1}{3}\right)$$
# Passo 3 : Calcolo Matrice Hessiana
Devo calcolare la matrice :
$$\large
H = \begin{bmatrix}
f_{xx} & f_{xy} \\
f_{xy} & f_{yy}
\end{bmatrix}
$$
## Esempio
- $f_{xx}=6x$
- $f_{xy}=1$
- $f_{y}=-6y$
# Passo 4 : Applico i punti stazionari alla matrice
Ora prendo ciascuno dei punti e lo valuto utilizzando la matrice Hessiana
## Esempio
$$
H(x,y) = \begin{bmatrix} 6x & 1 \\ 1 & -6y \end{bmatrix}
$$
$$
H(P_1) = \begin{bmatrix} 6(0) & 1 \\ 1 & -6(0) \end{bmatrix} = \begin{bmatrix} 0 & 1 \\ 1 & 0 \end{bmatrix}
$$
$$
H(P_2) = \begin{bmatrix} 6\left(\frac{1}{3}\right) & 1 \\ 1 & -6\left(-\frac{1}{3}\right) \end{bmatrix} = \begin{bmatrix} 2 & 1 \\ 1 & 2 \end{bmatrix}
$$
# Passo 5 : Calcolo Determinante e analisi della natura
Calcolo 
$$
\det(H)= f_{xx} \cdot f_{yy} - (f_{xy})^2
$$
- Se $\det(H)>0$
	- E $H_{11}>0 \implies$ Il punto è **minimo locale**
	- E $H_{11}<0 \implies$ Il punto è **massimo locale**
- Se $\det(H)<0 \implies$ Il punto è un **punto sella**
- Se $\det(H)=0 \implies$ Il punto è **indecidibile**
## Esempio
$$
\det(H(P_{1}))=0 \cdot 0 -(1)^2 = -1 < 0 \implies \text{ Punto sella} 
$$
$$
\begin{gather}\det(H(P_{2}))= 2 \cdot 2 -(1)^2=4-1=3>0 \\
H_{11} \text{ e } \det(H)>0 \implies \text{Minimo Locale}
\end{gather}
$$