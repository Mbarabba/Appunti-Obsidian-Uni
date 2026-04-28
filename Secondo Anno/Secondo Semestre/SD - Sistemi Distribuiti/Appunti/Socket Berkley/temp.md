## Ciclo di vita TCP
### Fase 1 : Connessione
1. `Socket()`
   Il client invoca questa chiamata di sistema per creare una nuova socket TCP
   In questa fase il sistema operativa alloca le risorse necessarie (i buffer) e sceglie automaticamente la porta locale da utilizzare
2. `connect()`
   Il client invia attivamente una richiesta di connessione specificando l'indirizzo IP e la porta del server di destinazione
   Questa operazione avvia il 3-way handshake ed è **fortemente bloccante**
   L'esecuzione del programma si ferma finchè la connessione non è stabilità con successo o si verifica un errore
### Fase 2 : Conversazione
1. Una volta connesso, il client avvia un ciclo di comunicazione, tipicamente inziando prima una richiesta tramite `write()`
   Poichè le socket TCP si basano su flussi di byte continui e non sul concetto di "messaggio", il programmatore deve implementare dei cicli per prelevare i byte mano a mano che arrivano nel buffer di ricezione
2. Il client si mette in attesa della risposta utilizzando `read()`
   Anche questa operazione **è bloccante**, sospende l'esecuzione finchè non ci sono effettivamente dati da leggere nel buffer
### Fase 3 : Chiusura
Al termine dello scambio, la connessione viene terminata invocando  `close()`
Questa chiamata ordina al sistema operativo di deallocare le risorse e terminare il canale