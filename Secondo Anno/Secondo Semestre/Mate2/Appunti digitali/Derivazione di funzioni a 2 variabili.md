# Derivate Parziali
## Definizione
Sia $f$ una funzione di $n$ variabili $x_{1},\dots,x_{2}$, la **derivata parziale** di $f$ rispetto alla variabile $x / y$ è definita nel seguente modo

$$\large
f_{x}(\bar{x},\bar{y})=\lim_{ \Delta x \to 0 } \frac{{f(\bar{x} + \Delta x , \bar{y})-f(\bar{x},\bar{y})}}{\Delta x}
$$
$$\large
f_{y}(\bar{x},\bar{y})= \lim_{ \Delta y \to 0 } \frac{{f(\bar{x},\bar{y}+\Delta y)-f(\bar{x},\bar{y})}}{\Delta y}
$$

## Notazione
Per indicare le derivate parziali si usa anche la notazione $f_{x}$ o $f'_{x}$

---
# Teorema di Schwarz
## Enunciato
Supponiamo che $f$ sia una funzione di $n$ variabili, che possieda derivate parziali fino all'ordine $N$ nell'interno di un punto $P=(x_{1},\dots,x_{n})$

Supponiamo inoltre che le derivate parziali di ordine $N$ siano continue in $P$

Allora le derivate parziali di ordine $N$ in $P$ non dipendono dall'ordine in cui vengono effettuate

## Cosa dice?
Afferma che se una funzione è "abbastanza regolare", l'operatore di derivazione parziale commuta

Questo significa che derivare rispetto a $x$ e poi rispetto a $y$ produce lo stesso risultato del derivare rispetto a $y$ e poi rispetto a $x$

## Esempio
- $n=N=2$ abbiamo l'identità
  $$
  \frac{d^2f}{dxdy}=\frac{d^2f}{dydx}
  $$
- $f = x^2y^3$ abbiamo 
  $$
\begin{aligned}
f_x &= 2xy^3, & f_y &= 3x^2y^2, & f_{xx} &= 2y^3, & f_{xy} &= 6xy^2, \\
f_{yx} &= 6xy^2, & f_{yy} &= 6x^2y, & f_{xxx} &= 0, & f_{xxy} &= 6y^2, \\
f_{xyx} &= 6y^2, & f_{yxx} &= 6y^2, & f_{xyy} &= 12xy, & f_{yxy} &= 12xy, \\
f_{yyx} &= 12xy, & f_{yyy} &= 6x^2.
\end{aligned}
$$
---
# Differenziabilità di una funzione
Dati $P=\{ x_{1},\dots,x_{n} \}$ e $\bar{P}0\{ \bar{x}_{1},\dots,\bar{x}_{n} \}$

$$
f(P)=f(\bar{P})+\sum^n_{i=1}f_{x_{i}}(\bar{P}\Delta x_{i})+o(\rho)
$$
- $\Delta x_{i}=x_{i}-\bar{x}_{i}$
- $\rho=\sqrt{\Delta x^2_{1}+\dots+\Delta x^2_{n}}$

