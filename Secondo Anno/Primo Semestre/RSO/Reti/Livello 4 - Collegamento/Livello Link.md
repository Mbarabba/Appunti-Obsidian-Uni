# Cos'è?
Il livello di link ha il compito di trasferire i dati da un nodo a quello adiacente *(fisicamente vicino)* attraverso un canale di comunicazione
- **Nodi** : Host e router
- **Link** : I canali che collegano nodi adiacenti 
- **Unità di dati** : Il pacchetto a questo livello viene chiamato **Frame**
---
# Cosa fa?
I servizi principali offerti sono :
- **Framing**
  Racchiude il datagramma IP in un frame, aggiungendo un intestazione *(header)* e una coda *(trailer)*
- **Accesso al canale *(MAC)***
  Regola l'uso del mezzo condiviso per evitare collisioni
- **Consegna affidabile *(Opzionale)***
  Garantisce che il frame arrivi correttamente al nodo vicino
- **Rilevamento e correzione errori**
  Identifica se i bit sono stati alterati durante la trasmissione fisica tramite algoritmi come il **CRC**
---
# Come lo fa?
A differenza dei livelli superiori che sono implementati principalmente nel software del sistema operativo, li livello di link è implementato in una combinazione di hardware e software nella **NIC *(Network Interface Card)***, ovvero la scheda di rete
- **Indirizzamento MAC**
  Ogni scheda di rete ha un indirizzo fisso univoco a 48 bit, diverso dall'indirizzo IP
- **Protocolli di accesso multiplo**
  Usa regole come **CSMA/CD *(per Ethernet)*** o **CSMA/CA *(per Wi-Fi)*** per gestire i momenti in cui più nodi provano a trasmettere contemporaneamente
- **Calcolo del CRC**
  Il mittente applica una matematica ai dati e inserisce il risultato nel frame, il destinatario rifà il calcolo per verificare l'integrità
---
# Integrazione nella pila di internet
Il livello di link si posiziona tra il livello di rete (3) e il livello fisico (1)
- Riceve un datagramma dal livello di rete
- Lo trasforma in frame
- Passa i singoli bit al livello fisico affinchè li trasmetta sul cavo/aria
- Al ricevente, fa il percorso inverso
---
# Interazione con il livello di rete
I due livelli interagiscono principalmente tramite
- **Incapsulamento**
  Il livello di rete passa una datagramma IP al livello di link, che lo vede solo come "dati" da trasportare
- **Protocollo ARP *(Address Resolution Protocol)***
  È l'anello di congiunzione.
  Quando il livello di rete vuole inviare un pacchetto a un IP, deve chiedere al livello di link _"Qual è l'indirizzo MAC della scheda di rete che ha questo IP?"_. Senza ARP, l'IP non saprebbe su quale "cavo" fisico viaggiare

---
# Vantaggi e Svantaggi

|                                                                   Vantaggi                                                                    |                                                                     Svantaggi                                                                     |
| :-------------------------------------------------------------------------------------------------------------------------------------------: | :-----------------------------------------------------------------------------------------------------------------------------------------------: |
| **Isolamento degli errori**<br>Se un pacchetto è corrotto, viene scartato subito dal nodo vicino senza "sporcare" il resto della rete globale |                                                           **Limitato alla rete locale**                                                           |
|      **Efficienza nel mezzo condiviso**<br>Grazie ai protocolli MAC, permette a centinaia di dispositivi di usare lo stesso Wi-Fi o cavo      |             **Overhead**<br>Header e trailer dei frame aggiungono byte extra ad ogni pacchetto, riducendo leggermente la banda utile              |
|   **Plug & Play**<br>Grazie ai meccanismi come il self-learning degli switch, le reti locali funzionano spesso senza configurazione manuale   | **Rischio di collisioni**<br>In reti molto congestionate, i protocolli di accesso possono diventare inefficienti a causa delle troppe collisioni. |