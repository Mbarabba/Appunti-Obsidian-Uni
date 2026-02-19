
# Che cosa è

La **Virgola Mobile** (Floating Point) è il metodo standard utilizzato nei computer per rappresentare numeri reali.
Si basa sul concetto di **notazione scientifica** (es. $1.23 \times 10^{-5}$): la posizione della virgola non è fissa, ma "galleggia" (float) in base al valore dell'esponente.

Questo permette di gestire numeri enormemente diversi tra loro (come la massa di un elettrone o quella della Terra) usando lo stesso numero di bit. Lo standard di riferimento internazionale è l'**IEEE 754** (definito nel 1985).

---

# Come è strutturata (32 bit - Singola Precisione)

Lo standard IEEE 754 a 32 bit divide la parola in tre campi distinti:

| Campo | Bit | Descrizione |
| :--- | :--- | :--- |
| **Segno (S)** | 1 | Determina se il numero è positivo (**0**) o negativo (**1**). |
| **Esponente (E)** | 8 | Rappresenta l'ordine di grandezza. È codificato in **eccesso 127 (Bias)**: al valore reale si somma 127. Intervallo rappresentabile: $[-126, +127]$. |
| **Mantissa (M)** | 23 | Rappresenta le cifre significative (parte frazionaria). Utilizza un **"bit nascosto"**: si assume che ci sia sempre un **1** davanti alla virgola ($1.M$) per i numeri normalizzati. |

> [!INFO] Formula Generale IEEE 754
> Il valore decimale $N$ si ottiene con la formula:
> $$N = (-1)^S \times (1.M) \times 2^{(E - 127)}$$

---

# 📉 Range e Precisione

### Limiti Numerici
Ecco i valori estremi rappresentabili con 32 bit:
* **Massimo valore assoluto (Max):** $\approx 3.402 \times 10^{38}$
    *(Ottenuto con Esponente Max $254$ e Mantissa Max)*
* **Minimo valore "normalizzato" (Min):** $\approx 1.175 \times 10^{-38}$
    *(Ottenuto con Esponente Min $1$ e Mantissa $0$)*
* **Minimo valore "denormalizzato" (Subnormal):** $\approx 1.401 \times 10^{-45}$
    *(Numeri vicinissimi allo zero con precisione ridotta)*

### Precisione
La mantissa a 23 bit (+1 nascosto) corrisponde a circa **7 cifre decimali significative**.
* Esempio: Il numero `123456.7` è rappresentabile bene, ma `123456.789` subirà un arrotondamento significativo.

---

# 🛡️ Valori Speciali (Reserved)

Alcune combinazioni di esponente sono riservate per indicare condizioni particolari:

| Esponente ($E$) | Mantissa ($M$) | Significato |
| :---: | :---: | :--- |
| **0** (00..00) | **0** (00..00) | **Zero** ($\pm 0$) |
| **0** (00..00) | $\neq 0$ | **Numeri Denormalizzati** (Molto piccoli) |
| **255** (11..11) | **0** (00..00) | **Infinito** ($\pm \infty$) (es. divisione per 0) |
| **255** (11..11) | $\neq 0$ | **NaN** (Not a Number) (es. $\sqrt{-1}$) |

---

# ✍️ Come rappresentarla con esempi

### Esempio 1: Da Decimale a IEEE 754
**Obiettivo:** Rappresentare il numero **8.5**.

1.  **Segno (S):** Positivo $\to$ **0**.
2.  **Binario (Virgola Fissa):** $8.5_{10} = 1000.1_2$.
3.  **Normalizzazione:** Sposto la virgola a sinistra fino ad avere $1.xxxx$:
    $$1.0001 \times 2^3$$
    * Esponente reale ($e$) = 3.
    * Mantissa ($M$) = 0001 (l'1 prima della virgola è implicito).
4.  **Esponente Polarizzato (E):**
    $$E = 3 + 127 = 130$$
    In binario: $10000010$.
5.  **Risultato (32 bit):**
    `0 10000010 00010000000000000000000`

### Esempio 2: Da IEEE 754 a Decimale
**Obiettivo:** Decodificare `1 10000001 0100000...`.

1.  **Segno (S):** 1 $\to$ **Negativo**.
2.  **Esponente (E):** `10000001` ($129_{10}$).
    Esponente reale = $129 - 127 = \mathbf{2}$.
3.  **Mantissa (M):** `010...`
    Si aggiunge l'1 implicito: $1.01_2 = 1 + 0.25 = \mathbf{1.25}$.
4.  **Calcolo:**
    $$-1 \times 1.25 \times 2^2 = -1.25 \times 4 = \mathbf{-5}$$

---

# Pro e Contro

| 👍 Pro                                                                                                                      | 👎 Contro                                                                                                                                                             |
| :-------------------------------------------------------------------------------------------------------------------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Ampio Intervallo:** Può rappresentare numeri piccolissimi (ordine $10^{-38}$) e grandissimi (ordine $10^{38}$).           | **Perdita di Precisione:** I numeri interi molto grandi (oltre $2^{24} \approx 16$ milioni) non possono essere rappresentati esattamente perché la mantissa è finita. |
| **Standardizzazione:** Essendo uno standard universale (IEEE), garantisce la portabilità dei dati tra diverse architetture. | **Errori di Arrotondamento:** I calcoli possono accumulare errori (errore assoluto vs relativo) poiché si opera su un numero limitato di cifre significative.         |
| **Bit Nascosto:** Ottimizza lo spazio guadagnando 1 bit di precisione per la mantissa.                                      | **Complessità Hardware:** Le operazioni sono più lente e richiedono circuiti più complessi rispetto alla virgola fissa.                                               |

---

# Tabella di Confronto: Virgola Mobile vs Virgola Fissa

| Caratteristica | Virgola Mobile (IEEE 754) | Virgola Fissa (Fixed Point) |
| :--- | :--- | :--- |
| **Posizione Virgola** | Dinamica (definita dall'esponente) | Statica (implicita e bloccata) |
| **Precisione** | Variabile (alta per numeri piccoli, bassa per grandi) | Costante (dipende dai bit assegnati a $D$) |
| **Utilizzo Principale** | Numeri Reali, Calcolo Scientifico, Grafica | DSP, Valute, Sistemi Embedded semplici |
| **Intervallo Rappresentabile** | Estremamente vasto (grazie all'esponente) | Limitato (Trade-off tra parte intera e decimale) |
| **Risoluzione (Gap)** | I numeri sono più densi vicino allo zero e più radi man mano che crescono. | I numeri sono equidistanti tra loro su tutto l'asse. |