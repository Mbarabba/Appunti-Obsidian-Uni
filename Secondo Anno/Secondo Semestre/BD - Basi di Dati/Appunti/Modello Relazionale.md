# Cos'è?
È un modello che permette di definire e organizzare i dati in insiemi di record a struttura fissa, basandosi sul concetto matematico formale di relazione

---
# Terminologia
## Struttura Base
- **Relazione**
  Una struttura che permette di organizzare i dati in insiemi di record a struttura fissa
  (È una tabella)
  ![[Pasted image 20260327174614.png]]
- **Attributo**
  Il nome associato a una colonna che ne descrivere il "ruolo" all'interno della relazione
  (È una Colonna)
  ![[Pasted image 20260327174634.png|0]]
- **Tupla**
  Formalmente è una funzione che associa a ciascun attributo un valore del corrispondente dominio
  (È una Riga)
- **Grado**
  Il numero delle componenti (ovvero il numero di attributi/colonne) di una relazione
- **Cardinalità**
  Il numero di n-uple (ovvero il numero di righe) presenti in una relazione
## Livelli di Astrazione
- **Schema**
  L'aspetto intensionale del database, sostanzialmente invariante nel tempo
  Consiste nelle "intestazioni" delle tabelle, ovvero il nome della relazione associato all'insieme dei suo attributi
  (Sarebbe la struttura generale di una lezione)
- **Istanza**
  L'aspetto estensionale del database, che può cambiare rapidamente
  Rappresenta i valori attuali, ovvero l'insieme effettivo delle tuple popolato all'interno delle tabelle in un dato momento
## Identificazione dei Dati (Chiavi)
- **Superchiave**
  Un insieme qualsiasi di attributi che identifica una riga in modo univoco
  Anche l'insieme di tutti gli attributi di una tabella, presi insieme, costituisce per definizione una superchiave
- **Chiave**
  È una superchiave minimale
  Questo significa che è un insieme di attributi strettamente necessario all'identificazione : se rimuovessimo anche un solo attributo da questo insieme, esso perderebbe la capacità di identificare le righe univocamente
- **Chiave Primaria**
  È semplicemente una delle chiavi minimali che il progettista scegli come identificatore principale e su cui viene imposta la regola di non ammettere mai valori nulli (NULL)
## Integrità e informazione Incompleta
- **Valore nullo (NULL)**
  Una speciale marcatura che denota l'assenza di un valore, impiegata quando un'informazione è sconosciuta, inesistente o senza informazione
  Non fa parte di nessun dominio
- **Vincoli di integrità**
  Predicati (funzioni booleane) che definiscono le regole per popolare le tabelle in modo corretto, associando ad ogni istanza un valore "vero" (ammissibile) o "falso" (inconsistente)
	- **Vincoli di dominio (o sui valori)**
	  Sono regole che si applicano a un singolo attributo per limitare i valori che può assumere
	  Impongono che i dati inseriti rispettino determinate condizioni logiche o aritmetiche
	  ```sql
	  (Voto >= 18) AND (Voto <= 30)
	  ```
	- **Vincolo di tupla**
	  Sono regole che valutano e confrontano i valori di più attributi all'interno della stessa riga 
	  Servono a evitare combinazioni di dati che non avrebbero senso logico
	  (Sono vincoli di dominio ma con più variabili coinvolte)
	  ```sql
	  (Voto = 30) OR (NOT (Lode = "e lode"))
	  ```