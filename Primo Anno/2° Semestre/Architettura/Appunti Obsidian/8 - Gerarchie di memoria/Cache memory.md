# Cosa è?
È un livello di memoria gerarchica di piccole dimensione ma ad altissima velocità, situato fisicamente tra il processore e la memoria principale

---
# Da cosa è composta?
La cache non è un blocco unico indifferenziato, ma è suddivisa in unità minime chiamate Blocchi

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
Ha due obbiettivi principali :
1. Ridurre la latenza media di accesso ai dati e ridurre il traffico sul bus di sistema
2. Sfruttare il principio di località per tenere vicini alla CPU i dati che probabilmente serviranno a breve
---
# Come lo fa?
Il funzionamento si basa su una sequenza di controllo hardware e sulla gestione delle tempistiche di accesso

## Logica di accesso
1. **Selezione** : Usa l'indice per attivare la riga corrispondente
2. **Verifica (Hit/Miss)** : Confronta il Tag e controlla il Vaild Bit
3. **Azione** :
	- **Hit** : Fornisce il dato
	- **Miss** : Stalla la CPU, carica il blocco dalla RAM, aggiorna la cache, riavvia l'istruzione

## Formule per le prestazioni
Per valutare quanto è veloce la gerarchia, si usano le seguenti metriche : 
1. **Hit Rate $(HR)$** $= \frac{\text{Accessi trovati in cache}}{\text{Totale accessi}}$
2. **Miss Rate** $(MR) = 1-HR$
3. **Hit Time** $(T_{hit})=\text{Tempo accesso alla cache}+\text{tempo confronto tag}$
4. **Miss Penalty** $(T_{penalty})= \text{Latenza}(\text{Tempo di accesso alla prima parola})+ \text{Tempo trasferimento}(\text{Resto del blocco})$
5. **Tempo medio di accesso** $(AMAT)=T_{hit}+(MR \times T_{penalty})$
---
# Tipi di cache
1. [[Cache Direct Mapped]] (Grado = 1)
	- Ogni blocco ha 1 sola posizione possibile
2. [[Cache Set Associative]] (Grado = $N$) 
	- La cache è divisa in insiemi
	  Ogni blocco mappa su 1 Set specifico, ma all'interno di quel set può occupare una qualsiasi delle $N$ vie disponibili
	- Se il Set è pieno, un algoritmo decide quale degli N blocchi da sostituire
3. [[Cache Fully Associative]] (Grado = $M$ totale)
	- Un blocco può andare in qualsiasi riga della cache

>[!definizione]- Grado di associatività
>Il grado di associatività indica in quante posizioni diverse un blocco di memoria principale può essere salvato
>## Vantaggi
>- Riduzione dei conflitti 
>  Avendo più posti disponibili per lo stesso indice, diminuisce drasticamente la probabilità che due dati utili "si buttino fuori" a vicenda
>- Maggiore flessibilità
>  Si sfrutta meglio lo spazio totale della cache
>- Miglior Hit Rate
>  Grazie a meno conflitti, il processore trova i dati più spesso
>## Svantaggi
>- Complessità Hardware
>  Per cercare un dato in un set da $N$ vie, servono $N$ comparatori che lavorano in parallelo per controllare tutti i Tag contemporaneamente
>- Lentezza ($HT$ maggiore)
>  Dopo aver trovato il dato (confronto Tag) serve un [[Multiplexer]] per selezionare la via corretta tra le $N$ disponibili
>- Consumo Energetico
>  Attivare $N$ comparatori per ogni singolo accesso consuma più corrente
## Tabella di confronto
| Caratteristica |            Direct Mapped             |             Set Associative              |         Fully Associative          |
| :------------- | :----------------------------------: | :--------------------------------------: | :--------------------------------: |
| Posizionamento |   Rigido <br><br>1 sola posizione    |  Flessibile nel Set<br><br>N posizioni   |               Libero               |
| Ricerca        |  Semplice<br><br>(1 confronto Tag)   |   Media<br><br>(N confronti paralleli)   |   Complessa<br><br>(Tutti i tag)   |
| Costo Hardware |                Basso                 |                  Medio                   |             Molto Alto             |
| Velocità       |   Altissima<br><br>$T_{hit}$ basso   | Media<br><br>Ritardo del [[Multiplexer]] |           Bassa/costosa            |
| Conflitti      | Alti<br><br>Tanti missi di conflitto |     Bassi<br><br>Compromesso ideale      | Nulli<br><br>Solo miss di capacità |
### Sintesi
- La **Direct Mapped** è la più veloce ma soffre di conflitti se due dati usati spesso finiscono sulla stessa riga
- La **Fully Associative** elimina i conflitti ma è troppo costosa da costruire per cache grandi
- La **Set Associative** è la scelta standard oggi: offre un ottimo equilibrio tra flessibilità (riducendo i miss) e velocità/costo