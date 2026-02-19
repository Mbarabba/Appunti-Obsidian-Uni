# Cos'è?
L'algoritmo di Dijkstra è un algoritmo di instradamento di tipo [[Algoritmo Link State | Link-State]].

Viene classificato come un algoritmo "globale" o "centralizzato" perchè richiede che la topologia della rete i costi di tutti i collegamenti siano noti a tutti i nodi prima di iniziare il calcolo

--- 
# Cosa fa?
- **Calcola i cammini minimi**
  Determina il percorso a costo minimo da un singolo nodo sorgente verso tutti gli altri nodi della rete
- **Genera la tabella di inoltro**
  Il risultato finale dell'algoritmo per un determinato nodo è la creazione della sua tabella di inoltro, che gli permette di sapere verso quale interfaccia inviare i pacchetti per ogni destinazione

---
# Come lo fa?
L'algoritmo opera in modo iterativo : dopo $k$ interazione, conosce il cammino a costo minimo verso i $k$ nodi di destinazione "più vicini".

Il procedimento segue questi passaggi : 
1. **Inizializzazione**
	- Si definisce un insieme $N'$ che inizialmente contiene solo il nodo sorgente
	- Per ogni nodo $v$ direttamente adiacente alla sorgente, si imposta il costo del percorso $D(v)$ pari al costo del link, per i nodi non adiacenti, il costo iniziale è impostato a infinito 
2. **Loop (Iterazione)**
	- Si individua un nodo $w$ non ancora presente in $N'$ che abbia il valore $D(w)$ minimo
	- Si aggiunge $w$ all'insieme $N'$ (il percorso verso questo nodo è ora definitivo)
	- **Aggiornamento (Rilassamento)** : Si ricalcolano i costi per tutti i vicini di $w$ non ancora in $N'$.
	  Il nuovo costo di $D(v)$ sarà il minimo tra il valore precedente e il costo per raggiunger $v$ passando attraverso $w$, calcolando come $D(w)+c(w,v)$
3. **Conclusione** 
   Il ciclo si ripete finchè tutti i node della rete non sono stati inseriti nell'insieme $N'$