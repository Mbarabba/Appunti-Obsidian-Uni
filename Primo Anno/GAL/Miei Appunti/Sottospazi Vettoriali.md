# Definizione
Sia $W$ un <mark style="background: #FF5582A6;">sottoinsieme dello spazio vettoriale</mark> $V$

Diremo che $W$ è un sottospazio vettoriale di $V$ se <mark style="background: #FF5582A6;">soddisfa le seguenti proprietà</mark> :
1. <mark style="background: #FFF3A3A6;">$W \not= \emptyset$</mark>
2. $W$ è <mark style="background: #FFF3A3A6;">chiuso rispetto alla somma</mark>, cioè $\forall u,v\in W$ si ha che <mark style="background: #BBFABBA6;">$u+v\in W$</mark>
3. $W$ è <mark style="background: #FFF3A3A6;">chiuso rispetto al prodotto</mark> per scalari, cioè $\forall u\in W$ e $\forall \gamma\in \mathbb{R}$ si ha ce <mark style="background: #BBFABBA6;">$\gamma u\in W$</mark>
---
# Sottospazi Vettoriali in $\mathbb{R}^n$
Si consideri una [[Matrici|matrice]] $A\in M_{m,n}(\mathbb{R})$

Lo spazio $W=\{ x \times \mathbb{R}^n : Ax = 0\}=\{ \text{soluzioni del sistema omogeneo associato ad A} \}$

Se $r=r(A)$ e le soluzioni dipendono dai parametri $s_{1},\dots,s_{n-r}$, allora : 
1. $dim(W)=n-r$
2. Una **base** di $W$ si ottiene ponendo, uno alla volta, un parametro pari a $1$ e gli altri pari a 0

Inoltre, dato $Ax=b$ , sia $\overline{x}\in W$ una soluzione particolare 

---
# Esempio di Sottospazio Vettoriale
L'insieme $X = \{ (x,y)\in \mathbb{R}^2:y=0 \}$ è uno sottospazio vettoriale di $\mathbb{R}^2$

X è infatti : 
1. **Non vuoto**, <mark style="background: #BBFABBA6;">contiene le infinite coppie di numeri reali $(x,0)$</mark>
2. **Chiuso rispetto alla somma**
   Presi due elementi $(x_{1},0),(x_{2},0)$ in $X$, la loro somma <mark style="background: #BBFABBA6;">$(x_{1},0)+(x_{2},0)=(x_{1}+x_{2},0)\in X$</mark>
3. **Chiuso rispetto al prodotto** per scalari
   Presi un qualsiasi $\alpha\in \mathbb{R}$ e un qualsiasi elemento $(x,0)\in X$, il prodotto <mark style="background: #BBFABBA6;">$\alpha(x,0)=(\alpha x,0)\in X$</mark>