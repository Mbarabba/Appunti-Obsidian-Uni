# 📝 Simulazione Esame: Sistemi Operativi e Reti (Full Combo - 2026)

> [!abstract] Struttura della Prova
> - **12 Quiz** (6 OS + 6 Reti) alternando teoria e pratica.
> - **2 Domande Aperte** (Sincronizzazione e Protocolli Applicativi).
> - **Soluzioni dettagliate** con calcoli passo-passo in fondo.

---

## 🖥️ PARTE 1: SISTEMI OPERATIVI (6 Quiz)

### Argomento 1: Scheduling Avanzato (SRTF)
**Q1 (Teoria):** Nello scheduling **SRTF** (Shortest Remaining Time First), cosa accade esattamente quando un nuovo processo arriva nella *Ready Queue* con un tempo di burst inferiore al tempo rimanente del processo in esecuzione?
- [ ] A) Il processo corrente termina il suo quanto di tempo prima di cedere la CPU.
- [ ] B) Il nuovo processo viene accodato e attende che il processo corrente termini spontaneamente.
- [x] C) Viene effettuata una **preemption**: il processo corrente viene interrotto e riportato in stato *Ready*. ✅ 2026-01-17
- [ ] D) La CPU esegue entrambi i processi in modalità "time-sharing" contemporaneo.

**Q2 (Pratica):** Dati i seguenti processi: $P_1(BT=10, AT=0)$, $P_2(BT=3, AT=2)$, $P_3(BT=1, AT=5)$. Calcola il tempo di completamento (**CT**) del processo $P_1$ utilizzando l'algoritmo **SRTF**.
- [ ] A) 10 ms
- [ ] B) 14 ms
- [ ] C) 12 ms
- [ ] D) 13 ms

### Argomento 2: Gestione Memoria e Paginazione
**Q3 (Teoria):** Qual è lo scopo principale del bit di **validità/invalidità** in una entry della Tabella delle Pagine?
- [ ] A) Indicare se la pagina è protetta da scrittura.
- [ ] B) Segnalare se la pagina corrispondente risiede attualmente nella RAM fisica o nell'area di swap.
- [ ] C) Determinare se la pagina appartiene al segmento di codice o ai dati.
- [ ] D) Contare quante volte la pagina è stata acceduta dalla CPU.

**Q4 (Pratica):** Un sistema utilizza indirizzi a $40$ bit, pagine da $16$ KB ($2^{14}$ byte) e dispone di $32$ GB ($2^{35}$ byte) di RAM. Calcola il numero di entry di una **Tabella delle Pagine Invertita**.
- [ ] A) $2^{26}$ entry
- [ ] B) $2^{21}$ entry
- [ ] C) $2^{14}$ entry
- [ ] D) $2^{35}$ entry

### Argomento 3: Scheduling e Code (Round Robin)
**Q5 (Teoria):** In un sistema **Round Robin**, se il quanto di tempo $q$ tende all'infinito ($\infty$), a quale altro algoritmo di scheduling tende ad assomigliare il sistema?
- [ ] A) Shortest Job First (SJF).
- [ ] B) Priority Scheduling.
- [ ] C) First-Come, First-Served (FCFS).
- [ ] D) Multilevel Feedback Queue.

**Q6 (Pratica):** Tre processi $P_1(15), P_2(5), P_3(7)$ arrivano a $t=0$. Usando **Round Robin** con quanto $q=5$, qual è il tempo di attesa (**WT**) del processo $P_3$?
- [ ] A) 10 ms
- [ ] B) 15 ms
- [ ] C) 12 ms
- [ ] D) 22 ms

---

## 🌐 PARTE 2: RETI DI CALCOLATORI (6 Quiz)

### Argomento 4: Ethernet e Collisioni
**Q7 (Teoria):** Perché nel protocollo **CSMA/CD** le stazioni devono continuare a monitorare il canale mentre trasmettono (collision detection)?
- [ ] A) Per misurare il tempo di propagazione verso la destinazione.
- [ ] B) Per interrompere immediatamente la trasmissione in caso di collisione, risparmiando banda.
- [ ] C) Per garantire che il preambolo sia stato ricevuto correttamente.
- [ ] D) Per aggiornare la propria Switch Table locale.

**Q8 (Pratica):** Una stazione $S_1$ inizia il carrier sense per trasmettere su un link a $10$ Mbps. Un ripetitore $R$ a metà strada introduce un ritardo di $50$ bit. Una stazione $S_2$ trasmette a $t=0$. Sapendo che $S_2$ dista da $R$ $200$ metri ($V = 200$ m/$\mu$s), qual è la distanza $X$ minima tra $S_1$ e $R$ affinché si verifichi una collisione nonostante l'**Interframe Gap** ($96$ bit)?
- [ ] A) $X > 360$ m
- [ ] B) $X > 720$ m
- [ ] C) $X > 150$ m
- [ ] D) $X > 480$ m

### Argomento 5: IP, Subnetting e Pacchettizzazione
**Q9 (Teoria):** Cosa accade a un frammento IP se uno dei router lungo il percorso ha una **MTU** inferiore alla dimensione del frammento stesso?
- [ ] A) Il router scarta il frammento e invia un errore ICMP.
- [ ] B) Il router frammenta ulteriormente il pacchetto (se il flag DF è 0).
- [ ] C) Il router ignora la propria MTU per garantire la consegna.
- [ ] D) Il pacchetto viene rimandato alla sorgente per essere ridimensionato.

**Q10 (Pratica):** Devi inviare un file da $4$ MB ($4.000.000$ byte) su una rete con **MTU** di $1400$ byte. Sapendo che gli header (IP+TCP) pesano $40$ byte, quanti datagrammi sono necessari?
- [ ] A) 2857
- [ ] B) 2942
- [ ] C) 2941
- [ ] D) 3000

### Argomento 6: Routing e Switching
**Q11 (Teoria):** Nell'algoritmo **Distance-Vector**, cos'è il fenomeno del "Count-to-Infinity" e come viene parzialmente risolto?
- [ ] A) È un loop di routing risolto tramite lo "Split Horizon".
- [ ] B) È un errore di Dijkstra risolto aumentando il costo dei link.
- [ ] C) È la saturazione della tabella MAC risolta con il self-learning.
- [ ] D) È il ritardo dei ripetitori Ethernet risolto con il segnale di Jam.

**Q12 (Pratica):** Un router riceve un pacchetto per `10.50.1.20`. La tabella contiene:
1. `10.50.1.0/24` (Next-hop A)
2. `10.50.0.0/16` (Next-hop B)
3. `10.0.0.0/8` (Next-hop C)
**Domanda:** Quale Next-hop viene scelto?
- [ ] A) Next-hop A
- [ ] B) Next-hop B
- [ ] C) Next-hop C
- [ ] D) Nessuno, viene usato il default gateway.

---

## ✍️ PARTE 3: DOMANDE APERTE

### Domanda Aperta 1: Sistemi Operativi (Sincronizzazione)
> Spiega il concetto di **Semaforo** (di Dijkstra). Descrivi la differenza tra semafori binari (mutex) e semafori a conteggio, illustrando come le operazioni `wait()` (P) e `signal()` (V) gestiscono l'accesso alla sezione critica.

### Domanda Aperta 2: Reti (Protocolli Applicativi)
> Analizza il protocollo **HTTP**. Descrivi la differenza tra connessioni **persistenti** e **non-persistenti**, spiegando l'impatto del tempo di andata e ritorno (RTT) sul ritardo totale di caricamento di una pagina web con 10 oggetti grafici.

---

# ✅ SOLUZIONI COMMENTATE

### 🖥️ Sistemi Operativi
1. **C (Preemption):** SRTF interrompe subito se arriva un job più corto.
2. **B (14 ms):** - $t=0: P_1$ esegue. 
   - $t=2: P_2$ arriva ($BT=3$), $P_1$ ha $8$ rimasti. $P_2$ prende la CPU. 
   - $t=5: P_2$ finisce ($CT=5$). Arriva $P_3$ ($BT=1$), esegue.
   - $t=6: P_3$ finisce ($CT=6$). $P_1$ riprende per gli 8 restanti.
   - **CT $P_1$ = $6 + 8 = 14$**.
3. **B:** Segnala la presenza in RAM fisica.
4. **B ($2^{21}$):** $N = \text{RAM} / \text{Pagina} = 2^{35} / 2^{14} = 2^{21}$.
5. **C (FCFS):** Senza interruzioni temporali, RR diventa un "chi prima arriva esegue tutto".
6. **B (15 ms):** Gantt: $[P_1: 0-5], [P_2: 5-10], [P_3: 10-15], [P_1: 15-20] \dots$
   - $P_3$ inizia a $10$, attende altri $5$ dopo il primo quanto di $P_1$. **WT $P_3 = 15 - 0 - 7 = 8$? No, WT = CT - AT - BT.** $P_3$ finisce a $22$. $WT = 22 - 0 - 7 = 15$.

### 🌐 Reti
7. **B:** Risparmio banda interrompendo frame inutili.
8. **A ($X > 360$ m):**
   - Ritardo $S_2 \to R$: $200\text{ m} / 200\text{ m/}\mu\text{s} = 1\mu\text{s} = 10\text{ bit}$.
   - Ritardo Totale segnale $S_2$: $10\text{ (S2-R)} + 50\text{ (R)} + \text{Ritardo}_{S1-R} > 96$.
   - $60 + 0,1 \cdot X > 96 \to 0,1 \cdot X > 36 \to \mathbf{X > 360}$.
9. **B:** Frammentazione ulteriore (se permesso).
10. **B (2942):** Payload = $1400 - 40 = 1360$. $4.000.000 / 1360 = 2941,17 \to \mathbf{2942}$.
11. **A:** Loop infiniti causati da aggiornamenti lenti.
12. **A:** Longest Prefix Match ($/24$ è più specifico di $/16$).