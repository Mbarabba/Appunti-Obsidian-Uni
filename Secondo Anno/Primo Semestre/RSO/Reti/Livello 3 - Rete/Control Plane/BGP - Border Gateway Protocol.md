# Cos'è?
Il BGP è il protocollo di routing Inter-AS *(Inter-Autonomous System)* standard utilizzato su internet.

Un **sistema autonomo (AS)** è una rete o un gruppo di reti sotto il controllo di un'unica entità

Mentre protocolli come OSPF lavorano "dentro" una rete, il BGP lavora "tra le reti"

---

# Cosa fa?
Il compito principale del BGP è permettere a un AS di :
1. **Ottenere informazioni sulla raggiungibilità dei prefissi** da parte degli AS vicini
2. **Propagare queste informazioni** a tutti i router interni all'AS
3. **Determinare le rotte "migliori"** verso i buffer basandosi su **politiche commerciali** e non solo sulla distanza tecnica

---

# Come lo fa?
Il BGP non usa algoritmi [[Algoritmo Link State | Link State]] o [[Algoritmo Distance Vector | Distance Vector]], ma un procollo a **vettore di cammino *(Path Vector)***
- **Sessioni TCP**
  Due router BGP si scambiano informazioni tramite una connessione TCP, che garantisce una consegna affidabile
- **eBGP vs iBGP**
	- eBGP (External BGP) : serve per scambiare rotte tra due AS diversi
	- iBGP (Internal BGP) : serve per trasmettere le rotte apprese dall'esterno a tutti i router dentro lo stesso AS
- **Attributi e Rotte**
  Quando un router annuncia un prefisso include degli attributi, i più importanti sono :
	- AS-PATH : La lista degli AS che il messaggio ha attraversato, serve anche a prevenire i cicli
	- NEXT-HOP : L'indirizzo IP del router specifico che inizia il cammino verso quel prefisso
- **Routing basato su Policy**
  A differenza di altri protocolli, il BGP permette di scegliere una rotta meno efficiente per motivi economici
---
# Vantaggi e Svantaggi

|                                                    Vantaggi                                                    |                                                       Svantaggi                                                        |
| :------------------------------------------------------------------------------------------------------------: | :--------------------------------------------------------------------------------------------------------------------: |
|               **Scalabilità enorme**<br>Gestisce centinaia di migliaia di rotte su scala globale               | **Lentezza *(convergenza)***<br>Quando un link cade, il BGP può impiegare minuti per aggiornare l'intera rete modnaile |
| **Controllo *(policy)***<br>Permette agli amministratori di decidere esattamente dove deve passare il traffico |                **Complessità**<br>La configurazione è estremamente difficile e soggetta a errori umani                 |
|                     **Stabilità**<br>Isola i problemi interni di un AS dal resto del mondo                     |                                     **Policy**<br>Basate su attributi e preferenze                                     |

---
# [[OSPF - Open Shortest Path First | Confronto con OSPF]]
La differenza fondamentale è che [[OSPF - Open Shortest Path First | OSPF]] è un protocollo  <u>Intra-AS</u>, mentre BGP è <u>Inter-AS</u>

| Caratteristica     |                       OSPF                        |                              BGP                               |
| :----------------- | :-----------------------------------------------: | :------------------------------------------------------------: |
| Ambito             |              Interno a un singolo AS              |                         Tra diversi AS                         |
| Obiettivo          |            Massimizzare le performance            |              Gestire accordi economici e politici              |
| Algoritmo          |             [[Algoritmo Link State]]              |                          Path Vector                           |
| Conoscenza         | Ogni router conosce l'intera topologia della rete | I router conoscono solo il cammino di AS verso la destinazione |
| Criterio di scelta |          Cammino minimo (costo / banda)           |                             Policy                             |

## In sintesi
- **OSPF** è come il navigatore satellitare che ti dice qual è la strada più veloce per girare dentro la tua città
- **BGP** è come il sistema doganale che decide attraverso quali paesi devi passare per andare dall'Italia alla Cina, basandosi su visti e accordi internazionali.