# 🎓 Simulazione Secondo Parziale LCA - PROVA 45
**Data:** 13 Gennaio 2026
**Focus:** Proprietà del Prefisso, Automi a Pila Deterministici, Macchine di Turing e Teoria della Calcolabilità.

---

> [!question] Esercizio 1: Proprietà del Prefisso
> Stabilire se i seguenti linguaggi godono della proprietà del prefisso (Prefix-Free). Motivare ogni risposta con una dimostrazione formale o un controesempio.
> 1. $L_1 = \{ a^n b^{2n} \mid n \ge 1 \}$
> 2. $L_2 = \{ a^n b^m c^k \mid n, m, k \ge 1 \}$
> 3. $L_3 = \{ w \$ w^R \mid w \in \{0, 1\}^* \}$
>
> **💡 Svolgimento:**
> 4. **$L_1$ è Prefix-Free**: Sia $x = a^n b^{2n}$ e $y = a^k b^{2k}$. Se $x$ fosse prefisso di $y$, il numero di 'a' iniziali dovrebbe coincidere ($n=k$), costringendo anche il numero di 'b' a essere identico ($2n=2k$). Qualsiasi estensione $z \neq \epsilon$ violerebbe il rapporto tra i blocchi o l'ordine alfabetico.
> 5. **$L_2$ NON è Prefix-Free**: Poiché gli esponenti sono indipendenti, possiamo estendere l'ultimo blocco. Ad esempio, $x = abc \in L_2$ è un prefisso proprio di $y = abcc \in L_2$.
> 6. **$L_3$ è Prefix-Free**: Il marcatore centrale `$` e la struttura speculare impongono che ogni stringa valida termini esattamente dopo la sequenza riflessa $w^R$. Ogni aggiunta dopo la chiusura della simmetria renderebbe la stringa non appartenente al linguaggio.

---

> [!question] Esercizio 2: Progettazione DPDA e Terminazione
> Dato il linguaggio $L = \{ a^n b^m c^m d^n \mid n, m \ge 1 \}$:
> 1. Fornire la **CFG** che genera il linguaggio.
> 2. Progettare il **DPDA** (modello deterministico).
> 3. **Argomentazione Scelta**: Quale tecnica di terminazione è preferibile e perché?
> 4. Disegnare l'**Albero Sintattico** per la stringa **`abccd`**.
>
> **💡 Svolgimento:**
> 1. **CFG**:
>    - $S \to aSd \mid aAd$
>    - $A \to bAc \mid bc$
>
> 2. **DPDA (Mermaid)**:
> ```mermaid
> stateDiagram-v2
>     [*] --> q0
>     q0 --> q0: a, Z0 / AZ0
>     q0 --> q0: a, A / AA
>     q0 --> q1: b, A / BA
>     q1 --> q1: b, B / BB
>     q1 --> q2: c, B / ε
>     q2 --> q2: c, B / ε
>     q2 --> q3: d, A / ε
>     q3 --> q3: d, A / ε
>     q3 --> qF: ε, Z0 / ε
> ```
>
> 3. **Scelta Tecnica**: È stata scelta l'accettazione per **Pila Vuota**. Il linguaggio è prefix-free grazie alla struttura annidata che vincola l'inizio e la fine della stringa. In questo caso, svuotare la pila coincide con il riconoscimento completo e corretto della parola.
> 4. **Albero Sintattico**: $S$ genera $a, A, d$; $A$ genera $b, c$. La struttura risultante è $(a(b c)d)$.

---

> [!question] Esercizio 3: PDA da CFG e Trace
> Data la grammatica $S \to 0S0 \mid 1S1 \mid 2$:
> 1. Costruire il **PDA** (modello a un solo stato).
> 2. Mostrare la **trace** completa per la stringa **`01210`**.
>
> **💡 Svolgimento:**
> 1. **PDA**:
>    - $\delta(q, \epsilon, S) = \{ (q, 0S0), (q, 1S1), (q, 2) \}$
>    - $\delta(q, 0, 0) = \{ (q, \epsilon) \}, \delta(q, 1, 1) = \{ (q, \epsilon) \}, \delta(q, 2, 2) = \{ (q, \epsilon) \}$
> 2. **Trace**:
> | Passo | Stato | Input | Stack | Azione |
> | :--- | :--- | :--- | :--- | :--- |
> | 1 | $q$ | `01210` | $S$ | Start |
> | 2 | $q$ | `01210` | $0S0$ | Espansione $S \to 0S0$ |
> | 3 | $q$ | `1210` | $S0$ | Match `0` |
> | 4 | $q$ | `1210` | $1S10$ | Espansione $S \to 1S1$ |
> | 5 | $q$ | `210` | $S10$ | Match `1` |
> | 6 | $q$ | `210` | $210$ | Espansione $S \to 2$ |
> | 7 | $q$ | `10` | $10$ | Match `2` |
> | 8 | $q$ | `0` | $0$ | Match `1` |
> | 9 | $q$ | $\epsilon$ | $\epsilon$ | Match `0` -> **Accettato** |

---

> [!question] Esercizio 4: Trace Macchina di Turing
> Data la MT con transizioni:
> - $\delta(q_0, 1) = (q_1, 0, R)$
> - $\delta(q_1, 1) = (q_1, 1, R)$
> - $\delta(q_1, 0) = (q_2, 1, L)$
> - $\delta(q_2, 0) = (q_f, 0, R)$
>
> **Eseguire la Trace per l'input:** `110`
>
> **💡 Svolgimento:**
> 1. $(q_0, \underline{1}10)$
> 2. $\vdash (0, q_1, \underline{1}0)$ [Legge 1, scrive 0, muove R]
> 3. $\vdash (01, q_1, \underline{0})$ [Legge 1, scrive 1, muove R]
> 4. $\vdash (0, q_2, \underline{1}1)$ [Legge 0, scrive 1, muove L]
> 5. **Halt**: Non esiste transizione per $\delta(q_2, 1)$. La stringa non è accettata.

---

> [!question] Esercizio 5: Teoria e Ricorsione
> 1. Enunciare il **Teorema di Rice** e spiegare il concetto di proprietà "non banale".
> 2. Dimostrare perché il **Linguaggio Diagonale $L_d$** non è RE.
> 3. **Ricorsione**: Spiega come la funzione `evaluate_exp` in un interprete gestisce le operazioni binarie.
>
> **💡 Svolgimento:**
> 4. **Rice**: Ogni proprietà semantica non banale dei linguaggi RE è indecidibile. Una proprietà è non banale se esiste almeno una MT che la soddisfa e una che non la soddisfa.
> 5. **$L_d$**: È l'insieme delle stringhe $w_i$ non accettate dalla macchina $M_i$. Se fosse RE, esisterebbe una $M_k$ tale che $L(M_k) = L_d$, portando al paradosso $w_k \in L_d \iff w_k \notin L(M_k)$.
> 6. **Ricorsione**: In un interprete, la valutazione è ricorsiva perché per calcolare un nodo (es. PLUS) è necessario prima valutare i suoi figli. La funzione chiama se stessa scendendo nell'albero fino ai casi base (numeri) e risale combinando i risultati.