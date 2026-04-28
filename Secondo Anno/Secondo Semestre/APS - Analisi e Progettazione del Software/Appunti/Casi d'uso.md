# Cosa sono?
I casi d'uso sono storie scritte e testuali, ampiamente utilizzate nell'ingegneria del software per scoprire e registrare i requisiti

Un caso d'uso è definito come : 
- Un **dialogo tra un attore e un sistema** finalizzato a svolgere un determinato compito
- Una **collezione di scenari correlati** in cui si descrive un attore che usa un sistema per raggiungere un obiettivo specifico
- La rappresentazioni di **requisiti funzionali o comportamentali**, in quanto definiscono un contratto relativo al comportamento del sistema e indicano esplicitamente che cosa il sistema deve fare

---
# Terminologia
## Attore
È qualcosa o qualcuno dotato di comportamento

Può essere una persona fisica oppure un sistema informatico esterno, anche il sistema stesso che si sta analizzando può essere considerato un attore quando richiede servizi ad altri sistemi
## Scenario
Detto anche "istanza del caso d'uso", è una sequenza specifica di azioni e iterazioni tra il sistema e alcuni attori

Descrive una singola e particolare "storia" di utilizzo, che può essere di successo oppure di fallimento

---
# Come scrivere un caso d'uso
## Formato
I casi d'uso possono essere redatti utilizzando tre diversi livelli di formalità
- **Formato Breve**
  È un riepilogo conciso composto da un solo paragrafo, che descrive solitamente solo lo scenario principale di successo
- **Formato Informale**
  Consiste in più paragrafi scritti in modo discorsivo, che coprono sia lo scenario principale sia alcune varianti o scenari alternativi
- **Formato Dettagliato**
  È il formato più strutturato, in cui tutti i passi e le variazioni sono scritti minuziosamente
  Include :
	- **Nome del caso d'uso**
	  Deve iniziare con un verbo, eccezione è l'uso del prefisso "Gestisci" per raggruppare operazioni CRUD
	- **Portata a Livello**
	  Specifica il sistema in esame e il livello del caso d'uso
	- **Attori e Parti Interessate**
	  Indica l'attore primario e fai un elenco di chi ha interesse nel caso d'uso e cosa desidera
	- **Pre-condizioni e Garanzia di successo**
	  Cosa deve essere vero prima di iniziare e cosa deve essere garantito al completamente con successo
	- **Scenario Principale di Successo**
	  La sequenza incondizionata dei passi "ideali"
	- **Estensioni**
	  Tutti gli scenari alternativi, sia di successo che di fallimento
	- **Altre sezioni di supporto**
	  Requisiti speciali, varianti tecnologiche, frequenza di ripetizione e problemi aperti
## Stile di Scrittura
Indipendentemente dal formato scelto il testo deve seguire regole precise per essere efficace 
- **Scatola nera**
  Devi specificare che cosa deve fare il sistema per rispondere all'attore, senza decidere come lo farà
  Non devi mai descrivere il funzionamento interno o le tecnologie sottostanti
- **Essenziale**
  Concentrati sullo scopo dell'attore e ignora completamente i dettagli dell'interfaccia utente
  Evita lo "stile concreto", quindi non scrivere "l'utente inserisce la password nella finestra di dialogo X", ma scrivi in modo astratto "l'utente si identifica"
- **Altre sezioni di supporto**
  Requisiti speciali, varianti tecnologiche, frequenza di ripetizione e problemi aperti
---
# Modellazione UML
## Elementi base
- **Confini del sistema e Attori**
  Il sistema viene solitamente rappresentato da un riquadro che ne delimita i confini, all'interno del quale si trovano i casi d'uso mentre gli attori sono posti all'esterno
  
  Per gli attori che non sono persone fisiche ma sistemi informatici, si può utilizzare un rettangolo con lo stereotipo $\ll \text{actor} \gg$ per distinguerli visivamente
  ![[Pasted image 20260324154108.png|0]]
- **Associazioni**
  Rappresentano il canale di comunicazione tra un attore e un caso d'uso e sono modellate con una linea continua se la linea presenta una direzione (freccia), indica chi dà inizio all'interazione, se non c'è direzione, significa che entrambe le parti possono dare inizio all'interazione
  ![[Pasted image 20260324154355.png|0]]