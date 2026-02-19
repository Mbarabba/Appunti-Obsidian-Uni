# Cos'è?
È una tecnica di gestione della memoria che permette di allocare lo spazio di un processo in <u>modo non contiguo</u>

## Struttura fisica
La RAM vine divisa in blocchi di dimensione fissa chiamati **Frame**
## Struttura Logica
Lo spazio di indirizzamento logico del processo viene diviso in blocchi della stessa identica dimensione chiamati **Pagine**

---
# Cosa fa?
Il suo obiettivo principale è eliminare la frammentazione esterna e disaccoppiare completamente la vista che il programma ha della memoria della realtà fisica.

Permette di caricare un processo in memoria "sparpagliandolo" le sue pagine in qualsiasi frame libero disponibile, senza bisogno di trovare un blocco unico e sequenziale

---
# Come lo fa?
Il cuore del sistema è una struttura dati chiamata **tabella dell pagine**

1. **Indirizzo Logico**
   La CPU genera un indirizzo diviso in 2 parti
	1. **Numero pagina**$(p)$ : Indica quale "pezzo" del processo stiamo cercando
	2. **Offset**$(d)$: Indica la posizione esatta all'interno di quella pagina
2. **Traduzione** (Tramite [[MMU - Memory Management Unit | MMU]])
	1. La MMU usa $p$ come indice per cercare nella tabella delle pagine
	2. Trova il corrispondente numero di frame fisico $(f)$
3. **Indirizzo Fisico**
   L'indirizzo fisico viene costruito sostituendo la pagina con il frame :
   $Indrizzo = (f \times \text{Dimensione Frame})+d$

## Supporto Hardware per la Paginazione

La paginazione richiede un supporto hardware specifico per evitare il rallentamento del sistema, dato che la Tabella delle Pagine risiede in memoria RAM.

* **Il Problema:** Ogni accesso a un dato/istruzione richiederebbe **due accessi alla memoria fisica**: uno per leggere la tabella delle pagine (e trovare il frame) e uno per accedere al dato reale. Questo dimezzerebbe le prestazioni.
* **La Soluzione: TLB (Translation Lookaside Buffer):**
    * È una memoria cache hardware associativa, piccola ma estremamente veloce, integrata nella MMU.
    * Contiene le traduzioni (Pagina $\to$ Frame) usate più di recente.
    * **Funzionamento:** La MMU controlla prima il TLB.
        * **TLB Hit:** La traduzione è trovata subito $\to$ accesso immediato alla RAM (prestazione massima).
        * **TLB Miss:** La traduzione non c'è $\to$ si legge la Tabella in RAM $\to$ si aggiorna il TLB $\to$ si riavvia l'accesso.
    * **ASID:** Il TLB usa identificatori (Address Space ID) per garantire che un processo non usi le traduzioni di un altro.

## Protezione della Memoria nella Paginazione

La protezione viene garantita associando dei **bit di controllo** a ogni entry della Tabella delle Pagine (e nel TLB).

* **Bit di Validità (Valid-Invalid Bit):**
    * **Valid (v):** La pagina è legale e appartiene allo spazio di indirizzamento logico del processo.
    * **Invalid (i):** La pagina non è mappata nello spazio logico. Qualsiasi tentativo di accesso genera un **Trap** al sistema operativo (errore di protezione).
* **Bit di Accesso (Permessi):**
    * Definiscono *come* il processo può usare quella pagina: **Read-Only**, **Read-Write**, **Execute-Only**.
    * L'hardware controlla questi bit a ogni accesso. Tentare di scrivere su una pagina "Read-Only" causa un Trap.
* **PTLR (Page Table Length Register):** Un registro che indica la lunghezza della tabella delle pagine, impedendo accessi oltre il limite degli indirizzi definiti.

--- 
# Vantaggi e Svantaggi

|                                                                            Vantaggi                                                                            |                                                                           Svantaggi                                                                           |
| :------------------------------------------------------------------------------------------------------------------------------------------------------------: | :-----------------------------------------------------------------------------------------------------------------------------------------------------------: |
|                                                               **Nessuna Frammentazione Esterna**                                                               |                       **Frammentazione Interna**<br><br>L'ultima pagina di un processo raramenta è piena, portando cosi' ad uno spreco                        |
| **Separazione totale**<br><br>Netta separazione tra indirizzi logici e fisici<br><br>Il programma vede uno spazio continuo da 0 a Max, la realtà è frammentata |                          **Overhead Memoria**<br><br>Ogni processo necessità della propria tabella delle pagine, che occupa memoria                           |
|                                                                    **Condivisione Facile**                                                                     | **Overhead Prestazionale**<br><br>L'accesso alla tabella delle pagine richiede un accesso in memoria in più per ogni dato.<br><br>*Mitigato dall'uso del TLB* |

---
# Paginazione vs Allocazioni Contigue


| Caratteristica                    | Allocazione Contigua (Base/Limite)                     | Allocazione Contigua (MMU Rilocazione)                                               | Paginazione                                                                           |
| :-------------------------------- | :----------------------------------------------------- | :----------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------ |
| **Disposizione in Memoria**       | **Contigua.** Il processo deve essere un blocco unico. | **Contigua.** Il processo deve essere un blocco unico.                               | **Non Contigua.** Il processo è sparso in frame ovunque in RAM.                       |
| **Indirizzi visti dal Programma** | **Fisici** (o statici). Il programma sa dove si trova. | **Logici (0 $\to$ Max).** Illusione di partire da 0, ma lo spazio fisico è continuo. | **Logici (0 $\to$ Max).** Illusione di continuità, ma realtà frammentata.             |
| **Frammentazione Principale**     | **Esterna.** Buchi inutilizzabili tra i processi.      | **Esterna.** Buchi inutilizzabili tra i processi.                                    | **Interna.** Spreco solo nell'ultima pagina.                                          |
| **Gestione Hardware**             | 2 Registri (Base, Limite).                             | 2 Registri (Rilocazione, Limite).                                                    | **Complessa.** Tabella delle Pagine + TLB (cache) + MMU sofisticata.                  |
| **Flessibilità**                  | Bassa.                                                 | Media (Rilocabile dinamicamente).                                                    | **Massima.** Permette anche di caricare solo *pezzi* del processo (Memoria Virtuale). |

---
# Paginazione COW - Copy on Write 

La tecnica **Copy-on-Write** è un'ottimizzazione fondamentale per la creazione dei processi (es. durante la system call `fork()`).

* **Concetto:** Invece di duplicare fisicamente tutta la memoria del processo padre per creare il figlio (operazione lenta), entrambi i processi iniziano **condividendo gli stessi frame fisici**.
* **Meccanismo:**
    1.  Le pagine condivise vengono marcate come **Read-Only**.
    2.  Finché i processi leggono, usano la stessa memoria (nessun costo).
    3.  Appena uno dei due prova a **scrivere** su una pagina, scatta un Trap di protezione.
    4.  Il Sistema Operativo intercetta l'evento, crea una **copia privata** di *quella sola pagina* in un nuovo frame, aggiorna la tabella delle pagine del processo che ha scritto rendendola **Read-Write**, e riavvia l'istruzione.
* **Vantaggio:** Risparmio enorme di memoria e creazione quasi istantanea dei processi.

---
# Strutture per grandi spazi di indirizzamento

Nei sistemi a 32 e 64 bit, la tabella delle pagine lineare diventerebbe troppo grande per essere allocata in un blocco unico contiguo. Si usano tre strutture principali:

1.  **Paginazione Gerarchica (Multilivello):**
    * Si "pagina la tabella delle pagine". L'indirizzo logico viene diviso in più parti (es. indice esterno $\to$ indice interno $\to$ offset).
    * Si crea una struttura ad albero: una directory esterna punta a tabelle interne. Le tabelle per le zone di memoria non usate non vengono nemmeno create.
    * *Problema:* Su 64-bit servirebbero troppi livelli (es. 7), rendendo l'accesso alla memoria troppo lento.

2.  **Tabella delle Pagine Hash (Hashed Page Table):**
    * Comune per spazi > 32 bit. Il numero di pagina virtuale viene trasformato tramite una funzione hash.
    * L'hash punta a una entry nella tabella che contiene una lista concatenata di elementi (per gestire le collisioni). Si scorre la lista per trovare il frame.

3.  **Tabella delle Pagine Invertita:**
    * Invece di una tabella per processo, c'è **una sola tabella globale** per tutta la RAM fisica.
    * Ogni entry corrisponde a un **Frame Fisico** e contiene l'informazione: "Chi sta usando questo frame?" (PID processo + Numero Pagina Virtuale).
    * *Pro:* Risparmio massimo di memoria (dimensione fissa dipendente dalla RAM).
    * *Contro:* Ricerca lenta (dall'indirizzo virtuale al fisico) e gestione complessa della memoria condivisa.
---
# Confronto tra le grandi strutture di indirizzamento

| Caratteristica           | Paginazione Gerarchica                                        | Tabella Hash                                | Tabella Invertita                                                        |
| :----------------------- | :------------------------------------------------------------ | :------------------------------------------ | :----------------------------------------------------------------------- |
| **Struttura**            | Albero di tabelle (Multilivello).                             | Tabella Hash con liste concatenate.         | Unica tabella globale indicizzata per Frame.                             |
| **Obiettivo**            | Non allocare tabelle contigue enormi.                         | Gestire spazi sparsi (>32 bit).             | Risparmiare memoria RAM usata dalle tabelle.                             |
| **Dimensione Tabella**   | Proporzionale allo spazio virtuale usato dal processo.        | Proporzionale al numero di pagine mappate.  | **Fissa** (Proporzionale alla RAM fisica installata).                    |
| **Prestazioni**          | Lente su 64-bit (troppi accessi in memoria per ogni livello). | Buone, ma rallentate dalle collisioni hash. | Ricerca lenta (serve hash di supporto).                                  |
| **Condivisione Memoria** | Facile (mappa pagine diverse su stesso frame).                | Facile.                                     | **Difficile** (ogni frame ha un solo "proprietario").                    |
| **Utilizzo Tipico**      | Sistemi 32-bit.                                               | Sistemi 64-bit.                             | Sistemi con RAM limitata o architetture specifiche (es. PowerPC, IA-64). |