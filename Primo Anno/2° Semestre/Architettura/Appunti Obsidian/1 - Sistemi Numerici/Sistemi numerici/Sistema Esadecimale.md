# Che cosa è

Il **Sistema Esadecimale** (spesso abbreviato in **Hex**) è un sistema di numerazione posizionale in **Base 16**.
A differenza del sistema decimale (che usa 10 simboli) o binario (che ne usa 2), l'esadecimale utilizza **16 simboli distinti** per rappresentare i valori numerici.

I simboli utilizzati sono:
1.  Le cifre da **0 a 9** (per i valori da 0 a 9).
2.  Le lettere da **A a F** (per i valori da 10 a 15).

|   Hex   |  A  |  B  |  C  |  D  |  E  |  F  |
| :-----: | :-: | :-: | :-: | :-: | :-: | :-: |
| **Dec** | 10  | 11  | 12  | 13  | 14  | 15  |

---

# Cosa fa (A cosa serve)

Il computer non "ragiona" in esadecimale (lavora solo in binario, ON/OFF). Il sistema esadecimale serve principalmente agli **esseri umani** come strumento di **rappresentazione compatta**.

* **Leggibilità:** Una sequenza binaria lunga e illeggibile come `101011001111` diventa `ACF` in esadecimale.
* **Mappatura Diretta:** Poiché $16 = 2^4$, ogni cifra esadecimale corrisponde esattamente a **4 bit** (un *nibble*). Questo rende la conversione immediata, a differenza del decimale.
* **Utilizzi Comuni:** Indirizzi di memoria (es. `0x7FFF`), codici colori (es. `#FF5733`), rappresentazione di byte e caratteri ASCII/Unicode.

---

# Come è strutturato

È un sistema **posizionale**, il che significa che il valore di una cifra dipende dalla sua posizione. Le posizioni rappresentano potenze di 16 crescenti da destra verso sinistra.

Dato un numero esadecimale $h_n...h_1h_0$, il suo valore è:
$$Valore = h_n \cdot 16^n + \dots + h_1 \cdot 16^1 + h_0 \cdot 16^0$$

> [!EXAMPLE] Esempio di Struttura ($1A3_{16}$)
> * **3** (posizione 0): $3 \times 16^0 = 3 \times 1 = 3$
> * **A** (posizione 1): $10 \times 16^1 = 10 \times 16 = 160$
> * **1** (posizione 2): $1 \times 16^2 = 1 \times 256 = 256$
>
> **Totale:** $256 + 160 + 3 = 419_{10}$

---

# Conversioni VERSO Esadecimale

### 1. Da Decimale (Base 10) a Esadecimale
Si utilizza il metodo delle **divisioni successive per 16**. Si prende il resto della divisione come cifra (convertendo i resti > 9 in lettere).

**Esempio:** Convertire $419_{10}$
1.  $419 \div 16 = 26$ con resto **3**
2.  $26 \div 16 = 1$ con resto **10** ($\to$ **A**)
3.  $1 \div 16 = 0$ con resto **1**
4.  Si leggono i resti dal basso verso l'alto: **1A3**.

### 2. Da Binario (Base 2) a Esadecimale
Si raggruppano i bit a **gruppi di 4** partendo da destra (dalla virgola). Se mancano bit a sinistra, si aggiungono zeri.

**Esempio:** Convertire `1101011101`
1.  Raggruppa: `0011` | `0101` | `1101` (aggiunti due zeri iniziali)
2.  Converti i gruppi:
    * `0011` = 3
    * `0101` = 5
    * `1101` = 13 ($\to$ **D**)
3.  Risultato: **35D**.

### 3. Da Ottale (Base 8) a Esadecimale
Non si fa quasi mai direttamente. Il metodo più veloce è passare per il binario (metodo "a ponte").
**Ottale $\to$ Binario $\to$ Esadecimale**

**Esempio:** Convertire $75_8$
1.  Converti in binario (ogni cifra ottale = 3 bit):
    * $7 \to 111$
    * $5 \to 101$
    * Binario: `111101`
2.  Raggruppa per 4 (per l'Hex):
    * `0011` | `1101`
3.  Converti in Hex:
    * $3$ | $D$
4.  Risultato: **3D**.

---

# Conversioni DA Esadecimale (Viceversa)

### 1. Da Esadecimale a Decimale (Base 10)
Si usa la **somma pesata** (polinomio) vista nella sezione "Struttura".
$$C3_{16} = (12 \times 16^1) + (3 \times 16^0) = 192 + 3 = 195_{10}$$

### 2. Da Esadecimale a Binario (Base 2)
Si "esplode" ogni singola cifra esadecimale nei suoi **4 bit** corrispondenti.

**Esempio:** Convertire **35D**
1.  **3** $\to$ `0011`
2.  **5** $\to$ `0101`
3.  **D** (13) $\to$ `1101`
4.  Risultato: `001101011101` (gli zeri iniziali si possono omettere: `1101011101`).

### 3. Da Esadecimale a Ottale (Base 8)
Anche qui si usa il "ponte" binario.
**Esadecimale $\to$ Binario $\to$ Ottale**

**Esempio:** Convertire **3D**
1.  Esplodi in binario (4 bit per cifra):
    * `0011` `1101` $\to$ `111101`
2.  Raggruppa per 3 (partendo da destra):
    * `111` | `101`
3.  Converti in ottale:
    * $7$ | $5$
4.  Risultato: **75**.