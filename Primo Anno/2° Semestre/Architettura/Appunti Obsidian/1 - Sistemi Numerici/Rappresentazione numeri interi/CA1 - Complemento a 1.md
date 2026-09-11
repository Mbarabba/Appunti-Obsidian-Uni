# Cosa è?
Il complemento a 1 è un metodo per rappresentare i numeri interi

Il nome deriva dall'operazione matematica di "complemento", che nel sistema binario significa invertire il valore dei bit

---
# Cosa fa?
Questo sistema permette di ottenere il numero negativo corrispondente a un numero positivo semplicemente invertendo tutti i suoi bit

---
# Come funziona
- **Numeri Positivi**
  Se il numero da codificare è positivo, lo si converte in binario con il [[Sistema Binario#Conversioni VERSO Binario | metodo]]
- **Numeri Negativi**
  Se il numero è negativo, si converte prima il suo valore assoluto in binario e poi si esegue l'operazione di complemento su tutti i bit ottenuti
## Esempi Pratici (su 4 bit)

| Valore | Procedimento                                                       | Risultato Binario |
| :----: | :----------------------------------------------------------------- | :---------------: |
| **+3** | Converto 3 in binario: `0011`. Essendo positivo, ho finito.        |      `0011`       |
| **-3** | 1. Modulo (3) in binario: `0011`<br>2. Inverto tutti i bit: `1100` |      `1100`       |
| **+0** | Binario puro di 0.                                                 |      `0000`       |
| **-0** | Inverto i bit di `0000`.                                           |      `1111`       |

---

# Pro e Contro

| 👍 Pro (Vantaggi) | 👎 Contro (Svantaggi) |
| :--- | :--- |
| **Semplicità Logica:** L'operazione di inversione dei bit è estremamente facile da realizzare a livello hardware (porte NOT). | [cite_start]**Doppio Zero:** Esistono due rappresentazioni diverse per lo zero (`0000` e `1111`), il che complica i circuiti di confronto e le operazioni aritmetiche[cite: 1314]. |
| **Simmetria:** L'intervallo dei numeri rappresentabili è simmetrico rispetto allo zero. | **Calcolo Complesso:** Le operazioni di somma richiedono la gestione del "riporto circolare" (end-around carry) per correggere il risultato, rendendolo meno efficiente del CA2. |

---

# Confronto con altre codifiche

Ecco una tabella comparativa che riassume le differenze tra CA1 e gli altri metodi principali trattati nel corso

| Caratteristica                  | Modulo e Segno (MS)                                                 | Complemento a 1 (CA1)                                                    | Complemento a 2 (CA2)                                                     | Eccesso 128 (Bias)                                               |
| :------------------------------ | :------------------------------------------------------------------ | :----------------------------------------------------------------------- | :------------------------------------------------------------------------ | :--------------------------------------------------------------- |
| **Ottenere il Negativo**        | [cite_start]Cambio solo il bit di segno (MSB) a 1[cite: 1254].      | [cite_start]Inverto **tutti** i bit ($0 \leftrightarrow 1$)[cite: 1289]. | [cite_start]Inverto tutti i bit e **aggiungo 1** ($CA1 + 1$)[cite: 1332]. | [cite_start]Sommo il bias (es. $X + 128$)[cite: 1634].           |
| **Rappresentazione dello Zero** | [cite_start]**Doppia**<br>($+0, -0$) [cite: 1273]                   | [cite_start]**Doppia**<br>(`00..0`, `11..1`) [cite: 1315]                | [cite_start]**Unica**<br>(`00..0`) [cite: 1341]                           | [cite_start]**Unica**<br>(traslata, es. `100..0`) [cite: 1617]   |
| **Intervallo (n bit)**          | [cite_start]Simmetrico<br>$[-(2^{n-1}-1), +2^{n-1}-1]$ [cite: 1271] | Simmetrico<br>$[-(2^{n-1}-1), +2^{n-1}-1]$                               | [cite_start]Asimmetrico<br>$[-2^{n-1}, +2^{n-1}-1]$ [cite: 1343]          | [cite_start]Asimmetrico<br>$[-2^{n-1}, +2^{n-1}-1]$ [cite: 1617] |
| **Bit di Segno (MSB)**          | $0 = +$, $1 = -$                                                    | $0 = +$, $1 = -$                                                         | [cite_start]$0 = +$, $1 = -$ [cite: 1342]                                 | [cite_start]**Invertito**<br>$1 = +$, $0 = -$ [cite: 1651]       |