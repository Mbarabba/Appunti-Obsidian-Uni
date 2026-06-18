# Che cosa è

**ASCII** (American Standard Code for Information Interchange) è uno standard internazionale per la rappresentazione dei caratteri di testo all'interno dei calcolatori.
È un codice accettato da tutti i computer ed è stato storicamente utilizzato fin dai tempi delle telescriventi durante la prima guerra mondiale.

Esistono due varianti principali:
1.  **ASCII Standard:** Utilizza **7 bit** per rappresentare un singolo carattere, permettendo di codificare un totale di **128 simboli** ($2^7$).
2.  **ASCII Esteso:** Utilizza **8 bit** (1 byte), estendendo i simboli rappresentabili a **256** ($2^8$), includendo caratteri accentati o grafici non presenti nella versione standard.

---

# Cosa fa

Il codice ASCII permette di associare univocamente un **numero** a ogni carattere (lettera minuscola, maiuscola, punteggiatura, cifra, ecc.).
In questo modo, le parole vengono memorizzate e trasmesse dal computer semplicemente come **sequenze di numeri** (o sequenze di bit).

> [!INFO] Esempio
> La parola "Informatica" non è altro che una sequenza di codici binari:
> * **I** = `01001001`
> * **n** = `01101110`
> * **f** = `01100110` ... e così via.

---

# Come lo fa (Struttura)

Lo standard ASCII organizza i 128 caratteri disponibili in gruppi logici ordinati.
Le regole di codifica seguono una logica precisa:
* **Cifre (0-9):** Sono ordinate per valore crescente.
* **Lettere Maiuscole (A-Z):** Sono ordinate alfabeticamente.
* **Lettere Minuscole (a-z):** Sono ordinate alfabeticamente e si trovano a una **distanza fissa** dalle rispettive maiuscole (basta cambiare un bit per passare da maiuscolo a minuscolo).

### Suddivisione dei Range (ASCII Standard)
I 128 caratteri sono mappati nei seguenti intervalli decimali:

| Range Decimale | Tipologia Caratteri | Note |
| :--- | :--- | :--- |
| **0 - 31** | Caratteri di Controllo | Non stampabili, servono per le periferiche (es. `LF`, `CR`, `ESC`). |
| **32 - 47** | Vari e Simboli | Include lo spazio (`32`) e simboli come `!`, `"`, `#`. |
| **48 - 57** | **Cifre Decimali** | Da `0` a `9`. |
| **58 - 64** | Vari caratteri | Simboli come `:`, `;`, `<`, `=`. |
| **65 - 90** | **Lettere Maiuscole** | Da `A` a `Z`. |
| **91 - 96** | Vari caratteri | Parentesi quadre `[`, `]`, ecc. |
| **97 - 122** | **Lettere Minuscole** | Da `a` a `z`. |
| **123 - 127** | Vari caratteri | Parentesi graffe `{`, `|`, `}` e `DEL`. |

---

# Tabella ed Esempi di Conversione

Ecco alcuni esempi significativi di come i caratteri vengono convertiti in decimale e binario.

### Esempi Chiave

| Carattere | Decimale | Binario (7 bit) | Calcolo Posizionale |
| :---: | :---: | :---: | :--- |
| **A** | 65 | `100 0001` | $1 \times 2^6 + 1 \times 2^0 = 64 + 1$ |
| **a** | 97 | `110 0001` | *Nota la somiglianza con 'A'* |
| **0** (cifra) | 48 | `011 0000` | |
| **{** | 123 | `111 1011` | $64 + 32 + 16 + 8 + 2 + 1$ |

