# Cos'è?
È un protocollo di tipo **client-server** che permette la configurazione automatica degli host quando si collegano alla rete

---
# Cosa fa?
Il suo scopo principale è assegnare automaticamente un [[Indirizzamento Protocollo IP | indirizzo IP]] a un dispositivo che entra nella rete, evitandogli di doverne configurare uno manualmente.
Oltre all'indirizzo IP, il DHCP fornisce altre informazioni vitali
- Subnet Mask
- Indirizzo del Gateway predefinito
- L'indirizzo del server DNS locale

---
# Come lo fa?
Il processo avviene tramite uno scambio di 4 messaggi principali
1. **DHCP Discover**
   Il client appena arrivato invia un messaggio in **broadcast** a tutta la rete chiedendo interrogando la presenza di un server DHCP
2. **DHCP Offer**
   Il server DHCP riceve la richiesta e risponde proponendo un indirizzo IP
3. **DHCP Request**
   Il client accetta l'offerta e risponde al server 
4. **DHCP ACK**
5. Il server conferma l'assegnazione