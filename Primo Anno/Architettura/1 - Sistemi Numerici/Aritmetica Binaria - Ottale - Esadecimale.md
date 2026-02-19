# Concetto Generale

L'aritmetica posizionale funziona allo stesso modo in tutte le basi.
Cambia solo il valore al quale scatta il **Riporto** (Carry) o dal quale si chiede il **Prestito** (Borrow).

* **Decimale (Base 10):** Riporto se somma $\ge 10$. Prestito vale 10.
* **Binario (Base 2):** Riporto se somma $\ge 2$. Prestito vale 2.
* **Ottale (Base 8):** Riporto se somma $\ge 8$. Prestito vale 8.
* **Esadecimale (Base 16):** Riporto se somma $\ge 16$. Prestito vale 16.

---

# Sistema Binario (Base 2)

### ➕ Somma
Regole base :
* $0+0=0$
* $0+1=1$
* $1+1=0$ con riporto di **1**
* $1+1+1=1$ con riporto di **1**

> [!EXAMPLE] Esempio: $19 + 17$ (in binario)
> ```
>   RIPORTO: 000100
>   ADD 1:   010011 (19) +
>   ADD 2:   010001 (17) =
>   -------  ------
>   RISULT:  100100 (36)
> ```
> *Dettaglio colonna 0 (dx):* $1+1 = 0$ riporto 1.
> *Dettaglio colonna 1:* $1+0+1 (\text{riporto}) = 0$ riporto 1.

### ➖ Sottrazione
Regole base :
* $0-1=1$ con prestito di **1** dal bit a sinistra (che vale 2 unità attuali).

> [!EXAMPLE] Esempio: $29 - 14$
> ```
>   PRESTITO: .222..
>   MINUENDO: 11101 (29) -
>   SOTTR.:   01110 (14) =
>   --------  -----
>   RISULT:   01111 (15)
> ```
> *Nota:* Quando prendi un prestito da un bit che è 0, devi andare a sinistra finché trovi un 1 e "trascinare" il prestito (il bit intermedio diventa 1, quello finale riceve 2).

---

# Sistema Ottale (Base 8)

### ➕ Somma
Si sommano le cifre. Se il risultato è **$\ge 8$**:
1.  Sottrai 8 dal risultato parziale.
2.  Scrivi il resto.
3.  Riporta **1** alla colonna successiva.

> [!EXAMPLE] Esempio: $45_8 + 17_8$
> *Colonna 0:* $5 + 7 = 12$.
> * $12 \ge 8 \to$ Riporto 1.
> * $12 - 8 = 4$. Scrivo **4**.
>
> *Colonna 1:* $4 + 1 + 1 (\text{riporto}) = 6$. Scrivo **6**.
>
> **Risultato:** $64_8$ (che è $52_{10}$).

### ➖ Sottrazione
Se la cifra superiore è minore di quella inferiore ($C_1 < C_2$):
1.  Chiedi prestito a sinistra (il vicino diminuisce di 1).
2.  Il prestito vale **8**. Somma 8 a $C_1$.
3.  Esegui la sottrazione.

> [!EXAMPLE] Esempio: $64_8 - 17_8$
> *Colonna 0:* $4 - 7$ non si può.
> * Prestito dal 6 (diventa 5).
> * Il 4 riceve 8 e diventa $12$ ($4+8$).
> * $12 - 7 = 5$. Scrivo **5**.
>
> *Colonna 1:* $5 - 1 = 4$. Scrivo **4**.
>
> **Risultato:** $45_8$.

---

# Sistema Esadecimale (Base 16)

Ricorda: $A=10, B=11, C=12, D=13, E=14, F=15$.

### ➕ Somma
Si sommano le cifre. Se il risultato è **$\ge 16$**:
1.  Sottrai 16 dal risultato parziale.
2.  Scrivi il resto (in Hex).
3.  Riporta **1** alla colonna successiva.

> [!EXAMPLE] Esempio: $1A_{16} + 2C_{16}$
> *Colonna 0:* $A (10) + C (12) = 22$.
> * $22 \ge 16 \to$ Riporto 1.
> * $22 - 16 = 6$. Scrivo **6**.
>
> *Colonna 1:* $1 + 2 + 1 (\text{riporto}) = 4$. Scrivo **4**.
>
> **Risultato:** $46_{16}$.

### ➖ Sottrazione
Se $C_1 < C_2$:
1.  Chiedi prestito a sinistra (il vicino diminuisce di 1).
2.  Il prestito vale **16**. Somma 16 a $C_1$.
3.  Esegui la sottrazione.

> [!EXAMPLE] Esempio: $42_{16} - 1F_{16}$
> *Colonna 0:* $2 - F (15)$ non si può.
> * Prestito dal 4 (diventa 3).
> * Il 2 riceve 16 e diventa $18$ ($2+16$).
> * $18 - 15 = 3$. Scrivo **3**.
>
> *Colonna 1:* $3 - 1 = 2$. Scrivo **2**.
>
> **Risultato:** $23_{16}$.

---

# Tabella Rapida di Riferimento

| Operazione          | Base 2 (Bin)  | Base 8 (Oct)  | Base 16 (Hex)  |
| :------------------ | :------------ | :------------ | :------------- |
| **Soglia Riporto**  | Somma $\ge 2$ | Somma $\ge 8$ | Somma $\ge 16$ |
| **Valore Prestito** | $+2$          | $+8$          | $+16$          |
| **Simboli**         | 0, 1          | 0-7           | 0-9, A-F       |