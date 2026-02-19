# Cosa è?
Il MAC è un sottolivello del livello di link
- **A livello di "identità"** 
  L'indirizzo MAC è un numero univoco di 48 bit impresso nella scheda di rete dal produttore
- **A livello di "Funzione"**
  Il protocollo MAC è l'insieme di regole che determinano come e quando un nodo può trasmettere su un canale condiviso

---
# Cosa fa?
Il compito principale del MAC è risolvere il **Problema dell'Accesso Multiplo**

Se tutti i nodi di una rete <u>parlassero contemporaneamente attraverso un unico canale</u> non si capirebbe nulla, questo si chiama **collisione**

Il MAC serve a :
- **Coordinare l'accesso**
  Decidere chi ha il diritto di trasmettere in un dato momento
- **Evitare o gestire le collisioni**
  Assicurarsi che i messaggi non si sovrappongano o, se succede, sapere come rimediare
- **Ottimizzare la banda**
  Fare in modo che il canale sia usato il più possibile senza sprechi
---
# Come lo fa?
## Partizionamento del canale
Il canale viene diviso in "fette" fisse assegnate a ogni nodo
- **TDMA *(Time Division)*** : Ogni nodo ha un turno temporale fisso
- **FDMA *(Frequency Division)*** : Ogni nodo usa un frequenza diversa (come nella radio)

|     Vantaggio     |                        Svantaggio                        |
| :---------------: | :------------------------------------------------------: |
| Niente collisioni | Se un nodo non ha nulla da dire la sua fetta va sprecata |

## Accesso Casuale
I nodi trasmettono quando hanno dati, senza turni fissi, se avviene una collisione riprovano dopo un tempo casuale
- **CSMA *(Carrier Sensitive Multiple Access)***
  "Ascolta prima di parlare", se il canale è occupato il nodo aspetta
- **CSMA/CD *(Collision Detection)***
  Usato in Ethernet, il nodo ascolta mentre parla, se sente una collisione, si ferma subito e invia un segnale di disturbo
- **CSMA/CA *(Collision Avoidance)***
  Usato nel Wi-Fi, si cerca di prevenire le collisioni con un sistema di prenotazione
## A Rotazione / Taking Turns
Si cerca di unire i vantaggi dei due metodi precedenti
- **Polling** : Un nodo "master" chiede a turno a tutti gli altri "Hai qualcosa da dire"?
- **Token Passing** : Un pacchetto speciale chiamato "token" gira tra i nodi.
  Può parlare solo chi ha il token in mano

## Tabella di confronto
| **Categoria**                  | **Protocolli Tipici**                  | **Meccanismo Principale**                                                                 | **Vantaggi (Pro)**                                                                 | **Svantaggi (Contro)**                                                                                | **Esempio d'uso**                         |
| ------------------------------ | -------------------------------------- | ----------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- | ----------------------------------------- |
| **Partizionamento del Canale** | **TDMA** (Tempo), **FDMA** (Frequenza) | Divide il canale in "pezzi" fissi (slot temporali o bande di frequenza).                  | **Nessuna collisione**. Equo e deterministico al 100%.                             | **Inefficiente con traffico a raffiche**: se un nodo è zitto, la sua fetta è sprecata.                | Telefonia mobile (GSM), Reti satellitari. |
| **Accesso Casuale**            | **ALOHA**, **CSMA/CD**, **CSMA/CA**    | Nessuna divisione fissa. I nodi trasmettono quando hanno dati e gestiscono le collisioni. | **Molto efficiente a basso carico**. Semplice: non serve un coordinatore centrale. | **Collisioni ad alto carico**: troppi nodi che parlano saturano il canale con interferenze.           | **Ethernet**, **Wi-Fi**.                  |
| **A Rotazione (Taking Turns)** | **Polling**, **Token Passing**         | I nodi si passano il "diritto di parola" (un turno o un pacchetto speciale).              | **Ottimo ad alto carico**. Combina l'efficienza dei due metodi precedenti.         | **Latenza (ritardo)**: bisogna aspettare il turno anche se il canale è vuoto. Punto di rottura unico. | Bluetooth, Token Ring (storico).          |

---
# Indirizzo IP vs Indirizzo MAC
|**Caratteristica**|**Indirizzo MAC**|**Indirizzo IP**|
|---|---|---|
|**Nome completo**|Media Access Control|Internet Protocol|
|**Livello OSI**|Livello 2 (Link Layer)|Livello 3 (Network Layer)|
|**Tipo di indirizzo**|Fisico / Hardware|Logico / Software|
|**Assegnazione**|Dal produttore della scheda|Dal provider (ISP) o dal router (DHCP)|
|**Lunghezza**|48 bit|32 bit (IPv4) o 128 bit (IPv6)|
|**Esempio**|`A1-C2-E3-44-5F-66`|`172.16.254.1`|
|**Visibilità**|Solo nella rete locale|Globale (se IP pubblico)|