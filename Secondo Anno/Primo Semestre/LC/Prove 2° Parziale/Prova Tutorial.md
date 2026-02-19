# 🎓 Simulazione Secondo Parziale - TUTORIAL STEP-BY-STEP
**Obiettivo:** Guida completa allo svolgimento. Leggi e comprendi il procedimento logico.

---

> [!question] Esercizio 1: Proprietà di Prefisso
> **Domanda:**
> Motivando la risposta, stabilire se il linguaggio $L_1 = \{ a^n b^m \mid n > m \ge 1 \}$ gode della proprietà di prefisso.
>
> **💡 Svolgimento Guidato Passo-Passo:**
>
> 1.  **Analisi della Richiesta:**
>     Devo capire se esiste una stringa valida "corta" che sia la parte iniziale esatta di una stringa valida "più lunga". Se esiste, il linguaggio *non* è prefix-free.
>
> 2.  **Scelta della stringa base ($x$):**
>     Cerco i valori minimi per $n$ e $m$.
>     So che $m \ge 1$ e $n > m$. Quindi pongo $m=1$ e $n=2$.
>     * Stringa $x = aab$.
>     * Verifica: $2 > 1$. (Valida).
>
> 3.  **Tentativo di estensione ($y$):**
>     Provo ad aggiungere caratteri alla fine di $x$ mantenendo la validità.
>     Posso aggiungere una `b`?
>     * Nuova stringa $y = aabb$.
>     * Nuovi valori: $n=2, m=2$.
>     * Verifica: $2 > 2$ è Falso. Quindi $aabb \notin L$.
>     * *Riprovo con numeri più grandi:*
>     Partiamo da $n=3, m=1 \Rightarrow x = aaab$.
>     Aggiungo una `b` $\Rightarrow y = aaabb$.
>     Nuovi valori: $n=3, m=2$.
>     Verifica: $3 > 2$ è Vero! Quindi $y \in L$.
>
> 4.  **Conclusione:**
>     Poiché $x=aaab$ è un prefisso di $y=aaabb$ ed entrambe appartengono a $L$, la proprietà cade.
>
> **Risposta:** **NO**, non gode della proprietà. Controesempio: $x=aaab, y=aaabb$.

---

> [!question] Esercizio 2: Costruzione DPDA
> **Domanda:**
> Costruire un DPDA per il linguaggio $L = \{ a^n b^{2n} \mid n \ge 1 \}$ (le `b` sono il doppio delle `a`). Discutere la terminazione.
>
> **💡 Svolgimento Guidato Passo-Passo:**
>
> 1.  **Strategia Logica:**
>     * Devo contare le `a`: uso la pila (PUSH A).
>     * Devo consumare le `a` usando le `b` in rapporto 1:2.
>     * Significa che servono due `b` per togliere una `A`.
>
> 2.  **Costruzione Stati:**
>     * $q_0$ (Accumulo): Leggo `a`, metto `A` in pila.
>     * $q_1$ (Attesa): Leggo la prima `b`, *non tocco la pila*, vado in $q_2$.
>     * $q_2$ (Consumo): Leggo la seconda `b`, *tolgo A dalla pila*, torno in $q_1$.
>
> 3.  **Funzione di Transizione $\delta$:**
>     * $\delta(q_0, a, Z_0) = \{(q_0, AZ_0)\}$
>     * $\delta(q_0, a, A) = \{(q_0, AA)\}$
>     * $\delta(q_0, b, A) = \{(q_1, A)\}$ *(Vado in attesa)*
>     * $\delta(q_1, b, A) = \{(q_2, \epsilon)\}$ *(Consumo A)*
>     * $\delta(q_2, b, A) = \{(q_1, A)\}$ *(Torno ad aspettare la prossima coppia)*
>     * $\delta(q_2, \epsilon, Z_0) = \{(q_f, Z_0)\}$ *(Accetto solo se ho finito esattamente le coppie)*
>
> 4.  **Terminazione:**
>     Il linguaggio è Prefix-Free (la struttura $a^n b^{2n}$ non permette estensioni valide). Uso accettazione per **Stato Finale**.
>
> **Diagramma:**
> ```mermaid
> graph LR
>     q0 -- "a, A -> AA" --> q0
>     q0 -- "b, A -> A" --> q1((q1))
>     q1 -- "b, A -> ε" --> q2((q2))
>     q2 -- "b, A -> A" --> q1
>     q2 -- "ε, Z0 -> Z0" --> qf(((qf)))
> ```

---

> [!question] Esercizio 3: CFG to NPDA (Trace)
> **Domanda:**
> Data la grammatica $S \to 0S1 \mid 01$, mostrare la trace per la stringa `0011`.
>
> **💡 Svolgimento Guidato Passo-Passo:**
>
> 1.  **Impostazione NPDA Standard:**
>     * Un solo stato $q$.
>     * Le regole diventano loop $\epsilon$: $\epsilon, S \to 0S1$ e $\epsilon, S \to 01$.
>     * I terminali si cancellano: $0,0 \to \epsilon$ e $1,1 \to \epsilon$.
>
> 2.  **Esecuzione della Trace (Obiettivo: Svuotare tutto):**
>     Partiamo con la variabile iniziale $S$ nello stack.
>
>     | Passo | Stato | Input Residuo | Stack | Azione Spiegata |
>     | :--- | :--- | :--- | :--- | :--- |
>     | 1 | $q$ | `0011` | $S$ | Configurazione iniziale |
>     | 2 | $q$ | `0011` | $0S1$ | **Espansione:** $S \to 0S1$ (sostituisco S con la parte destra) |
>     | 3 | $q$ | `011` | $S1$ | **Match:** Il `0` in cima alla pila cancella il `0` dell'input |
>     | 4 | $q$ | `011` | $011$ | **Espansione:** $S \to 01$ (uso la regola che chiude) |
>     | 5 | $q$ | `11` | $11$ | **Match:** Il `0` in cima alla pila cancella il `0` dell'input |
>     | 6 | $q$ | `1` | $1$ | **Match:** `1` pila con `1` input |
>     | 7 | $q$ | $\epsilon$ | $\epsilon$ | **Match:** Ultimo `1`. Pila vuota e Input finito. |
>
> **Risultato:** Stringa accettata.

---

> [!question] Esercizio 4: Macchina di Turing
> **Domanda:**
> Data la MT definita da:
> * $\delta(q_0, 0) = (q_0, 0, R)$
> * $\delta(q_0, 1) = (q_1, 1, R)$
> * $\delta(q_1, 0) = (q_1, 0, R)$
> * $\delta(q_1, 1) = (q_2, 0, L)$
>
> Mostrare la sequenza di configurazioni per input `00101`.
>
> **💡 Svolgimento Guidato Passo-Passo:**
>
> 1.  **Lettura delle Regole:**
>     * $q_0$: Scorre a destra finché non trova un `1`, poi passa a $q_1$.
>     * $q_1$: Continua a scorrere a destra. Se trova un altro `1`, lo cambia in `0` e torna a sinistra ($q_2$).
>
> 2.  **Trace (Configurazioni):**
>     *(Nota: La sottolineatura indica la posizione della testina)*
>
>     * Start: $(q_0, \underline{0}0101)$
>     * Passo 1: $(q_0, 0\underline{0}101)$ $\to$ Regola 1 (Scorre 0)
>     * Passo 2: $(q_0, 00\underline{1}01)$ $\to$ Regola 1 (Scorre 0)
>     * Passo 3: $(q_1, 001\underline{0}1)$ $\to$ Regola 2 (Trovato 1, cambio stato in $q_1$, vado a DX)
>     * Passo 4: $(q_1, 0010\underline{1})$ $\to$ Regola 3 (Scorre 0)
>     * Passo 5: $(q_2, 001\underline{0}0)$ $\to$ Regola 4 (**Trovato secondo 1**, scrivo 0, torno a SX in $q_2$)
>
> **Conclusione:** La macchina si ferma in $q_2$ puntando all'ultimo zero.

---

> [!question] Esercizio 5: Teoria
> **Domanda:**
> Definire il **Linguaggio Diagonale ($L_d$)** e spiegare perché **non** è Ricorsivamente Enumerabile (RE).
>
> **💡 Svolgimento Guidato Passo-Passo:**
>
> 1.  **Definizione:**
>     Il linguaggio diagonale $L_d$ è l'insieme delle stringhe binarie $w_i$ tali che la macchina $M_i$ (codificata da $w_i$) **non accetta** $w_i$.
>     In formula: $L_d = \{ w_i \mid w_i \notin L(M_i) \}$.
>
> 2.  **Dimostrazione (Per Assurdo):**
>     * **Ipotesi:** Supponiamo che $L_d$ sia RE. Allora esiste una macchina $M_k$ che lo accetta ($L(M_k) = L_d$).
>     * **Test:** Consideriamo la stringa $w_k$ (la codifica di $M_k$ stesso). $w_k$ sta in $L_d$?
>     * **Contraddizione 1:** Se $w_k \in L_d$, per definizione di $L_d$ significa che $M_k$ *non accetta* $w_k$. Ma $M_k$ è la macchina di $L_d$, quindi dovrebbe accettarla. Assurdo.
>     * **Contraddizione 2:** Se $w_k \notin L_d$, per definizione significa che $M_k$ *accetta* $w_k$. Ma se $M_k$ accetta $w_k$, allora $w_k$ deve stare in $L_d$. Assurdo.
>
> 3.  **Conclusione:**
>     Poiché arriviamo sempre a una contraddizione, l'ipotesi iniziale è falsa. Non esiste nessuna macchina $M_k$ che riconosce $L_d$. Quindi $L_d$ non è RE.