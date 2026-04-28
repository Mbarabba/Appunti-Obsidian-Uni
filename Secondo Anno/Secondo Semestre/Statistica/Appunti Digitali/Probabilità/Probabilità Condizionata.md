# Definizione
Dati 2 eventi $A$ e $B$ in uno spazio di probabilità, e assumendo che l'evento $B$ sia possibile, la probabilità condizionata di $A$ dato $B$ è definita dal rapporto tra la probabilità dell'intersezione dei 2 eventi e la probabilità dell'evento condizionante
$$
P(A|B)=\frac{{P(A \cap B)}}{P(B)}
$$
## Esempio
Lancia due dati regolari a 6 facce
- Qual'è la probabilità che la somma valga 4?
- Qual'è la probabilità che la somma valga 4 sapendo che il primo dado vale 2

$$\begin{gather}\Omega=\{ 1,2,3,4,5,6 \} \times \{ 1,2,3,4,5,6 \}  \\
= \left\{ \begin{matrix} (1,1), & (1,2), & (1,3), & (1,4), & (1,5), & (1,6), \\ (2,1), & (2,2), & (2,3), & (2,4), & (2,5), & (2,6), \\ (3,1), & (3,2), & (3,3), & (3,4), & (3,5), & (3,6), \\ (4,1), & (4,2), & (4,3), & (4,4), & (4,5), & (4,6), \\ (5,1), & (5,2), & (5,3), & (5,4), & (5,5), & (5,6), \\ (6,1), & (6,2), & (6,3), & (6,4), & (6,5), & (6,6) \end{matrix} \right\}  \\
\implies|\Omega|=6 \cdot 6 = 36 
\end{gather}$$

$$
A = \text{"la somma vale 4} = \{  (1,3),(2,2),(3,1) \} \implies |A|=3
$$

$$
P(A)=\frac{|A|}{|\Omega|}=\frac{1}{12} \simeq 8.3\%
$$

$$
B = \text{Il primo dado vale  2} = \{ (2,1),(2,2),(2,3),(2,4),(2,5),(2,6) \}
$$

$$
P(A|B)=\frac{{P(A \cap B)}}{P(B)}=\frac{{\frac{{|A \cap B|}}{|\Omega|}}}{|B|}=\frac{1}{6}\simeq 16.7\%
$$


---
# Cosa rappresenta? 
Rappresenta l'aggiornamento della misura di probabilità dell'evento $A$ per tenere conto dell'informazione aggiuntiva che l'evento $B$ si è verificato

## In modo informale
Mi dice "ora che si è verificato $B$, queste sono le chance di $A$"

---
# Proprietà
## Formula disintegrazione
$$P(A)=P(A \cap B)+P(A \cap B^c)$$
## Formula delle Probabilità Totali
$$
P(A)=P(A|B) \cdot P(B) + P(A|B^c) \cdot P(B^c)
$$
