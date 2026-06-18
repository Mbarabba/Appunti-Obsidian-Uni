# Cosa è?
È una politica di sostituzione della memoria cache

È l'approccio più semplice e intuitivo per gestire la sostituzione dei blocchi nella cache associativa quando lo spazio è esaurito

---
# Cosa fa?
Il suo obbiettivo è liberare spazio eliminando il blocco più vecchio in termini di tempo di caricamento

A differenza di [[LRU - Least Recently Used|LRU]], FIFO ignora completamente l'utilizzo del dato

Non gli importa se un blocco viene letto un milione di volte al secondo o mai, se è stato caricato per primo, sarà il primo ad essere sacrificato quando serve spazio

---
# Come lo fa?
Il meccanismo hardware è estremamente semplice e leggero
1. **Coda Circolare (Round Robin)**
	- Per ogni insieme (Set), il controller mantiene un semplice puntatore che indica la "prossima vittima"
2. **Caricamento (Miss)**
	- Quando un nuovo blocco viene caricato nel Set, occupa la posizione indicata dal puntatore
	- Il puntatore avanza di una posizione (modulo $N$ vie)
3. **Accesso (Hit)**
	* Se la CPU legge o scrive su un blocco già presente (Hit), **FIFO non fa nulla**. L'ordine della coda non cambia. Questo è il punto cruciale che lo differenzia da LRU (che invece sposterebbe il blocco in cima alla lista)
---
# Vantaggi e svantaggi
## Vantaggi
- Semplice
- Veloce
## Svantaggi
- Ignora il concetto di località
- Anomalia di belady 
  È l'unico algoritmo che soffre di questo paradosso matematico: in certi casi, _aumentare_ la dimensione della cache può paradossalmente _peggiorare_ le prestazioni
---
# Confronto con gli altri algoritmi
|**Caratteristica**|**FIFO (First In First Out)**|**LRU (Least Recently Used)**|**Random (Casuale)**|
|---|---|---|---|
|**Criterio**|Elimina il più vecchio (tempo di arrivo).|Elimina il non usato da più tempo.|Elimina a caso.|
|**Aggiornamento su Hit**|**Nessuno** (Statico).|**Sì** (Sposta in cima alla lista).|Nessuno.|
|**Logica**|Temporale (Ordine di arrivo).|Comportamentale (Frequenza d'uso).|Nessuna.|
|**Costo Hardware**|**Basso** (Contatore circolare).|**Alto** (Matrice o pila complessa).|Bassissimo.|
|**Efficienza (Miss Rate)**|Mediocre (Rischia di buttare dati utili).|**Ottima** (Protegge i dati usati).|Bassa (Ma stabile).|