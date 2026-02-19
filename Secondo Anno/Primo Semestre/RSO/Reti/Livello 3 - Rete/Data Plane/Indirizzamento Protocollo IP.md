# Cos'è?
L'indirizzamento IP è un sistema che <u>assegna un identificatore a 32 bit univoco</u> per ogni **interfaccia** di un host o di un router connessa alla rete.

---
# Cosa fa?
- **Identificazione**
  Permette di distinguere univocamente ogni dispositivo all'interno della rete globale o locale
- **Localizzazione ([[Routing]])**
  Grazie alla sua struttura gerarchica, permette ai router di capire "dove" si trova il destinatario e di instradare i pacchetti nella giusta direzione, aggregando le rotte

---
# Come lo fa?
L'indirizzamento IP utilizza diverse tecniche e strutture per funzionare :
- **Notazione Decimale Puntata**
  Per facilitare la lettura, i 32 bit sono divisi in 4 blocchi da 1 byte scritti come numeri decimali separati da putni
  *Esempio : 192.168.0.25*
- **Struttura Gerarchica (Subnet + Host)**
  L'indirizzo non è un numero piatto, ma è diviso in 2 parti
	1. **Parte di sottorete (Subnet part)**
	   I bit più significativi identificano la rete a cui il dispositivo appartiene
	2. **Parte Host**
	   I bit rimanenti identificano il dispositivo specifico all'interno di quella sottorete
- **CIDR (Classless InterDomain Routing)**
  È il metodo moderno per definire dove finisce la parte di rete e inizia quella di host.
  Si usa la notazione $a.b.c.d /x$ dove $x$ indica il numero di bit dedicati alla sottorete
- **Assegnazione**
  Gli indirizzi possono essere configurati manualmente o ottenuti automaticamente tramite il [[Protocollo DHCP - Dynamic Host Configuration Protocol| protocollo DHCP]] 

---
# Longest Prefix Match (LPM)

Il **Longest Prefix Match** è il meccanismo fondamentale utilizzato dai router per determinare l'interfaccia di uscita corretta quando un indirizzo IP di destinazione corrisponde a più voci nella tabella di inoltro.

## Concetto Base
Quando un router riceve un pacchetto, cerca l'indirizzo IP di destinazione nella sua tabella di inoltro. Se l'indirizzo corrisponde a più prefissi memorizzati, il router seleziona la voce con il **prefisso più lungo** (ovvero quella più specifica).

## Esempio Pratico
Immaginiamo una tabella di inoltro con queste regole (in binario):

| Prefisso di destinazione | Interfaccia di uscita |
| :--- | :--- |
| `11001000 00010111 00010*** ********` (prefisso /21) | 0 |
| `11001000 00010111 00011000 ********` (prefisso /24) | 1 |
| `11001000 00010111 00011*** ********` (prefisso /21) | 2 |
| Altrimenti | 3 |

### Analisi dei pacchetti in arrivo:

1.  **Pacchetto A:** Destinazione `11001000 00010111 00010110 10100001`
    * Corrisponde solo alla prima riga.
    * **Azione:** Inoltrato all'interfaccia **0**.

2.  **Pacchetto B:** Destinazione `11001000 00010111 00011000 10101010`
    * Corrisponde sia alla seconda riga (match di 24 bit) che alla terza riga (match di 21 bit).
    * Il router applica il *Longest Prefix Match*.
    * **Azione:** Inoltrato all'interfaccia **1** (perché 24 > 21).

## Perché si usa?
* **Efficienza:** Permette l'aggregazione delle rotte (route aggregation), riducendo le dimensioni delle tabelle di routing globali.
* **Gerarchia:** Consente di gestire indirizzamenti gerarchici dove un ISP può pubblicizzare un blocco ampio, ma rotte più specifiche possono essere gestite separatamente.