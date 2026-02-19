# Cosa è?
Il protocollo IP è il protocollo principale del livello di rete, è presente in ogni dispositivo della rete inclusi host e router.

---
# Cosa fa?
Svolge 2 funzioni chiave : 
1. [[Forwarding]]
   È l'azione locale di un router che consiste nello spostare i pacchetti da un interfaccia di ingresso a quella di uscita appropriata
2. [[Routing]]
   È la funzione di rete che determina il percorso seguito dai pacchetti dalla sorgente alla destinazione
---
# Come lo fa?
- [[Datagramma protocollo IP | Formato del Datagramma]] 
  Il protocollo IP incapsula i dati in "datagrammi" che contengono un'intestazione con informazioni cruciali
- [[Tabelle di inoltro | Tabelle di inoltro]]
  Ogni router consulta una tabella locale per decidere su quale interfaccia inviare il pacchetto in arrivo
- **Longest Prefix Match**
  Quando cerca una voce nella tabella di inoltro, il router utilizza il prefisso dell'indirizzo più lungo che corrisponde alla destinazione per garantire l'accuratezza del percorso
- [[Indirizzamento Protocollo IP | Indirizzamento]]
  Utilizza la notazione CIDR (a.b.c.d/x), dove x indica il numero di bit della parte di sottorete (subnet).