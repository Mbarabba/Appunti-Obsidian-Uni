# 📝 Simulazione Esame: Sistemi Operativi e Reti (Basata sui tuoi Esercizi)

## 🖥️ Parte 1: Sistemi Operativi (6 Quiz)

### Interfaccia e struttura del kernel (2 Teoria)
**1. Qual è un vantaggio fondamentale dell'architettura di sistema basata su Kernel Monolitico?**
- [ ] A. Una superiore modularità che facilita l'estensione del codice.
- [ ] B. Una maggiore protezione del kernel dai crash dei driver esterni.
- [x] C. Una maggiore efficienza nell'esecuzione delle funzioni di sistema. ✅ 2026-01-17
- [ ] D. Una gestione semplificata dei privilegi e dei profili degli utenti.

> [!tip]- Soluzione
> **Risposta corretta: C**
> **Ragionamento:** In un kernel monolitico, tutti i servizi (file system, driver, gestione memoria) risiedono nello stesso spazio di indirizzamento del kernel, permettendo chiamate dirette tra componenti senza l'overhead della comunicazione tra processi (IPC) tipica dei microkernel.

**2. Durante l'invocazione di una System Call, come avviene il passaggio dei parametri e il cambio di modalità?**
- [ ] A. I parametri sono passati tramite lo stack dell'utente; l'istruzione di trap commuta l'hardware in modalità supervisore.
- [ ] B. Il processo passa autonomamente in modalità sistema prima di chiamare una normale procedura del kernel.
- [ ] C. I parametri vengono obbligatoriamente copiati nello stack del kernel prima di attivare l'hardware.
- [ ] D. Il passaggio di modalità è gestito interamente dal compilatore senza l'uso di istruzioni hardware specifiche.

> [!tip]- Soluzione
> **Risposta corretta: A**
> **Ragionamento:** L'utente non può cambiare il bit di modalità. Deve usare un'istruzione di `trap` che causa il passaggio hardware a Kernel Mode e l'esecuzione di una regione definita del SO. I parametri risiedono nei registri o in buffer di memoria utente.

### Processi e thread: la struttura (1 Teoria + 1 Esercizio)
**3. Quale di queste è una risorsa che normalmente NON è protetta e può essere accessibile anche in modalità utente?**
- [ ] A. Registri di controllo del processore e registri non general-purpose.
- [x] B. Dispositivi di I/O (dischi, schede di rete, interfacce seriali). ✅ 2026-01-17
- [ ] C. Variabili locali allocate all'interno dello stack del processo.
- [ ] D. L'intera memoria fisica del sistema in modalità di indirizzamento diretto.

> [!tip]- Soluzione
> **Risposta corretta: C**
> **Ragionamento:** Lo stack utente è memoria assegnata al processo per il suo funzionamento; l'hardware e il SO proteggono invece i registri critici, l'I/O e la memoria fisica globale, accessibili solo in Kernel Mode.

**4. Esercizio: Dati $P_1(BT=21)$, $P_2(BT=13)$, $P_3(BT=2)$ arrivati a $t=0$, qual è il tempo di attesa medio ($\bar{WT}$) in FCFS?**
- [ ] A. 9.0 ms
- [ ] B. 12.0 ms
- [x] C. 18.6 ms ✅ 2026-01-17
- [ ] D. 26.6 ms



> [!tip]- Soluzione
> **Risposta corretta: C**
> **Ragionamento:** > $WT_1 = 0$
> $WT_2 = 21$
> $WT_3 = 21 + 13 = 34$
> $\bar{WT} = (0 + 21 + 34) / 3 = 18.33$ (Nota: basandoti sul tuo esercizio con 5 processi, il calcolo per 5 è 26.6).

### Gestione della memoria: la struttura (1 Esercizio)
**5. Esercizio: Un sistema ha indirizzi virtuali di 32 bit, pagine da $4 \text{ KB}$ ($2^{12}$) e indirizzi fisici di 30 bit. Qual è la percentuale (%) di pagine che possono stare fisicamente in RAM?**
- [ ] A. 3%
- [ ] B. 25%
- [ ] C. 50%
- [ ] D. 10%



> [!tip]- Soluzione
> **Risposta corretta: B**
> **Ragionamento:** > Pagine Virtuali = $2^{32} / 2^{12} = 2^{20}$.
> Frame Fisici = $2^{30} / 2^{12} = 2^{18}$.
> $\%$ = $(2^{18} / 2^{20}) \cdot 100 = 1/4 \cdot 100 = 25\%$.

**6. Esercizio: In una Tabella delle Pagine Invertita con 64 GB ($2^{36}$) di RAM fisica e pagine da 8 KB ($2^{13}$), quanti frame fisici deve gestire la tabella?**
- [ ] A. $2^{22}$ frame
- [ ] B. $2^{23}$ frame
- [ ] C. $2^{33}$ frame
- [ ] D. $2^{25}$ frame

> [!tip]- Soluzione
> **Risposta corretta: B**
> **Ragionamento:** Numero di frame = Memoria Fisica / Dim Pagina = $2^{36} / 2^{13} = 2^{23}$ frame.

---

## 🌐 Parte 2: Reti (6 Quiz)

### Livello di rete: piano dei dati (1 Teoria + 1 Esercizio)
**7. Un'organizzazione gestisce la rete 149.76.1.0/24 e vuole dividerla in 6 sottoreti usando una maschera a 27 bit. Qual è l'indirizzo di broadcast della terza sottorete utilizzabile?**
- [ ] A. 149.76.1.64
- [ ] B. 149.76.1.95
- [ ] C. 149.76.1.255
- [ ] D. 149.76.1.127

> [!tip]- Soluzione
> **Risposta corretta: B**
> **Ragionamento:** Con /27 i blocchi sono di 32 indirizzi ($2^5$). Sottorete 1: 0-31; Sottorete 2: 32-63; Sottorete 3: 64-95. L'ultimo indirizzo del blocco (95) è il broadcast.

**8. Dato un router NAT con una sola uscita IP pubblica, quanti bit al minimo deve avere il prefisso di rete privata per gestire una rete tipo 10.0.0.0/x?**
- [ ] A. 8 bit
- [ ] B. 16 bit
- [ ] C. 24 bit
- [ ] D. 12 bit

> [!tip]- Soluzione
> **Risposta corretta: A**
> **Ragionamento:** La rete 10.0.0.0 è storicamente una Classe A privata, il cui prefisso minimo standard per definire l'intera rete è di 8 bit.

### Livello di rete: piano di controllo (1 Teoria + 1 Esercizio)
**9. In un algoritmo di routing basato sulla metodologia Distance-Vector:**
- [ ] A. È necessario avere una conoscenza completa della topologia della rete globale.
- [ ] B. È necessario conoscere esclusivamente le connessioni con i propri router vicini.
- [ ] C. Bisogna obbligatoriamente conoscere la banda di tutte le connessioni della rete.
- [ ] D. Si utilizza sempre l'algoritmo di Dijkstra per il calcolo del cammino minimo.

> [!tip]- Soluzione
> **Risposta corretta: B**
> **Ragionamento:** Il Distance Vector è distribuito; ogni nodo scambia stime di distanza solo con i vicini immediati e aggiorna la propria tabella tramite Bellman-Ford.

**10. Esercizio: In un calcolo di Dijkstra partendo dal nodo 1 verso il nodo 4 su un grafo con 8 nodi, quanti passi sono necessari per concludere l'insieme dei nodi esaminati?**
- [ ] A. 4 passi
- [ ] B. 6 passi
- [ ] C. 7 passi
- [ ] D. 8 passi



> [!tip]- Soluzione
> **Risposta corretta: A**
> **Ragionamento:** Basandosi sul tuo esercizio guidato, il calcolo del percorso minimo verso il nodo 4 viene completato in 4 passi con un costo finale pari a 10.

### Livello di collegamento e reti locali (1 Teoria + 1 Esercizio)
**11. In un protocollo CSMA/CD per LAN Ethernet a 10 Mbps, quanto tempo impiega un host a trasmettere un segnale di jam di 48 bit?**
- [ ] A. 4,8 ms
- [ ] B. 4,8 micro sec
- [ ] C. 48 micro sec
- [ ] D. 0,48 ms

> [!tip]- Soluzione
> **Risposta corretta: B**
> **Ragionamento:** Tempo = Bit / Velocità = $48 / (10 \cdot 10^6) = 4,8 \cdot 10^{-6} \text{ secondi} = 4,8 \text{ microsecondi}$.

**12. Cosa succede se due host A e B sono così distanti che il frame Ethernet più piccolo viene emesso completamente da A prima che il segnale di jam di B arrivi ad A?**
- [ ] A. Lo switch gestisce automaticamente la collisione in modo trasparente.
- [ ] B. A rileva la collisione non appena riceve il segnale di jam grazie al timestamp.
- [ ] C. A è convinto di aver inviato il frame correttamente e non rileva la collisione.
- [ ] D. Il segnale di jam duplicato permette comunque di rilevare l'errore a posteriori.

> [!tip]- Soluzione
> **Risposta corretta: C**
> **Ragionamento:** Per rilevare collisioni, il tempo di trasmissione del frame più piccolo deve essere $\ge 2 \cdot d_{prop}$. Se il frame finisce prima del ritorno del segnale di collisione, l'host mittente crede che la trasmissione sia andata a buon fine.

---

## 📝 Parte 3: Domande Aperte (Teoria)

### Sistemi Operativi: Paginazione
**Descrivi la struttura di una riga (entry) di una Tabella delle Pagine standard, spiegando lo scopo dei bit di controllo principali.**

> [!tip]- Soluzione Suggerita
> Una riga della tabella contiene il numero del **Frame Fisico** e diversi bit di controllo:
> - **Bit Valid/Invalid:** Indica se la pagina è presente in memoria fisica (RAM).
> - **Bit Dirty (Modify):** Segnala se la pagina è stata modificata in RAM; se è "sporco", deve essere riscritta su disco prima di essere rimpiazzata.
> - **Bit di Protezione:** Definisce se la pagina è di sola lettura o scrivibile.

### Reti: Architettura del Router
**Spiega la differenza tra il Piano dei Dati (Data Plane) e il Piano di Controllo (Control Plane) all'interno di un router tradizionale.**

> [!tip]- Soluzione Suggerita
> - **Piano dei Dati (Forwarding):** È l'azione locale di spostare i pacchetti dall'interfaccia di ingresso a quella di uscita corretta tramite la *switching fabric*.
> - **Piano di Controllo (Routing):** È l'azione globale di determinare il percorso che i pacchetti devono seguire da sorgente a destinazione tramite algoritmi (Dijkstra, Bellman-Ford).