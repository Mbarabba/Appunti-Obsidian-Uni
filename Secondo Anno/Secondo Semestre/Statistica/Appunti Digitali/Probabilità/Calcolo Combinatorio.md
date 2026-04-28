# Premessa
Consideriamo uno [[Assiomi della probabilità#Spazio di probabilità|spazio di probabilità uniforme]] $(\Omega,P)$
- $P(A)=\frac{{|A|}}{|\Omega|}=\frac{\text{Casi favorevoli}}{\text{Casi Possibili}} \quad \forall A \subseteq \Omega$
- $P(\{ w \})=\frac{1}{\Omega}=\frac{1}{n} \quad \forall w\in \Omega$

È il modello appropriato per descrivere esperimenti aleatori i cui esiti $w\in \Omega$ siano tutti **equiprobabili**

Quando si dice "scegliamo  casualmente una persona / oggetto in un inseme finito" senza ulteriori specifiche, <mark style="background: #BBFABBA6;">si sottointende che la scelta è in modo uniforme</mark>

Affichè la probabilità uniforme sia ben definita lo spazio campionario $\Omega$ deve essere finito

In uno spazio di probabilità uniforme, calcolare una probabilità significa contare gli elementi di un insieme
$$
P(A)=\frac{{|A|}}{|\Omega|}
$$
Contare è un problema non banale per insiemi grandi, le tecniche di conteggio formano il **calcolo combinatorio**

---
# Proprietà di Base
Fissiamo uno [[Assiomi della probabilità#Spazio di probabilità|spazio di probabilità]] $(\Omega,P)$
1. $P(\Omega)=1$
2. se $A \cap B = \emptyset \quad P(A \cup B) = P(A) + P(B)$

Da questi assiomi si deducono queste proprietà
- $P(\emptyset)=0$
  La probabilità che l'evento vuoto si verifichi è nulla
- $P(A^c)=1-P(A)$
  La probabilità che $A$ non si verifichi è uguale alla certezza meno la probabilità che $A$ si verichi
- $P(A \cup B) = P(A)+P(B)-P(A \cap B)$
- $\text{Se } A \subseteq B \text{ allora } P(A) \leq P(B)$

>[!Example] Esempio "almeno Uno"
>Qual'è la probabilità di ottenere almeno un 6 lanciando 2 dadi regolari a sei facce
>- $\Omega=\{ 1,2,3,4,5,6 \} \times \{ 1,2,3,4,5,6 \} = \{ (x,y) : 1\leq x,y \leq 5 \}$
>- $P = \text{Probabilità uniforme su } \Omega$
>- $A = \text{"esce almeno un 6"}=\{ w=(x,y)\in \Omega: x=6  \}$
>
>$$
>\Omega = \left\{ \begin{matrix} (1,1) & (1,2) & (1,3) & (1,4) & (1,5) & (1,6) \\ (2,1) & (2,2) & (2,3) & (2,4) & (2,5) & (2,6) \\ (3,1) & (3,2) & (3,3) & (3,4) & (3,5) & (3,6) \\ (4,1) & (4,2) & (4,3) & (4,4) & (4,5) & (4,6) \\ (5,1) & (5,2) & (5,3) & (5,4) & (5,5) & (5,6) \\ (6,1) & (6,2) & (6,3) & (6,4) & (6,5) & (6,6) \end{matrix} \right\} \implies |\Omega|= 6 \times 6 = 36
>$$
>
>- Soluzione 1
>  $$
>  |A| = 11 \to P(A)=\frac{{|A|}}{|\Omega|}=\frac{11}{36}
>  $$
>- Soluzione 2
>  $$\begin{gather} A^c = \text{non esce neanche un 6} = \{ 1,2,3,4,5 \} \times \{ 1,2,3,4,5 \}  \\
>|A^c|=5\times5 = 25 \\ P(A^c)=\frac{{|A^c|}}{|\Omega|}=\frac{25}{36} \to P(A)=1-P(A^c)=1-\frac{25}{36}=\frac{11}{36}
\end{gather}
>  $$

---
# Disposizioni con Ripetizione
## Cosa sono?
Sequenze ordinate di $k$ elementi (anche ripetuti tra ) scelti tra $n$ possibili elementi 
$$\large D'_{n,k} = \underbrace{n \cdot n \cdot \dots \cdot n}_{k \text{ VOLTE}} = n^k $$
## Cosa rappresentano?
Rappresentano il numero di modi in cui puoi scegliere e ordinare un gruppo di oggetti di un insieme, con la possibilità di riutilizzare lo stesso oggetto più volte
## Esempio
Estraggo casualmente 3 persone : qual'è la possibilità che siano tutte nate in primavera?

- $\Omega=\{ \text{compleanni delle 3 persone} \}=\{ (x_{1},x_{2},x_{3}):x_1,x_{2},x_{3}\in Calendario \}$$=\{ \text{disposizioni con ripetizione di 3 elementi estratti dal calendario} \}$
- $|\Omega|=365^3$
- $A$ = Tutti nati in primavera = $[20 marzo, 21 giugno)$ = {disposizioni con ripetizione di 3 elementi estratti dalla primavera}
- $|A|=92^3$

$$P(A)=\frac{|A|}{|\Omega|}=(\frac{92}{365})^3 \simeq 0,016=1,6\%$$
  

---
# Disposizioni Semplici
## Cosa sono?
Sequenze ordinati di $k$ elementi distinti scelti tra $n$ possibili $(\text{con }k\leq n)$
$$\large
D_{n,k}=\frac{n!}{(n-k)!}
$$
## Cosa rappresentano?
Rappresentano il numero di modi in cui posso scegliere e ordinare $k$ oggetti estratti da un insieme di $n$ elementi totali, con la regola ferrea che ogni oggetto può essere scelto una sola volta
## Esempio
Quanti sono i possibili ordini di arrivo di 3 squadre?
$$\large D_{3,3}=\frac{3!}{(3-3)!}=6$$
---
# Combinazioni
## Cosa sono?
Collezioni non ordinate di $k$ elementi distinti scelti tra $n$ elementi possibili 
$$\large
C_{n,k}=\begin{pmatrix}
n \\
k
\end{pmatrix}=\frac{n!}{k!(n-k)!}
$$
## Cosa rappresentano?
Rappresentano il numero di modi in cui puoi selezionare un gruppo di $k$ elementi da un insieme di $n$ oggetti totali, con una <mark style="background: #ADCCFFA6;">regola fondamentale , l'ordine non ha alcuna importanza</mark>
## Esempio
In una "mano" a Poker, un giocatore riceve 5 carte estratte da un mazzo che ne contiene 52

$$C_{52,5}=\begin{pmatrix}
52 \\
5
\end{pmatrix}=\frac{52!}{5!(52-5)!}=2598960$$