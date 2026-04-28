Richiede di trovare i punti di massimi / minimo assoluto di una funzione delimitata da una figura geometrica definita da dei punti sul piano

---
# Passo 1 : Controllare che la funzione sia compatta 
# Passo 2 : Trovare i punti stazionari della funzione
1. Calcoliamo $\nabla f(x,y)$
2. Risolviamo il sistema $\nabla f=0$ per trovare i punti stazionari
3. Considerare solo i punti all'interno della figura del piano
## Esempio
$$f(x,y)=x^2-2xy+2y$$
nel rettangolo $$D= \{ (x,y)\in \mathbb{R}^2 : 0\leq x \leq3, 0\leq y \leq 2 \}$$
$$\begin{gather} \nabla f = \begin{bmatrix}
f_{x} \\
f_{y}
\end{bmatrix} = \begin{bmatrix}
2x-2y \\
-2x+2
\end{bmatrix} \\ \\ 
\begin{cases}
2x-2y=0 \\
-2x+2= 0
\end{cases}\begin{cases}
2x=2y \implies x=y=1 \\
x=1
\end{cases} \\ \\
\text{Otteniamo il punto } P_{1}(1,1)\in D
\end{gather}
$$
# Passo 3 : Ispezione del bordo
1. Parametrizziamo ogni lato
2. Sostituiamo la parametrizzazione in $f(x,y)$ per ottenere una funzione di una sola variabile $F(t)$
3. Troviamo i punti dove $F'(T)=0$ lungo quel segmento
## Esempio
$$
\begin{aligned}
&\text{Lato I } (x=t,y=0) &: F_I(t) = t^2 &\implies F_I'(t) = 2t &\implies 2t = 0 \implies t = 0 \implies \mathbf{P_2(0, 0)} \\
&\text{Lato II } (x=3, y=t) &: F_{II}(t) = 9 - 4t &\implies F_{II}'(t) = -4 &\implies -4 \neq 0 \implies \text{Nessun punto} \\
&\text{Lato III } (x=t,y=2) &: F_{III}(t) = t^2 - 4t + 4 &\implies F_{III}'(t) = 2t - 4 &\implies 2t - 4 = 0 \implies t = 2 \implies \mathbf{P_3(2, 2)} \\
&\text{Lato IV } (x=0, y=t) &: F_{IV}(t) = 2t &\implies F_{IV}'(t) = 2 &\implies 2 \neq 0 \implies \text{Nessun punto}
\end{aligned}
$$
# Passo 4 : Controllo dei vertici della figura
1. Calcoliamo la funzione passandogli come parametri i vertici della figura
2. Categorizziamo i punti come Massimo / Minimo assoluto
## Esempio
I punti da studiare sono
$$\begin{gather} P_{1}(1,1) \\
P_{2}(0,0) \\
P_{3}(3,0) \\
P_{4}(3,2) \\
P_{5}(0,2) \\
P_{6}(2,2)
\end{gather}
$$
I cui valori sono
$$\begin{gather}
f(0,0)=0 \implies \text{Minimo Assoluto} \\
f(3,0)=9 \implies \text{Massimo Assoluto}\\
f(3,2)=1 \\
f(0,2)=4 \\
f(1,1)=1 \\
f(2,2)=0 \implies \text{Minimo Assoluto}
\end{gather}
$$