# Cosa è?
È un protocollo di livello applicativo progettato per il web basato su un architettura client server

Una delle sue caratteristiche architetturali più importanti è l'essere "stateless", questo significa che il server tratta ogni singolo richiesta in modo del tutto isolato e indipendente, senza mantenere in memoria alcuna informazione sulle interazioni precedenti avvenute con quello stesso client

---
# Cosa fa? 
Il suo scopo primario è permettere il trasferimento di risorse e oggetti Web allocati sui server

Oltre a richiedere la lettura di documenti, consente ai clienti di interagire attivamente con i server
## HTTP non persistente
In questo approccio, vige una regola rigida, su una singola connessione TCP può viaggiare al massimo un solo oggetto
1. Il client apre la connessione TCP
2. Il client richiede un oggetto
3. Il server risponde inviando quel singolo file e chiude immediatamente la connessione

Questo comporta un enorme costo in termini di tempo di risposta, per ogni singolo oggetto, il tempo richiesto è calcolato come $2\text{RTT (Round Trip Time)}+$ il tempo di trasmissione dell'oggetto
1. 1 RTT viene speso per instaurare e sincronizzare la connessione TCP
2. 1 RTT serve per inviare la richiesta HTTP e ricevere l'inizio della risposta
## HTTP persistente
Per superare i colli di bottiglia causati dalle continue aperture e chiusure, i protocolli più moderni utilizzano connessioni persistenti
1. La connessione TCP viene aperta verso il server
2. Sfruttando questa singola connessione lasciata aperta, possono essere inviati più oggetti in sequenza

Facendo cosi' si risparmi 1 intero RTT per comunicazione

---
# Struttura di un messaggio HTTP
I messaggi HTTP sono orientati al carattere, il che significa che il loro formato è basato su stringhe di testo leggibile codificate in ASCII

Esistono due tipologie principali di messaggi che condividono esattamente la stessa struttura di base
1. La richiesta (lato client)
2. La risposta (lato server)

![[Pasted image 20260421105445.png]]

La struttura si divide in 4 componenti logiche sequenziali
1. **Riga Iniziale**
   Avvia il messaggio e varia a seconda che si tratti di una richiesta o di una risposta
	1. Nelle **richieste** prende il nome di riga di richiesta ed è composta dal metodo HTTP (GET / POST), dall'URL della risorsa e dalla versione del protocollo
	   `GET /index.html HTTP/1.1`
	2. Nelle **risposte** prende il nome di riga di stato e contiene la versione del protocollo, seguita da un codice di stato numerico e da una breve descrizione testuale
	   `HTTP/1.1 200 OK`
2. **Righe di intestazione**
   Subito dopo la riga iniziale si trova un elenco di intestazioni formattate come `nome-campo: valore`, e ciascuna termina con un `CR LF`, servino per scambiare parametri e metadati
	1. Nelle **richieste**, indicano al server informazioni come l'indirizzo dell'Host, il tipo di browser utilizzato (`User-Agent`), le preferenze sulla lingua o i MIME accettati
	   `Accept: text/html`
	2. Nelle **risposte**, il server le usa per comunicare la data, il software server in uso, l'orario di ultima modifica del file, il tipo di contenuto (`Content-Type`) e la sua dimensione del paylod in byte (`Content-Length`)
3. **Riga Vuota**
   Per segnalare alla controparte che l'elenco delle intestazioni è terminato, il protocollo impone l'inserimento di una linea vuota, composta esclusivamente da una coppia isolata di caratteri
4. **Corpo del Messaggio**
   È la sezione finale, opzionale, in cui risiede il "carico utile" del messaggio
	1. Nelle **richieste**, viene utilizzato per i metodi che prevedono l'invio di dati al servere (come `POST`), affinchè i dati da elaborare vengano inseriti qui come documento autonomo
	2. Nelle **risposte**, questa sezione contiene fisicamente i dati effettivi dell'oggetto richiesto, come ad esempio il testo di un file HTML o i byte di un'immagine
---
# Metodi
## GET
### Cosa fa?
Recupera lo stato, qualunque informazione relativa alla risorsa identificata dall'URL e la risorsa stessa
### Quando Usarlo?
Si usa per richiedere e ottenere dati in vari formati

È ideale quando i parametri di ricerca possono essere passati in chiaro, poichè vengono accodati direttamente all'URL

È un metodo sicuro e idempotente
### Esempio
Richiedere tutti gli ordini di marzo per il prodotto Q2345. La richiesta non ha un corpo, i parametri sono nell'URL
`GET myCompany/orders?item="Q2345"&date="2022/03" HTTP1.1`

## POST
### Cosa fa?
Comunica al server dei dati da elaborare, richiedendo che vengono accettati come una nuova risorsa subordinata all'URL specificato
### Quando Usarlo?
Si utilizza tipicamente per trasportare i dati inseriti dagli utenti in un form o per creare nuove risorse

A differente della GET, i dati non sono nell'URL ma vengono messi in coda al messaggio come documento autonomo nel corpo della richiesta

Non è un metodo sicuro e non è idempotente
### Esempio
Inviare un form per aggiornare i codici di un prodotto. I dati viaggiano nel _body_ 
`POST myCompany/orders HTTP1.1Content-Length: 59` `Content-Type: application/x-www-form-urlencoded` `update=true&oldItem="Q2345"&newItem="Q68254"&date="2022/04"`
## PUT
### Cosa fa? 
Modifica una risorsa esistente o ne crea una nuova all'URL esatto specificato

Se in quell'URL esiste già un oggetto, questo viene completamente sostituito dal contenuto fornito nel corpo della richiesta
### Quando usarlo?
Quando il client conosce esattamente l'URL in cui vuole depositare o sovrascrivere l'informazione, pur non essendo sicuro, questo metodo è idempotente
## DELETE
### Cosa fa?
Richiede esplicitamente che il server elimini la risorsa identificata dall'URL
### Quando usarlo?
Per rimuovere un oggetto dal sistema distribuito, non è sicuro ma è idempotente
## HEAD
### Cosa fa?
È del tutto identico al metodo GET, ma impone al server di NON restituire un corpo del messaggio nella risposta
### Quando Usarlo?
È utilissimo per il debugging o per ottenere informazioni e metadati su una risorsa senza sprecare banda per scaricarla,  sicuro e idempotente
## OPTIONS
Rappresenta una richiesta esplorativa, il client lo usa per ottenere informazioni sulle opzioni di comunicazione e sui metodi supportati relativamente a una specifica risorsa, è sicuro e idempotente
## TRACE
Viene impiegato a scopo diagnostico per invocare un loopback del messaggio di richiesta a livello applicativo da parte del server, permettendo di tracciare eventuali alterazioni lungo il percorso di rete, è sicuro e idempotente

---
# Codici
## Classe $1xx$ (Informativi)
Segnalano che la richiesta del client è stata ricevuta correttamente e che il server sta continuando l'elaborazione

Si tratta di risposta provvisorie
## Classe $2xx$ (Successo)
Indicano che l'operazione richiesta dal client è andata a buon fine

La richiesta è stata ricevuta, compresa, accetta ed elaborata con successo dal server
## Classe $3x x$ (Reindirizzamento)
Comunicano al client che la semplice richiesta non basta, ed è necessario intraprendere ulteriori azioni per poterla completare
## Classe $4 x x$ (Errore imputabile al Client)
Questa classe viene utilizzata quando la richiesta fallisce e la colpa è del client

Succede tipicamente se la richiesta contiene una sintassi errata oppure chiede qualcosa di non comprensibile o inesistente
## Classe $5 x x$ (Errore imputabile al Server)
Questa classe viene utilizzata quando il server non riesce a soddisfare una richiesta del client a causa di un proprio errore interno o malfunzionamento

---
# [[Cookies]]