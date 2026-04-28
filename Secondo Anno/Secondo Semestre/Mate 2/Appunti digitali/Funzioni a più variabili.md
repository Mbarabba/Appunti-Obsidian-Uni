# Definizione
Data
$$
f : D \subset \mathbb{R}^n \to \mathbb{R}
$$
- $D$ è il **dominio** della funzione

Si chiama grafico di $f$ il sottoinsieme $\mathbb{R}^{n+1}$ definito dai punti nella forma
$$
(x_{1},\dots,x_{n},f(x_{1},\dots,x_{n}))
$$
con $(x_{1},\dots,x_{n})\in D$

## Esempio : Funzioni con $n=1$
Se $n=1$ il grafico di $f$ è la curva nel piano definita dai punti della forma $(x_{1},f(x_{1}))\text{ con } x_{1}\in[a,b]$
### Esempio $f(x)=\sin(x)$
![[desmos-graph.png]]
## Esempio : Funzioni con $n=2$
Se $n=2$ il grafico di $f$ è la superficie nello spazio definita dai punti della forma $(x_{1},x_{2},f(x_{1},x_{2}))$ con $(x_{1},x_{2})\in D$
### Esempio : $f(x,y)=x^2+y^2$
<iframe src="https://www.desmos.com/3d/5rui1zdlrs?embed" 
        width="100%" 
        height="500px" 
        style="border: 1px solid #444; border-radius: 10px;" 
        frameborder="0">
</iframe>
</center>

---
# Limiti
## Definizione
$$\begin{gather} \lim_{ x \to x_{0} } f(x) = l \\
\forall \varepsilon>0 \quad \exists \delta > 0 \text{ tale che } \\
 \\
\text{Se } 0 < \underbrace{\|\mathbf{x} - \mathbf{x}_0\|}_{\sqrt{(x_1 - x_1^0)^2 + \dots + (x_n - x_n^0)^2}} < \delta   \\
 \\
\text{Allora } |f(x)-l|< \varepsilon
\end{gather}
$$

## Quando una funzione è continua?
$f(x)$ è continua in $x_{0}$ se 
$$
\lim_{ x \to x_{0} } f(x)=f(x_{0})
$$