# Cos'è?
È la forma più semplice di organizzazione della memoria cache

La sua caratteristica fondamentale è la rigidità, ogni blocco della memoria principale può essere posizionato in un solo, specifico blocco della cache

Esiste una relazione univoca tra l'indirizzo di memoria e la posizione in cache

---
# Com'è composta?
Fisicamente, è costituita da $N$ blocchi (dove $N$ è una potenza di )
>[!tip]- Precisazione
>I calcoli sottostanti saranno eseguiti tenendo in conto questi dati d'esempio
>- Indirizzo = 32 bit
>- Dimensione Cache = 4 KB
>- Dimensione del Blocco = 16 B
## Cosa contiene?
Ogni linea contiene 3 elementi fondamentali :
1. **Bit di validità $(V)$** : 1 bit
   Indica se la riga contiene un dato valido o meno
2. **Tag** : 20 bit
   Contiene i bit più significativi dell'indirizzo per il confronto
3. **Dati (Data)** : 128 bit ($16B \times8$)
   Il blocco di memoria vero e proprio
## Struttura dell'indirizzo

1. **Offset (Spostamento)**
   Indica quale byte leggere all'interno del blocco
	- <u>Calcolo</u> = $\log_{2}(\text{Dimensione Blocco})=\log_{2}(16)=4\text{ bit}$ 
2. **Indice (Index)**
   Indica quale riga della cache cercare 
	- <u>N. righe</u> = $\frac{\text{Dimensione Cache}}{\text{Dimensione Blocco}} = \frac{{4\cdot2^{10}}}{16} = 256 \text{ righe}$   
	- <u>Calcolo bit</u> $= \log_{2}(256)=8 \text{ bit}$
3. **Tag (Etichetta)**
   Identifica univocamente il blocco di memoria
	- <u>Calcolo</u>$= \text{Totale}-(\text{Indice}+\text{Offset})=32-(8+4)=20 bit$
---
# Cosa fa?
Il compito della mappatura diretta è assegnare velocemente una posizione ai dati provenienti dalla RAM senza dover cercare spazi liberi

Dato che molti blocchi di memoria competono per la stessa linea di cache, il sistema usa il Tag per distinguere quale blocco è presente in un dato momento 

---
# Come lo fa? 
## Meccanismo di Mappatura
La posizione fissa è determinata da una formula matematica basata sull'indirizzo del blocco
$$\text{Posizione Cache}=\text{Indirizzo Blocco Memoria } \% \text{ Numero Blocchi Cache}$$
## Gestione del Conflitto
Se la CPU richiede un blocco che mappa su una riga già occupata da un altro indirizzo, il vecchio blocco viene sovrascritto immediatamente

Non c'è alcuna scelta o algoritmo di sostituzione, la sostituzione è forzata

---
# Vantaggi e Svantaggi
## Vantaggi
- **Semplicità Hardware**
  Richiede un solo comparatore per verificare il Tag, riducendo i costi e lo spazio sul chip
- **Velocità**
  È il tipo di cache più veloce in caso di Hit, il dato è disponibile subito, prima ancora di sapere se è Hit o Miss, perchè non c'è bisogno di un [[Multiplexer]] per scegliere tra più vie
## Svantaggi
- **Alto Tasso di conflitti**
  Se il programma usa alternativamente due dati che mappano sulla stessa riga, si "buttano fuori" a vicenda continuamente
- **Rigidità**
  Se una riga è piena e le altre sono vuote, la cache non può usare lo spazio vuoto per salvare un dato destinato alla riga piena
---
# Confronto con le altre strutture
|**Caratteristica**|**Direct Mapped**|**Set Associative (N-way)**|**Fully Associative**|
|---|---|---|---|
|**Dove va il blocco**|1 posto fisso|N posti (nel Set)|**Ovunque (Nessun vincolo)**|
|**Indirizzo**|Tag + Indice + Offset|Tag + Indice + Offset|**Tag + Offset** (Niente Indice)|
|**Ricerca**|1 confronto (Veloce)|N confronti (Media)|**Tutti i confronti** (Lenta/Parallela)|
|**Algoritmo Sostituzione**|Non serve (Obbligata)|Serve (nel Set)|**Fondamentale** (su tutta la cache)|
|**Tasso di Miss**|Alto (Conflitti)|Medio|**Minimo** (Solo Capacità)|
|**Costo**|Basso|Medio|**Altissimo**|