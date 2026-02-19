# Cos'è?
L'ICMP *(Internet Control Message Protocol)* è un protocollo di supporto utilizzato da host e router per scambiarsi informazioni a livello di rete.

Sebbene tecnicamente si trovi sopra l'IP *(I messaggi ICMP vengono trasportati dentro [[Datagramma protocollo IP | datagrammi IP]])*, viene considerato parte integrante del **Network Layer**

---
# Cosa fa?
Il compito principale dell'ICMP è fornire feedback sulla trasmissione dei pacchetti.

Le sue funzioni includono :
- **Segnalazione di errori**
  Avvisa la sorgente se un pacchetto non può essere consegnato
- **Diagnostica**
  Permette di testare la connettività
- **Tracciamento del percorso**
  Permette di scoprire i router attraversati per arrivare a una destinazione 
- **Gestione della congestione e del TTL**
  Avvisa quando un pacchetto viene scartato perchè il suo tempo di vita *(TTL)* è scaduto
---
# Come lo fa?
I messaggi ICMP hanno una struttura specifica che permette di identitificare il problema
- **Incapsulamento**
  Un messaggio ICMP viene inserito nel campo "dati" di un normale pacchetto IP.
  Nel campo "Protocollo" dell'intestazione IP viene inserito il valore 1
- **Struttura del messaggio**
  Ogni messaggio contiene tre campi fondamentali :
	1. Type : Un numero che indica la categoria del messaggio 
	2. Code : Un numero che specifica meglio il tipo di errore
	3. Dati : Contiene l'intestazione IP e i primi 8 byte del pacchetto che ha generato l'errore

## Traceroute
Per scoprire il percorso verso una destinazione, il mittente invia una serie di pacchetti con TTL crescente (1, 2, 3...). Ogni router sul percorso decrementa il TTL; quando arriva a 0, il router scarta il pacchetto e invia indietro un messaggio ICMP di tipo 11 (TTL scaduto). Questo permette al mittente di identificare tutti i router della catena.

---
# Vantaggi e Svantaggi

|                                                             Vantaggi                                                             |                                                                        Svantaggi                                                                        |
| :------------------------------------------------------------------------------------------------------------------------------: | :-----------------------------------------------------------------------------------------------------------------------------------------------------: |
|                                              **Essenziale per il troubleshooting**                                               |                   **Rischi per la sicurezza**<br>Può essere utilizzato per fare network scanning o per l'invio di pacchetti malevoli                    |
| **Automazione degli errori**<br>Permette ai router di informare automaticamente la sorgente di problemi senza l'intervento umano |   **Consumo di banda**<br>In caso di problemi gravi, una tempesta di messaggi di errore ICMP potrebbe saturare ulteriormente i link già congestionati   |
|                                            **Leggero**<br>Ha un overhead molto basso                                             | **Filtri e Blocchi**<br>Poiché è considerato pericoloso, molti firewall bloccano i messaggi ICMP, rendendo a volte inutili gli strumenti di diagnostica |