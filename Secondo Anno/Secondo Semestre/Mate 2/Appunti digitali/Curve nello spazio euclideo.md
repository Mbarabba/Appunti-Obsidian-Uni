# Definizione
Una curva parametrizzato nello spazio euclideo $\mathbb{R}^n$ è una <mark style="background: #BBFABBA6;">funzione a valori vettoriali</mark>
$$
\vec{x}:[a,b] \subset \mathbb{R} \to \mathbb{R}^n
$$
che associa a ogni valore del parametro $t \in [a,b]$ un vettore in $\mathbb{R}^n$

$$
\vec{x}(t)=\begin{bmatrix}
x_{1}(1) \\
\vdots \\
\vdots \\
x_{i}(i) \\
\vdots \\
x_{n}(t)
\end{bmatrix}
$$

dove le funzioni 
$$
x_{i}=x_{i}(t), \quad 1 \leq i \leq n
$$
si chiamano <mark style="background: #BBFABBA6;">componenti della curva</mark>

---
# Vettore velocità
Assumiamo che le funzioni $x_{i}(t)$ sia derivabili con **continuità**, ciò significa : 
- La funzione è derivabile in ogni punto dell'intervallo
- La funzione derivata non presenta "salti" o interruzioni

Definiamo come vettore velocità la funzione come la derivata delal funzione vettoriale
$$
\frac{dx}{dt}=\left( \frac{dx_{1}}{dt} ,\dots, \frac{dx_{n}}{dt}\right)
$$
$$
\vec{x}' = \begin{bmatrix}
x'_{1}(\overline{t}) \\
\vdots \\
\vdots \\
x'_{n}(\overline{t})
\end{bmatrix}
$$
calcolato in $t=\overline{t}$ (un valore a scelta di $t$) chiamato vettore tangente alla curva nel punto $(x_{1}(\overline{t}),\dots,x_{n}(\overline{t}))$

## Esempio
$$
\begin{gather} \vec{x} = \begin{bmatrix}
x_{1} = 3t+1 \\
x_{2} = t+2
\end{bmatrix} \\  \\
\vec{x}'(t)= \begin{bmatrix}
3 \\
1
\end{bmatrix} \\
 \\
\text{ oppure lo possiamo interpretare come moto rettilineo uniforme} \\
 \\
\vec{x}(t)=\vec{x_{0}}+t \vec{v} \\
\vec{x}(t)=\begin{bmatrix}
1 \\
2
\end{bmatrix} + t \begin{bmatrix}
3 \\
1
\end{bmatrix}
\end{gather}
$$
---
# Curve Regolari
## Definizione
Assumiamo che la funzione 
$$
\vec{x}:[a,b] \subset \mathbb{R} \to \mathbb{R}^n
$$
soddisfi le seguenti proprietà : 
- È **iniettiva**, $\vec{x}(t_{1}) \not= \vec{x}(t_{2}) \quad t_{1} \not= t_{2}$
- La funzione **derivata** di $\vec{x}$ sia **continua** $\vec{x}'(t) > 0 \quad \forall t \in [a,b]$

Allora possiamo affermare che $\vec{x}$ è una **Curva Regolare**
### Cosa rappresenta
La regolarità di una curva <mark style="background: #BBFABBA6;">rappresenta l'idea di un moto fluido e continuo</mark>
- Assenza di fermate
- Esistenza della retta tangente (esistenza della derivata)
### Differenza tra curva semplice e curva chiusa
- Una curva si dice **semplice** se non si interseca mai con se stessa
- Una curva si dice **chiusa** se il suo punto finale coincide esattamente con il suo punto iniziale
## Lunghezza di una curva
La lunghezza di una curva regolare definito dalle equazioni parametriche è definita come

$$\Large
l = \int^a_{b} ||\vec{x}'(t)|| dt \quad \text{ ossia}$$
$$\Large
l = \int^a_{b} \sqrt{ (x_{1}')^2 + \dots + (x'_{n})^2 } dt
$$
### Cosa rappresenta?
- **Geometricamente**
  Se potessi "raddrizzare" la curva come se fosse uno spago e misurarla con un righello, otterresti il valore di $l$
- **Fisicamente**
  Rappresenta lo spazio totale percorso
---
# Moto Rettilineo Uniforme
Consideriamo la curva 
$$\large
\vec{x}(t)=\vec{x_{0}} + t\vec{v}
$$
$$\large \text{con } t\in [a,b]$$
Si tratta del segmento di retta con congiunge i punti
$$
\begin{gather}\vec{x_{a}} = \vec{v}a + \vec{x_{0}} \quad \text{ e } \\
\vec{x_{b}} = \vec{v}b+ \vec{x_{0}}
\end{gather}
$$
il vettore tangente
$$
\frac{dx}{dt}=\vec{v} \to \vec{x'}=\vec{v}
$$
è costante
## Cosa rappresenta?
Rappresenta la velocità **costante** <mark style="background: #BBFABBA6;">a cui stiamo percorrendo la curva</mark>

---
# Moto rettilineo non uniforme
Consideriamo la curva in $\mathbb{R}^2$ di equazioni parametriche
$$\large
\begin{cases}
x(t)=t^3 \\
y(t)=t^3
\end{cases}
\qquad \text{ con } t\in \mathbb{R}
$$
Eliminando il parametro si ottiene
$$\large
x = y
$$
Al variare di $t$ i punti sono situati sulla bisettrice tra il $1°$ e il $3°$ quadrante

Il vettore tangente
$$
\begin{gather} \vec{x}' = 3t^2 \\
\vec{y}'=3t^2
\end{gather}
$$
non è però costante
## Cosa rappresenta
Rappresenta la velocità **variabile** <mark style="background: #BBFABBA6;">a cui stiamo percorrendo la curva</mark>

---
# Parametrizzazione di una Circonferenza
Data una circonferenza di raggio $R$ centrata nell'origine $(0,0)$, la posizione di un punto generico $\vec{x}(t)$ è definita dalle funzioni
$$\large
\begin{cases}
x_{1}(t)= R \cos(t) \\
x_{2}(t) = R \sin(t)
\end{cases} \qquad \text{ con }t\in[0,2\pi]
$$
## Vettore Velocità
Derivando le componenti rispetto a $t$, otteniamo il **vettore velocità** della curva
$$\large
\begin{gather} x'_{1} = -R\sin(t) \\
x'_{2}=R\cos(t) 
\end{gather}
$$
## Lunghezza della circonferenza
$$l = \int^b_{a} ||\vec{x'}(t)|| dt = \int^{2\pi}_{0}R dt = 2\pi R$$