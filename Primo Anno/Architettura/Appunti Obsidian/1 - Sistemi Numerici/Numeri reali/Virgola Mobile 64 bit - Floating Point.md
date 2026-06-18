# Architettura Elaboratori: Virgola Mobile 64 Bit (Double)
# Che cos'è

La rappresentazione in **virgola mobile a 64 bit** (spesso chiamata *Double precision*) è lo standard utilizzato per calcoli numerici che richiedono elevata precisione e un ampio intervallo di grandezze.
Rispetto alla versione a 32 bit (float), offre più bit per l'esponente (quindi numeri più grandi/piccoli) e molti più bit per la mantissa (quindi più cifre significative).

---

# Struttura dei Bit

I 64 bit sono suddivisi in tre campi fondamentali:

| Campo | Dimensione | Posizione Bit | Descrizione |
| :--- | :---: | :---: | :--- |
| **Segno (S)** | **1 bit** | 63 | `0` = Positivo, `1` = Negativo. |
| **Esponente (E)** | **11 bit** | 62 - 52 | Rappresentato in **Eccesso 1023** (Bias). |
| **Mantissa (M)** | **52 bit** | 51 - 0 | La parte frazionaria. Include un "1" implicito (hidden bit). |

# Formula del Valore
Il valore decimale si calcola con la formula:

$$V = (-1)^S \times (1.M) \times 2^{E - 1023}$$

> [!NOTE] Il Bias (Polarizzazione)
> L'esponente non è in Complemento a 2, ma in **Eccesso K**.
> Per 11 bit, il Bias è $K = 2^{11-1} - 1 = \mathbf{1023}$.
> * $E_{min} = 1 \to 1 - 1023 = -1022$
> * $E_{max} = 2046 \to 2046 - 1023 = +1023$
> *(0 e 2047 sono riservati)*

---

# Range di Valori Rappresentabili

La capacità di rappresentazione a 64 bit è immensa. Ecco i limiti teorici:

### 1. Massimo Valore Assoluto (Max Value)
Il numero più grande rappresentabile (prima di sfociare in $+ \infty$).
* **Esponente:** Massimo ($2046 \to +1023$).
* **Mantissa:** Massima (tutti 1 $\approx 2.0$).
* **Valore:** $\approx 2 \times 2^{1023}$
* **Decimale:**
$$\approx 1.797 \times 10^{308}$$

### 2. Minimo Valore "Normalizzato" Positivo
Il numero più piccolo rappresentabile mantenendo la massima precisione (1.xxxx).
* **Esponente:** Minimo ($1 \to -1022$).
* **Mantissa:** Minima (tutti 0 $\to 1.0$).
* **Valore:** $1.0 \times 2^{-1022}$
* **Decimale:**
$$\approx 2.225 \times 10^{-308}$$

### 3. Minimo Valore "Denormalizzato" Positivo
Il numero più piccolo in assoluto (vicinissimo allo zero), perdendo precisione (0.xxxx).
* **Esponente:** 0 (Segnala numero denormalizzato, esponente effettivo -1022).
* **Mantissa:** Solo l'ultimo bit a 1 ($2^{-52}$).
* **Valore:** $2^{-1022} \times 2^{-52} = 2^{-1074}$
* **Decimale:**
$$\approx 4.940 \times 10^{-324}$$

---

# Precisione e Cifre Significative

Mentre il *range* indica quanto grande/piccolo può essere il numero, la *precisione* indica quante cifre decimali sono affidabili.

* **Bit di Mantissa:** $52 + 1$ (hidden bit) = 53 bit.
* **Cifre Decimali Significative:**
  $$53 \times \log_{10}(2) \approx 15.95$$
  In pratica, il double garantisce **15-17 cifre decimali** di precisione.

> [!WARNING] Machine Epsilon
> La più piccola differenza tra 1.0 e il numero successivo rappresentabile è circa **$2.22 \times 10^{-16}$**. Errori più piccoli di questa soglia vengono persi nell'arrotondamento.

---

## 🛡️ Valori Speciali (Riservati)

Alcune combinazioni di esponente sono riservate per casi non numerici.

| Esponente ($E$) | Mantissa ($M$) | Significato |
| :---: | :---: | :--- |
| **0** (00..0) | **0** (00..0) | **Zero** ($\pm 0$) |
| **0** (00..0) | $\neq 0$ | **Numeri Denormalizzati** (Subnormal) |
| **2047** (11..1) | **0** (00..0) | **Infinito** ($\pm \infty$) |
| **2047** (11..1) | $\neq 0$ | **NaN** (Not a Number - es. $\sqrt{-1}$) |

---

# Confronto Rapido: Float (32) vs Double (64)

| Caratteristica | Float (32 bit)               | Double (64 bit)               |
| :------------- | :--------------------------- | :---------------------------- |
| **Esponente**  | 8 bit ($+127$)               | 11 bit ($+1023$)              |
| **Mantissa**   | 23 bit                       | 52 bit                        |
| **Range Max**  | $\approx 3.4 \times 10^{38}$ | $\approx 1.8 \times 10^{308}$ |
| **Precisione** | ~7 cifre                     | ~16 cifre                     |
| **Uso Tipico** | Grafica 3D, Audio            | Calcolo Scientifico, Finanza  |