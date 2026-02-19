# Architettura  generale e piani logici
Il router opera su 2 piani logici che lavorano a scale temporali differenti :
- **Piano di controllo (Control Plane)**
  È la "mente" del router, solitamente implementata in software.
  Determina il percorso che i pacchetti devono seguire dalla sorgente alla destinazione operando in un ordine di grandezza di <u>millisecondi</u>
- **Piano di dati (Data plane)**
  È il braccio operativo, implementato in hardware.
  Si occupa di spostare fisicamente i pacchetti dai link di ingresso a quelli di uscita operando in tempi di <u>nanosecondi</u>
---
# Componenti principali
- **Routing processor
	- Cosa fa? : Esegue i protocolli di routing e gestisce il software del piano di controllo
	- A cosa serve? : Calcola le tabelle di inoltro che vengono poi installate nelle porte di ingresso
- **Porte di ingresso**
  Svolgono 3 funzioni principali
	1. **Line Termination** : Ricezione fisica dei bit
	2. **Protocollo Link Layer** : Gestione della ricezione dei frame
	3. **Lookup e Forwarding** : Utilizzano la tabella di inoltro presente nella memoria dalla porta per determinare la porta di uscita corretta
- **Switching Fabric**
	- Cosa fa?  : Connette le porte di ingresso con quelle di uscita
	- A cosa serve? : Trasferisce i pacchetti all'interno del router.
	  La velocità di commutazione è un parametro critico, idealmente dovrebbe essere $N$ volte il bit rate dei link di ingresso per evitare code
- **Porte di uscita
	- Cosa fanno : Ricevono i pacchetti dalla switching fabric e li trasmettono sul link
	- Funzioni : Includono il buffering, la gestione dei protocolli link layer e la trasmissione fisica dei bit

---
# Gestione delle code

L'accodamento dei datagrammi avviene quando il tasso di arrivo dei pacchetti supera la capacità di elaborazione o di trasmissione del router.

## 1. Code nelle Porte di Input (Input Queuing)
* **Causa**: Si verifica se la *switching fabric* è più lenta rispetto alla velocità combinata delle porte di input.
* **Conseguenze**: Si possono verificare ritardi di accodamento e perdite di dati (loss) dovute all'overflow dei buffer di ingresso.
* **HOL (Head-of-the-Line) Blocking**: Un datagramma in testa alla coda impedisce agli altri pacchetti in coda di avanzare, anche se le loro porte di uscita sono libere.

## 2. Code nelle Porte di Output (Output Queuing)
* **Causa**: Il buffering avviene quando il tasso di arrivo dalla *switching fabric* supera la velocità della linea di uscita $R$.
* **Conseguenze**: Si verificano ritardi e perdite di pacchetti in caso di overflow del buffer di uscita.
* **Politiche di gestione**:
	* **Drop Policy**: Determina quali datagrammi scartare se i buffer sono quasi pieni.
	* **Scheduling Discipline**: Sceglie tra i datagrammi in coda quale trasmettere (es. *Priority Scheduling* per dare migliori prestazioni a traffico specifico).

## 3. Parametri Critici
* **Switching Rate**: Velocità alla quale i pacchetti vengono trasferiti dagli ingressi alle uscite; idealmente dovrebbe essere $N \times R$ per minimizzare le code.
* **Buffer Overflow**: Causa principale della perdita dei datagrammi (discard) sia in ingresso che in uscita.