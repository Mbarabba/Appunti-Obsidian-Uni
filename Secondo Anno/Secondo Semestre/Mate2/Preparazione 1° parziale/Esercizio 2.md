Richiede di trovare i punti stazionari data una funzione a 2/3 variabili e 1 o più vincoli

Per risolverlo ho 2 metodi

---
# Metodo della Parametrizzazione
## Cosa fa?
Invece di studiare la funzione $f(x,y)$ su tutto il piano, la "costringiamo" a vivere solo sopra il vincola $g(x,y)=k$

Analiticamente, riduce il problema da due variabili $(x,y)$ a una sola variabile
## Quando usarlo?
Conviene usarlo quando il vincolo è "esplicitabile" o ha una forma geometrica nota
- Rette / segmenti
- Parabole
- Circonferenze / Ellissi
## Procedimento
1. **Parametrizzazione del vincolo**
   Supponiamo di avere una funzione $f(x,y)$ soggetta a un vincolo $g(x,y)=c$
   
   Il primo passo consiste nel trovare una parametrizzazione della curva che rappresenta il vincolo, ovvero esprimere $x$ e $y$ in funzione di un unico parametro $t$
   $$r(t)=(x(t),y(t)) \qquad \text{ Dove }t \in [a,b]$$
	1. $$\begin{gather}f(x,y)=x^2+y^2 \\
	\text{Vincolo : }x+y=1 \\
	 \\
	\text{Parametrizzazione : }\begin{cases}
x=t \\
y=1-t
\end{cases}\end{gather}
	   $$
1. **Definizione della funzione composta**
   Si sostituiscono le espressioni di $x(t)$ e $y(t)$ all'interno della funzione $f(x,y)$ che si vuole studiare
   
   Si ottiene una nuova funzione $F(t)=f(x(t),y(t))$
	1. $$F(t)=t^2+(1-t)^2 = t^2+1-2t+t^2=2t^2-2t+1
	   $$
1. **Ricerca dei punti stazionari**
   A questo putno, i punti di massimo e minimo si trovano cercando i punti stazionari di $F(t)$ ovvero risolvendo l'equazione della derivata rispetto a $t : F'(t)=0$
   
   Una volta trovati i valori critici $t_{k}$, i punti stazionari della funzione vincolata saranno le coordinate corrispondenti sulla curva $(x(t_{k}),y(t_{k}))$
	1. $$\begin{gather}F'(t)=4t-2 \\
	4t-2=0 \implies t=\frac{1}{2} \\ \\
	\text{Sostiusco t nella parametrizzazione iniziale} \\
	\begin{cases}
x = \frac{1}{2} \\
y=1-\frac{1}{2}=\frac{1}{2}
\end{cases} \\ \\
P\left( \frac{1}{2}, \frac{1}{2} \right)
\end{gather}$$
---
# Metodo del moltiplicatore di Laplace
## Cosa fa?
Invece di "schiacciare" la funzione sul vincolo, questo metodo sfrutta la geometria dei vettori

L'idea è che nei punti di massimo o minimo vincolato, $\nabla f$ e $\nabla g$ devono essere paralleli
## Quando usarlo?
- Quando parametrizzare il vincolo è troppo difficile / impossibile
- Quando hai più vincoli contemporaneamente
- In generale, è il metodo standard e più veloce
## Procedimento
1. **Scrivi il sistema di Lagrange**
   Bisogna risolvere un sistema di 3 equazioni (per 2 variabili) dove compare una nuova variabile $\lambda$, chiamata moltiplicatore di lagrange
   $$\begin{cases}
\nabla f = \lambda \nabla g \\
g(x,y)=c
\end{cases} \implies\begin{cases}
f_{x} = \lambda g_{x} \\
f_{y} = \lambda g_{y} \\
g(x,y)=x
\end{cases}
   $$
	1. $$\begin{gather} f(x,y) = x^2+y^2 \\ 
	g(x,y)= x+y+1 \\ \\
	\nabla  f = \begin{bmatrix}
f_{x} \\
f_{y}
\end{bmatrix} = \begin{bmatrix}
2x \\
2y
\end{bmatrix} \\
\nabla g =\begin{bmatrix}
g_{x} \\
g_{y}
\end{bmatrix} = \begin{bmatrix}
1 \\
1
\end{bmatrix} \\
 \\
\begin{cases}
2x=\lambda \cdot 1 \\
2y = \lambda \cdot 1 \\
x+y = 1
\end{cases}
\end{gather}
	   $$
2. **Risolvere il sistema**
	1. $$\begin{gather}\begin{cases}2x = \lambda  \\
	2y = \lambda \\
	x+y=1\end{cases}\implies x=y \implies x+x=1 \implies 2x = 1 \implies x = \frac{1}{2} \\
	 \\
	x=y=\frac{1}{2}\implies \text{Il punto critico è } \left( \frac{1}{2}, \frac{1}{2} \right)
\end{gather}
	   $$
---
# Lagrange in $\mathbb{R}^3$ con più vincoli
Dobbiamo modificare $\nabla f$
$$
\nabla f = \begin{bmatrix}
f_{x} \\
f_{y} \\
f_{y}
\end{bmatrix}
$$
Inoltre il sistema ora avrà 5 equazioni, inoltre  dobbiamo aggiungere un moltiplicatore per ogni vincolo
$$ \nabla f=\lambda \nabla g_{1}+\mu \nabla g_{2} \implies
\begin{cases}
f_{x}=\lambda(g_{1})_{x} + \mu(g_{2})x \\
f_{y}=\lambda(g_{1})_{y} + \mu(g_{2})y \\
f_{z}=\lambda(g_{1})_{z} + \mu(g_{2})z \\
g_{1}(x,y,z)=c_{1} \\
g_{2}(x,y,z)=c_{2}
\end{cases}
$$