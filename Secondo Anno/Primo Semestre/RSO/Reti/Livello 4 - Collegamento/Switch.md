# Cosa sono?
Uno switch è un dispositivo di Livello 2 che mette in comunicazione diversi host all'interno di una rete
- **Intelligenti**
  A differenza dei vecchi hub, lo switch capisce a chi è destinato un messaggio
- **Trasparenti**
  Gli host collegati non si accorgono della presenza dello switch inviano i frame come se fossero connessi direttamente al destinatario
- **Plung-and-play**
  Non richiedono configurazione manuale per funzionare si collegano e iniziano a lavorare autonomamente
---
# Cosa fanno?
Il compito principale dello switch è l'inoltro selettivo dei frame
- **Ricevono ed esaminano**
  Quando un frame ethernet arriva su una porta, lo switch legge l'indirizzo MAC di destinazione
- **Isolano il traffico**
  Trasmettono il frame solo sulla porta dove si trova il destinatario evitando di "sporcare" altre porte
- **Eliminano le collisioni**
  Poichè ogni porta è un canale dedicato, più host possono trasmettere contemporaneamente senza che i segnali si scontrino
- **Store-and-forward**
  Memorizzano il frame, controllando che non ci siano errori e poi lo inviano
---
# Come lo fanno?
## Switch Table
Lo switch mantiene in memoria una tabella che contine
- L'indirizzo MAC dell'host
- La porta fisica dello switch a cui l'host è collegato
- Un TTL per cancellare le voci vecchie
## Self-learning
Lo switch impara la topologia della rete "osservando" il traffico
1. Quando arriva un frame, lo switch guarda l'indirizzo MAC sorgente
2. Registra nella tabella l'associazione
3. In questo modo, mappa gradualmente tutti i dispositivi collegati senza l'intervento di un tecnico.
## Algoritmo di inoltro
Quando arriva un frame per un determinato MAC di destinazione :
1. **Destinatario conosciuto**
   Se il MAC è nella tabella, lo switch invia il frame solo sulla porta specifica
2. **Destinatario sconosciuto**
   Se lo switch non sa ancora dove si trova il destinatario, esegue il **Flooding**: invia il frame a tutte le porte (tranne quella da cui è arrivato). Appena il destinatario risponde, lo switch impara la sua posizione per la prossima volta.
3. 152157