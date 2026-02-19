>[!definizione]+ Cosa sono?
>Un espressione regolare è una "espressione algebrica" finalizzata alla rappresentazione del #Linguaggio 

>[!definizione] Come le uso?
>>[!approfondimento]- Operazioni
>>>[!sub-appro] Associazione di un #Linguaggio 
>>>$$\forall a\text{(carattere)}\in \Sigma \qquad a\text{ è un espressione regolare}$$
>>>$$\text{Il linguaggio che associo a questa espressione è : } L(a)=\{a\}$$
>>
>>>[!sub-appro]- Unione
>>>$$\text{Date }E_{1},E_{2}\text{(espressioni regolari, è valida la costruzione)}$$
>>>$$E_{1}|E_{2}= E_{1}+E_{2}\text{(questo per il libro ma non va bene per il prof)} = E_{1} \cup E_{2} $$
>>>$$L(E_{1}|E_{2}) = L(E_{1}) \cup L(E_{2})$$
>>
>>>[!sub-appro]- Concatenazione
>>>$$\begin{gather} \text{Date }E_{1},E_{2}\text{(espressioni regolari, è valida la costruzione)}  \\ \\
E_{1}\cdot E_{2}=E_{1}E_{2} \\ \\
L(E_{1}E_{2})=\{w_{1}w_{2}:w_{1}\in L(E_{1}),w_{2}\in L(E_{2})\}
\end{gather}$$
>>>>[!INFO] $E^+$
>>>>$E^+ =$ concatenazione di 1 o più parole di E $= E^* \backslash\{\varepsilon\}$
>>>
>>>>[!INFO] $E\{n,m\}$
>>>>Concatenazione di almeno $n$ e al più $m$ parole di $E$
>>>>(Sarebbe $E^*$ ma con un range $\{min,max\}$ da soddisfare)
>>
>>>[!sub-appro]- Chiusura di Kleene
>>>$$\begin{gather} \text{Per ogni espressione regolare abbiamo } E^* \\ \\
\ * = \text{Chiusura di Kleene} \\ \\
\text{Riprendo(concateno) da }0 \text{ a }+\infty \text{ volte }E \\ \\
L(E^*) = \text{ concateno un numero arbitrario di volte parole di  } L(E)
\end{gather}$$
>>>>[!EXAMPLE]- Esempi di notazione di chiusura di Kleene
>>>>$$\begin{gather} L(E^i) = \text{ concatenazione di i parole di }L(E)  \\
L(E^i) = \{w_{1}w_{2}:w_{1}\in L(E),w_{2}\in L(E^{i-1})    \} \text{ se }i > 1\\ \\
L(E^0) = \{\varepsilon\} \\  \\
L(E^1) = L(E)
\end{gather}$$
>>>
>>>$$L(E^*)=\bigcup_{i=0}^{+\infty}L(E^i)$$
>
>>[!EXAMPLE]- Esempi
>>>[!sub-example]- Parole che contengono almeno uno 0 e almeno un 1
>>>$$\begin{gather}L\in \Sigma_{b} \text{ le parole che contengono almeno uno } 0 \text{ e almeno un }1 \\  \\
((0|1)^*01(0|1)^*)\quad|\quad((0|1)^*10(0|1)^*)  \\ \\ 
\text{oppure} \\ \\ 
(0|1)^*(01|10)(0|1)^*
\end{gather}$$
>>>Qual'è il linguaggio associato all'espressione regolare : $(0|1)^*(01|10)(0|1)^*$?
>>>$$\begin{gather}L((0|1)^*(01|10)(0|1)^*) \\ \\
L(0) = \{0\} \qquad L(1) = \{1\} \\
L(01) = \{w_{1}w_{2}:w_{1}\in L(0),w_{2}\in L(1)\} = \{0,1\} \\ \\
L(01|10)) = L(01) \cup L(10) = \{01,10\} \\  \\
L((0|1)^*(01|10)) = \{w_{1}w_{2}:w_{1}\in L(0|1)^*,w_{2}\in\{01,10\}   \} \\  \\
L((0|1)^*(01|10)(0|1)^*) = \{w_{1}w_{2}w_{3}:w_{1}\in L(0|1)^*,w_{2}\in\{01,10\},w_{3}\in L(0|1)^*\}
\end{gather}$$
>>
>>>[!sub-example]- Parole che hanno al massimo un occerrenza della stringa 11
>>>$L\in\Sigma_{B}$ voglio tutte e sole le parole che hanno al massimo un occorrenza della stringa 11
>>>$$\begin{gather}
>>>E=0^*(100^*)(1|\varepsilon)\\ \\
>>>\text{ oppure } \\ \\
>>>E = (\varepsilon|1)(0|10)^*(\varepsilon|1)
>>>\end{gather}$$
>>
>>>[!sub-example]- Parole dove il numero di 1 è un multiplo di 3
>>>$L\in\Sigma_{B}$ il numero di 1 è un multiplo di 3
>>>$$E=0^*(10^*10^*10^*)^*$$
>>
>>>[!sub-example]- Stringhe con cifre in ordine non decrescente
>>>$$\Sigma_{C}=\{0,1,2,3,4,5,6,7,8,9\}$$
>>>$$E = (0^*1^*2^*3^*4^*5^*6^*7^*8^*9^*)$$
>>
>>>[!sub-example]- Parole che contengono un numero pari di 1
>>>$$\begin{gather} L\in \Sigma_{B}\\ E=0^*(0^*10^*1)^*\end{gather}$$
>>
>>>[!sub-example]- Parole che contengono un numero pari di 1
>>>$$L \in \Sigma_{B}^* \text{ Linguaggio delle parole che contengono un numero pari di 1}$$
>>>$$(0*10*1)*)$$
>>
>>>[!sub-example]- Parole che non contengo la sottostringa 101
>>>$$\begin{gather}
>>>L \in \Sigma_{B}^* \text{ insieme delle stringghe che non contengono la sottostringa 101} \\
>>>(0 | 11 | 100)^*(1 | 10 | \varepsilon)^* \\
\end{gather}$$
>>
>>>[!sub-example]
>>>

>[!definizione]- Chiusura dei linguaggi regolari
>>[!approfondimento] Cosa sono?
>>Le operazioni di chiusura sono le operazioni che, se applicate a linguaggi regolari, producono un altro linguaggio regolare.
>
>>[!approfondimento] Quali sono le operazioni di chiusura?
>>- Unione $(| \text{ oppure } \cup)$
>>- Intersezione$(\cap)$
>>- Differenza$\text{(\\)}$
>>- Concatenazione$(\cdot)$
>>- Chiusura di Kleene$(*)$
>>- >[!sub-appro]- Complemento (con spiegazione)
>>$L \longrightarrow \Sigma^* \text{\\}L$ 
>><u>Tutte e solo le parole che non fanno parte del linguaggio $L$</u>
>>- >[!sub-appro]- Inversione (con spiegazione)
>>  $L=\{w\} \qquad L^R=\{w^R : w\in L$
>>  E' praticamente l'inversione delle parole , ciao = oiac
>>- >[!sub-appro]- Omomorfismo (con spiegazione)
>>>  $\text{Omomorfismo} = f : \Sigma \rightarrow \Sigma_{1}^*$
>>>  
>>>  E' una funzione che trasforma parole del linguaggio di partenza in parole di un altro linguaggio
>>>  
>>>  - Se un linguaggio è regole allora anche l'omomorfismo lo sarà
>>>  - Se un linguaggio **non è regolare** allora <u>neanche l'omomorfismo lo sarà</u>
>
>^def-chiusura-linguaggi-regolari

>[!definizione]- ER   $\rightarrow$  [[Ɛ-NFA - Automa a stati finiti non deterministico con le Ɛ mosse | Ɛ-NFA]]
>>[!approfondimento]- <u>Albero di traduzione</u>
>>Per rendere più facile la stusura di un $\varepsilon-\text{NFA}$ conviene creare un albero
>>$$
>>\begin{cases} | = \text{ Unione} \\
 \text{*} = \text{ Chiusura di Kleene} \\
\cdot = \text{ Concatenazione}
\end{cases}
>>$$
>>Ecco l'labero per la ER : $(01)^*(1|\varepsilon)(0|1)^*$
>>![[Drawing 2025-10-26 15.43.13.excalidraw]]
>>
>>
>
>
>>[!approfondimento]- $L(\varepsilon-\text{NFA})=\{\emptyset\} \qquad \emptyset\not=\varepsilon$
>>![[Drawing 2025-10-26 13.39.39.excalidraw]]
>>Non esiste alcun caso per cui riusciamo a finire in uno stato finale/accettante perchè **non esistono stati finali/accettanti**
>
>>[!approfondimento]- $L(\varepsilon-\text{NFA})=\{\varepsilon\}$
>>![[Drawing 2025-10-26 13.43.13.excalidraw]]
>>
>># Oppure
>>
>>![[Drawing 2025-10-26 13.46.31.excalidraw]]
>
>>[!approfondimento]- $ER^*$
>>![[Drawing 2025-10-26 15.26.11.excalidraw]]
>>
>
>>[!approfondimento]- $ER_{1} | ER_{2}$
>>![[Drawing 2025-10-26 13.53.25.excalidraw]]
>
>>[!example]- Esempi
>>>[!sub-example]- $(01)^*$
>>>Costruire un $\varepsilon-\text{NFA}$ che riconosce il linguaggio associato a $(01)^*$
>>>
>>># Passo 1 : Creazione Albero
>>>![[Drawing 2025-10-26 15.53.46.excalidraw]]
>>>
>>># Passo 2 : Creazione $\varepsilon-\text{NFA}$
>>>![[Drawing 2025-10-26 16.10.28.excalidraw]]
>>>
>>># Passo 3 (Opzionale) : Semplificazione al minimo $\varepsilon-\text{NFA}$
>>
>>>[!sub-example]- $((1|\varepsilon)(01)^*)^*$
>>>Costruire un $\varepsilon-\text{NFA}$ che riconosce il linguaggio associato a   $((1|\varepsilon)(01)^*)^*$
>>># Passo 1 : Creazione albero
>>>![[Drawing 2025-10-26 16.17.03.excalidraw]]
>>>
>>># Passo 2 : Creazione $\varepsilon-\text{NFA}$
>>>![[Drawing 2025-10-26 16.36.33.excalidraw]]
>>>
>>># Passo 3 (Opzionale) : Semplificazione al minimo
>>
>>>[!sub-example]- $((100|\varepsilon)1(10|01)^*)^*$
>>>Costruire un $\varepsilon-\text{NFA}$ che riconosce il linguaggio associato a  $((100|\varepsilon)1(10|01)^*)^*$
>>># Passo 1 : Creazione albero
>>>![[Drawing 2025-10-26 17.12.42.excalidraw]]
>>>
>>># Passo 2 : Creazione $\varepsilon-\text{NFA}$
>>>![[Drawing 2025-10-26 17.18.51.excalidraw]]
>>>
  