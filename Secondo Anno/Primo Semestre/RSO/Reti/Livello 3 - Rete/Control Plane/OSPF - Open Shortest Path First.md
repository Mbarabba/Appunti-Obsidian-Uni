# Cos'è?
È un protocollo di routing Intra-AS (Interior Gateway Protocol - IGP), ovvero viene usato per scambiare informazioni di instradamento tra router appartenenti alla stessa organizzazione o ISP

È un protocollo di tipo [[Algoritmo Link State | Link State]]

---
# Cosa fa?
- **Mappa la rete**
  Ogni router OSPF costruisce una mappa completa e identica dell'intera topologia dell'AS
- **Calcola le rotte ottimali**
  Determina l'albero dei cammini minimi verso tutte le sottoreti di destinazione
- **Gestisce l'affidabilità**
  Rileva rapidamente guasti ai link o ai router e ricalcola i percorsi in pochi secondi

## Caratteristiche avanzate
A differenza degli algoritmi teorici, OSPF include funzioni necessarie per il mondo reale : 
- **Sicurezza**
  Supporta l'autenticazione dei messaggi per evitare che router malevoli iniettino rotte false
- **ECMP (Equal-Cost Multi-Path)**
  Se esistono più percorsi con lo stesso costo minimo, OSPF può usarli tutti contemporaneamente per bilanciare il carico
- **Supporto IP**
  I messaggi OSPF vengono trasporti direttamente sopra **IP**

---
# Come lo fa?
Il funzionamento OSPF si basa su alcuni concetti chiave : 
1. **LSA (Link State Advertisement)**
   I router creano dei messaggi chiamati LSA che descrivono lo stato dei propri link e dei vicini.
   Questi messaggi vengono diffusi tramite flooding e tutti gli altri router
2. **Database Topologico**
   Ogni router riceve gli LSA da tutti gli altri e li memorizza in una LInk State Database identica per tutti i nodi
3. **Esecuzione di [[Algoritmo di Dijkstra | Dijkstra]]**
   Una volta ottenuta la mappa, ogni router esegue localmente l'algoritmo di Dijkstra per popolare la propria tabella di inoltro
4. **Supporto Gerarchico (Aree)**
   In reti molto grandi, OSPF permette di dividere l'AS in Aree, questo serve a limitare il traffico di flooding e la dimensione dei calcoli
	- Esiste sempre un Area 0 che connette tutte le altre aree
	- I router ai confini delle aree si chiamano Are Bouder Routers (ABR)

---
# Pregi e difetti
|**Categoria**|**Pregi (Vantaggi)**|**Difetti (Svantaggi)**|
|---|---|---|
|**Performance**|**Convergenza molto rapida**: reagisce quasi istantaneamente ai cambiamenti della topologia.|**Consumo di risorse**: richiede molta memoria per la LSDB e CPU per eseguire Dijkstra frequentemente.|
|**Scalabilità**|**Struttura gerarchica**: l'uso delle **Aree** permette di gestire reti molto grandi limitando il flooding.|**Complessità di design**: la progettazione delle aree (Area 0, ABR, ASBR) richiede competenze avanzate.|
|**Affidabilità**|**Assenza di loop**: la visione globale della topologia garantisce percorsi privi di cicli.|**Overhead di rete**: il meccanismo di flooding degli LSA può generare molto traffico di controllo in reti instabili.|
|**Funzionalità**|**ECMP (Equal-Cost Multi-Path)**: permette di bilanciare il carico su più percorsi con lo stesso costo.|**Protocollo pesante**: non adatto a router con capacità hardware molto limitate.|
|**Sicurezza**|**Autenticazione**: i messaggi possono essere autenticati per prevenire intrusioni o rotte false.|**Vulnerabilità globale**: se l'area backbone (Area 0) ha problemi, l'intero sistema di routing ne risente.|

---
# [[BGP - Border Gateway Protocol| Confronto con BGP]]
|**Caratteristica**|**OSPF (Open Shortest Path First)**|**BGP (Border Gateway Protocol)**|
|---|---|---|
|**Ambito d'uso**|**Intra-AS**: all'interno di un singolo Sistema Autonomo.|**Inter-AS**: tra diversi Sistemi Autonomi (collega gli AS tra loro).|
|**Tipo di Algoritmo**|**Link-State**: basato sulla conoscenza della topologia completa.|**Path Vector**: un'estensione del Distance Vector che include l'intero percorso.|
|**Criterio di Scelta**|**Performance**: cerca il percorso a costo minimo (spesso basato sulla banda).|**Policy**: le decisioni sono basate su accordi commerciali, politici e di sicurezza.|
|**Obiettivo Principale**|Massimizzare l'efficienza e la velocità interna alla rete.|Garantire la raggiungibilità globale e il controllo del traffico tra domini.|
|**Annunci (Advertisements)**|Diffonde lo stato dei singoli link (LSA) a tutti i router.|Annuncia prefissi IP di destinazione e i relativi attributi di percorso (AS-PATH).|
|**Conoscenza della Rete**|Ogni router ha la mappa completa dell'AS (o dell'area).|I router conoscono solo i percorsi verso i prefissi, non l'intera topologia interna degli altri AS.|
|**Scalabilità**|Gestita tramite divisione in **Aree**.|Altissima, deve gestire l'intera tabella di routing globale di Internet.|