>[!definizione]- Definizione Informale
>Un DFA (Deterministic Finite Automation) è un **modello di calcolo** appartenente al 3° livello della gerarchia delle grammatiche , che funziona come una macchina mangia nastri, data una stringa legge carattere per carattere la stringa e "decide" uno stato

>[!definizione]- Definizione Formale
>$$\begin{cases} \Sigma = Alfabeto  \quad \text{L'automa mi dice se } w\in\Sigma  \\
Q = \text{Insieme di stati} \\
q_{0} \in Q = \text{Stato iniziale} \\
F \subseteq = \text{Stati accettanti / finali} \\
\delta : Q \times \Sigma \mapsto Q = \text{Funzione di transizione}
\end{cases}$$
>
$w \in \Sigma^*$ se e solo se , partendo da $q_{0}$ e muovendomi seguendo la funzione $\delta$, dopo aver letto/consumato $w$ mi ritrovo in uno stato $F$
>
E' deterministico perchè **in ogni momento sono in un unico stato ed ogni transizione mi porta ad uno stato preciso**
>
>>[!approfondimento]+ Quando una parola fa parte di un linguaggio?
>>>[!sub-appro]- Risposta informale
>>>Quando attraverso l'automa arriviamo ad uno stato finale
>>
>>>[!sub-appro]+ Risposta Formale
>>>- $\varepsilon \in L(DFA) \text{ se e solo se } q_{0} \in F$
>>>  La parola vuota fa parte del linguaggio del DFA **solo se lo stato di partenza è anche uno stato finale / accettante**
>>>  
>>>- $a\in \Sigma \quad a\in L(DFA) \text{ se e solo se } \delta(q_{0},a) \in F$
>>>  La parola a con $|a|=1$(Lunghezza di a pari ad 1) facente parte dell'alfabeto $\Sigma$ **appartiene al linguaggio del DFA solamente se partendo dallo stato iniziale ed operando attraverso $\delta$ arriviamo ad uno stato finale**
>>>- $ab\in\Sigma\times\Sigma=\Sigma^2 \text{ se e solo se } ab\in L(DFA)\implies \delta(\delta(q_{0},a),b)\in F$
>>>  Prendendo una stringa di 2(ab) caratteri facente parti dell'insieme delle stringhe di lunghezza 2 facente parti dell'alfabeto , **la mia stringa farà parte del linguaggio dell'automa se e solo se dopo esser partiti dallo stato iniziale per poi operare con la funziona $\delta$ leggendo a e successivamente leggere b sempre attraverso l'utilizzo di $\delta$ arrivo in uno stato finale**
>>>  (Una stringa $ab$ appartiene al linguaggio dell'automa se e solo se, processandola a partire dallo stato iniziale, l'automa termina in uno stato finale)
>>>
>>>Per la generica parola w dobbiamo introdurre un nuovo "operatore" $\hat{\delta}$ ossia , la **transizione estesa**.
>>>
>>># Differenza tra $\delta \text{ e } \hat{\delta}$
>>>- $\delta : Q\times\Sigma\rightarrow Q$ 
>>>  $\delta$ ha bisogno come input un insieme di stati ed **un singolo carattere dell'alfabeto $\Sigma$** per restituirci uno stato $q$
>>>- $\hat{\delta} : Q \times \Sigma^*\rightarrow Q$
>>>  $\hat{\delta}$ è una **funzione ricorsiva** che ha bisogno di un insieme di stati ed **una stringa di caratteri** per poter restituire uno stato.
>>>  Per definirla in modo formale ho bisogno dell'**induzione**
>>>  >[!INFO]+ Definizione formale delal transizione estesa 
>>>  >Caso base : 
>>>  >$\hat{\delta}(q,\varepsilon)=q \quad \forall q\in Q \text{}$
>>>  > Partendo dal generico stato q se leggo la stringa vuota $\varepsilon$ mi ritroverò nello stesso stato q appartenente all'insieme degli stati
>>>  > 
>>>  >Passo induttivo :
>>>  >$\hat{\delta}:Q\times \Sigma^* \rightarrow Q$
>>>  >Parto da un insieme di stati Q e tutte le stringhe di caratteri facente parti dell'alfabeto $\Sigma$
>>>  >
>>>  >$\hat{\delta}(q,\varepsilon) =q\quad\forall q\in Q$
>>>  >Se fornisco alla transizione estesa uno stato e la stringa vuota otterrò in ritorno lo stesso stato
>>>  >
>>>  >$\hat{\delta}(q,a)=\delta(q,a)\quad\forall a\in\Sigma,\forall q\in Q$
>>>  >Se fornisco alla transizione estesa uno stato ed un singolo carattere appartenente a sigma essa utilizzerà la funzione $\delta$ applicata a $q \text{ ed } a$ per restituirmi uno stato q
>>>  >
>>>  >$\hat{\delta}(q, ax)=\hat{\delta(\delta(q,a),x)} \quad \forall a\in\Sigma,\forall q\in Q$
>>>  >Dando in input alla transizione estesa uno stato q ed una stringa ax dove $a\in \Sigma \text{ e } x\in \Sigma^*$ , ossia a un carattere dell'alfabeto ed x una stringa composta da caratteri dell'alfabeto sigma , questo è uguale ad operare con la funzione $\delta$  sul carattere $a$ a poi tornare a $\hat{\delta}$ lavorare con x
>>>  >
>>>  >$\hat{\delta}(q,xa)=\delta(\hat{\delta}(q,x),a) \quad \forall q\in Q$
>>>  >Dice la stessa cosa di prima ma con l'ordine delle operazioni invertite

>[!definizione]- Linguaggio accettato da un DFA
>$L(DFA)=\{w\in \Sigma^*:\hat{\delta}(q_{0},w)\in F\}$
>Il linguaggio riconosciuto da un DFA è **l'insieme di tutte le parole** per cui il processamento, a partire dallo stato iniziale, termina in uno stato di accettazione

>[!EXAMPLE]- Esempi grafici + Forma Tabellare
>>[!sub-example]- 1
>>![[Drawing 2025-10-08 10.22.37.excalidraw]]
>>$$
\begin{array}{|c|c|}
\hline \text{stato | arco} & 0 & 1 & 2 \\ 
\hline q_{0} & x & q_{1} & x \\ \\
\hline q_{1}  & x & x & \text{ok}\\
\hline \text{*altro} & q_{0} & q_{1} & q_{0}\\
\hline \text{*ok}  & \text{ok} & q_{1} & q_{2}\\
\hline \end{array} $$
>
>>[!sub-example]- 2
>>$L \in \Sigma_{b}$ parole che contengono almeno due zeri consecutivi
>>![[Drawing 2025-10-08 10.42.03.excalidraw]]
>>$$
> \begin{array}{|c|c|c|}
> \hline
> \text{Stato} & 0 & 1 \\
> \hline
> 0 & 1 & 2 \\
> \hline
> 1 & 2 & 1 \\
> \hline
> *2 & 2 & 2 \\
> \hline
> \end{array} $$

>[!definizione]- DFA $\rightarrow$ [[Espressioni Regolari | ER]]
>>[!INFO] Premessa Iniziale
>>Il modo più semplice per poter "tradurre" un DFA in Espressione Regolare è quello semplificare il DFA fino ad avere solo stati iniziali ed accettanti.
>>- Diminuirò notevolmente il numero di stati
>>- Complicherò notevolmente l'etichetta assegnata ad ogni transizione
>>
>>Voglio arrivare ad un DFA di questo tipo :
>>![[Drawing 2025-10-26 12.24.47.excalidraw]]
>>$L(\text{DFA})=\{L_{1},L_{2},L_{3}\}=\text{(Espressione Regolare)}\quad L_{1} |L_{2}|L_{3} = L_{1} \cup L_{2} \cup L_{3}$
>
>>[!approfondimento]- $L(\text{DFA}=\{L_{1},L_{2}\}$
>>![[Drawing 2025-10-26 12.07.16.excalidraw]] 
>>$L(\text{DFA})=\{a,b\} = \text{(Espressione Regolare)}\quad a|b =$
>>
>># Più in generale
>>![[Drawing 2025-10-26 12.11.06.excalidraw]]
>>$L(\text{DFA})=\{L_{1},L_{2}\}=\text{(Espressione regolare)}\quad L_{1}|L_{2} = L_{1} \cup L_{2}$
>
>>[!approfondimento]- Cappi
>>![[Drawing 2025-10-26 12.29.35.excalidraw]]
>>$L(\text{DFA})=\{ER\}=\text{(Espressione regolare)}\quad (ER)^*$
>>
>>>[!EXAMPLE]+ Esempio
>>>![[Drawing 2025-10-26 12.34.49.excalidraw]]
>>>$$\text{Espressione regolare }= ER_{1}^*ER_{2}ER_{3}^*$$
>
>>[!example]+ Esempi
>>>[!sub-example]- 1
>>>$$
>>>\text{s = stato generico} \qquad s \not=q_{0}\text{(stato inziale)},\qquad s\not\in F\text{(stato finale)} 
>>>$$
>>>$$
>>>\begin{cases}
P_{1},\dots,P_{k} \\ \\
S \\
T_{1},\dots ,T_{k}
\end{cases} = \text{Espressioni Regolari}
>>>$$
>>>![[Drawing 2025-10-26 12.49.50.excalidraw]]
>>>
>>>**Per semplificare il DFA** rimuovo S e lo implemento all'interno dell'etichetta 
>>>![[Drawing 2025-10-26 13.15.07.excalidraw]]
>>
>>>[!sub-example]- 2 
>>>![[Drawing 2025-10-26 13.19.56.excalidraw]]
>>>
>>>Semplifico:
>>>- Concateno la transizione $P,S\text{(cappio}\rightarrow \text{Kleene)},T$ e rimuovo lo stato $S$
>>>- Rimuovo l'arco $Q$ e lo aggiungo come alternativa(Unione) all'espressione regolare
>>>
>>>![[Drawing 2025-10-26 13.23.47.excalidraw]]