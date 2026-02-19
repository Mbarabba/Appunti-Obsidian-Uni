# Cos'è?
È il metodo più comune per implementare la [[Memoria virtuale]].

È simile a un sistema di [[Swapping con paginazione | Paginazione con swapping]]

---
# Cosa fa?
Il principio fondamentale è <u>**Non caricare MAI una pagina in memoria a meno che non sia chiesta per l'esecuzione**</u>.

Invece di caricare tutto il programma all'avvio, il "Lazy Swapper" carica le pagine solo quando il processo cerca di accedervi

---
# Come lo fa?
Il sistema utilizza il **Bit di validità** nella Tabella delle pagine per distinguere le pagine in RAM da quelle sul disco
1. **Accesso**
   Il processo prova ad accedere a una pagina
2. **Controllo**
   L'hardware controlla il bit di validità
	- Se è **valido** la pagina è in RAM e l'esecuzione può proseguire
	- Se è **invalido** la pagina non è in ram e si genera un **Page Fault**
3. **Gestione del Page Fault (Trap)**
	1. Il sistema operativo blocca il processo e controlla se l'indirizzo è lega
	2. Trova un frame libero in memoria fisica
	3. Legge la pagina mancante dal disco e la carica nel frame
	4. Aggiorna la tabella delle pagine
	5. Riavvia l'istruzione che aveva causato l'errore
---
# Confronto tra paginazioni

| Caratteristica      | Paginazione Standard (Pre-Paging)                                                                                  | Paginazione con Swapping                                                                                              | Paginazione su Richiesta (Demand Paging)                                                                                 |
| :------------------ | :----------------------------------------------------------------------------------------------------------------- | :-------------------------------------------------------------------------------------------------------------------- | :----------------------------------------------------------------------------------------------------------------------- |
| **Filosofia**       | Caricamento totale preventivo: il processo viene portato interamente in RAM prima di iniziare l'esecuzione.        | Gestione dinamica: sposta singole pagine tra RAM e disco per ottimizzare l'uso della memoria corrente.                | Approccio "Pigro" (Lazy): non carica mai una pagina in RAM finché non viene esplicitamente richiesta da un'istruzione.   |
| **Stato all'Avvio** | Il processo parte solo quando tutte le sue pagine risiedono nei frame fisici della RAM.                            | Il processo può partire con un set parziale; le pagine vengono rimosse o inserite (Swap-in/out) secondo necessità.    | Il processo può iniziare l'esecuzione con **zero pagine** in memoria fisica (Pure Demand Paging).                        |
| **Page Fault**      | **Assenti:** poiché tutto il codice è già caricato, non si verificano interruzioni per pagine mancanti.            | **Occasionali:** avvengono se il processo richiede una pagina precedentemente spostata sul disco per liberare spazio. | **Frequenti all'inizio:** l'esecuzione genera continui Page Fault finché le pagine critiche non sono caricate in RAM.    |
| **Efficienza RAM**  | **Bassa:** spreca spazio caricando parti di codice che potrebbero non essere mai eseguite (es. routine di errore). | **Alta:** permette a molti processi di coesistere spostando su disco le pagine "vittime" meno utilizzate.             | **Massima:** occupa solo lo spazio strettamente necessario per le istruzioni e i dati correntemente in uso dal processo. |
| **Tempo di Avvio**  | **Alto:** il ritardo iniziale è dovuto al caricamento completo del programma dal disco alla RAM.                   | **Medio:** l'attesa dipende dal set iniziale di pagine caricate al momento del lancio.                                | **Minimo:** l'esecuzione del programma inizia quasi istantaneamente; il caricamento avviene "on-the-fly".                |
| **Complessità HW**  | **Media:** richiede MMU e supporto alla gestione della Tabella delle Pagine.                                       | **Alta:** richiede un'integrazione software (Pager) e hardware per gestire velocemente il disco.                      | **Molto Alta:** l'hardware deve supportare il **riavvio delle istruzioni** interrotte a metà da un Page Fault.           |
## Sintesi delle differenze chiave
1. [[Paginazione]]
   È statica, carichi tutto ed esegui, se non c'è posto per tutto il processo esso non parte
2. [[Swapping con paginazione | Paginazione con swapping]]
   È dinamica
3. **Paginazione su richiesta**
   È una strategia che usa la paginazione con swapping, porta l'efficienza all'estremo caricando solo nel momento del bisogno