>[!Definizione Informale]-
>Mi fornisce delle regole per trasformare una parola in input in una nuova parola appartenente ad un linguaggio L

>[!Definizione formale]-
>- Dati:
>	- V variabili = $V \cap T=$
>	- T terminali (la stringa finale deve essere composta da soli terminali)
>	- P produzioni ($\alpha\rightarrow\beta$)
>	- S start $S \varepsilon V$
>
>>[!EXAMPLE]+ Esempi
>>- V = {numero , cifra}
>>- T = {0 , 1}
>>- P = numero $\rightarrow$ cifra
>>cifra $\rightarrow$ 1
>>cifra $\rightarrow$ 0
>>numero $\rightarrow$ $\varepsilon$
>>- S = numero
>>   
>>Forme Senteziali :
>>numero $\rightarrow$ numero cifra
>>numero cifra $\rightarrow$ numero cifra cifra
>>numero cifra cifra $\rightarrow$ numero 0 cifra
>>numero 0 cifra $\rightarrow$ $\varepsilon$ 0 0 
>>   
>>Elaboro le variabili con le produzioni fino a ritrovarmi una stringa composta da soli terminali
>
>>[!EXAMPLE]+ Esempio
>>Prendi la grammatica precedente e genera la stringa 101
>>$$\begin{cases} V = \text{\{numero , cifra\}} \\ \\
>>T = \text{\{0 , 1\}}\\ \\
>>P = \begin{cases} \text{numero} \implies \text{numero cifra} \\ 
\text{cifra} \implies 1 \\
\text{cifra} \implies 0 \\ 
\text{numero} \implies \varepsilon
>>\end{cases} \\
S = \text{numero}
>>\end{cases}$$
>>$$\begin{gather} \text{numero} \implies \text{numero cifra} \\ 
\text{numero cifra} \implies \text{numero cifra cifra} \\
\text{numero cifra cifra} \implies \text{numero cifra cifra cifra} \\
\text{numero cifra cifra cifra} \implies \varepsilon \text{ cifra cifra cifra} \\
\varepsilon \text{ cifra cifra cifra } \implies \varepsilon 1 \text{ cifra cifra} \\
\varepsilon 1 \text{ cifra cifra} \implies \varepsilon 1 0 \text{ cifra} \\
\varepsilon 1 0 \text{ cifra} \implies \varepsilon 1 0 1
\end{gather}$$ ^definizione-grammatica

^4dd5ed

# Cosa significa applicare una produzione?
Produzioni : $\alpha , \beta, \delta , ...,  \in (V\cup T)^*$
**$\implies$** = simbolo di applicazione di una produzione
**$\overset{*}{\implies}$** = simbolo di applicazione di una sequenza di produzioni

# Cosa significa "una parola viene generata da una grammatica?"
$W\in T^*$ è generata dalla grammatica G se $S\overset{*}{\implies}W$
**L(G)** è il linguaggio generato dalla grammatica G , è l'insieme $\{w\in T^*:\exists\overset{*}\implies \text{con } S\overset{*}\implies W \}$
>[!Gerarchia delle grammatiche]-
>$\underset{\big\downarrow}{\text{Grammatica generica - Linguaggio Tipo 0 - Macchina di Turing}}$
>$\underset{\big\downarrow}{|\alpha|\le|\beta|\text{ - Linguaggio Tipo 1}} \text{ - (Questa scrittura indica che il numero di variabili di }\alpha \text{ deve essere minore } \le \text{ di quello di } \beta \text{)}$
>$\underset{\big\downarrow}{\alpha = A\in V\text{ - Linguaggio Tipo 2 - Automi a pila}}$
>$$
\begin{cases} \alpha \implies a \qquad a\in T \\ \\
\alpha \implies Aq \qquad A\in V
\end{cases} - \text{LInguaggio Tipo 3} - \text{Automi a stati finiti (Questa scrittura significa che )}\alpha \text{ può avere solo quella tipologia di trasformazione , non significa che può avere solo 2 trasformazioni}
>>$$
>Ad ogni livello inferiore vengono applicate le regole dei livelli superiori ^gerarchia-chomsky
