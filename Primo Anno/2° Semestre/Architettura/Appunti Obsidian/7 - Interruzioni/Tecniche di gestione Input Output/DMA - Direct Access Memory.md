# Cos'è?
È la tecnica di gestione dell'I/O più evoluta e performante

Il DMA è un meccanismo hardware che permette alle periferiche di accedere direttamente alla memoria principale per leggere o scrivere dati, senza dover passare attraverso la CPU per ogni singolo byte

In questo modello, la periferica diventa "autonoma" e capace di gestire il bus

---
# Cosa fa?
Il suo compito è scaricare la CPU dal "lavoro sporco" di spostare grandi quantità di dati 

La CPU si limita a fare da "capocantiere": dà l'ordine iniziale ("Sposta 4KB da qui a lì") e viene avvisata solo quando il lavoro è finito, lasciando che il DMA faccia tutto il trasferimento pesante in background

---
# Come lo fa?
1. **Configurazione**
   La CPU scrive nei registri del DMA le informazioni sul lavoro da svolgere :
	- Indirizzo di memoria di partenza
	- Quantità di dati da trasferire
	- Direzione
2. **Trasferimento**
   La CPU torna a eseguire il programma utente
   Nel frattempo, il controller DMA prende il controllo del BUS e trasferisce i dati direttamente tra Periferica e Memoria
	- Gestione Registri CPU
	  Durante questa fase, la CPU **NON** viene interrotta. I suoi registri generali (`$t0`, `$s1`, ecc.) rimangono dedicati al Processo A e non vengono toccati né salvati. Il DMA ha i suoi registri interni per gestire il trasferimento.
3. **Conclusione**
   Solo quando l'intero blocco di dati è stato trasferito, il DMA invia un interrupt alla CPU
4. **Salvataggio Stato**
   Qui scatta la procedura standard di salvataggio, ma una sola volta per l'intero blocco
	- Hardware : Salva `PC` in `EPC`,`Cause`, aggiorna `Status`
	- Software (Handler) : Salva i registri generali nello Stack, gestisce la fine dell'operazione (es. segna il file come "letto"), ripristina i registri e torna al lavoro.

---
# Pro e contro
## Pro
- **Efficienza massima**
  La CPU non esegue nessuna istruzione di trasferimento dati (`lw`/`sw`), si occupa solo di gestione
- **Banda passate**
  Permette velocità di trasferimento altissime, limitate solo dalla velocità della memoria, non dalla velocità di esecuzione della CPU
## Contro
- **Costo Hardware**
  Richiede un controller DMA complesso e registri extra mappati in memoria
- **Setup Overhead**
  Configurare il DMA richiede tempo, è inefficiente per trasferire pochi byte
### Sintesi
Il DMA è indispensabile per i moderni sistemi operativi e per periferiche veloci (Hard Disk, SSD, Schede di Rete, Schede Video), dove l'Interrupt Driven causerebbe un collasso delle prestazioni della CPU.

---
# Confronto tra le 3 modalità
| Caratteristica       |     [[Programmed Input Output\|Programmato]]     |                                         [[Interrupt Driven\|Interrupt]]                                         |                                           DMA                                           |
| :------------------- | :----------------------------------------------: | :-------------------------------------------------------------------------------------------------------------: | :-------------------------------------------------------------------------------------: |
| Ruolo CPU            | Totale<br><br>Controlla stato e trasferisce dati |                         Parziale<br><br>Trasferisce solo i dati, non controlla lo stato                         |                     Minimo<br><br>Configura solo l'inizio e la fine                     |
| Attesa               |    Busy Waiting<br><br>CPU bloccata in attesa    |                            Nessuna<br><br>La CPU fa altro finchè non viene chiamata                             |               Nessuna<br><br>La CPU lavora in parallelo al trasferimento                |
| Salvataggio Registri |  Nessuno<br><br>Il flusso non si interrompe mai  | Alto Costo<br><br>salva `EPC`/`Cause`<br>Software deve salvare/ripristinare registri nello Stack per ogni dato. | Alto Costo<br><br>Avviene solo una volta alla fine del trasferimento dell'intero blocco |
| Efficienza           |                      Bassa                       |                                                      Media                                                      |                                         Massima                                         |
| Latenza              |                      Minima                      |                                                      Alta                                                       |                                         Minima                                          |