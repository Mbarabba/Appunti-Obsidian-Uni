# Cos'è?
È l'evoluzione dello [[Allocazione Contigua e Protezione con registro base e limite#Cosa sono?| schema base/limite]].

È la **forma più semplice di supporto hardware** che permette di avere una <u>distinzione tra indirizzi logici e fisici</u> pur **mantenendo l'allocazione contigua**.

In questo schema, il registro che prima chiamavamo "base" prendi il nome di <u>Registro di Rilocazione</u>

---
# Cosa fa?
Permette al programma di "credere" di esser caricato a partire dall'indirizzo 0 (indirizzo logico), indipendentemente da dove si trovi realmente nella memoria fisica.

La MMU si occupa di tradurre al volo ogni indirizzo generato dalla CPU nell'indirizzo fisico reale corrispondente

---
# Come lo fa?
La MMU contiene 2 registri : 
1. **Registro di Rilocazione**
   Contiene <u>l'indirizzo fisico iniziale</u> dove inizia il processo
2. **Registro Limite**
   Contiene la <u>dimensione del processo</u>

**Per ogni indirizzo logico** generato dalla CPU, la MMU esegue le seguenti <u>2 operazioni in sequenza</u> :
1. **Controllo**
   Verifica se $\text{ Indirizzo Logico} < \text{ Registro Limite}$
2. **Somma**
   Se il controllo passa, calcola 
   $$\text{Indirizzo Fisico} = \text{Indirizzo Logico} + \text{Registro Rilocazione}$$
L'indirizzo fisico risultante viene inviato alla memoria

---
# Supporto Hardware
La paginazione richiede un supporto hardware specifico perchè la tabella delle pagine risiede in memoria centrale.

Questo creerebbe un problema di prestazioni : ogni istruzione richiederebbe due accessi alla memoria
- Uno per leggere la tabella e trovare il frame
- Uno per accedere al dato reale

Per risolvere questo problema si utilizza 
## TLB - Translation Lookaside Buffer
È una piccola memoria cache associativa ad alta velocità, integrata nel processore.

Contiene le traduzioni pagina $\to$ frame usate di recente

- Se **il numero di pagina è nel TLB**, l'indirizzo fisico è disponibile immediatamente 
- Se **non c'è**, <u>bisogna accedere alla tabella in RAM</u>, ma la nuova traduzione viene poi salvata nel TLB per il futuro
- Vengono usati registri come il **PTRB - Page Table Base Register** che punta all'inizio della tabella delle pagine corrente 
---
# Protezione della memoria 
La protezione viene implementata associando dei bit di controllo a ogni entry della tabella delle pagine :
- **Bit di Validità**
  Indica se la pagina appartiene allo stesso spazio di indirizzamento logico del processo
	- **Valid** : La pagina è legale e accessibile
	- **Invalid** : La pagina non è nello spazio logico del processo, un accesso genera un trap
- **Bit di protezione**
  Definiscono come si può accedere alla pagina.
  Un tentativo di scrivere su una pagina read-only viene bloccato dall'hardware
- **PTLR - Page Table Length Register**
  Definisce la dimensione della tabella,  impedendo accessi oltre il limite degli indirizzi validi
  
---
# Paginazione COW (Copy-on-Write)
La tecnica COW premette a 2 processi (tipicamente padre e figlio dopo una `fork()`) di condividere le stesse pagine fisiche in memori, invece di duplicare subito
- Le pagine sono marcate come read-only per entrambi
- Finchè i processi leggono solo i dati, condividono la stessa RAM
- Appena uno dei 2 prova a scrivere su una pagina, il sistema operativo intercetta l'azione, crea una copia privata di quella solo pagina per il processo che ha scritto e aggiorna la sua tabella delle pagine
- **Vantaggio**, risparmi molta memoria e rende la creazione dei processi molto più veloce

---
# Strutture per grandi spazi di indirizzamento
Nei sistemi moderni, la tabella delle pagine lineare diventerebbe troppo grande, quindi impraticabile  in un unico blocco contiguo, si usano quindi strutture alternative .

## Tabelle delle Pagine Gerarchiche 
Si "pagina la tabella delle pagine", l'indirizzo logico viene diviso in più parti
- **Funzionamento**
  Si usa una directory esterna che punta a tabelle di secondo livello, che a loro volta puntano ai frame.
  In questo modo, le tabelle di secondo livello non usate non vengono create
- **Vantaggi**
  Non serve allocare la tabella in un blocco contiguo enorme, supporta pagine di dimensione diverse
- **Svantaggi**
  Aumenta il numero di accessi in memoria necesari per tradurre un indirizzo
## Tabelle delle Pagine Hash
Comuni per spazi di indirizzamento $>$ 32 bit
- **Funzionamento**
  Il numero di pagina virtuale viene trasformato tramite una funzione hash.
  L'hash punta a un'entry nella tabella
- **Collisioni**
  Poichè più pagine possono avere lo stesso hash, ogni entry contiene una lista concatenata di elementi.
  Si scorre la lista finch+ non si trova il numero di pagina virtuale cercato per ottenere il frame corrispondente

## Tabelle delle pagine invertite
Invece di avere una tabella per ogni processo con tutte le sue pagine virtuali, si ha **una sola tabella globale** per tutta la memoria fisica
- **Struttura**
  La tabella ha un'entry per ogni frame fisico esistente.
  Ogni entry dice "questo frame è occupato dalla pagina X del processo Y"
- **Vantaggi**
  Risparmio enorme di memoria per le tabelle
- **Svantaggi**
  La ricerca è lenta, inoltre rende difficile implementare la memoria condivisa

---

# Vantaggi e Svantaggi

|               Vantaggi                | Svantaggi                                                                                                                            |
| :-----------------------------------: | ------------------------------------------------------------------------------------------------------------------------------------ |
| **Spazio di Indirizzamento Virtuale** | **Frammentazione Esterna**<br><br>Poichè l'allocazione è ancora contigua, persiste il problema dei "buchi" di memoria inutilizzabili |
|         Rilocazione Dinamica          | **Allocazione Contigua**<br><br>Il processo deve comunque trovare un blocco unico di memoria fisica sufficientemente grande          |

---
# Confronto tra le strutture per grandi spazi di indirizzamento

Confronto tra le tecniche utilizzate per gestire tabelle delle pagine in grandi spazi di indirizzamento (es. 32/64 bit).

| Caratteristica | **Paginazione Gerarchica** (Multilivello) | **Tabella delle Pagine Hash** (Hashed) | **Tabella delle Pagine Invertita** |
| :--- | :--- | :--- | :--- |
| **Concetto Base** | La tabella delle pagine viene a sua volta "paginata". L'indirizzo logico è diviso in più livelli (es. indice esterno, indice interno, offset). | Il numero di pagina virtuale (p) viene passato attraverso una funzione hash che punta a un'entrata nella tabella. | Esiste **una sola tabella globale** con una voce per ogni **frame fisico** reale, invece che per ogni pagina virtuale di ogni processo. |
| **Struttura Dati** | Struttura ad albero (Directory esterna $\to$ Tabella interna $\to$ Frame). Le tabelle dei livelli inferiori non usate non vengono allocate. | Tabella Hash. Ogni voce contiene una lista concatenata di elementi per gestire le **collisioni** (più pagine che hanno lo stesso valore hash). | Array indicizzato in base ai frame fisici. Ogni voce contiene la coppia `<Process-ID, Page-Number>` per identificare chi possiede quel frame. |
| **Obiettivo** | Evitare di dover allocare la tabella delle pagine come un unico blocco contiguo enorme in memoria, spezzandola in pezzi più piccoli. | Gestire spazi di indirizzamento sparsi (sparse) e molto grandi (es. > 32 bit) dove la gerarchia diventerebbe troppo profonda. | Ridurre drasticamente la memoria occupata dalle tabelle stesse, legando la dimensione alla **RAM fisica** installata e non al numero/dimensione dei processi virtuali. |
| **Vantaggi** | Efficiente per sistemi a 32 bit. Risparmia memoria non creando le tabelle per le aree di indirizzamento non usate dal processo. | È la soluzione comune e adatta per spazi di indirizzamento superiori a 32 bit (es. 64 bit). | **Massimo risparmio di memoria:** La tabella ha una dimensione fissa. Se aggiungi processi, la tabella non cresce. |
| **Svantaggi** | **Prestazioni su 64-bit:** Ogni livello aggiuntivo richiede un accesso in memoria in più. Per coprire 64 bit servirebbero troppi livelli (es. 7), rendendo l'accesso alla memoria inaccettabilmente lento. | **Overhead di ricerca:** In caso di collisione dell'hash, bisogna scorrere la lista concatenata per trovare l'elemento giusto, rallentando la traduzione. | **Ricerca Lenta:** Dato un indirizzo virtuale, è difficile trovare il frame fisico perché la tabella è ordinata per frame (serve una hash table di supporto). <br> **Memoria Condivisa:** Difficile da implementare perché ogni frame fisico può avere un solo "proprietario" nella tabella. |

## Sintesi Rapida
- **Gerarchica:** Ottima per 32 bit, sconsigliata per 64 bit (troppi accessi in memoria).
- **Hash:** Buon compromesso per sistemi a 64 bit.
- **Invertita:** La migliore per risparmiare spazio in RAM, ma più complessa da gestire per la ricerca e la condivisione.

---
# [[Allocazione Contigua e Protezione con registro base e limite#Vantaggi e Svantaggi della allocazione contigua | Confronto con l'allocazione contigua a registro base e limite]]

| Caratteristica                |                      Protezione Base/Limite                      |                    MMU                    |
| :---------------------------- | :--------------------------------------------------------------: | :---------------------------------------: |
| Indirizzi visti dal programma |                            **Fisici**                            |                **Logici**                 |
| Flessibilità                  | **Bassa**<br><br>Difficile sposta il processo una volta caricato | **Alta**<br><br>Facile sposta il processo |
| Hardware                      |                    2 Registri : Base , Limite                    |     2 Registri : Rilocazione , Limite     |
| Logica di confronto           |            $$Base \leq Indirizzo < (Base + Limite)$$             |     $$Fisico = Logico + Rilocazione$$     |
| Obiettivo                     |                            Protezione                            |          Protezione + Astrazione          |
