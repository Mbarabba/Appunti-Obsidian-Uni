# Che cosa è

Il **Sistema Binario** è un sistema di numerazione posizionale in **Base 2**.
È il linguaggio fondamentale dei calcolatori elettronici. A differenza del sistema decimale (che usa 10 simboli, 0-9), il binario utilizza solo **2 simboli**: **0** e **1**.

* **Bit (Binary Digit):** La singola cifra binaria (0 o 1).
* **Byte:** Una sequenza di 8 bit.

---

# Cosa fa (A cosa serve)

Mentre gli esseri umani contano in base 10 (perché abbiamo 10 dita), i computer funzionano grazie a componenti elettronici (transistor) che possono trovarsi solo in due stati fisici distinti:
1.  **ACCESO** (Corrente passa / Alta tensione) $\rightarrow$ **1**
2.  **SPENTO** (Corrente non passa / Bassa tensione) $\rightarrow$ **0**

Qualsiasi informazione digitale (numeri, testo, immagini, video, suoni) viene convertita in sequenze di bit per essere elaborata dalla CPU.

---

# Come è strutturato

È un sistema **posizionale**: il valore di ogni cifra dipende dalla sua posizione.
Le posizioni rappresentano le potenze di 2 crescenti da destra verso sinistra ($2^0, 2^1, 2^2, \dots$) e potenze negative per la parte frazionaria ($2^{-1}, 2^{-2}, \dots$).



Dato un numero binario $b_n...b_1b_0$, il suo valore è:
$$Valore = b_n \cdot 2^n + \dots + b_1 \cdot 2^1 + b_0 \cdot 2^0$$

> [!EXAMPLE] Esempio di Struttura ($101.01_2$)
> * **1** (pos 2): $1 \times 2^2 = 4$
> * **0** (pos 1): $0 \times 2^1 = 0$
> * **1** (pos 0): $1 \times 2^0 = 1$
> * **.** (virgola)
> * **0** (pos -1): $0 \times 2^{-1} = 0$
> * **1** (pos -2): $1 \times 2^{-2} = 0.25$
>
> **Totale:** $4 + 0 + 1 + 0 + 0.25 = \mathbf{5.25}_{10}$

---

# Conversioni VERSO Binario

### 1. Da Decimale Intero (Base 10) a Binario
Si utilizza il metodo delle **divisioni successive per 2**.
Si divide il numero ripetutamente per 2 e si annota il **resto** (che sarà sempre 0 o 1). La lettura dei resti avviene dall'ultimo al primo (dal basso verso l'alto).

**Esempio:** Convertire $9_{10}$
1.  $9 \div 2 = 4$ con resto **1** (LSB)
2.  $4 \div 2 = 2$ con resto **0**
3.  $2 \div 2 = 1$ con resto **0**
4.  $1 \div 2 = 0$ con resto **1** (MSB)
   $\rightarrow$ Risultato: **1001**.

### 2. Da Decimale Frazionario (Base 10) a Binario
Si utilizza il metodo delle **moltiplicazioni successive per 2**.
Si moltiplica solo la parte decimale per 2 e si annota la parte intera del risultato (0 o 1). Si continua con la nuova parte decimale finché non diventa 0 o si raggiunge la precisione desiderata.

**Esempio:** Convertire $0.6234_{10}$
1.  $0.6234 \times 2 = \mathbf{1}.2468 \rightarrow$ bit **1**
2.  $0.2468 \times 2 = \mathbf{0}.4936 \rightarrow$ bit **0**
3.  $0.4936 \times 2 = \mathbf{0}.9872 \rightarrow$ bit **0**
4.  ...

### 3. Da Esadecimale/Ottale a Binario
Ogni cifra della base di partenza viene "esplosa" nel corrispondente gruppo di bit.
* **Hex $\to$ Bin:** 1 cifra Hex = 4 bit. (Es. $F \to 1111$).
* **Oct $\to$ Bin:** 1 cifra Oct = 3 bit. (Es. $7 \to 111$).

---

# Conversioni DA Binario (Viceversa)

### 1. Da Binario a Decimale (Base 10)
Si usa la **somma pesata** delle potenze di 2, sommando i valori delle posizioni dove è presente un **1**.

$$1101_2 = (1 \cdot 8) + (1 \cdot 4) + (0 \cdot 2) + (1 \cdot 1) = 8+4+1 = 13_{10}$$

### 2. Da Binario a Esadecimale (Base 16)
Si raggruppano i bit a **gruppi di 4** partendo dalla virgola (verso sinistra per gli interi, verso destra per i decimali).
* `101101` $\to$ `0010` `1101` $\to$ **2D**

### 3. Da Binario a Ottale (Base 8)
Si raggruppano i bit a **gruppi di 3** partendo dalla virgola.
* `101101` $\to$ `101` `101` $\to$ **55**