# Che cosa è

**UNICODE** è lo standard universale per la codifica dei caratteri, nato come evoluzione dell'ASCII per superarne i limiti.
Mentre l'ASCII era limitato all'alfabeto latino e all'inglese (non aveva lettere accentate o caratteri stranieri), UNICODE è stato progettato per codificare **tutti i caratteri di tutte le lingue scritte del mondo** (incluso Cinese, Arabo, Greco, ecc.), oltre a simboli matematici ed Emoji.

È uno standard indipendente dalla lingua, dal sistema operativo e dal programma utilizzato.

---

# Cosa fa

L'obiettivo di UNICODE è assegnare un numero univoco (detto **Code Point**) a qualsiasi carattere astratto, indipendentemente da come questo verrà poi visualizzato graficamente (font).

* **Capacità:** Utilizza fino a **32 bit** per carattere.
* **Potenziale:** Con 32 bit si possono rappresentare oltre **4 miliardi** di caratteri diversi ($2^{32}$).
* **Copertura:** Include alfabeti antichi, notazioni musicali e le moderne Emoji.

---

# Come è strutturato

Il cuore di UNICODE è il **Code Point**, solitamente rappresentato come una sequenza di cifre **esadecimali**.

> [!EXAMPLE] Esempi di Code Point
> * La legatura "fi": `0000FB01`
> * Un simbolo musicale greco antico: `0001D235`
> * Caratteri multilingue: A, Δ, Ж, あ, 葉

### Il Problema dello Spazio
Usare sempre 32 bit (4 byte) per ogni singolo carattere sarebbe un enorme **spreco di memoria** per i testi occidentali (che con ASCII occupavano solo 1 byte).
* *Esempio:* Un testo in inglese occuperebbe 4 volte lo spazio necessario rispetto all'ASCII.

---

# La Soluzione: Codifica UTF-8

Per risolvere il problema dello spazio, UNICODE definisce diversi formati di codifica. Il più diffuso e importante è **UTF-8**.

**UTF-8 (8-bit Unicode Transformation Format)** è una codifica a **lunghezza variabile**:
1.  **Compatibilità ASCII:** I primi 128 caratteri (0-127) usano **1 solo byte**. Un file ASCII è quindi automaticamente un file UTF-8 valido.
2.  **Adattabilità:** Gli altri caratteri usano **2, 3 o 4 byte** a seconda della necessità.

| Carattere | Byte usati in UTF-8 | Descrizione |
| :--- | :--- | :--- |
| **A** | 1 Byte | Caratteri standard (ASCII). |
| **è** | 2 Byte | Caratteri latini estesi/accentati. |
| **€** | 3 Byte | Simboli comuni. |
| **𝄞** | 4 Byte | Simboli rari / Emoji. |
