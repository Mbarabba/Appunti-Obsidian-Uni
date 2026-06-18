## 1. Concetto di Procedura
Una procedura (o funzione) è uno strumento per strutturare i programmi, rendendoli più facili da capire e riutilizzare.
L'esecuzione di una procedura segue **6 passi fondamentali**:
1.  Il chiamante mette i parametri in un posto accessibile alla procedura.
2.  Si trasferisce il controllo alla procedura (Salto).
3.  La procedura acquisisce le risorse di memoria necessarie.
4.  La procedura esegue il compito.
5.  La procedura mette il risultato in un posto accessibile al chiamante.
6.  La procedura restituisce il controllo al chiamante (Ritorno).

## 2. Registri Dedicati
L'architettura MIPS riserva specifici registri per gestire le chiamate, seguendo una convenzione standard:

| Registro | Nome | Utilizzo |
| :--- | :--- | :--- |
| **$a0 - $a3** | Argomenti | Usati per passare i parametri di input (4 registri). |
| **$v0 - $v1** | Valori di Ritorno | Usati per restituire i risultati (2 registri). |
| **$ra** | Return Address | Contiene l'indirizzo di ritorno per tornare al punto di chiamata. |

## 3. Istruzioni di Chiamata e Ritorno

### Chiamata: `jal` (Jump and Link)
* **Sintassi:** `jal Label`
* **Cosa fa:** Salta all'indirizzo dell'etichetta `Label` e contemporaneamente salva l'indirizzo dell'istruzione successiva (`PC + 4`) nel registro `$ra`.
* **Perché "Link":** Crea il collegamento per poter tornare indietro.

### Ritorno: `jr` (Jump Register)
* **Sintassi:** `jr $ra`
* **Cosa fa:** Copia il contenuto di `$ra` nel Program Counter (PC), facendo riprendere l'esecuzione da dove era stata interrotta.

## 4. Lo Stack (La Pila)
Quando i registri non bastano (es. servono più variabili locali o si devono salvare valori temporanei), si usa lo **Stack**.
* È una struttura **LIFO** (Last In First Out).
* **$sp (Stack Pointer):** È il registro (di solito `$29`) che punta all'ultimo elemento inserito nello stack.
* **Crescita:** In MIPS, lo stack cresce dagli indirizzi alti verso quelli bassi.
    * **Push (Inserire):** Si sottrae valore a `$sp` (es. `addi $sp, $sp, -4`) e si fa la `sw`.
    * **Pop (Togliere):** Si fa la `lw` e poi si somma valore a `$sp` (es. `addi $sp, $sp, 4`).

## 5. Convenzioni di Salvataggio Registri
Per evitare che una procedura sovrascriva i dati del chiamante, si dividono i registri in due categorie:

> [!NOTE] Preserved vs Non-Preserved
> * **Preserved (Callee Saved):** La procedura chiamata DEVE salvarli se li usa e ripristinarli prima di uscire.
>     * `$s0 - $s7` (Saved registers)

---
tags:
  - architettura
  - mips
  - assembly
  - syscall
  - io
## 6. Che cos'è una Syscall?
Il processore MIPS, di per sé, sa solo fare calcoli e spostare dati in memoria. Non sa cosa sia un "monitor", una "tastiera" o una "console".
Per interagire con il mondo esterno (Input/Output) o per chiedere servizi al Sistema Operativo (o al simulatore SPIM/MARS), si usa l'istruzione speciale **`syscall`**.

> [!NOTE] User Mode vs Kernel Mode
> I programmi utente girano in modalità protetta e non possono toccare l'hardware direttamente. La `syscall` trasferisce il controllo al Sistema Operativo (Kernel) che esegue l'operazione sicura e poi restituisce il controllo al programma.

## 7. Come si usa (Il protocollo)
L'utilizzo di una syscall segue sempre questi **4 passaggi**:

1.  **Caricare il codice del servizio** nel registro **`$v0`**. (Questo dice al sistema *cosa* vuoi fare: stampare, leggere, uscire...).
2.  **Caricare gli argomenti** (se servono) nei registri **`$a0`, `$a1`...** (Questo dice al sistema *su quali dati* lavorare).
3.  Eseguire l'istruzione **`syscall`**.
4.  **Recuperare il risultato** (se c'è) dal registro **`$v0`**.

## 8. Tabella dei Codici Principali (SPIM/MARS)
Ecco i servizi più usati negli esercizi di architettura:

| Servizio | Codice ($v0) | Argomenti (Input) | Risultato (Output) |
| :--- | :---: | :--- | :--- |
| **Print Integer** | **1** | `$a0` = intero da stampare | - |
| **Print Float** | **2** | `$f12` = float da stampare | - |
| **Print String** | **4** | `$a0` = indirizzo della stringa | - |
| **Read Integer** | **5** | - | `$v0` = intero letto |
| **Read String** | **8** | `$a0` = buffer, `$a1` = lunghezza | Stringa nel buffer |
| **Exit** | **10** | - | Il programma termina |
| **Print Char** | **11** | `$a0` = carattere (ASCII) | - |
| **Read Char** | **12** | - | `$v0` = char letto |

## 9. Esempi Pratici

### Esempio A: Stampa di un Intero
Voglio stampare il numero `50`.

```assembly
li $v0, 1      # 1. Carico codice 1 (Print Integer) in $v0
li $a0, 50     # 2. Carico il valore 50 in $a0
syscall        # 3. Chiamo il sistema