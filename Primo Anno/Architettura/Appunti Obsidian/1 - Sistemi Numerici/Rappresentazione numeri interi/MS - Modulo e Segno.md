# Cose è?
La rappresentazione in modulo e segno è il metodo più intuitivo per rappresentare numeri interi

---
# Cosa fa?
Serve a superare il limite dell'aritmetica binaria pura permettendo di codificare il segno di un numero all'interno della sequenza di bit

---
# Come funziona?
Supponiamo di avere N bit totali, la struttura è :
- **Bit di Segno (MSB)** : Il bit più significativo viene usato per indicare il segno
	- 0 = Positivo
	- 1 = Negativo
- **Modulo (Valore assoluto)** : I restanti $N-1$ bit rappresentano il valore assoluto del numero in binario puro
---
# Come rappresentarla (con Esempi)

La rappresentazione **Modulo e Segno** (MS) utilizza il bit più significativo (MSB - Most Significant Bit) come indicatore del segno e i restanti bit per il valore assoluto (modulo).

### Struttura (su N bit)
* **Bit di Segno (1 bit):**
    * `0` = Positivo ($+$)
    * `1` = Negativo ($-$)
* **Modulo (N-1 bit):** Rappresenta la grandezza del numero in binario puro.

### Esempi Pratici (su 8 bit)

**1. Rappresentazione di $+4$**
* Segno ($+$): `0`
* Modulo ($4$): `0000100` (7 bit)
* **Risultato:** `00000100`

**2. Rappresentazione di $-4$**
* Segno ($-$): `1`
* Modulo ($4$): `0000100` (7 bit)
* **Risultato:** `10000100`

### Intervallo Rappresentabile
Con $N$ bit, l'intervallo è **simmetrico**:
$$[-(2^{n-1}-1), +(2^{n-1}-1)]$$
* *Esempio (8 bit):* Da $-127$ a $+127$.

---

# Pro e Contro

| 👍 Pro (Vantaggi) | 👎 Contro (Svantaggi) |
| :--- | :--- |
| **Intuitività Umana:** Rispecchia il nostro modo di scrivere i numeri (segno + valore). La lettura è immediata. | **Doppio Zero:** Esistono due codifiche per lo zero: $+0$ (`0000...`) e $-0$ (`1000...`). Questo complica i circuiti di confronto (es. check `if x == 0`). |
| **Simmetria:** Il range dei numeri positivi e negativi è identico. | **Aritmetica Complessa:** L'ALU (Unità Aritmetico Logica) non può sommare direttamente i bit. Deve prima analizzare i segni, decidere se fare somma o sottrazione e gestire il segno del risultato. È inefficiente per l'hardware. |
| **Cambio Segno Rapido:** Per invertire il segno di un numero basta cambiare il primo bit (0 $\leftrightarrow$ 1). | **Spreco di Rappresentazione:** A causa del doppio zero, si perde una combinazione utile (si rappresentano $2^N - 1$ numeri distinti invece di $2^N$). |

---

# Confronto con altre codifiche

Ecco come il Modulo e Segno si posiziona rispetto alle altre principali rappresentazioni per interi.

| Caratteristica | Modulo e Segno (MS) | Complemento a 1 (CA1) | Complemento a 2 (CA2) | Eccesso K (Bias) |
| :--- | :--- | :--- | :--- | :--- |
| **Creazione Negativo** | Cambio solo il bit di segno (`1` al posto di `0`). | Inverto **tutti** i bit (NOT logico). | Inverto tutti i bit e **aggiungo 1** ($CA1 + 1$). | Sommo una costante fissa (Bias) al numero. |
| **Gestione dello Zero** | **Doppio** ($+0$, $-0$). | **Doppio** ($00..0$, $11..1$). | **Unico** ($00..0$). | **Unico** (traslato). |
| **Intervallo (8 bit)** | Simmetrico: $[-127, +127]$. | Simmetrico: $[-127, +127]$. | Asimmetrico: $[-128, +127]$. | Asimmetrico: $[-128, +127]$. |
| **Facilità Aritmetica** | Bassa (regole complesse). | Media (richiede gestione del riporto ciclico). | **Alta** (la somma funziona sempre uguale). | Media (usata per confronti veloci). |
| **Utilizzo Tipico** | Mantissa dei numeri Floating Point. | Storico (vecchi computer). | **Standard universale** per interi (CPU). | Esponenti dei numeri Floating Point. |

> [!SUMMARY] Sintesi
> Sebbene il **Modulo e Segno** sia il più semplice per noi umani, il **Complemento a 2** è il vincitore assoluto per i calcolatori, grazie all'unicità dello zero e alla possibilità di usare lo stesso circuito sommatore per numeri positivi e negativi.