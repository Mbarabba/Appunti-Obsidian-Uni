# Cos'è?
È un algoritmo di routing globale in cui ogni router possiede informazioni complete sulla topologia della rete e sui costi di tutti i collegamenti

## Classificazione
Viene classificato come algoritmo centralizzato e solitamente dinamico
- **Centralizzato** perchè ogni nodo ha una visione globale
- **Dinamico** poichè reagisce ai cambiamenti della rete in tempo reale

---
# Cosa fa?
- **Calcolo dei percorsi**
  Determina il cammino a costo minimo da un nodo sorgente verso tutte le altri possibili destinazioni nel grafo della rete 
- **Generazione delle tabelle**
  Fornisce i dati necessari per popolare al tabella di inoltro del router, associando ogni destinazione alla corretta interfaccia di uscita
---
# Come lo fa?
Il processo si divide in 2 fasi operative principali :
1. **Link State Broadcast (Flooding)**
   Ogni nodo monitora i propri link diretti e invia queste informazioni (stato e costo) a tutti gli altri router della rete tramite un meccanismo di diffusione capillare.
   Al termine di questa fase, tutti i router dispongono di un database identico che rappresenta l'intera topologia della rete 
2. **Algoritmo di Dijkstra**
   Ogni router esegue localmente [[Algoritmo di Dijkstra| l'algoritmo di Dijkstra]] sulla mappa ottenuta
---
# Pregi e Difetti
| Categoria       |                                                           Pregi                                                           |                                                                Difetti                                                                 |
| --------------- | :-----------------------------------------------------------------------------------------------------------------------: | :------------------------------------------------------------------------------------------------------------------------------------: |
| **Convergenza** |                    Convergenza rapida verso le rotte ottimali in seguito a variazioni della topologia                     |                  Rischio di oscillazioni se i costi dei collegamenti vengono calcolati in base al carico di traffico                   |
| **Robustezza**  | Errori localizzati<br>Un router che diffonde costi errati influenza principalmente solo i calcoli relativi ai propri link |         Il calcolo dei percorsi è separato in ogni nodo, ma dipende dalla ricezione corretta di tutti i messaggi di broadcast          |
| **Complessità** |                 Minore probabilità di creare loop di instradamento rispetto ad algoritmi decentralzizati                  | Alta complessità dei messaggi, richiede l'invio di $O(n \cdot E)$ messaggi a ogni variazione di stato<br><br>(n = nodi , E = link)<br> |
| **Risorse**     |               Ogni nodo calcola autonomamente la propria tabella di inoltro partendo da una visione globale               |          Richiede un consumo elevato di CPU e memoria per memorizzare l'intera topologia ed eseguire l'algoritmo di Dijkstra           |

--- 
# [[Algoritmo Distance Vector |Confronto con Distance Vector]]

| Caratteristica    |           Link state            |                Distance Vector                |
| ----------------- | :-----------------------------: | :-------------------------------------------: |
| **Conoscenza**    |             Globale             |                    Locale                     |
| **Algoritmo**     |            Dijkstra             |                 Bellman-Ford                  |
| **Comunicazione** |      Invia a tutti i nodi       |        Scambia dati solo con i vicini         |
| **Robustezza**    | Alta<br>Un errore è localizzato | Bassa<br>Un errore si propaga a tutta la rete |
