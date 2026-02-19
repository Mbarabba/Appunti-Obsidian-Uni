# Cosa è?
È la tecnica di gestione dell'Input/Output più elementare

In questo modello, la periferica ha un ruolo totalmente passivo, mentre la CPU ha il controllo assoluto e la responsabilità totale dell'operazione

Non esistono segnali hardware esterni (interrupt) per avvisare la CPU, è il software stesso che deve verificare costantemente se c'è lavoro da fare

---
# Cosa fa?
Il suo compito è sincronizzare la velocità della CPU con quella (solitamente inferiore) della periferica per permettere il trasferimento dei dati

La CPU dedica il 100% delle sue risorse a "sorvegliare" la periferica, attendendo attivamente che questa cambi il suo stato da "occupata" a "pronta", bloccando di fatto l'esecuzione di qualsiasi altro processo utile nel frattempo

---
# Come lo fa?
Il meccanismo si basa su un ciclo continuo chiamato Polling o Busy Waiting
1. **Avvio** : La CPU invia il comando di lettura/scrittura al registro di controllo della periferica
2. **Il Loop** : La CPU entra in un ciclo `while` in cui legge continuamente il registro di stato della periferica
	- Ad ogni ciclo controllo il Ready Bit
	- Se il bit dice "non pronto", la CPU ripete il ciclo
3. **Trasferimento** : Appena il bit diventa "pronto", la CPU esegue l'istruzione di `load` e `store` per spostare il dato dal registro della periferica alla memoria

## Gestione dei registri
In questà modalità, <u>non viene alcun salvataggio di stato</u>

---
# Pro e Contro
## Pro
- **Semplicità Hardware**
  Non richiede controllori di interrupt complessi
- **Latenza Minima**
  Appena la periferica è pronta, la CPU trasferisce il dato immediatamente, senza il tempo perso per il cambio di contesto
## Contro
- **Inefficienza (Busy Waiting)**
  La CPU è bloccata al 100% nel ciclo di controllo e non può eseguire calcoli utili
- **Spreco di risorse**
  Se la periferica è lenta, la CPU spreca milioni di cicli di clock solo per aspettare
### Sintesi
È una tecnica eccellente per sistemi semplici o dedicati dove la CPU non deve fare altro, o per periferiche estremamente veloce dove l'attesa è trascurabile

Diventa inaccettabile in sistemi multitasking dove la CPU deve gestire più processi contemporaneamente

---
# Confronto con le altre modalità

| Caratteristica       |                   Programmato                    |                                         [[Interrupt Driven\|Interrupt]]                                         |                           [[DMA - Direct Access Memory\|DMA]]                           |
| :------------------- | :----------------------------------------------: | :-------------------------------------------------------------------------------------------------------------: | :-------------------------------------------------------------------------------------: |
| Ruolo CPU            | Totale<br><br>Controlla stato e trasferisce dati |                         Parziale<br><br>Trasferisce solo i dati, non controlla lo stato                         |                     Minimo<br><br>Configura solo l'inizio e la fine                     |
| Attesa               |    Busy Waiting<br><br>CPU bloccata in attesa    |                            Nessuna<br><br>La CPU fa altro finchè non viene chiamata                             |               Nessuna<br><br>La CPU lavora in parallelo al trasferimento                |
| Salvataggio Registri |  Nessuno<br><br>Il flusso non si interrompe mai  | Alto Costo<br><br>salva `EPC`/`Cause`<br>Software deve salvare/ripristinare registri nello Stack per ogni dato. | Alto Costo<br><br>Avviene solo una volta alla fine del trasferimento dell'intero blocco |
| Efficienza           |                      Bassa                       |                                                      Media                                                      |                                         Massima                                         |
| Latenza              |                      Minima                      |                                                      Alta                                                       |                                         Minima                                          |
### Sintesi
- **I/O Programmato:** Vince sulla latenza pura (è il più reattivo) ma perde drasticamente sull'efficienza complessiva del sistema.
    
- **Interrupt:** Risolve il problema dell'attesa, ma introduce un "costo nascosto" (overhead): ogni volta che la periferica chiama, la CPU perde tempo a salvare e ripristinare i registri (`PC` in `EPC`, registri generali nello Stack). Se i dati arrivano troppo velocemente, la CPU passa più tempo a salvare registri che a lavorare.
    
- **DMA:** È la soluzione definitiva per grandi moli di dati. Paga il costo del salvataggio registri (interrupt) solo una volta per un intero blocco di dati (es. 4KB), non per ogni singolo byte.