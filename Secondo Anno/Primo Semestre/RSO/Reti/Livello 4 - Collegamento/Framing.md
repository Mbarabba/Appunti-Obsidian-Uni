# Cos'è?
Il framing è il processo di **incapsulamento** di un datagramma proveniente dal livello superiore all'interno di un'unità di dati specifica per il livello di link

## Cosa è un frame?
Il **frame** è l'unità di dati del livello di link.

È composto da 3 parti principali : 
1. **Header** : Contiene le informazioni di controllo
2. **Payload** : Il datagramma IP vero e proprio ricevuto dal livello superiore
3. **Trailer** : Contiene bit aggiuntivi per il controllo errori
---
# Cosa fa?
Il framing assolve 3 compiti vitali per la comunicazione tra  2 nodi vicini 
1. **Delimitazione del pacchetto**
   Definisce esattamente dove inizia e dove finisce un pacchetto.
   Poichè il livello fisico invia un flusso continuo di bit, il ricevente ha bisogno di sapere quali bit appartengono a quale messaggio
2. **Indirizzamento locale**
   Specifica l'indirizzo della sorgente e della destinazione all'interno del link locale
3. **Rilevamento degli errori**
   Fornisce i mezzi per capire se i dati sono stati danneggiati da interferenze elettriche o rumore durante il passaggio sul cavo o nell'aria
---
# Come lo fa?
Il protocollo del livello di link aggiunge dei campi specifici attorno al datagramma IP

Ogni frame ethernet ha una struttura fissa che permette 
alla scheda di rete di leggere i dati
- **Preambolo (8 byte)**
  Una sequenza di bit usata per "sincronizzare" i ritmi di trasmissione tra mittente e ricevente
- **Indirizzi MAC (Destinazione + Sorgente - 6 byte ciascuno)**
  Gli indirizzi fisici delle schede di rete
- **Tipo (2 byte)**
  Indica quale protocollo di livello superiore è contenuto nel frame
- **Dati (Payload - da 46 a 1500 byte)**
  Il contenuto vero e proprio
- **[[CRC - Cyclic Redundancy Check | CRC (4 byte]]
  Il codice di controllo per gli errori