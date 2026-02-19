>[!definizione] A cosa serve?
>Utilizzeremo il pumping lemma "in modo negativo"per provare che un certo linguaggio <u>**non è regolare**</u>.
>
>Cercheremo di "rompere" il pumping lemma per provare che un linguaggio non è regolare

>[!definizione]+ Definizione
>Sia $L$ un #linguaggio regolare
>
>$$\begin{gather} \exists n_{0} \in \mathbb{N}  \qquad \text{ dipende da L} \\
\forall w \in L, \quad |w| \geq n_{0} \\ \\
\exists w=\text{(decomposizione)}xyz \rightarrow \begin{cases}
x = \text{Prefisso}  \\
y = \text{Parte centrale} \\ 
z = \text{Suffisso} \\
\end{cases} \\  \\
|xy| \leq n_{0}, \quad |y| \geq 1 \\ \\
\forall i>0 ,\quad xy^iz \in L
\end{gather}$$
>
>>[!INFO]- Spiegazione verbale
>>1. Per ogni linguaggio regolare $L$, esiste un numero intero $n_{0}$ 
>>2. Ogni parola $w$ di un linguaggio regolare $L$ può essere suddivisa in 3 parti
>> 	  - x : Prefisso
>> 	  - y : Parte centrale (ripetibile)
>> 	  - z : Suffisso 
>>3. Concatenando $xz$ con $y$ nella forma $xyz$ ripetendo $y$ un $i$ numero di volte otterremo una parola che fa parte del linguaggio
>
>>[!approfondimento]+ Dimostrazione
>>Sia $L$ un linguaggio regolare e sia $A$ un DFA che riconosce $L$.
>>
>>Sia $l$ il numero di stati di $A$
>>
>>Sia $w$ una parola del linguaggio 
>>
>>>[!sub-appro]- Caso 1 (Parola corta , non rilevante per il PL)
>>>Quando riceve $w$, l'automa $A$ non visita lo stesso stato 2 o più volte
>>>
>>>$$|w|\leq l$$
>>
>>>[!sub-appro]+ Caso 2 (Parolo lunga)
>>>Quando l'automa $A$ riceve la stringa $w$ con $|w|\geq l$, allora <u>esiste uno stato $q$ visitato almeno 2 volte</u>
>>>
>>>Senza perdita di generalità, <u>assumo che $q$ sia il primo stato ad essere visitato 2 volte</u>
>>>![[Drawing 2025-10-27 10.28.40.excalidraw]]

>[!definizione]+ Contronominale
># Questa è la definizione che sfrutteremo>
>$$\begin{gather}
>\forall n \geq n_{0} \\ 
>\exists w \in L , \quad |w| \geq n \\ \\
>\forall w =\text{(decomposizione)} xyz \rightarrow \begin{cases}
>x = \text{Prefisso}  \\
>y = \text{Parte centrale} \\ 
>z = \text{Suffisso} \\
>\end{cases} \\ \\
>|xy| \leq n_{0} , \quad |y| \geq 1\\ \\ 
>\exists i > 0 , \quad xy^iz \not\in L
>\end{gather}$$
>
>Se questo viene **verificato** allora $L$ <u>non è un linguaggio regolare</u>

>[!example] Esempi
>L'utilizzo delle [[Espressioni Regolari#^def-chiusura-linguaggi-regolari|chiusure dei linguaggi regolari]] è **espressamente consigliata**
>
>>[!sub-example]- $0^n1^n$ non è regolare
>>Dimostrare che $L=\{0^n1^n, \quad n\in \mathbb{N}\}$ non è regolare
>>
>>$$\begin{gather}
> w = 0^n 1^n \\
> w = xyz , \quad |xy| \leq n_{0} \\
> xyyz \qquad x=0,y=0,z=1 \qquad xyyz>n_{0} \\ \\ 
>|0| > |1| \rightarrow \text{ L non è regolare}
>\end{gather}$$
>>
>><u>Scelgo una $w$ di una lunghezza tale che mi permetta</u>, per una determinata composizione, <u>di soddisfare la contronominale del pumping lemma</u>
>
>>[!sub-example]- $0^n 1^m \quad n \leq m \quad \text{non è regolare}$ (Non risolto)
>>Dimostrare che $L\in \Sigma_{B}^*$ nella forma $0^n 1^m \text{ con } n \leq m$ non è regolare
>>
>
>>[!sub-example]-
>>$L \in \Sigma_{B}$ delle parole tali che in ogni prefisso il numero di 0 è almeno pari al numero di 1