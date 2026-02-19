# Cosa è?
È un protocollo di servizio del livello link che permette di risolvere un indirizzo IP in un indirizzo MAC

Mentre l'indirizzo IP è gerarchico (come un indirizzo postale) e serve per instradare i pacchetti attraverso Internet, l'indirizzo MAC è "piatto" (come un codice fiscale) e identifica univocamente una scheda di rete all'interno di una singola LAN

---
# Cosa fa?
Il suo compito è ottenere l'indirizzo fisico di un dispositivo situato sulla stessa sottorete, conoscendo solo il suo indirizzo IP

Ogni nodo mantiene una ARP Table nella propria memoria, questa tabella contiene le mappature `<Indirizzo IP; Indirizzo MAC; TTL>`, dove il TTL indica quanto tempo quella voce resterà in memoria prima di essere cancellata automaticamente

---
# Come lo fa?
Immaginiamo che il Nodo A voglia inviare un pacchetto al Nodo B (entrambi sulla stessa LAN), ma A conosca solo l'IP di B

1. **Controllo della Tabella**
   Il nodo A controlla la sua ARP Table, se l'associazione IP-MAC di B è già presente, costruisce il frame e lo invia, se non c'è deve avviare la procedura di ricerca
2. **ARP Request**
   Il nodo A crea un paccheto speciale chiamato **ARP Request** che contiene _"Chi ha l'IP di B? Rispondi a me (Nodo A)"_
	- Questo pacchetto viene incapsulato in un frame con indirizzo MAC di destinazione Broadcast
	- Tutti i dispositivi nella LAN ricevono il pacchetto, lo aprono e controllano l'IP richiesto
3. **ARP Reply**
   Il Nodo B, riconoscendo il proprio indirizzo IP, prepara un pacchetto ARP replu
	- Il pacchetto contiene il suo indirizzo MAC
	- A differenza della richiesta, la risposta è Unicast : B la invia direttamente al MAC di A
4. **Aggiornamento e Invio**
   Il Nodo A riceve la risposta, aggiorna la sua ARP Table con la nuova coppia IP-MAC e può finalmente inviare il datagramma IP originale (incapsulato nel frame corretto)
