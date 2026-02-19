>[!definizione]+ Definizione formale di un #Ɛ-NFA
>$$\begin{cases} \Sigma = \text{ Alfabeto di input} \qquad \varepsilon \not\in\Sigma\\ 
Q = \text{ Insieme degli stati} \\
q_{0} \in Q = \text{ Stato iniziale} \\
F \subseteq Q = \text{ Stati accettanti} \\
\delta : (Q \times \Sigma \cup \{\varepsilon\}) \rightarrow 2^Q \text{ transizioni}
\end{cases}$$
>
>La modifica principale è che accetto la stringa vuota come input , l'utilizzo della stringa vuota non ne indica il "consumo" permettendo cosi' che un arco uscente sia etichettato come $\varepsilon$
>
>>[!EXAMPLE]+ Esempio Grafico
>>![[Drawing 2025-10-14 09.30.45.excalidraw]]
>>Questa cosa è ora possibile

>[!definizione] $\varepsilon \text{-close}$
>
>La $\varepsilon-close / \varepsilon \text{.chiusura}$ di uno stato q   $\varepsilon-close(q)$ è il più piccolo insieme $C \subseteq Q \text{ tale che } q \in C \text{ e } q_{1} \in C \implies \delta(q_{1},\varepsilon) \subseteq C$
>
>>[!INFO]+ Spiegazione **informale** 
>>La $\varepsilon-close(q)$ sarebbe "la catena" dei possibili stati raggiungibili attraverso la funzione di transizione attraverso partendo dallo stato q

>[!definizione] Linguaggi accettati da un #Ɛ-NFA 
>Essendo che un $\varepsilon$-NFA ed un #NFA utilizzano la stessa funzione di transizione estesa, con la sola differnza che un $\varepsilon$-NFA accetta la stringa vuota, le condizioni per accettare un linguaggio sono le stesse
>
>[[NFA - Automi non deterministici a stati finiti#^def-LinguaggioAccettatoNFA | Linguaggio accettato da un NFA]]

>[!EXAMPLE]+ Esempi di $\varepsilon-NFA$
>>[!sub-EXAMPLE]- 1
>>$L \subseteq \Sigma^*_{B}$ insieme delle stringhe formate da 01 ripetute almeno una volta oppure 010 ripetute almeno una volta
>>![[Drawing 2025-10-14 10.14.10.excalidraw]]
>
>>[!sub-example]- 2
>>![[Drawing 2025-10-14 09.30.45.excalidraw]]