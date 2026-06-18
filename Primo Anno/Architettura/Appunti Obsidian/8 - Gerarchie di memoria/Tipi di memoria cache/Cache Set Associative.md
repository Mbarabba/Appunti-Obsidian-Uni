# Cos'è?

È una soluzione ibrida che si posizione a metà strada tra la [[Cache Direct Mapped]] e la [[Cache Fully Associative]] 

È il compromesso architettonico più utilizzato nei processori moderni perchè cerca di combinare la velocità della prima con la flessibilità della seconda, riducendo i conflitti senza esplodere i costi hardware

---
# Com'è composta?
Invece di avere singole linee indipendenti, la cache è divisa in gruppi chiamati insieme (Set)

Una cache $N-$way Set Associative è composta da $S$ insiemi, e ogni insieme contiene esattamente $N$ blocchi

## Come è composto un blocco?
Per calcolare la dimensione totale di una cache in bit, non basta contare i dati, bisogna sommare la grandezza dei 3 componenti fondamentali per ogni blocco

Per determinare queste grandezze, dobbiamo prima analizzare come viene scomposto l'indirizzo di memoria (solitamente a 32 bit) fornito dalla CPU

>[!tip]- Precisazione
>I calcoli sottostanti saranno eseguiti tenendo in conto questi dati d'esempio
>- Indirizzo = 32 bit
>- Dimensione Cache = 4 KB
>- Dimensione del Blocco = 16 B

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

![[Pasted image 20260207105609.png]]
## Cosa contiene un blocco?
1. **Bit di validità $(V)$** : 1 bit
   Indica se la riga contiene un dato valido o meno
2. **Dirty Bit $(D)$** : 1 bit (Solo se la cache è [[Cache Write-Back|Write-Back]])
   Indica se il dato è stato modificato dalla CPU e deve essere salvato in RAM prima di essere cancellato
3. **Tag** : 20 bit
   Contiene i bit più significativi dell'indirizzo per il confronto
4. **Dati (Data)** : 128 bit ($16B \times8$)
   Il blocco di memoria vero e proprio
---
# Cosa fa?
Il suo scopo è ridurre i Miss di conflitto

Nella mappatura diretta, se 2 indirizzi puntano allo stesso indice, si sovrascrivono a vicenda (anche se il resto della cache è vuoto)

Nella Set Associative, se due indirizzi puntano allo stesso indice (Set), possono coesistere pacificamente occupando due vie diverse dello stesso set

---
# Come lo fa?
Il funzionamento richiede hardware più complesso rispetto alla mappatura diretta
1. **Indicizzazione**
   L'hardware usa i bit di Indice per attivare un unico Set specifico
2. **Ricerca parallela**
   All'interno del set attivato, bit di Tag dell'indirizzo vengono confrontati contemporaneamente con i Tagi di tutte le $N$ vie
3. **Selezione (Hit)**
	- Se un comparatore trova una corrispondenza (e $V=1$), segnala l'hit
	- Un [[Multiplexer]] seleziona il dato dalla via corretta e lo manda alla CPU
4. **Gestione Miss (Sostituzione)**
	- Se nessuno dei Tag corrisponde, si ha un Miss
	- Bisogna caricare il nuovo blocco dalla RAM
	  Se il set è pieno, si deve scegliere chi "sfrattare" usando un algoritmo come [[LRU - Least Recently Used]]
---
# Vantaggi e Svantaggi
## Vantaggi
- **Basso tasso di miss**
  Riduce drasticamente i conflitti
  Se un programma salta tra due indirizzi con lo stesso indice, in una cache 2-way non c'è nessun miss
- **Flessibilità Controllata**
  Permette di aumentare l'associatività quanto basta senza dover gestire la complessità totale della [[Cache Fully Associative]]
## Svantaggi
- **Costo Hardware**
  Richiede $N$ comparatori per ogni set
  Una cache 8-way è molto più costosa in transistor di una [[Cache Direct Mapped]]
- **Lentezza (Hit time)**
  È leggermente più lenta della [[Cache Direct Mapped]]
  Il segnale deve attraversare il comparatore e poi il [[Multiplexer]] per uscire
---
# Confronto
|**Caratteristica**|**Direct Mapped**|**Set Associative (N-way)**|**Fully Associative**|
|---|---|---|---|
|**Dove va il blocco**|1 posto fisso|N posti (nel Set)|**Ovunque (Nessun vincolo)**|
|**Indirizzo**|Tag + Indice + Offset|Tag + Indice + Offset|**Tag + Offset** (Niente Indice)|
|**Ricerca**|1 confronto (Veloce)|N confronti (Media)|**Tutti i confronti** (Lenta/Parallela)|
|**Algoritmo Sostituzione**|Non serve (Obbligata)|Serve (nel Set)|**Fondamentale** (su tutta la cache)|
|**Tasso di Miss**|Alto (Conflitti)|Medio|**Minimo** (Solo Capacità)|
|**Costo**|Basso|Medio|**Altissimo**|