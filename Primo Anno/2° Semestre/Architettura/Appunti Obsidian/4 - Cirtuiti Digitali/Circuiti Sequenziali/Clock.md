# Cos'è?
È un segnale digitale fondamentale per i [[Introduzione ai circuiti sequenziali | circuiti sequenziali sincroni]]

Viene definito come un'onda quadra caratterizzata da un periodo predeterminato e costante

È l'elemento che trasforma un circuito sequenziale generico in un circuito sincrono

---
# Cosa fa?
Il compito del Clock è sincronizzare tutte le operazioni del circuito, determinare il ritmo dei calcoli e delle operazioni di memorizzazione

Serve per : 
- **Abilitare la scrittura** : Dice agli elementi di memoria quando è permesso salvare un nuovo dato
- **Garantire la stabilità** : Assicura che i dati vengano letti o scritti solo quando gli output dei circuiti combinatori si sono stabilizzati, evitando errori dovuti a ritardi di propagazione
---
# Da cosa è formato?
Il segnale di Clock è caratterizzato da grandezze specifiche visualizzabili nel suo grafico a onda quadra : 
- $\text{Periodo }(T)$ : La durata di un ciclo completo (Tempo tra due ripetizioni dello stesso evento)
- $\text{Frequenza }(F)$ : Il numero di ciclo al secondo, misurata in Hertz $(F=1 / T)$
- Fronti (Edges) : I momenti di transizione del segnale 
	- Rising edge (Fronte di salita) : Il passaggio da 0 a 1
	- Falling edge (Fronte di discesa) : Il passaggio da 1 a 0
![[Pasted image 20260129123505.png]]
