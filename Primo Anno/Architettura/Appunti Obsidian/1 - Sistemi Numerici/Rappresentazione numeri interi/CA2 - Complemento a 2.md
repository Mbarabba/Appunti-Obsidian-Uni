# Cose è?
Il complemento a 2 è il metodo standard utilizzato nei moderni calcolatori per rappresentare i numeri interi con segno

Nasce come evoluzione del complemento a 1 per risolvere il problema del doppio zero

---
# Cosa fa?
Il CA2 permette di rappresentare numeri e positivi in modo che lo zero abbia un'unica rappresentazione

La sua funzione principale è rendere l'aritmetica più efficiente

Permette di trasformare le sottrazioni in somme, calcolare $A-B$ diventa equivalente a calcolare $A+CA2(B)$

---
# Come funziona?
Il sistema utilizza il bit più significativo come indicatore del segno
- 0 per positivo
- 1 per negativo

La codifica dei valori segue regole precise :
- **Numeri positivi**
  Rimangono invariati rispetto al binario puro
- **Numeri negativi**
  Si ottengono partendo dal numero positivo, effettuando il [[CA1 - Complemento a 1#Come funziona| complemento a 1]] e aggiungendo 1 al risultato
  *Formula :*$CA2(X) = CA1(X) + 1$
---

# Come rappresentarla (Algoritmo ed Esempi)

Il procedimento per ottenere la rappresentazione in Complemento a 2 varia a seconda del segno del numero:

1.  **Numeri Positivi:** La conversione è identica al binario puro. Il bit di segno (MSB) è `0`.
2.  **Numeri Negativi:** Si applica l'algoritmo **"Inverti e Aggiungi 1"**:
    1.  Prendi il corrispondente numero positivo.
    2.  Esegui il **Complemento a 1** (inverti tutti i bit).
    3.  **Somma 1** al risultato ottenuto.

### Esempi Pratici (su 4 bit)

|  Valore  | Procedimento                                                                                   | Risultato Binario |
| :------: | :--------------------------------------------------------------------------------------------- | :---------------: |
|  **+7**  | Conversione diretta di 7 in binario.                                                           |      `0111`       |
|  **-7**  | 1. Parto da +7: `0111`<br>2. Inverto i bit: `1000`<br>3. Aggiungo 1: `1000 + 1`                |      `1001`       |
| **Zero** | 1. Parto da 0: `0000`<br>2. Inverto: `1111`<br>3. Aggiungo 1: `(1)0000` (il riporto si scarta) |      `0000`       |
|  **-1**  | 1. Parto da +1: `0001`<br>2. Inverto: `1110`<br>3. Aggiungo 1: `1111`                          |      `1111`       |

---

# Pro e Contro

| 👍 Pro (Vantaggi)                                                                                                                                                     | 👎 Contro (Svantaggi)                                                                                                                                                                                                                     |
| :-------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Zero Unico:** Risolve definitivamente il problema del doppio zero ($+0$ e $-0$). Esiste solo `0000`.                                                                | **Asimmetria dell'Intervallo:** L'intervallo non è perfettamente simmetrico. Esiste un numero negativo in più rispetto ai positivi (es. su 8 bit: da -128 a +127). [cite_start]Non esiste il corrispondente positivo di -128[cite: 1343]. |
| **Efficienza Hardware (ALU):** Permette di usare lo stesso circuito sommatore per somme e sottrazioni. La sottrazione $A - B$ viene eseguita come somma $A + CA2(B)$. | **Leggibilità Umana:** È difficile determinare "a occhio" il valore decimale di un numero negativo (es. `1001` è -7) senza eseguire il processo inverso.                                                                                  |
| **Estensione del Segno Semplice:** Per aumentare i bit (es. da 8 a 16), basta copiare il bit di segno (MSB) nelle nuove posizioni a sinistra .                        |                                                                                                                                                                                                                                           |

---

# Confronto con le altre codifiche

Tabella riassuntiva che evidenzia perché il CA2 è lo standard odierno rispetto alle codifiche storiche o speciali.

| Caratteristica            | Modulo e Segno (MS)          | Complemento a 1 (CA1)         | **Complemento a 2 (CA2)**         | Eccesso 128 (Bias)            |
| :------------------------ | :--------------------------- | :---------------------------- | :-------------------------------- | :---------------------------- |
| **Generazione Negativo**  | Cambio MSB (`0`$\to$`1`)     | Inverto tutti i bit           | Inverto bit + 1                   | Sommo costante (Bias)         |
| **Rappresentazione Zero** | **Doppia** ($+0, -0$)        | **Doppia** (`00..0`, `11..1`) | **Unica (`00..0`)**               | **Unica** (traslata)          |
| **Intervallo (8 bit)**    | Simmetrico<br>$[-127, +127]$ | Simmetrico<br>$[-127, +127]$  | **Asimmetrico**<br>$[-128, +127]$ | Asimmetrico<br>$[-128, +127]$ |
| **Efficienza Calcolo**    | Bassa (logica complessa)     | Media (riporto circolare)     | **Ottima** (somma diretta)        | Media (confronti rapidi)      |
| **Utilizzo Principale**   | Mantissa Floating Point      | Obsoleto                      | **Interi (CPU/ALU)**              | Esponenti Floating Point      |