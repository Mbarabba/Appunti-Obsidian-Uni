# 🧠 Formulario Tecnico: Calcoli Gestione Memoria

> [!IMPORTANT] Note per l'Esame
> - **1 KB** = 1024 byte ($2^{10}$)
> - **1 MB** = 1.048.576 byte ($2^{20}$)
> - In un sistema a **n-bit**, lo spazio di indirizzamento totale è $2^n$ byte.

---

## 1. Paginazione: Traduzione Indirizzo Logico (LA) → Fisico (PA)
Serve a calcolare dove si trova un dato in RAM partendo dall'indirizzo della CPU.

### 🏁 Formule Fondamentali
Dato un **Indirizzo Logico ($LA$)** e una **Dimensione Pagina ($S$)**:

1. **Numero di Pagina ($p$):** $$p = \lfloor LA / S \rfloor$$
2. **Offset (Spostamento, $d$):** $$d = LA \pmod S$$
3. **Indirizzo Fisico ($PA$):** $$PA = (f \times S) + d$$

### 🛠️ Procedimento Passo-Passo
1. **Normalizza S:** Converti la dimensione pagina in byte (es. 4 KB = 4096).
2. **Calcola $p$ e $d$:** Dividi l'indirizzo $LA$ per $S$. Il quoziente è la pagina, il resto è l'offset.
3. **Lookup Tabella:** Cerca il numero di pagina $p$ nella **Page Table** per trovare il frame $f$ corrispondente.
4. **Calcola PA:** Moltiplica il frame $f$ per la dimensione pagina $S$ e aggiungi l'offset $d$.



---

## 2. Tempo di Accesso Effettivo (EAT) con TLB
Calcola il tempo medio di accesso considerando la cache veloce (TLB).

### 🏁 Formula
$$EAT = \alpha \cdot (\epsilon + m) + (1 - \alpha) \cdot (\epsilon + 2m)$$

### 📋 Legenda Variabili
- $\alpha$: **Hit Ratio** (probabilità di successo nel TLB, es. 0.95).
- $\epsilon$: **Tempo di accesso al TLB** (es. 20ns).
- $m$: **Tempo di accesso alla RAM** (es. 100ns).
- $2m$: Rappresenta l'accesso alla RAM per la tabella + l'accesso per il dato (in caso di Miss).

### 🛠️ Procedimento
1. Somma $(\epsilon + m)$ per il caso di successo.
2. Somma $(\epsilon + 2m)$ per il caso di fallimento.
3. Moltiplica i due risultati per le loro probabilità ($\alpha$ e $1-\alpha$) e somali.

---

## 3. Calcolo Dimensione Tabella delle Pagine
Determina quanta RAM occupa la struttura dati della tabella.

### 🏁 Formule
1. **Numero di Pagine ($N$):** $$N = \frac{\text{Spazio Indirizzamento Logico Totale}}{\text{Dimensione Pagina}}$$
2. **Dimensione Tabella:** $$Size = N \times \text{Dimensione Entry (PTE)}$$

### 🛠️ Procedimento (Metodo Potenze di 2)
1. **Esponenti:** Se hai spazio a 32-bit ($2^{32}$) e pagine da 4 KB ($2^{12}$).
2. **Sottrazione:** $2^{32} / 2^{12} = 2^{20}$ pagine.
3. **Moltiplicazione:** Se ogni riga (PTE) è 4 byte ($2^2$), allora $2^{20} \times 2^2 = 2^{22} = 4 \text{ MB}$.

---

## 4. Segmentazione: Verifica Validità
Determina se un indirizzo logico $(s, d)$ è legale o causa una Trap.

### 🏁 Algoritmo di Controllo
1. Prendi l'offset **$d$** dall'indirizzo logico.
2. Confrontalo con il valore **Limit** del segmento **$s$** nella Segment Table.
3. **Condizione:** - Se $d < Limit \implies PA = Base + d$ (Valido)
   - Se $d \ge Limit \implies \text{TRAP (Segmentation Fault)}$ (Illegale)