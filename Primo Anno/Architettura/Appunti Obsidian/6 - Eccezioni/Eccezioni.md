# Cosa sono?
Sono eventi inattesi che interrompono il normale flusso di esecuzione delle istruzioni

È importante distinguere due categorie principali
- **Eccezioni (vere e proprie)**
  Sono eventi sincroni e interni al processore
  Sono causate direttamente dall'istruzione che si sta eseguendo (es. overflow aritmetico)
- **Interruzioni (Interrupt)**
  Sono eventi asincroni ed esterni al processore
  Provengono solitamente dalle periferiche di I/O e non sono legate alla specifica istruzione in esecuzione in quel momento
---
# Cosa fanno?
Quando si verifica un'eccezione, il processore smette di eseguire il programma corrente e trasferisce il controllo al sistema operativo per gestire il problema

Il comportamento tipico prevede :
1. **Sospensione** : Il programma utente viene "congelato"
2. **Salto al gestore** : Il processore salta a un indirizzo di memoria predefinito dove risiede una routine del sistema operativo chiamata handler
3. **Risoluzione o terminazione** : Se l'eccezione è risolvibile, l'handler sistema il problema e riprende l'esecuzione del programma
   Se non è risolvibile, il programma viene terminato
---
# Come lo fanno?
Nel [[Datapath Multiciclo|datapath]], la gestione avviene tramite passaggi precisi eseguiti dall'hardware : 
1. **Rilevamento** : L'unità di controllo o l'ALU rilevano l'anomalia
2. **Salvataggio EPC** : L'indirizzo dell'istruzione che ha causato viene salvato in un registro speciale chiamato Exception Program Counter (EPC)
3. **Aggiornamento Cause** : Il tipo di errore viene scritto nel registro Cause
4. **Salto forzato** : Il PC viene sovrascritto con un indirizzo fisso, costringendo la CPU a eseguire il codice dell'handler

Tutto questo è gestito dalla FSM che prevede stati appositi per gestire la transizione verso l'eccezione invece che verso il normale completamento dell'istruzione

---
# Come riconoscerne il tipo?
Poichè tutte le eccezioni fanno saltare il processore allo stesso indirizzo il sistema operativo deve capire cosa è successo

Esistono 2 metodi, ma il MIPS usa il primo
- **Metodo del registro Cause (MIPS)**
  Esiste un registro dedicato, chiamato Cause che contiene un codice numerico identificativo dell'errore
- **Interruzioni vettorizzate**
  Metodo alternativo dove ogni tipo di errore fa saltare a un indirizzo diverso
  Non è usato in questa implementazione MIPS base

Inoltre, per errori di memoria, esiste il registro BADVAddr che contiene l'indirizzo di memoria specifico che ha generato l'errore

---
# Come gestirle?
La gestione è affidata al Coprocessore 0 (CP0), un unità hardware accanto alla CPU dedicata proprio alle eccezioni e alla memoria

Il software interagisce con le eccezioni leggendo e scrivendo i registri del CP0 tramite istruzioni speciali
- **mfc0 (move from coprocessor 0)**
  Per leggere il motivo dell'errore dal registro Cause o l'indirizzo dal registro EPC
- **mtc0 (move to coprocessor 0)**
  Per scrivere nei registri di controllo

La procedura software dell'handler è :
1. Salvare i registri generali
2. Leggere il registro Cause per capire il problema
3. Eseguire l'azione correttiva o terminare il programma
4. Se possibile, usare l'indirizzo EPC per tornare al programma utente 