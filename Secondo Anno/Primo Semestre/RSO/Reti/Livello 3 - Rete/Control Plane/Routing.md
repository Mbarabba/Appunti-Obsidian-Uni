# Cos'è?
Il routing è il processo che determina il percorso end-to-end seguito dai pacchetti dalla sorgente alla destinazione

---
# Cosa fa?
- **Determinazione del percorso**
  Calcola il tragitto ottimale tra i router lungo il percorso end-to end
- **Logica di rete**
  Rappresenta la logica di controllo dell'intera rete decidendo come i datagrammi devono essere instradati tra i vari nodi
- **Creazione delle tabelle**
  Il risultato finale del routing è la creazione/aggiornamento delle tabelle di inoltro all'interno di ogni router

---
# Come lo fa?
Il routing viene implementato attraverso 2 approcci nel Control Plane :
1. **Controllo per ogni router (Tradizionale)**
   In ogni router è presente un componente software dedicato all'algoritmo di routing, questi componenti interagiscono tra di loro scambiandosi messaggi per costruire le tabelle di inoltro locali
2. **Controllo logicamente centralizzato  (SDN)**
   Un remote controller centrale calcola le tabelle di inoltro per tutti i router, dopo aver fatto ciò il controller installa direttamente nei router tramite protocolli specifici

---
# Algoritmi principali
- [[Algoritmo Link State]]
---
# Protocolli principali
---
# Routing vs Forwarding
| Caratteristica      |                                        Forwarding                                         |                                              Routing                                              |
| :------------------ | :---------------------------------------------------------------------------------------: | :-----------------------------------------------------------------------------------------------: |
| **Definizione**     | Azione locale di spostare un pacchetto dal link di ingresso al link di uscita appropriato | Processo globale che determina il percorso seguito dai pacchetti dalla sorgente alla destinazione |
| **Piano Logico**    |              **Data Plane**<br>Implementa le funzioni di inoltro per-router               |      **Control Plane**<br>Implementa la logica di rete per determinare i percorsi end-to-end      |
| **Scala Temporale** |                                        Nanosecondi                                        |                                           Millisecondi                                            |
| **Ambito**          |                                 Locale al singolo router                                  |             Di rete, coinvolge l'interazione tra più router o un controller centrale              |
| **Implementazione** |                     Basata su chip specializzati e tabelle di inoltro                     |                            Basata su algoritmi di routing e protocolli                            |
