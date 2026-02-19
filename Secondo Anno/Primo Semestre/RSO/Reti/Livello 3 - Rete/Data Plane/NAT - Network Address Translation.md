# Cos'è?
Il NAT è una tecnica che permette a tutti i dispositivi presenti in una rete locale di condividere un unico indirizzo IPv4 pubblico per comunicare con il mondo esterno

--- 
# Cosa fa?
- **Risparmio di indirizzi IP**
  Permette a molti dispositivi di accedere a internet utilizzando un solo indirizzo pubblico fornito dall'ISP
- **Flessibilità interna**
  Consente di cambiare gli indirizzi dei dispositivi nella rete locale senza dover notificare il mondo esterno
- **Indipendenza dall'ISP**
  Permette di cambiare fornitore di servizi internet senza dover modificare gli indirizzi IP dei dispositivi interni
- **Sicurezza**
  I dispositivi all'interno della rete locale non sono direttamente visibili o indirizzabili dall'esterno, offrendo un livello di protezione nativo
---
# Come lo fa?
L'implementazione del NAT avviene nel router e si basa su una tabella di traduzione
## 1 - Gestione dei datagrammi in uscita
Quando un host interno invia un pacchetto verso l'esterno, il router NAT esegue i seguenti passaggi :
1. **Sostituzione**
   Sostituisce la coppia del datagramma (IP sorgente, porta sorgente) del datagramma con la coppia (IP NAT, nuova porta)
2. **Registrazione**
   Memorizza questa corrispondenza nella tabella di traduzione in modo da poter gestire la risposta futura
## 2 - Gestione dei datagrammi in entrata
Quando una risposta arriva dall'esterno verso il router NAT : 
- **Lookup**
  Il router controlla la porta di destinazione del pacchetto arrivato nella sua tabella di traduzione
- **Ripristino**
  Sostituisce l'indirizzo IP del NAT e la porta con quelli originali dell'host interno, inoltrando poi il pacchetto alla destinazione corretta nella LAN