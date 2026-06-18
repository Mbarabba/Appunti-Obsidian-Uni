# Cosa è?
È una tecnica di gestione dell'I/O asincrona

A differenza dell'approccio precedente, qui la periferica ha un ruolo attivo, è lei a segnalare alla CPU quando ha bisogno di attenzione

La CPU non deve controllare continuamente lo stato del dispositivo, ma può dedicarsi all'esecuzione di altri programmi finchè non viene "disturbata"

---
# Cosa fa?
Il suo compito è disaccoppiare i tempi della CPU da quelli della periferica, eliminando i tempi morti

Permette alla CPU di lavorare utilmente su un processo e interrompersi solo per il tempo strettamente necessario a trasferire un dato per la periferica, per poi tornare subito al lavoro originale

---
# Come lo fa?
Il meccanismo è più complesso perchè coinvolge una stretta collaborazione tra Hardware e Software per salvare lo stato
1. **Segnalazione** : La periferica attiva la linea di Interrupt Request su l bus di controllo
2. **Rilevamento** : La CPU controlla la presenza di interrupt alla fine di ogni ciclo di istruzione
3. **Salvataggio Hardware** : Se l'interrupt è abilitato, l'hardware della CPU
	- Salva il `PC` corrente nel registro EPC
	- Salva il motivo dell'interruzione nel registro Cause
	- Disabilità ulteriori interrupt
	- Forza il `PC` all'indirizzo dell'handler
4. **Salvataggio Software (Manuale - Nello Stack):** Qui inizia il lavoro del Sistema Operativo (Handler). Poiché l'handler deve usare i registri della CPU (es. `$t0`, `$a0`) per fare il lavoro, deve prima salvare i valori originali del programma interrotto.
    
    - Esegue istruzioni `sw` (Store Word) per copiare i **Registri Generali** nello **Stack** in memoria.
        
5. **Trasferimento:** L'handler esegue il trasferimento dati (legge/scrive sulla periferica).
    
6. **Ripristino (Software e Hardware):**
    
    - L'handler recupera i valori originali dallo Stack (`lw`) e li rimette nei registri generali.
        
    - Esegue `rfe` (Return from Exception) che copia atomicamente `EPC` indietro nel `PC`.

---
# Pro e Contro
## Pro
- **Efficienza CPU**
  Elimina totalmente il Busy Waiting, la CPU lavora sempre e non spreca cicli ad aspettare dispositivi lenti
- **Parallelismo**
  Permette di gestire più periferiche contemporaneamente
## Contro
- **Overhead**
  Ogni singola interruzione costa tempo extra per il salvataggio e ripristino dei registri
- **Saturazione**
  Se i dati arrivano troppo velocemente, la CPU passa tutto il tempo a salva/ripristinare lo stato e non riesce a elaborare i dati
### Sintesi
È la tecnica standard per dispositivi a bassa/media velocità (tastiere, mouse, stampanti). Diventa inefficiente per il trasferimento di grandi moli di dati ad alta velocità perché il costo del salvataggio dei registri per _ogni singolo dato_ diventa insostenibile

---
# Confronto con le altre modalità
| Caratteristica       |     [[Programmed Input Output\|Programmato]]     |                                                    Interrupt                                                    |                           [[DMA - Direct Access Memory\|DMA]]                           |
| :------------------- | :----------------------------------------------: | :-------------------------------------------------------------------------------------------------------------: | :-------------------------------------------------------------------------------------: |
| Ruolo CPU            | Totale<br><br>Controlla stato e trasferisce dati |                         Parziale<br><br>Trasferisce solo i dati, non controlla lo stato                         |                     Minimo<br><br>Configura solo l'inizio e la fine                     |
| Attesa               |    Busy Waiting<br><br>CPU bloccata in attesa    |                            Nessuna<br><br>La CPU fa altro finchè non viene chiamata                             |               Nessuna<br><br>La CPU lavora in parallelo al trasferimento                |
| Salvataggio Registri |  Nessuno<br><br>Il flusso non si interrompe mai  | Alto Costo<br><br>salva `EPC`/`Cause`<br>Software deve salvare/ripristinare registri nello Stack per ogni dato. | Alto Costo<br><br>Avviene solo una volta alla fine del trasferimento dell'intero blocco |
| Efficienza           |                      Bassa                       |                                                      Media                                                      |                                         Massima                                         |
| Latenza              |                      Minima                      |                                                      Alta                                                       |                                         Minima                                          |

### Sintesi
- Rispetto al **Programmed I/O**, libera la CPU dall'attesa stupida, ma paga il prezzo del salvataggio registri.
    
- Rispetto al **DMA**, è meno efficiente per i grandi trasferimenti perché la CPU viene disturbata troppo spesso (una volta per byte/word), costringendola a continui salvataggi di stato che frammentano l'esecuzione dei processi .