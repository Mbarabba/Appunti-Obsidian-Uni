# Che cosa è

La **Virgola Fissa** (Fixed Point) è un metodo di rappresentazione dei numeri reali in cui si stabilisce a priori (e in modo rigido) quanti bit assegnare alla parte intera e quanti alla parte frazionaria.
La caratteristica fondamentale è che la posizione della virgola decimale è **implicita** e **fissa**: non viene memorizzata nel numero, ma è determinata dalla convenzione scelta dal programmatore o dall'hardware.

---

# Come è strutturata

Dato un numero totale di **N bit**, la struttura varia a seconda che si vogliano rappresentare solo numeri positivi o anche negativi.

### 1. Unsigned (Senza Segno)
Tutti i bit sono dedicati al valore numerico.
* **Struttura:** [ Parte Intera ($I$ bit) ] [ Parte Frazionaria ($D$ bit) ]
* **Vincolo:** $N = I + D$
* **Intervallo:** Da $0$ a un massimo determinato dalla somma delle potenze di 2 attive.

### 2. Signed (Con Segno)
Si sacrifica un bit per indicare il segno.
* **Struttura:**  Segno ($1$ bit)   Parte Intera ($I$ bit)   Parte Frazionaria ($D$ bit) 
* **Vincolo:** $N = 1 + I + D$
* **Segno:** Solitamente $0$ per positivo, $1$ per negativo.

> [!INFO] Il Trade-off (Compromesso)
> La ripartizione dei bit è una scelta progettuale critica:
> * **Più bit alla Parte Intera ($I$):** Aumenti il **range** (puoi scrivere numeri più grandi), ma perdi precisione decimale.
> * **Più bit alla Parte Frazionaria ($D$):** Aumenti la **precisione** (risoluzione più fine), ma riduci il valore massimo rappresentabile.

---

# Come rappresentarla

### Esempio 1: Da Binario a Decimale
Consideriamo il numero binario **101.01** in virgola fissa.
Si sommano le potenze di 2, usando esponenti negativi per la parte a destra della virgola ($2^{-1}, 2^{-2}, \dots$).

$$
\begin{align*}
101.01_2 &= (1 \cdot 2^2) + (0 \cdot 2^1) + (1 \cdot 2^0) + (0 \cdot 2^{-1}) + (1 \cdot 2^{-2}) \\
&= 4 + 0 + 1 + 0 + 0.25 \\
&= \mathbf{5.25}_{10}
\end{align*}
$$

### Esempio 2: Da Decimale a Binario
Consideriamo il numero **9.6234** da convertire in virgola fissa.
Si separano le due parti:

1.  **Parte Intera (9):**
    Conversione classica: $9_{10} \rightarrow \mathbf{1001}_2$

2.  **Parte Frazionaria (0.6234):**
    Si usa l'algoritmo delle **moltiplicazioni successive** per 2, prendendo la parte intera del risultato:
    * $0.6234 \times 2 = \mathbf{1}.2468$ $\rightarrow$ bit **1**
    * $0.2468 \times 2 = \mathbf{0}.4936$ $\rightarrow$ bit **0**
    * $0.4936 \times 2 = \mathbf{0}.9872$ $\rightarrow$ bit **0**
    * $0.9872 \times 2 = \mathbf{1}.9744$ $\rightarrow$ bit **1**
    * ...si continua fino a raggiungere 0 o esaurire i bit disponibili.

    Risultato approssimato: $\mathbf{1001.1001\dots}$

---

# Pro e Contro

| 👍 Pro | 👎 Contro |
| :--- | :--- |
| **Semplicità:** L'hardware per calcoli interi può essere riutilizzato facilmente. | **Rigidità:** La posizione della virgola non si adatta al numero. Non puoi rappresentare efficientemente sia la massa di un atomo che quella del sole con lo stesso formato. |
| **Velocità:** Le operazioni aritmetiche sono generalmente più veloci rispetto alla virgola mobile. | **Spreco di Memoria:** Per numeri piccoli, i bit della parte intera sono tutti a 0 (sprecati). Per numeri grandi, i bit decimali spesso non servono o non bastano. |
| | **Errore di Approssimazione:** Molti numeri decimali non sono convertibili esattamente in binario (diventano periodici), costringendo a troncamenti significativi se i bit frazionari ($D$) sono pochi. |

---

# Tabella di Confronto: Virgola Fissa vs Virgola Mobile

| Caratteristica         | Virgola Fissa (Fixed Point)                          | Virgola Mobile (Floating Point - IEEE 754)   |
| :--------------------- | :--------------------------------------------------- | :------------------------------------------- |
| **Posizione Virgola**  | **Fissa** (Implicita a una posizione predefinita)    | **Mobile** (Definita dall'esponente)         |
| **Struttura**          | Parte Intera + Parte Frazionaria                     | Segno + Esponente + Mantissa                 |
| **Range (Intervallo)** | Limitato (dipende strettamente dai bit totali)       | Molto esteso (grazie all'esponente)          |
| **Precisione**         | Assoluta (dipende dal bit meno significativo)        | Relativa (varia con la grandezza del numero) |
| **Gestione Numeri**    | Male per numeri molto piccoli o molto grandi (misti) | Ottima per ordini di grandezza molto diversi |
| **Utilizzo Tipico**    | DSP, Sistemi Embedded semplici, Valute               | Calcolo scientifico, Grafica 3D, PC moderni  |

---
# Guida al Calcolo dell'Errore di Quantizzazione (Virgola Fissa)

## 🎯 Obiettivo
Calcolare l'**errore di approssimazione** ($E$) che si commette rappresentando un numero reale $x$ all'interno di un sistema a **virgola fissa** con un intervallo limitato e un numero di bit finito.

## 🧮 Formule Fondamentali

### 1. Range (Intervallo)
È l'ampiezza totale dei valori rappresentabili.
$$\text{Range} = \text{Max} - \text{Min}$$

### 2. Risoluzione (Quantum o Step) $\Delta$
È la distanza minima tra due valori consecutivi rappresentabili. Dipende dal numero di bit ($n$).
$$\Delta = \frac{\text{Range}}{2^n}$$

### 3. Errore Assoluto
$$E = \text{Numero Reale} - \text{Numero Quantizzato}$$
$$E = x - \hat{x}$$

---

## 🚀 Procedimento Passo-Passo

### Passo 1: Identificare i Dati
Devi avere a disposizione:
* **Intervallo**: $[Min, Max]$
* **Bit disponibili**: $n$
* **Numero target**: $x$

### Passo 2: Calcolare la Risoluzione ($\Delta$)
Usa la formula del punto 2. Questo valore ti dice quanto è "fine" la tua griglia.
> *Esempio: Se $\Delta = 0.01$, il sistema può scrivere solo 11.45, 11.46, 11.47...*

### Passo 3: Calcolare gli "Step" (Livello intero)
Dobbiamo capire a quale "gradino" della scala corrisponde il nostro numero $x$.
1. Trova la distanza dal minimo (offset):
   $$\text{Offset} = x - \text{Min}$$
2. Dividi l'offset per la risoluzione per trovare il numero di step ideali (con la virgola):
   $$\text{Step}_{float} = \frac{\text{Offset}}{\Delta}$$

### Passo 4: Quantizzazione (Intero $Q$)
Il calcolatore non può salvare step con la virgola. Devi scegliere un intero $Q$ in base alla politica richiesta:
* **Troncamento (Floor):** Prendi la parte intera inferiore.
  $$Q = \lfloor \text{Step}_{float} \rfloor$$
* **Arrotondamento (Round):** Prendi l'intero più vicino.
  $$Q = \text{round}(\text{Step}_{float})$$

### Passo 5: Ricostruzione del Valore ($\hat{x}$)
Torniamo nel dominio dei numeri reali per vedere quale valore viene effettivamente salvato.
$$\hat{x} = \text{Min} + (Q \times \Delta)$$

### Passo 6: Calcolo dell'Errore
Fai la differenza tra il numero originale e quello ricostruito.
$$E = x - \hat{x}$$

---

## 📝 Esempio Pratico (L'esercizio d'esame)

**Dati:**
- Intervallo: $[11.45, \ 21.69]$
- Bit: $n=10$
- Numero target: $x = 17.665774$

**Svolgimento:**

1. **Range**: $21.69 - 11.45 = 10.24$
2. **Risoluzione ($\Delta$)**:
   $$\Delta = \frac{10.24}{2^{10}} = \frac{10.24}{1024} = 0.01$$
3. **Calcolo Step**:
   - Offset: $17.665774 - 11.45 = 6.215774$
   - Step Float: $6.215774 / 0.01 = 621.5774$
4. **Quantizzazione (Troncamento)**:
   - Prendiamo l'intero inferiore: $Q = 621$
   *(Nota: Se fosse arrotondamento sarebbe 622)*
5. **Ricostruzione ($\hat{x}$)**:
   $$\hat{x} = 11.45 + (621 \times 0.01) = 11.45 + 6.21 = 17.66$$
6. **Errore Finale**:
   $$E = 17.665774 - 17.66 = 0.005774$$