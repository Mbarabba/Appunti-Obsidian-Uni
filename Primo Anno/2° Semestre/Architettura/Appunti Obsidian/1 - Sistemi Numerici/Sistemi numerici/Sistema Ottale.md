
# Che cosa è

Il **Sistema Ottale** è un sistema di numerazione posizionale in **Base 8**.
Utilizza **8 simboli distinti** per rappresentare i valori numerici: le cifre da **0 a 7**.

| Cifre | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
| :---: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
| **Binario** | 000 | 001 | 010 | 011 | 100 | 101 | 110 | 111 |

⚠️ **Nota:** Le cifre 8 e 9 *non esistono* in questo sistema. Scrivere $18_8$ è un errore.

---

# Cosa fa (A cosa serve)

Come l'esadecimale, anche il sistema ottale serve per rappresentare in modo compatto le stringhe binarie.
* **Mappatura Diretta:** Poiché $8 = 2^3$, ogni cifra ottale corrisponde esattamente a **3 bit**.
* **Utilizzi Storici e Attuali:**
    * Era molto diffuso sui vecchi mainframe (come il PDP-11) che usavano parole a 12, 24 o 36 bit (divisibili per 3).
    * Oggi è famoso soprattutto nei sistemi **Unix/Linux** per la gestione dei **permessi dei file** (es. `chmod 755`), dove ogni cifra rappresenta i permessi di Lettura/Scrittura/Esecuzione (rwx) per Utente, Gruppo e Altri.

---

# Come è strutturato

È un sistema **posizionale** dove le posizioni rappresentano le potenze di 8 crescenti da destra verso sinistra.

Dato un numero ottale $o_n...o_1o_0$, il suo valore è:
$$Valore = o_n \cdot 8^n + \dots + o_1 \cdot 8^1 + o_0 \cdot 8^0$$

> [!EXAMPLE] Esempio di Struttura ($153_8$)
> * **3** (posizione 0): $3 \times 8^0 = 3 \times 1 = 3$
> * **5** (posizione 1): $5 \times 8^1 = 5 \times 8 = 40$
> * **1** (posizione 2): $1 \times 8^2 = 1 \times 64 = 64$
>
> **Totale:** $64 + 40 + 3 = 107_{10}$

---

# Conversioni VERSO Ottale

### 1. Da Decimale (Base 10) a Ottale
Si utilizza il metodo delle **divisioni successive per 8**. Si prende il resto della divisione come cifra.

**Esempio:** Convertire $107_{10}$
1.  $107 \div 8 = 13$ con resto **3**
2.  $13 \div 8 = 1$ con resto **5**
3.  $1 \div 8 = 0$ con resto **1**
4.  Si leggono i resti dal basso verso l'alto: **153**.

### 2. Da Binario (Base 2) a Ottale
Si raggruppano i bit a **gruppi di 3** partendo da destra (dalla virgola).

**Esempio:** Convertire `1101011101`
1.  Raggruppa: `001` | `101` | `011` | `101` (aggiunti due zeri iniziali)
2.  Converti i gruppi:
    * `001` = 1
    * `101` = 5
    * `011` = 3
    * `101` = 5
3.  Risultato: **1535**.

### 3. Da Esadecimale (Base 16) a Ottale
Metodo "a ponte" passando per il binario.
**Esadecimale $\to$ Binario $\to$ Ottale**

**Esempio:** Convertire $3D_{16}$
1.  Converti in binario (4 bit per cifra hex):
    * $3 \to 0011$
    * $D \to 1101$
    * Binario: `00111101`
2.  Raggruppa per 3 (per l'Oct):
    * `000` | `011` | `111` | `101` (gli zeri iniziali extra non contano)
    * `011` | `111` | `101`
3.  Converti in ottale:
    * $3$ | $7$ | $5$
4.  Risultato: **375**.

---

# Conversioni DA Ottale (Viceversa)

### 1. Da Ottale a Decimale (Base 10)
Si usa la **somma pesata** (polinomio) vista nella sezione "Struttura".
$$24_8 = (2 \times 8^1) + (4 \times 8^0) = 16 + 4 = 20_{10}$$

### 2. Da Ottale a Binario (Base 2)
Si "esplode" ogni singola cifra ottale nei suoi **3 bit** corrispondenti.

**Esempio:** Convertire **705**
1.  **7** $\to$ `111`
2.  **0** $\to$ `000` (importante non saltarlo!)
3.  **5** $\to$ `101`
4.  Risultato: `111000101`.

### 3. Da Ottale a Esadecimale (Base 16)
Si usa il "ponte" binario.
**Ottale $\to$ Binario $\to$ Esadecimale**

**Esempio:** Convertire $75_8$
1.  Esplodi in binario (3 bit per cifra):
    * $7 \to 111$
    * $5 \to 101$
    * Binario: `111101`
2.  Raggruppa per 4 (partendo da destra):
    * `0011` | `1101`
3.  Converti in Hex:
    * $3$ | $D$
4.  Risultato: **3D**.