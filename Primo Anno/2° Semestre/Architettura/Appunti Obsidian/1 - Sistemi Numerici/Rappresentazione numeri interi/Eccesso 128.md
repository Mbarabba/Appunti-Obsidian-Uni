# Cosa è?
L'eccesso 128 è un metodo per rappresentare numeri interi con segno

Rientra nella famiglia delle rappresentazioni "in Eccesso $K$", dove il valore zero viene spostato per far si che tutti i numeri rappresentati siano positivi

---
# Cosa fa?
Questo sistema "trasla" l'intervallo dei numeri interi in un intervallo di numeri interamente non negativi, sommando una costante fissa detta Bias (in questo caso 128)

Nello specifico, mappa i numeri dall'intervallo [$-128,+127$] all'intervallo senza segno [$0,255$]

---
# Come funziona?
Il funzionamento si basa su una semplice trasformazione matematica
- Al numero $X$ che si vuole rappresentare viene sommata la costante $128$
- Il risultato ottenuto $(X+128)$ è sempre positivo viene convertito in binario puro

>[!tip] Consiglio Pratico
>I numeri in Eccesso 128 corrispondono esattamente alla rappresentazioni in [[CA2 - Complemento a 2 | complemento a 2]] con il bit più significativo invertito

---# Architettura Elaboratori: Eccesso 128 (Biased)

**Tag:** #uni #architettura #numeri_binari #eccesso_k #floating_point #ripasso
**Fonte:** [[3 - NumeriConSegno.pdf]]

---

## ✍️ Come rappresentarla (Algoritmo ed Esempi)

Per codificare un numero $X$ in Eccesso 128 su 8 bit, si applica la formula:
$$Valore = X + 128$$

### Esempi Pratici

| Numero ($X$) | Calcolo ($X+128$) | Binario Puro (Risultato) | Metodo Rapido (da CA2) |
| :---: | :---: | :---: | :--- |
| **+5** | $5 + 128 = 133$ | `1000 0101` | CA2 di 5 è `0000 0101` $\to$ inverto MSB $\to$ `1000 0101` |
| **-3** | $-3 + 128 = 125$ | `0111 1101` | CA2 di -3 è `1111 1101` $\to$ inverto MSB $\to$ `0111 1101` |
| **-128** | $-128 + 128 = 0$ | `0000 0000` | (Minimo rappresentabile) |

> [!NOTE] Convenzione del Segno Invertita
> A differenza delle altre codifiche, qui il bit più significativo (MSB) indica:
> * **0** $\to$ Numeri Negativi (i più piccoli nell'intervallo traslato).
> [cite_start]* **1** $\to$ Numeri Positivi (i più grandi nell'intervallo traslato)[cite: 1651].

---

# Pro e Contro

| 👍 Pro (Vantaggi) | 👎 Contro (Svantaggi) |
| :--- | :--- |
| **Ordinamento Semplice:** I numeri sono ordinati in modo naturale dal più piccolo (`00...0`) al più grande (`11...1`). Questo semplifica i circuiti di confronto (è come confrontare numeri unsigned). | **Aritmetica Non Diretta:** Non si possono sommare direttamente due numeri in Eccesso 128 senza correggere il risultato (bisognerebbe sottrarre il bias extra aggiunto). |
| **Zero Unico:** Lo zero è rappresentato univocamente (di solito `1000 0000` nel caso standard, o traslato a seconda del bias esatto). | **Conversione:** Richiede un passaggio in più (somma del bias) rispetto alla conversione diretta in modulo e segno. |
| **Utilizzo negli Esponenti:** È lo standard per rappresentare gli esponenti nei numeri in virgola mobile (IEEE 754), perché facilita il confronto tra grandezze diverse. | |

---

# Confronto con altre codifiche

La differenza principale risiede nella gestione del **Bit più significativo (MSB)** rispetto al Complemento a 2.

| Caratteristica               | Complemento a 2 (CA2)      | Eccesso 128 (Bias)                       |
| :--------------------------- | :------------------------- | :--------------------------------------- |
| **Formula**                  | $CA1(X) + 1$               | $X + 128$                                |
| **Bit di Segno (MSB)**       | $0 = (+)$, $1 = (-)$       | **$1 = (+)$, $0 = (-)$**                 |
| **Rappresentazione dello 0** | `0000 0000`                | `1000 0000` (traslato)                   |
| **Intervallo (8 bit)**       | $[-128, +127]$             | $[-128, +127]$                           |
| **Relazione**                | Base per i calcoli interi. | Si ottiene dal CA2 **invertendo l'MSB**. |