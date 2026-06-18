# Cos'è?
È un organizzazione della memoria in cui non esistono regole di posizionamento

Un blocco proveniente dalla memoria principale può essere collocato in qualsiasi riga libera della cache

---
# Come è composta?
Fisicamente, la cache è sempre una matrice di linee, ma logicamente viene trattata come un unico grande insieme


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
# Come lo fa?
Il funzionamento è ciò che rende questa cache costosa e difficile da realizzare per grandi dimensioni
1. **Nessuna selezione**
   Non essendoci un indice, non si restringe il campo di ricerca si cerca ovunque
2. **Confronto simultaneo**
   Quando arriva un indirizzo, l'hardware deve confrontare il Tag richiesto con i Tag di tutte le linee della cache contemporaneamente
3. **Selezione (Hit)**
	- Se uno dei comparatori segnala "uguale" (e $V=1$), si ha un HIT
	- Un enorme multiplexer preleva il dato dalla riga vincente
4. **Sostituzione (Miss)**
	- Se la cache è piena, bisogna scegliere chi eliminare
	  Qui è obbligatorio usare un algoritmo di sostituzione, dato che qualsiasi riga è candidata a essere sacrificata
---
# Vantaggi e Svantaggi
## Vantaggi
- **Zero conflitti**
  È l'architettura più efficiente in termini di $MR$, sfrutta ogni singolo bit di spazio disponibile prima di sovrascrivere qualcosa
- **Ideale per cache piccole**
  Si usa spesso nelle TLB o in cache piccolissime dove l'efficienza è tutto e le righe sono poche
## Svantaggi
- **Costo Hardware Proibitivo**
  Richiede un comparatore per ogni singola linea, per cache grandi, il costo in transistor e spazio è insostenibile
- **Lentezza** $(T_{hit})$
  Dover controllare centinaia di comparatori in parallelo e gestire l'output richiede tempo elettrico, è più lenta della [[Cache Direct Mapped]]
- **Consumo energetico**
  Attivare tutti i comparatori ad ogni accesso consuma molta corrente
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