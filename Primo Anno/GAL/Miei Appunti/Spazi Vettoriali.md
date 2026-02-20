# Definizione
Si dice spazio vettoriale reale un insieme $V$ munito di due operazioni dette rispettivamente :
- **Somma** : $+:V \times V\to V \qquad (u,v)\to u+v$
- **Prodotto** : $\cdot:\mathbb{R} \times V\to V \qquad (\gamma,u)\to \gamma u$

che soddisfano le seguenti proprietà : 
>[!tip] Proprietà somma
>- **Commutativa**, cioè $u+v=v+u\quad \forall u,v\in V$
>- **Associativa**, cioè $(u+v)+w=u+(v+w) \quad \forall u,v,w\in V$
>- Ammette un **elemento neutro**, $\exists0\in V:0+u=u+0=u \quad \forall u\in V$
>- Ogni elemento di $V$ ha un **opposto**, $\forall u\in V\quad\exists a:a+u=u+a=0$

>[!tip] Proprietà prodotto
>- **$1u=u$**
>- **$(\gamma \mu)u=\gamma(\mu u)$**$,\quad \forall u\in V \quad \forall \gamma,\mu\in \mathbb{R}$
>- **$\gamma(u+v)=\gamma u+\gamma v$**, $\quad \forall u,v\in V \quad \forall \gamma\in \mathbb{R}$
>- **$(\gamma+\mu)u=\gamma u+\gamma \mu$**, $\quad \forall u,v\in V\quad \forall \gamma\in \mathbb{R}$

## Definizione di vettore
Gli elementi di uno spazio vettoriali si dicono **vettori** mentre i <mark style="background: #FF5582A6;">numeri reali</mark> si dicono **scalari**

<mark style="background: #FF5582A6;">L'elemento neutro</mark> rispetto alla somma in $V$ si chiama **vettore nullo**

---
# Spazi Vettoriali finitamente generati
Uno spazio vettoriale $V$ si dice **finitamente generato** se $\exists v_{1},\dots,v_{n}:\forall v\in V$ si scrive come [[Combinazioni Lineari|combinazione lineare]] di $v_{1},\dots ,v_{n}$, ovvero $\exists a_{1},\dots ,a_{n}\in \mathbb{R}$ tale che 
$$\LARGE
v=\sum_{i=1}^n a_{i}v_{i}
$$
- $v_{1},\dots,v_{n}$ si dicono **generatori** di $V$
## SPAN
Dati $v_{1},\dots ,v_{k}\in V$ il sottospazio vettoriale generato da $v_{1},\dots,v_{k}$ è <mark style="background: #FFF3A3A6;">l'insieme di tutte le [[Combinazioni Lineari|combinazioni lineari]] di $v_{1},\dots ,v_{k}\qquad (Span)$</mark>
$$\LARGE
Span(v_{1},\dots,v_{k})=\left\{  \sum^k_{i=1} a_{i}v_{i} : a_{i} \in \mathbb{R} \right\}
$$
Allo stesso modo se $S$ è un <mark style="background: #ABF7F7A6;">sottoinsieme di $V$</mark>, il [[Sottospazi Vettoriali|sottospazio vettoriale]] generato da $S$ è<mark style="background: #FFF3A3A6;"> l'insieme di tutte le combinazioni lineari di elementi di $S$</mark>, ovvero : 
$$\LARGE
Span(S)=\left\{  \sum^k_{i=1}a_{i}s_{i}:a_{i}\in \mathbb{R},s_{i}\in S  \right\}
$$
### Esempio
In $\mathbb{R}^3$ prendiamo $v_{1}=\begin{pmatrix}0\\0\\1\end{pmatrix}\quad v_{2}=\begin{pmatrix}0\\1\\0\end{pmatrix}$
$$
\begin{gather} \\
Span(V_{1})=\{ \alpha\begin{pmatrix}0\\0\\1\end{pmatrix} \ : \alpha\in \mathbb{R} \}=\{ \begin{pmatrix}
0\\0\\alpha
\end{pmatrix} : \alpha\in \mathbb{R} \} \\
\\ \\
Span(v_{1},v_{2})=\{ \begin{pmatrix} 0\\ \alpha_{1} \\ \alpha_{2}\end{pmatrix} : \alpha_{1},\alpha_{2} \in \mathbb{R} \}
\end{gather}
$$
---
# Indipendenza lineare
## Vettori linearmente indipendenti
Sia $V$ uno spazio vettoriale, i vettori $v_{1},\dots,v_{n} \in V$ si dicono **linearmente indipendenti** se <mark style="background: #FFF3A3A6;">nessuno di essi può essere espresso come [[Combinazioni Lineari|combinazione lineare]] degli altri vettori dell'insieme $V$</mark>
$$ \LARGE
\sum^k_{i=1} a_{i}v_{i}=0\implies a_{i}=\dots=a_{k}=0
$$
## Vettori linearmente dipendenti 
Sia $V$ uno spazio vettoriale, i vettori $v_{1},\dots,v_{n} \in V$ si dicono **linearmente dipendenti** se <mark style="background: #FFF3A3A6;">nessuno di essi può essere espresso come [[Combinazioni Lineari|combinazione lineare]] degli altri vettori dell'insieme $V$</mark>

## Esempi
### Vettori linearmente indipendenti
$$\LARGE
\begin{pmatrix}
1 \\ 0
\end{pmatrix},
\begin{pmatrix}
0 \\ 1
\end{pmatrix} \in \mathbb{R}^2 \quad \text{ Sono linearmente indipendenti}
$$
$$\LARGE
\begin{pmatrix}
0 \\ 0
\end{pmatrix}=
a_{1}\begin{pmatrix}1 \\ 0\end{pmatrix} +
a_{2} \begin{pmatrix}0 \\ 1\end{pmatrix} = 
\begin{pmatrix}a_{1} \\ a_{2} \end{pmatrix} \implies
a_{1}=a_{2}=0
$$
### Vettori linearmente dipendenti
