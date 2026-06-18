## 1. Procedure Non-Leaf (Annidate)
Sono procedure che chiamano altre procedure.
**Il Problema:** La chiamata interna (es. `jal`) sovrascrive il registro `$ra` originale. Se non lo salviamo, la procedura esterna non saprà più come tornare al `main`.

**La Soluzione:**
1.  All'inizio della procedura: Salvare `$ra` nello **Stack**.
2.  Eseguire il corpo e le chiamate annidate.
3.  Alla fine (prima di `jr $ra`): Ripristinare `$ra` dallo **Stack**.

## 2. Layout della Memoria MIPS
La memoria di un programma è divisa in segmenti logici:

| Segmento                | Descrizione                                                                 |
| :---------------------- | :-------------------------------------------------------------------------- |
| **Text**                | Contiene il codice macchina (le istruzioni).                                |
| **Static Data**         | Variabili globali dichiarate staticamente.                                  |
| **Dynamic Data (Heap)** | Dati allocati dinamicamente (es. `malloc` in C). Cresce verso l'alto.       |
| **Stack**               | Salvataggio automatico (registri, variabili locali). Cresce verso il basso. |

> [!WARNING] Heap e Stack
> Heap e Stack crescono l'uno verso l'altro. Se si incontrano, si ha un errore di memoria (es. Stack Overflow).

## 3. Stack Frame (Activation Record)
Ogni chiamata a procedura crea un blocco di dati sullo stack chiamato **Stack Frame** (o Record di Attivazione). Contiene:
* Registri salvati (es. `$ra`, `$s0`...).
* Variabili locali (se non stanno nei registri).
* Argomenti in eccesso (se sono più di 4).

### Il Frame Pointer ($fp)
Mentre lo Stack Pointer (`$sp`) si muove durante l'esecuzione (push/pop), il **Frame Pointer ($fp)** (registro `$30`) rimane fisso all'inizio del frame corrente.
* Serve come "ancora" stabile per accedere alle variabili locali.
* Inizializzazione: `$fp` viene impostato col valore di `$sp` all'inizio della procedura.

## 4. Manipolazione di Caratteri (Byte)
Poiché le stringhe sono sequenze di caratteri (8 bit) e non di word (32 bit), MIPS offre istruzioni specifiche per leggere e scrivere singoli byte:

* **`lb rt, offset(rs)` (Load Byte):** Carica un byte dalla memoria e lo mette nei bit meno significativi del registro (estendendo il segno).
* **`lbu rt, offset(rs)` (Load Byte Unsigned):** Come sopra, ma estende con zeri (usato per caratteri ASCII standard).
* **`sb rt, offset(rs)` (Store Byte):** Prende gli 8 bit meno significativi del registro e li scrive in memoria.

### Esempio: Copia di Stringhe (`strcpy`)
Per copiare una stringa si usa un ciclo che:
1.  Carica un byte alla volta con `lbu`.
2.  Lo scrive nell'indirizzo di destinazione con `sb`.
3.  Incrementa gli indirizzi di 1 (perché i byte sono grandi 1, non 4 come le word).
4.  Esce quando incontra il terminatore `null` (byte 0).