# Cos'è
## Definizione informale
E' la simulazione teorica di un vero e proprio elaboratore, tutto ciò che un computer può fare allora lo può fare anche la MDT e viceversa
## Definizione formale
$$M = \begin{cases}
Q : \text{Insieme finito degli stati} \\
\Sigma : \text{Alfabeto di input} \\
\Gamma : \Gamma = \text{Alfabeto del nastro}\quad \Gamma \cup \Sigma \\
\delta: \text{Funzione di transizione} \\
q_{0} \in Q : \text{Stato iniziale} \\
b \in \Gamma : \text{Simbolo blank, all'inizio il nasto è tutto blank} \\
F \subseteq Q : \text{Stati finali}
\end{cases}$$
### Funzione di transizione
$$\large \delta(q,a)=(q_{1},c,\leftrightarrows)$$
#### Input
- $q$ : Stato attuale
- $a$ : Carattere in Input
#### Output
- $q_{1}$ : Nuovo stato attuale
- $c$ : Carattere scritto sul nastro
- $\leftrightarrows$ : Direzione spostamento testina
--- 
# Linguaggio accettato
Il linguaggio accettato da una $MDT$ M, indicato come $L(M)$ è l'insieme di tutte le stringhe $w$ per le quali la macchina entra nello stato di accettazione $q_{accept}$
$$L(M)=\{ w \in \Sigma^* | \delta(q_{0},a) \vdash^* (q_{accept} \subseteq F,\alpha,\leftrightarrows)\}$$
- $\alpha$ : è un qualsiasi carattere di $\Gamma$

---

