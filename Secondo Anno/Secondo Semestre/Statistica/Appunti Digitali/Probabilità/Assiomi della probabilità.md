# Cosa sono?
Sono le regole fondamentali su cui si basa la teoria della probabilità

---
# Spazio campionario
## Cos'è?
Un **esperimento** è un qualunque procedimento che <mark style="background: #BBFABBA6;">produce un'osservazione o esito
</mark>

L'insieme **$\Omega$** <mark style="background: #BBFABBA6;">contiene tutti i possibili esisti dell'esperimento</mark> 
## Esempio
1. Lancio un dado a 6 facce e osservo il **risultato**
   $$\Omega = \{ 1,2,3,4,5,6 \}$$
   $$\text{Questi sono tutti i possibili esiti}$$
2. Intervisto un campione di 1000 elettori e registro **quanti** voteranno per il candidato A
   $$\Omega=\{ 0,1,2,...,999,1000 \}$$
3. Misuro il **tempo di emissione** di una particella radioattiva da un atomo
   $$\Omega=[0.\infty)=\{ x \in \mathbb{R} : x\geq 0 \}$$
---
# Eventi
## Cosa sono? 
Uni <mark style="background: #BBFABBA6;">insieme di esiti $A \subseteq \Omega$</mark> si chiama **evento** 

Diciamo che un evento $A$ si verifica se <mark style="background: #BBFABBA6;">l'esito dell'esperimento è contenuto in $A$</mark>

## Operazioni insiemistiche sugli eventi
- **Unione** $A \cup B \iff \text{ Si verifica A o B (o entrambi)}$
- **Intersezione** $A \cap B\iff \text{Si verificano A e B}$
- **Complementare** $A^c \iff \text{Non si verifica A}$
## Esempio
1. $\Omega=\{ 1,2,3,4,5,6 \}$
	1. $A=\text{"Esce un numero pari"}=\{ 2,4,6 \}$  
	2. $B=\text{"Esce un numero multiplo di 3"}=\{ 3,6 \}$
	3. $C=\text{"Esce un numero pari o multiplo di 3"}=A \cup B = \{ 2,3,4,6 \}$
	4. $D=\text{"Esce un numero pari e multiplo di 3"}=A \cap B= \{ 6 \}$
2. $\Omega=\{ 0,1,2,\dots,999,1000 \}$
	1. $E=\text{"Almeno 550 intervistati votano A"}=\{ 550,551,\dots,1000 \}$
	2. $F=\text{"Meno di 550 intervistati votano A"}=E^c=\{ 0,1,2,\dots,549 \}$
	3. $G=\text{"2000 intervistati votano A"}=\emptyset$
3. $\Omega=[0,\infty)$
	1. $H=\text{"La particella è emessa dopo più di 3600 sec"}=(3600,\infty)=\{ x \in \mathbb{R} : x>3600 \}$
---
# Probabilità
## Cosa è?
Funzione che assegna, in modo **coerente** (rispetta gli assiomi), a ogni evento $A \subseteq \Omega$ un **grado di fiducia** $P(A)$ (tra 0 e 1) che contribuiscono al verificarsi di $A$

$$P:P(\{ A \subseteq \Omega \})\to[0,1]=[0\%,100\%]$$
## Interpretazioni
Sono possibili <mark style="background: #BBFABBA6;">diverse interpretazioni della probabilità</mark>
### Soggettivista
$$P(A)=\text{prezzo "equo" di una scommessa
che paga 1 se si verifica A (altrimenti 0)}$$
>[!example] Esempio
>$$A=\text{L'italia vince i prossimi Europei di calcio}$$
>$P(A)=0.4 : \text{Vendo a 0.41}$
#### Frequentista
$P(A) = \text{Frazione asintotica di volte in cui si verifica A, ripetendo l'esperimento}$
>[!example] Esempio
>$$A= \text{Una moneta dà testa}$$
>$P(A)=0.4 : $ Lanciando N volte la moneta, la frazione di teste è compresa tra il $39\%$ e il $41\%$

---
# Spazio di probabilità
Sia $\Omega$ uno spazio campionario, si dice **probabilità qualsiasi** funzione
$$P:P(\Omega)\to[0,1] \quad \text{ che soddisfa}$$
1. $P(\Omega)$
2. Se $A \cap B = \emptyset : P(A \cup B)=P(A)+P(B)$

La coppia $(\Omega,P)$ è detta **spazio di probabilità**

## Cardinalità
Indichiamo con $|A|$ la **cardinalità** (numero di elementi) di un insieme $A$ 

---
# Probabilità Uniforme
Su un insieme **finito** $\Omega$ dove
- $N=|\Omega|$

$$
P(A)=\frac{{|A|}}{|\Omega|}=\frac{\text{Casi Favorevoli}}{\text{ Casi Possibili}} \qquad \forall A \subseteq \Omega
$$
>[!example] Esempio
>$$\Omega = \{ 1,2,3,4,5,6 \}$$
>Se il dado è equilibrato
>$$P({1})=P({2})=P({3})=P({4})=P({5})=P({6})=\frac{1}{6}$$
>Allora $P$ è la probabilità uniforme
>$$\begin{gather}\forall A \subseteq \Omega \\
>P(A)=\frac{{|A|}}{|\Omega|}=\frac{{|A|}}{6}
\end{gather}$$

