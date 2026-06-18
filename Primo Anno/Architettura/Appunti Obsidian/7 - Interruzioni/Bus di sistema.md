# Cos'è?
Il Bus di sistema è un canale di comunicazione comune e condiviso che collega tra loro le principali componenti dell'elaboratore

Invece di avere cavi dedicati tra ogni coppia di componenti, tutti si collegano a questa unica "autostrada" digitale

Questa architettura è apprezzata per la sua **semplicità**, il **basso costo** e l'elevata **flessibilità** (è facile aggiungere nuove periferiche), anche se la condivisione del canale può creare colli di bottiglia e richiede una gestione complessa

---
# Cosa fa?
Il suo compito è trasportare le informazioni necessarie al funzionamento del computer da un'unità all'altra

Permette alla CPU di :
- Selezionare con chi vuole parlare
- Inviare o ricevere dati e istruzioni
- Inviare comandi di controllo e sincronizzare le operazioni
---
# Come lo fa?
Il Bus di Sistema non è un unico cavo indifferenziato, ma è composto fisicamente da tre sotto-bus distinti, ognuno con una funzione specifica : 
1. **Bus Dati**
   Sono le linee fisiche su cui viaggiano i dati veri e propri e le istruzioni che vengono trasferiti tra CPU, memoria e periferiche
2. **Bus Indirizzi**
   Su queste linee la CPU trasmette l'indirizzo univoco della cella di memoria o del registro della periferica che vuole contattare.
   Serve a identificare "chi" è il destinatario o la sorgente dell'operazione
3. **Bus di Controllo**
   Trasporta i segnali di gestione, come i comandi di lettura/scrittura e i segnali di sincronizzazione
