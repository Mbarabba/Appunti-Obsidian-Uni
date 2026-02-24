# Definizione Equazione Lineare
Si definisce **equazione lineare** su $R$ ogni equazione del tipo
$$a_{1}x_{1}+a_{2}x_{2}+\dots+a_{n}x_{n}=b$$
- **$a_{i}$** viene chiamata <mark style="background: #ADCCFFA6;">coefficiente della incognita</mark>
- **$x_{i}$** viene chiamata <mark style="background: #ADCCFFA6;">incognita</mark>
- **$b_{i}$** viene chiamato <mark style="background: #ADCCFFA6;">termine noto</mark>
---
# Definizione Sistema Lineare
Consideriamo ora <mark style="background: #BBFABBA6;">$m$ equazioni lineari in $n$ incognite</mark>, cioè
$$
\begin{cases}
a_{11}x_{1}+a_{12}x_{2}+\dots+a_{1n}x_{n}=b_{1} \\
a_{21}x_{1}+a_{22}x_{2}+\dots+a_{2n}x_{n}=b_{2} \\
\vdots  \\
a_{m1}x_{1}+a_{m 2}x_{2}+\dots+a_{mn}x_{n}=b_{m}
\end{cases}
$$
Siamo davanti ad un **sistema lineare** di <mark style="background: #ADCCFFA6;">$m$ equazioni ed $n$ incognite</mark>

Un sistema lineare si definisce **risolubile** se <mark style="background: #ADCCFFA6;">ammette soluzioni</mark>

---
# Definizione Soluzione di un Sistema Lineare
Una $n$-pla ordinata di reali è detta **soluzione** del sistema lineare se essa <mark style="background: #ADCCFFA6;">soddisfa tutte le $m$ equazioni del sistema</mark>
### Soluzione Particolare
Ciascuna soluzione del sistema è detta anche **soluzione particolare**
### Soluzione Generale
L'insieme di tutte le soluzioni particolari è detto **soluzione generale**

---
# Trasformare un Sistema lineare in [[Matrici|Matrice]]
Dato un qualsiasi **sistema lineare** <mark style="background: #ADCCFFA6;">possiamo trasformalo nella matrice **$AX=B$</mark>**
$$
\begin{gather}
A \text{ (Matrice incompleta) } = \begin{pmatrix}
a_{11}  & a_{12}  & \dots & a_{1n} \\
a_{21} & a_{22} & \dots & a_{2n} \\
\dots & \dots & \dots & \dots \\
a_{m 1} & a_{m 2} & \dots  & a_{mn}
\end{pmatrix} \\
X \text{ (Matrice colonna delle incognite) } = \begin{pmatrix}
x_{1} \\
x_{2} \\
\vdots \\
x_{n}
\end{pmatrix} \\
B = \begin{pmatrix}
b1 \\
b_{2} \\
\vdots \\
b_{m}
\end{pmatrix} \\
 \\
\end{gather}
$$
La matrice equivalente ad un sistema lineare sarà nella forma
$$
\begin{cases}
2x_{1}-x_{2}+x_{3}=4 \\
x_{1}+3x_{2}-4x_{3}=1 \\
-x_{1}+5x_{2}+6x_{3}=0
\end{cases} \to
A = \left(\begin{array}{ccc|c} 2 & -1 & 1 & 4 \\
1 & 3 & -4 & 1 \\
-1 & 5 & 6 & 0
\end{array}\right)
$$
---
# Teorema di Rouché Capelli : Risolubilità e numero di soluzioni
Sia dato un **sistema lineare** <mark style="background: #ADCCFFA6;">trasposto a [[Matrici#Matrice ridotta a Scala|matrice ridotta a scala]] $AX=B$</mark> si ha che
1. Se **$r(A)\not=r(A|b)$** il sistema <mark style="background: #ADCCFFA6;">non è risolubile</mark>
2. Se **$r(A)=r(A|b)=b$** esiste un <mark style="background: #ADCCFFA6;">unica soluzione</mark>
3. Se **$r(A)=r(A|b)=r<n$** esistono <mark style="background: #ADCCFFA6;">infinite soluzioni</mark> dipedenti da <mark style="background: #BBFABBA6;">**$n-r$** parametri</mark>
---
# Come risolvere un Sistema Lineare
## Sistema Generico
### Regola di Cramer (Termini $k$ e sistemi quadrati)
Un **sistema lineare quadrato ($m=n$)** ha una ed una sola soluzione se e solo se $\det(A)\not=0$

Se ciò è vero, la componente $i$-esima dell'unica soluzione $(k_{1},k_{2},\dots,k_{n})$ di tale sistema è data da
$$
k_{i}=\frac{\det(A^1,A^2,\dots,A^{i-1},B,A^{i+1},\dots,A^n)}{\det(A^1,A^2,\dots,A^{i-1},A^i,A^{i+1},\dots,A^n)}
$$
### Metodo di Gauss (generico sistema)
La risoluzione di un **sistema lineare** si divide in 4 step
1. Trasforma il sistema in matrice completa $AX=B$
2. Riduci la matrice a scala
3. Ritorna al sistema
4. Risolvi il sistema per sostituzione
## Sistema Omogeneo
