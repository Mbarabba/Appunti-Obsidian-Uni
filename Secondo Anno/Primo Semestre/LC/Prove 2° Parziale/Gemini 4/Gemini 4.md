# 🎓 Simulazione Secondo Parziale LCA - PROVA 43
**Data:** 10 Gennaio 2026
**Obiettivo:** Analisi avanzata dei linguaggi Context-Free, progettazione di automi e limiti della calcolabilità.

---

> [!question] Esercizio 1: Proprietà del Prefisso (3 Linguaggi Inediti)
> **Domanda:**
> Stabilire se i seguenti linguaggi godono della proprietà del prefisso (Prefix-Free). Motivare con un controesempio o con la **dimostrazione formale (stringa generica)**.
> 1. $L_1 = \{ 1^n 0 1^m \mid n \ge m \ge 1 \}$
> 2. $L_2 = \{ a^n b^m a^n b^m \mid n, m \ge 1 \}$
> 3. $L_3 = \{ w \in \{0, 1\}^* \mid w \text{ è una palindroma} \}$
>
> **💡 Svolgimento:**
>
> **1. Analisi $L_1$ ($n \ge m$):**
> * **Controesempio:** Sia $x = 1101$ ($n=2, m=1$, $2 \ge 1$). Sia $y = 11011$ ($n=2, m=2$, $2 \ge 2$).
> * **Esito:** $x$ è prefisso proprio di $y$ ed entrambe appartengono a $L_1$.
> * **Risposta:** **NO**, non gode della proprietà.
>
> **2. Analisi $L_2$ (Dimostrazione Formale):**
> * **Analisi:** Sia $x = a^n b^m a^n b^m$. Se esistesse un'estensione $y = xz \in L_2$ con $z \neq \epsilon$, la struttura della stringa verrebbe violata. Se $z$ contenesse delle 'a', queste apparirebbero dopo l'ultimo blocco di 'b' di $x$, violando l'ordine alfabetico. Se $z$ contenesse solo delle 'b', il conteggio del secondo blocco di 'b' non corrisponderebbe più al conteggio del primo blocco di 'b' ($m \neq m'$) oppure mancherebbe la ripetizione del blocco di 'a'.
> * **Risposta:** **SÌ**, gode della proprietà.
>
> **3. Analisi $L_3$ (Palindroma):**
> * **Controesempio:** Sia $x = 00$. Sia $y = 000$.
> * **Esito:** Entrambe sono palindrome, ma $x$ è prefisso proprio di $y$.
> * **Risposta:** **NO**, non gode della proprietà.

---

> [!question] Esercizio 2: CFG, DPDA e Scelta della Terminazione
> **Linguaggio:** $L = \{ a^n b^m \mid m > n \ge 1 \}$
> 1. Fornire la **CFG** che genera il linguaggio.
> 2. Progettare il **DPDA** completo per questo linguaggio.
> 3. **Argomentazione Scelta:** Quale tecnica di terminazione hai scelto? Perché? Giustifica la scelta basandoti sulla proprietà del prefisso del linguaggio.
> 4. Disegnare l'**Albero Sintattico** per la stringa **`abbb`**.
>
> **💡 Svolgimento:**
>
> **1. CFG:**
> * $S \to aSb \mid A$
> * $A \to Ab \mid b$
>
> **2. Progettazione DPDA:**
> 
> * $\delta(q_0, a, Z_0) = (q_0, AZ_0)$ (Push A per ogni 'a')
> * $\delta(q_0, a, A) = (q_0, AA)$
> * $\delta(q_0, b, A) = (q_1, \epsilon)$ (Pop A per ogni 'b')
> * $\delta(q_1, b, A) = (q_1, \epsilon)$
> * $\delta(q_1, b, Z_0) = (q_a, Z_0)$ (Se finita la pila rimangono 'b', accetta)
> * $\delta(q_a, b, Z_0) = (q_a, Z_0)$ (Continua ad accettare 'b' extra)
>
> **3. Argomentazione Tecnica:**
> * **Scelta:** **Accettazione per Stato Finale**.
> * **Motivazione:** Il linguaggio $L = \{ a^n b^m \mid m > n \ge 1 \}$ **NON gode della proprietà del prefisso**. Ad esempio, $abb \in L$ e $abbb \in L$, dove la prima è prefisso della seconda. [cite_start]Come studiato, la terminazione per pila vuota è possibile solo per linguaggi prefix-free[cite: 130, 144]. [cite_start]Pertanto, l'accettazione per stato finale è obbligatoria per permettere l'accettazione di stringhe che sono l'una il prolungamento dell'altra[cite: 134, 150].
>
> **4. Albero Sintattico (`abbb`):**
> $S \to aSb \to aAb \to aAbb \to abbb$.

---

> [!question] Esercizio 3: Da CFG a PDA (Costruzione e Trace)
> **Grammatica:** $S \to 0S1 \mid 01$
> 1. Costruire il **PDA non deterministico** equivalente (modello a un solo stato).
> 2. Mostrare la **trace** completa per la stringa **`0011`**.
>
> **💡 Svolgimento:**
> 
> | Passo | Stato | Input | Stack | Azione |
> | :--- | :--- | :--- | :--- | :--- |
> | 1 | $q$ | `0011` | $S$ | Start |
> | 2 | $q$ | `0011` | $0S1$ | Espansione $S \to 0S1$ |
> | 3 | $q$ | `011` | $S1$ | Match `0` |
> | 4 | $q$ | `011` | $011$ | Espansione $S \to 01$ |
> | 5 | $q$ | `11` | $11$ | Match `0` |
> | 6 | $q$ | `1` | $1$ | Match `1` |
> | 7 | $q$ | $\epsilon$ | $\epsilon$ | Match `1` -> **Accettazione** |

---

> [!question] Esercizio 4: Trace Macchina di Turing (Avanzata)
> **Configurazione:** 4 stati ($q_0, q_1, q_2, q_f$), alfabeto $\{0, 1, \#, B\}$.
> **Obiettivo:** La macchina percorre la stringa fino alla fine, sostituisce l'ultimo carattere con `#` e torna all'inizio.
> **Transizioni:**
> * $\delta(q_0, 0) = (q_0, 0, R)$; $\delta(q_0, 1) = (q_0, 1, R)$
> * $\delta(q_0, B) = (q_1, B, L)$
> * $\delta(q_1, 0) = (q_2, \#, L)$; $\delta(q_1, 1) = (q_2, \#, L)$
> * $\delta(q_2, 0) = (q_2, 0, L)$; $\delta(q_2, 1) = (q_2, 1, L)$
> * $\delta(q_2, B) = (q_f, B, R)$
>
> **Trace per input:** `011`
>
> **💡 Svolgimento:**
> 1. $(q_0, \underline{0}11)$
> 2. $\vdash (0, q_0, \underline{1}1)$ [Legge 0, resta $q_0$, R]
> 3. $\vdash (01, q_0, \underline{1})$ [Legge 1, resta $q_0$, R]
> 4. $\vdash (011, q_0, \underline{B})$ [Legge 1, resta $q_0$, R su Blank]
> 5. $\vdash (01, q_1, \underline{1}B)$ [Legge Blank, passa $q_1$, L]
> 6. $\vdash (0, q_2, \underline{1}\#)$ [Legge 1, scrive #, passa $q_2$, L]
> 7. $\vdash (q_2, \underline{0}1\#)$ [Legge 1, resta $q_2$, L]
> 8. $\vdash (q_2, \underline{B}01\#)$ [Legge 0, resta $q_2$, L su Blank iniziale]
> 9. $\vdash (B, q_f, \underline{0}1\#)$ [Legge Blank, passa $q_f$, R]
> **Esito:** Accettazione con nastro "01#".

---

> [!question] Esercizio 5: Teoria della Calcolabilità
> [cite_start]1. Enunciare il **Teorema di Rice** e spiegare cosa si intende per proprietà "non banale" [cite: 392-393].
> [cite_start]2. Descrivere la **Macchina di Turing Universale (UTM)** e la funzione dei suoi 4 nastri [cite: 5-9, 272-275, 360-364].
> [cite_start]3. Dimostrare perché il **Linguaggio Diagonale $L_d$** non è RE [cite: 33-35, 60-61, 303-307].
>
> **💡 Svolgimento:**
>
> **1. [cite_start]Teorema di Rice:** Qualsiasi proprietà semantica non banale dei linguaggi RE è indecidibile[cite: 392]. [cite_start]Una proprietà è "non banale" se esiste almeno una MT che la soddisfa e almeno una che non la soddisfa[cite: 393].
>
> **2. [cite_start]UTM:** È una MdT capace di simulare qualsiasi altra macchina $T$[cite: 3, 270, 357]. Utilizza 4 nastri: 1) Descrizione di $T$ e input; 2) Nastro simulato di $T$; 3) Stato corrente di $T$; [cite_start]4) Nastro ausiliario [cite: 5-9, 273-275, 360-364].
>
> **3. [cite_start]Linguaggio Diagonale ($L_d$):** Definito come $L_d = \{ w_i \mid w_i \notin L(M_i) \}$ [cite: 183, 287-288, 329]. [cite_start]Non è RE perché l'esistenza di una macchina $M_i$ per $L_d$ comporterebbe la contraddizione $w_i \in L_d \iff w_i \notin L(M_i)$, ma dato che $L(M_i) = L_d$, si ottiene $w_i \in L_d \iff w_i \notin L_d$ [cite: 34-35, 60-61, 303-307].

