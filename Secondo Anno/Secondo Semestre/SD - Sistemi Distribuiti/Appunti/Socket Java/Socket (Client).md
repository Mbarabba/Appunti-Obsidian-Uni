# Cos'è?
È una classe interfaccia derivante da `java.net.Socket` che <mark style="background: #ADCCFFA6;">rappresenta il lato client della connessione</mark>

Il suo compito è quello di "mascherare" e semplificare l'utilizzo delle primitive di basso livello del sistema operativo, sollevando lo sviluppatore dal dover gestire manualmente complessi dettagli di rete

---
# Cosa fa?
Una socket ha il compito di instaurare una connessione con una controparte [[ServerSocket]] e di permettere il trasferimento bidirezionale di flussi di byte

Per identificare il server a cui collegarsi la socket utilizza 2 coordinate
1. **Indirizzo IP**
2. **Numero di porta**

---
# Come lo fa?
## Metodi
### Costruttori
- `Socket()`
  Crea una socket per il client vuota e non connessa
- `Socket(String host, int port)`
  Crea una socket e la connette automaticamente al numero di porta remoto specificato sull'hostname (non è un IP) remoto indicato
  Può lanciare l'eccezione `UnknownHostException` se l'indirizzo IP non può essere risolto
- `Socket(InetAddress address, int port)`
  Simile al precedente, ma crea una socket e la connette utilizzando direttamente un oggetto `InetAddress` per specificare l'indirizzo IP remoto
### Metodi per la gestione delle connessioni
- `void bind(SocketAddress bindpoint)`
  Associa la socket a un indirizzo locale specifico
  Se l'indirizzo passato è `null`, il sistema sceglierà in automatico una porta effimera e un indirizzo IP locale valido
- `void connect(SocketAddress endpoint)`
  Tenta attivamente di stabilire la connessione collegando la socket all'endpoint specificato
- `void close()`
  Interrompe la conversazione e chiude la socket, liberando le risorse allocate
### Metodi per lo scambio dati (byte)
- `InputStream getInputStream()`
  Restituisce il flusso in entrata ovvero uno stream di dati dal quale è possibile leggere i byte grezzi ricevuti dalla controparte
- `OutputStream getOutputStream()`
  Restituisce il flusso in uscita, fornendo un output stream che permette all'applicazione di scrivere e inviare byte grezzi sulla socket
### Metodi di Utility
- `getInetAddress()`
  Restituisce l'indirizzo IP a cui la socket è connessa
- `getPort()`
  Restituisce la porta remota a cui la socket sta parlando
## Ciclo di vita
### Creazione e Connessione (Setup)
Utilizzando il costruttore `new Socket(indirizzo, porta)`, Java si occupa in un colpo solo di creare la socket

Questa fase è **bloccante**, l'istanziazione dell'oggetto non termina finchè il 3-way handshake TCP non sarà concluso o non verrà generata un eccezione

Java permette comunque di separare le fasi usando il costruttore vuoto `new Socket()` e chiamando successivamente il metodo `connect()`
### Conversazione (I/O tramite Stream)
Una volta che l'oggetto SOcket è istanziato e connesso, il programma Java non usa funzioni grezze come `read()` o `write()`, ma sfrutta il paradigma degli stream di I/O

1. **Preparazione dei canali**
   Il client preleva le interfacce di comunicazione chiamando i metodi `getInputStream()` e `getOutputStream()` sull'oggetto socket
   Spesso questi flussi vengono incapsulati in classi di utilità (come `DataInputStream` o `PrintWriter`) per facilitare la lettura e la scrittura di stringhe o dati primitivi
2. **Scambio dati**
   A questo punto il client esegue un ciclo while per leggere e scrivere
   Quando si invoca un metodo di lettura su uno stream, l'esecuzione del thread Java si blocca in attesa finchè non ci sono effettivamente byte da prelevare dal buffer di ricezione allocato dal sistema operativo
### Fase di chiusura
Al termine delle operazioni il programmatore invoca semplicemente il metodo `close()` sull'oggetto socket

Questa chiamata ordina al sistema di chiudere la connessione TCP e di liberare immediatamente la porta locale e i bufferi di memoria che erano stati allocati per quella conversazione