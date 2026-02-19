# Cos'è?
È una tecnica di gestione della memoria che prevede lo <u>spostamento temporaneo</u> di un processo dalla RAM a una **memoria secondaria**

---
# Cosa fa?
Il suo scopo principale è permettere al sistema di <u>gestire più processi di quanti ne potrebbero fisicamente entrare nella RAM</u>, liberando spazio in memoria, permette di caricare ed eseguire altri processi, aumentando il grado di multiprogrammazione

---
# Come lo fa?
Il processo avviene tramite il gestore della memoria (o scheduler a medio termine) secondo questi passaggi : 
1. **Backing Store**
   Viene utilizzata un'area dedicata del disco, grande e veloce, capace di contenere le immagini di memoria di tutti gli utenti
2. **Roll out, Roll in**
	- Se serve spazio, il sistema <u>sceglie un processo da spostare alla memoria secondaria</u>
	- **Roll out** : Il processo viene copiato dalla RAM alla memoria secondaria
	- **Roll in** : Quando il processo deve essere eseguito di nuovo viene ricopiato dalla memoria secondaria alla RAM
3. **Vincoli I/O**
   Un processo <u>non può essere swappato se sta attendendo un'operazione di I/O</u>, per risolvere questo,l'I/O deve avvenire sempre nei **buffer del kernel**
---
# Vantaggi e svantaggi
| Categoria      | Vantaggi                  | Svantaggi                                                                                                                                 |
| :------------- | ------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| Capacità       | Multiprogrammazione       | Spazio Disco<br><br>Richiede una grande area riservata su disco                                                                           |
| Efficienza     | Flessibile                | Lentezza<br><br>Il tempo di trasferimento è molto alto.<br>Spostare un intero processo richiede tempo significativo, bloccando il sistema |
| Implmentazione | Supporto Hardware  minimo | Complessità di I/O<br><br>Richiede una gestione speciale per i processi in attesa di I/O                                                  |

---
# Confronto con altre strutture di memoria
| Caratteristica  | Allocazione Contigua                       | Paginazione                                | Swapping                                                         | Swapping con Paginazione                                                     |
| :-------------- | ------------------------------------------ | ------------------------------------------ | ---------------------------------------------------------------- | ---------------------------------------------------------------------------- |
| Limite Processi | Limitato dalla dimensione fisica della RAM | Limitato dalla dimensione fisica della RAM | Superiore alla RAM<br><br>I processi inattivi stanno sul disco   | Superiore alla RAM<br><br>Solo le pagine attive stanno sulla RAM             |
| Movimento Dati  | Nessuno                                    | Nessuno                                    | Alto <br><br>Sposta tutto il processo (codice + dati) ogni votla | Ottimizzato<br><br>Sposta solo quel che serve quando serve                   |
| Context Switch  | Velocissimo                                | Veloce                                     | Lentissimo<br><br>Bisogna copia MB di dati da RAM a disco        | Medio<br><br>Più lento della RAM pura, ma molto più veloce dello swap intero |
| Frammentazione  | Esterna                                    | Interna                                    | Esterna                                                          | Interna                                                                      |

---
# [[Swapping con paginazione]]
---
# Confronto tra swapping standard e con paginazione


| Caratteristica | Swapping Standard (Senza Paginazione) | Swapping con Paginazione (Moderno) |
| :--- | :--- | :--- |
| **Unità di Trasferimento** | **Intero Processo.** Tutto il codice e i dati del processo vengono spostati in blocco dalla RAM al disco (e viceversa). | **Singola Pagina.** Vengono spostati solo piccoli blocchi di memoria (pagine) strettamente necessari in quel momento. |
| **Tempo di Context Switch** | **Molto Alto.** Il trasferimento richiede molto tempo (es. copiare 100MB di processo) rendendo il cambio di contesto lento e bloccante. | **Basso.** Si trasferisce una quantità minima di dati, riducendo drasticamente il tempo di attesa. |
| **Requisiti Hardware** | **Minimi.** Funziona anche con sistemi semplici (registro Base/Limite), non richiede hardware sofisticato per la gestione memoria. | **Elevati.** Richiede una MMU complessa con supporto per TLB, Tabelle delle Pagine e gestione dei Page Fault. |
| **Gestione Memoria** | Soffre di **Frammentazione Esterna**. Quando i processi rientrano in memoria, devono trovare un buco contiguo sufficiente. | Elimina la frammentazione esterna, ma introduce **Frammentazione Interna** (spreco di spazio nell'ultima pagina). |
| **Efficienza** | **Bassa.** Spesso si copiano in RAM parti del codice (es. routine di gestione errori) che non verranno mai eseguite, sprecando banda e spazio. | **Alta.** Si carica in RAM solo ciò che serve davvero. Le parti inutilizzate restano su disco senza occupare RAM. |
| **Diffusione** | Obsoleto nei sistemi general purpose moderni (usato oggi solo in sistemi datati o specifici). | È lo standard nei moderni sistemi operativi (Linux, Windows, macOS). |
| **Vincoli I/O** | **Critico.** Se un processo fa I/O, non può essere swappato (o serve *double buffering*) perché l'DMA scriverebbe nella memoria sbagliata. | **Gestibile.** Si possono fissare in memoria (*pinning*) solo le pagine coinvolte nell'I/O, swappando il resto del processo. |