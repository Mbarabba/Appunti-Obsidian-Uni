>[!INFO]- Definizione formale di un #NFA
>$$\begin{cases} \Sigma = \text{Alfabeto di input} \\
Q = \text{Insieme di stati} \\
F \subseteq Q = \text{ Sottoinsieme di stati finali} \\
\delta: (Q\times \Sigma) \rightarrow 2^Q = \text{funzione di transizione} \\
2^Q \text{insieme dei sottoinsiemi di Q}
\end{cases}$$
>
>La differenze principale rispetto ad un DFA è che $\delta$ **non restituisce un singolo stato , ma un insieme di stati possibili (l'insieme delle mie scelte)**
>
> >[!INFO] [[Ɛ-NFA - Automa a stati finiti non deterministico con le Ɛ mosse]]

>[!Diagramma di transizione]+
># DFA - Automi determinisitici a stato finito
>![[Drawing 2025-10-08 10.22.37.excalidraw]]
>Per ogni stato , per ogni carattere esisto un solo arco uscente
># NFA - Automi non deterministici a stato finito
>![[Drawing 2025-10-11 14.32.56.excalidraw]]
>Per ogni stato , per ogni carattere non ho limiti sul numero di archi uscenti

>[!Comportamento della transizione estesa di un NFA]
>$$\hat{\delta}(q,w) =\begin{cases}\hat{\delta}(q,\varepsilon) = q \\
\hat{\delta}(q,a)=\delta(q,a) \quad a\in \Sigma \\
\hat{\delta}(q,xa)=\bigcup_{p\in \hat{\delta}(q,x)}
\end{cases}$$
Per calcolare dove arriva l'automa leggendo la parola xa, questa formula prima trova tutti gli stati possibili in cui potrebbe trovarsi dopo aver letto la parte iniziale x Successivamente, da ognuno di questi punti intermedi, calcola dove può andare leggendo l'ultimo simbolo a. Il risultato finale è l'unione di tutti questi possibili percorsi.

>[!INFO]+ Linguaggio accettato da un NFA
>Transizione estesa : $\hat{\delta}:(Q\times \Sigma^*)\rightarrow 2^Q$
>
>$L(NFA) = \{w\in \Sigma^* : \hat{\delta}(q_{0},w)\cap F\not=\emptyset$
>Data una parola , **se almeno uno degli stati in cui finisco è finale / accettante allora accetto la parola** ^def-LinguaggioAccettatoNFA

>[!Relazione tra NFA e DFA]-
>Gli NFA sono una generalizzazione dei DFA , questo implica che qualsiasi cosa che posso espriemere sottoforma di DFA posso esprimerla allo stesso modo sottoforma di NFA,**tutti i DFA soddifisfano le condizioni per essere NFA**,  ma vale il contrario? Si.
>
>Sia L un linguaggio accettato dal NFA $A_{N}$ allora esiste un DFA $A_{D}$ che accetta L
>
>Dato $NFA = <Sigma,Q_{N},q_{0}^N,F_{N},\delta_{N}>$ voglio un DFA che accetti lo stesso linguaggio.
>
>$DFA = <\Sigma,2^{Q_{N}},q_{0},F_{D},\delta_{D}>$ dove :
>	- $F_{D}=\{S\subseteq Q_{N} : S\cap F_{N} \not=\emptyset\}$
>	  Uno stato nel  DFA è considerato uno stato di accettazione se l'insieme di stati dell'NFA che esso rappresenta contiene **almeno uno** degli stati finali dell'NFA originale.
>	  
>	- $\delta_{D}(S,a)=\bigcup_{p\in S}\quad\delta_{N}(P,a)$
>	  La funzione di transizione δ_D del DFA, dato un super-stato S (un insieme di stati dell'NFA) e un simbolo a, calcola il super-stato di destinazione. Questo è definito come l'unione di tutti i risultati ottenuti applicando la funzione di transizione δ_N dell'NFA a ogni singolo stato p contenuto in S con il simbolo a.

>[!EXAMPLE]+ Esempio
>>[!sub-EXAMPLE]- Esempio 1
>>$L\in \Sigma_{B}^*$ dopo la stringa 00 non compare la stringa 11, tranne l'ultima occorrenza di 00 che **deve** essere seguita (non immmediatamente) da 11
>>![[Drawing 2025-10-11 16.03.58.excalidraw]]
>
>>[!sub-EXAMPLE]- Esempio 2
>>$L\in \Sigma_{B}^*$ tutte e sole le parole che finiscono con la stringa 01
>>![[Drawing 2025-10-11 16.11.05.excalidraw]]