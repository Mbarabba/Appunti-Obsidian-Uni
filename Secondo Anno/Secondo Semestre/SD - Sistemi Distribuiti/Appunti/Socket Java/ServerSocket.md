# Cosa è?
È un'interfaccia ad oggetti che proprio come la [[Socket (Client)|controparte client]], "maschera" e accorpa le chiamate di sistema di basso livello

Implicitamente, la semplice istanziazione di questo oggetto esegue in un colpo ben 3 chiamate di sistema C
1. `socket()` per creare il canale
2. `bind()` per associare l'indirizzo IP e la porta
3. `listen()` per predisporsi all'ascolto
---
# Cosa fa? 
A differenza della [[Socket (Client)]], il cui scopo è instaurare una conversazione diretta, lo scopo principale della ServerSocket non è scambiare dati, ma fungere da "centralinista"

Il suo compito è mettersi in ascolto su una porta specifica e nota per accettare le richieste di connessione in ingresso dai client

A tale scopo, richiede al sistema operativo di allocare dei buffer speciali, in particolare una coda chiamata backlog (o Completed Connection Queue), dove vengono accodate le connessioni in entrata che hanno completato con successo il 3-way handshae e sono pronte per essere servite

---
# Come lo fa?
## Metodi
### Costruttori
- `ServerSocket()`
  Crea una socket per il server vuota e non associata ad alcuna porta
- `ServerSocket(int port)`
  Crea una socket e la associa direttamente alla porta specificata
  Se si passa una parta pari a 0, il sistema sceglierà in automatico una porta effimera (49152-65535)
  Questo costruttore imposta di default la lunghezza massima della coda di attesa a 50 connessioni
- `ServerSocket(int port, int backlog)`
  Funziona come il precedente, ma permette allo sviluppatore di specificare esplicitamente la dimensione della coda
### Gestione delle Connessioni
- `void bind(SocketAddress endpoint)`
  Associa la socket a un indirizzo locale specifico (combinazione di IP e porta)
  Se il parametro passato è **null**, il sistema sceglierà una porta effimera e un IP locale valido
- `Socket accept()`
  Resta in attesa di una connessione in ingresso e la accetta
  Il metodo rimane bloccato  finchè non viene stabilità una connessione e, una volta terminata l'attesa, restituisce la nuova socket di servizio
### Utility
- `InetAddress getInetAddress()`
  Restituisce l'indirizzo di rete locale della socket, oppure restituisce **null** se la socket non è ancora stata associata a un indirizzo
- `int getLocalPort()`
  Restituisce il numero della porta sulla quale il server è fisicamente in ascolto
  Restituisce **-1** se la socket non è ancora associata
## Ciclo di vita
### Creazione e Predisposizione (Setup)
Il server crea una socket su una porta nota
L'istanziazione dell'oggetto ServerSocket in Java è molto potente perchè maschera e accorpa in un colpo 3 chiamate di sistema di basso livello
1. `socket()` per creare il canale
2. `bind()` per associare l'indirizzo IP e la porta
3. `listen()` per predisporsi all'ascolto

L'esecuzione del programma si ferma completamente finché un client non finalizza il three-way handshake. Quando ciò avviene, la connessione viene estratta dalla Completed Connection Queue
### Generazione della Socket di Servizio
Questo è il passaggio architetturale chiave

Il metodo `accept()` non fa comunicare i dati direttamente sulla ServerSocket, ma crea e restituisce una nuova socket (chiamata connection socket o socket di servizio)

So ServerSocket originale continua a rimanere in ascolto per altri client, mentre questa nuova socket viene usata esclusivamente per la conversazione con il client appena accettato
### Conversazione e Chiusura
Utilizzando la nuova socket di servizio, il server esegue un ciclio di lettura (`read()`) e scrittura (`write()`) per scambiare byte con il client

Al termine dello scambio di dati, il server chiude la socket di servizio tramite il metodo `close()`

A questo punto il ciclo ricomincia e il server torna a bloccarsi sulla `accept()` in attesa del prossima client

---
# Esempio pratico
```java
import java.io.PrintWriter
import java.net.ServerSocket
import java.net.Socket

public class SenderServerSocket{
	final static String message = "This is a not so short text to test the reading capabilities of clients"
}

public static void main(String[] args){
}
```