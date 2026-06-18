# Cos'è?
È la politica di sostituzione più diffusa ed efficace per le cache associative

Si attiva solo quando si verifica un Miss e il Set è pieno, il sistema deve decidere quale blocco eliminare per fare spazio a quello nuovo appena prelevato dalla memoria

---
# Cosa fa?
L'obbiettivo di LRU è minimizzare la probabilità di buttare fuori un dato che servirà di nuovo a breve, si basa sul principio di località temporale
- Ipotesi : Se un dato è stato usato molto recentemente, è probabile che verrà usato ancora
- Conseguenza : Se un dato non viene usato da molto tempo, è probabile che non serva più

Quindi, LRU individua il blocco che è rimasto inutilizzato per il tempo più lengo e lo sacrifica

---
# Come lo fa?
Implementare LRU puro in hardware è costoso, perchè bisogna tenere traccia dell'ordine esatto di accesso di ogni singola riga

Esistono 2 metodi di implementazione principale

## Metodo dei Contatori (Timestamp)
Ogni linea della cache ha un registro che ne segna l'età ed esiste un contatore globale che avanza ad ogni ciclo di clock

Ogni volta che la CPU accede ad una riga, il valore del contatore viene copiato nel registro "età" della riga

Quando bisogna sostituire, si cerca la riga con il valore "età" più basso

## Metodo dello Stack
Si gestisce una lista ordinata dei blocchi nel set, ogni volta che un blocco viene usato, viene spostato in cima alla pila

Il blocco in fondo alla pila è quello che è stato usato meno recentemente e quindi, il primo ad essere sostituito

---
# Vantaggi e Svantaggi
## Vantaggi
- **Massima Efficienza**
  È l'algoritmo che garantisce il $MR$ più basso
- **Adattabilità**
  Funziona bene con quasi tutti i tipi di carico di lavoro
## Svantaggi
- **Costo Hardware alto**
- **Lentezza**
  Ogni operazione richeide una scrittura dei metadati
- **Complessità con alta aassociatività**
  Se il set ha molte vie, trovare il minimo tra 16 contatori è lento
---
# Confronto con gli altri algoritmi
|**Caratteristica**|**LRU (Least Recently Used)**|**FIFO (First In First Out)**|**Random (Casuale)**|
|---|---|---|---|
|**Criterio**|Elimina il non usato da più tempo.|Elimina il più vecchio caricato.|Elimina a caso.|
|**Logica**|Basata sull'uso (Access history).|Basata sull'arrivo (Load time).|Nessuna logica.|
|**Complessità HW**|**Alta** (Serve tracciare ogni accesso).|**Media** (Serve solo una coda).|**Bassissima** (Pseudo-random).|
|**Prestazioni (Miss Rate)**|**Ottime** (Sfrutta la località).|Mediocri (Rischio anomalia).|Basse (Imprevedibile).|
|**Utilizzo Tipico**|Cache L1/L2 di CPU moderne.|Buffer semplici o di rete.|Cache enormi (L3) o low-power.|
### Sintesi
- **LRU** è la scelta **"Intelligente ma Costosa"**. Cerca di capire il comportamento del programma guardando al passato recente. È lo standard de facto.
    
- **FIFO** è la scelta **"Ingenua"**. Assume che "vecchio = inutile", ma sbaglia spesso (es. le variabili globali caricate all'avvio servono sempre, ma FIFO le eliminerebbe perché sono vecchie).
    
- **Random** è la scelta **"Economica"**. Quando la cache è molto grande (es. L3) o l'associatività è alta, LRU diventa troppo costoso da gestire e Random si rivela sorprendentemente efficace perché evita casi patologici.