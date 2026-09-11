# Cos'è?
## Definizione informale
E' una [[MDT - Macchina di Turing | MDT]] ma la funzione di transizione $\delta$ può restituirci un insieme di output dato un input, rendendola cosi' non deterministica
## Definizione Formale
$$\large M = \begin{cases}
Q : \text{Insieme di stati} \\
\Sigma : \text{Alfabeto di input} \\
\Gamma : \text{Alfabeto del nastro (Contiene } \Sigma \text{ e }b\text{)} \\
q_{0} \in Q : \text{Stato iniziale} \\
b \in \Gamma : \text{Simbolo blank} \\
F \subseteq Q : \text{Insieme degli stati finali}
\end{cases}$$
### Funzione di transizione $\delta$
$$\delta(q,X)=\{ (q_{1},Y_{1},\leftrightarrows),(q_{2},Y_{2},\leftrightarrows),\dots,(q_{n},Y_{n},\leftrightarrows) \}$$
- **Input** : 
	- $q$ : Stato attuale
	- $X$ : Simbolo letto
- **Output** : Un insieme di triple risultati formate da
	- $q_{n}$ : Stato risultante
	- $Y_{n}$ : Carattere salvato sul nastro
	- $\leftrightarrows$ : Direzione della testina
---
# Linguaggio accettato
## Definizione informale
Il linguaggio di una $MDT$ non deterministica ($NTM$) è l'insieme delle stringhe per cui esiste una sequenza di scelte per arrivare all'accettazione.

Questo insieme coincide con i [[Linguaggi Ricorsivi e Ricorsivamente Enumerabili| linguaggi ricorsivamente enumerabili]] 
## Definizione Formale
Il linguaggio accettato da una $NTM$ $M$ è :
$$L(M)=\{ w \in \Sigma^* : \exists \text{ una sequenza di configurazioni }C_{0},C_{1},\dots,C_{K} \text{ tali che : }\}$$
1. $C_{0}$ è la configurazione iniziale con input $w$
2. Ogni $C_{i+1}$ è una delle possibili configurazioni di $C_{i}$ secondo la funzione $\delta$
3. $C_{k}$ contiene lo stato di accettazione $q_{accept}$
## $L(MDT)$ VS $L(NDT)$
**Per ogni** $NDT$ esiste una $MDT$. entrambe riconoscono la classe dei linguaggi ricorsivamente enumerabili 

---