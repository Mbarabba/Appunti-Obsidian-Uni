# Cos'è
È un algoritmo di routing decentralizzato in cui ogni router non conosce l'intera topologia della rete, ma solo i costi verso i suoi vicini diretti
## Classificazione
Viene classificato come iterativo, asincrono e distribuito
- **Distribuito** perchè ogni nodo riceve informazioni dai vicini, calcola e poi distribuisce i risultati
- **Iterativo** perchè il processo continua finchè non vengono più scambiati dati 
- **Asincrono** perchè non richiede che tutti i nodi operino in sincronia
---
# Cosa fa?
- **Stima i costi**
  Ogni nodo mantiene un vettore (Distance Vector) che contiene la stima del costo minimo verso tutte le possibili destinazioni della rete
- **Aggiorna le rotte**
  Determina il percorso migliore basandosi esclusivamente sulle informazioni ricevute dai router adiacenti
---
# Come lo fa
L'algoritmo segue un ciclio continua di 3 fasi : 
1. **Attesa**
   Il nodo attende un cambiamento nel costo di un link locale o la ricezione di un nuovo vettore delle distanze da un vicino 
2. **Calcolo**
   Il nodo ricalcola le proprie stime dei cammini minimi utilizzando [[Algortimo di Bellman-Ford | l'equazione di Bellman-Ford]]
3. **Aggiornamento**
   Se il vettore delle distanze è cambiato, il nodo invia il proprio nuovo vettore a tutti i suoi vicini 

Questo processo porta gradualmente la rete alla convergenza, ovvero a una situazione in cui tutti i router hanno le rotte corrette

---
# Pregi e difetti

| **Caratteristica** | **Pregi (Vantaggi)**                                                                        | **Difetti (Svantaggi)**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| ------------------ | ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **Complessità**    | Bassa complessità dei messaggi: le informazioni sono scambiate solo tra vicini diretti.     | La velocità di convergenza può essere molto lenta in reti grandi o con topologie complesse.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| **Configurazione** | Non richiede che ogni router memorizzi l'intera topologia della rete, risparmiando memoria. | Problema del **Count-to-Infinity**: i costi che aumentano si propagano molto lentamente (es. "le cattive notizie viaggiano piano").                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| **Flessibilità**   | Adatto a reti dinamiche dove i nodi possono non avere una visione globale.                  | **Scarsa robustezza**: un router che invia informazioni errate può "avvelenare" le tabelle di tutta la rete, poiché ogni nodo usa i calcoli altrui.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |

---
# [[Algoritmo Link State | Confronto con Link state]]

|**Caratteristica**|**Distance Vector (DV)**|**Link State (LS)**|
|---|---|---|
|**Conoscenza della Rete**|**Locale**: il nodo conosce solo i costi verso i vicini direttamente collegati.|**Globale**: ogni nodo ha la mappa completa dell'intera topologia della rete.|
|**Algoritmo Utilizzato**|**Bellman-Ford**: calcolo iterativo basato sulle stime dei vicini.|**Dijkstra**: calcolo dell'albero dei cammini minimi dalla sorgente a tutti i nodi.|
|**Scambio di Messaggi**|**Tra vicini**: ogni nodo scambia il proprio vettore delle distanze solo con i router adiacenti.|**In broadcast**: le informazioni sullo stato dei link locali vengono inviate a tutti i nodi della rete.|
|**Complessità dei Messaggi**|Bassa: lo scambio avviene solo tra vicini, ma il tempo di propagazione varia.|Alta: richiede l'invio di messaggi a tutti i nodi ($O(n \cdot E)$ messaggi).|
|**Velocità di Convergenza**|Può essere lenta e soffrire del problema del "**count-to-infinity**".|Generalmente rapida nel convergere verso le nuove rotte ottimali.|
|**Robustezza**|Bassa: un router che invia costi errati può propagare l'errore a tutta la rete.|Alta: un errore è spesso confinato al nodo che lo genera; ogni router ricalcola la propria tabella.|
|**Utilizzo Risorse**|Richiede meno memoria e CPU (non serve memorizzare l'intera rete).|Richiede più memoria (per il database topologico) e CPU (per eseguire Dijkstra).|