# 🌐 Virtual Local Area Networks (VLAN)

Le **VLAN** sono una tecnologia di **Livello 2 (Link Layer)** che permette di segmentare logicamente una rete fisica in più reti locali separate e indipendenti.

---

## 1. Cosa sono?
In una rete tradizionale, tutti i dispositivi collegati a uno switch appartengono allo stesso **dominio di broadcast**. Una VLAN permette di istruire uno o più switch fisici affinché si comportino come se fossero più switch logici distinti. 

In pratica, si rompe il legame rigido tra la posizione fisica del cavo e l'appartenenza alla rete: due computer possono essere vicini di scrivania ma appartenere a reti diverse, o trovarsi in uffici diversi ma far parte della stessa rete virtuale.

---

## 2. Cosa fanno? (Scopo e Vantaggi)
Le VLAN risolvono diversi problemi critici delle reti LAN di grandi dimensioni:

- **Isolamento dei domini di Broadcast**: Impediscono che il traffico di broadcast (es. richieste ARP o DHCP) di una sottorete inondi l'intera infrastruttura fisica, migliorando le prestazioni.
- **Sicurezza**: Consentono di isolare reparti sensibili. Ad esempio, la VLAN "Amministrazione" può essere resa invisibile alla VLAN "Ospiti", anche se condividono lo stesso switch.
- **Efficienza Gestionale**: Gli utenti possono essere raggruppati per funzione (Marketing, Ingegneria, HR) anziché per posizione fisica. Spostare un utente in un altro ufficio richiede solo una modifica software nella configurazione della porta dello switch.

---

## 3. Come lo fanno? (Meccanismi)

Il funzionamento si basa principalmente su due approcci definiti dallo standard **IEEE 802.1Q**:

### A. VLAN basate su porta (Port-based)
L'amministratore assegna manualmente ogni porta dello switch a una specifica VLAN (es. porte 1-4 alla VLAN 10, porte 5-8 alla VLAN 20).
- Lo switch inoltra i frame solo tra porte appartenenti alla stessa VLAN.
- Per comunicare tra VLAN diverse è necessario un **Router** (o uno switch di Livello 3).

### B. Trunking e Tagging
Quando una VLAN deve estendersi su più switch, si usa un collegamento speciale chiamato **Trunk**.

1. **Il Tag 802.1Q**: Quando un frame Ethernet attraversa un link di trunk, lo switch aggiunge un'intestazione speciale di 4 byte chiamata **VLAN Tag**.
2. **VLAN ID**: All'interno del tag è presente un identificativo (un numero a 12 bit) che indica a quale VLAN appartiene quel frame.
3. **Inoltro**: Lo switch ricevente legge il tag, capisce la destinazione corretta e rimuove l'etichetta prima di consegnare il frame all'host finale.

> [!INFO] Native VLAN
> Esiste spesso una **VLAN Nativa** (solitamente la 1) i cui frame viaggiano sui trunk senza etichetta per garantire la compatibilità con i dispositivi che non supportano il tagging.

---
#Reti #LinkLayer #VLAN #Networking #Appunti