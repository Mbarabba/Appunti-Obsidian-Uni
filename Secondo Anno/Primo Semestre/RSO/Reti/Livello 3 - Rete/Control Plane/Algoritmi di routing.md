# Cosa sono?
Sono procedure che determinano il percorso che i pacchetti devono seguire attraverso una rete di router per andare dalla sorgente alla destinazione.

La rete viene astratta come un grafo dove i nodi sono i router e gli archi sono i link fisici tra di essi, che può riflettere la velocità del link, il ritardo o il costo economico

--- 
# Cosa fanno?
- **Calcolano il costo minimo**
  Trovano il percorso tra una coppia di nodi che minimizza la somma dei costi degli archi attraversati
- **Popolano le tabelle di inoltro**
  Forniscono le informazioni necessarie per creare le forwarding tables all'interno dei router, indicano quale porta di uscita usare per ogni specifica destinazione
- **Gestiscono i cambiamenti**
  Aggiornano i percorsi in risposta a guasti dei link o variazioni nella topologia della rete

---
# Come classificarli?
## In base alla conoscenza
- **Globali**
  Ogni nodo ha informazioni complete 
- **Decentralizzati**
  Ogni nodo ha informazioni limitate ai vicini
## In base alla dinamicità
- **Statici**
  Le rotte cambiano raramente e sono spesso configurate manualmente
- **Dinamici**
  Le rotte si adattano rapidamente ai cambiamenti di topologia o traffico
---
# Come valutare le performance?
La valutazione avviene tramite 3 criteri principali :
1. **Complessità dei messaggi**
   Quanti messaggi devono essere scambiati per far funzionare l'algoritmo
2. **Velocità di convergenza**
   Quanto tempo serve alla rete per stabilizzarsi su nuove rotte dopo un cambiamento
3. **Robustezza**
   Cosa succede se un router fallisce o invia dati errati
