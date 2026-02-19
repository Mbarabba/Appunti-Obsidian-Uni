# 🧮 Formulario Avanzato: Scheduling dei Processi

## 📋 1. Legenda dei Simboli e Terminologia
| Simbolo | Nome | Significato | Formula |
| :--- | :--- | :--- | :--- |
| **$n$** | Numero processi | Totale dei processi da analizzare | - |
| **$AT$** | Arrival Time | Istante di arrivo nella Ready Queue | Dato dal problema |
| **$BT$** | Burst Time | Durata dell'esecuzione richiesta sulla CPU | Dato dal problema |
| **$CT$** | Completion Time | Istante in cui il processo termina l'esecuzione | Dal diagramma di Gantt |
| **$TAT$** | Turnaround Time | Tempo totale di permanenza nel sistema | $TAT = CT - AT$ |
| **$WT$** | Waiting Time | Tempo totale di attesa nella Ready Queue | $WT = TAT - BT$ |
| **$TAT_{avg}$** | Media Turnaround | Media del tempo di completamento/permanenza | $\frac{\sum TAT}{n}$ |
| **$WT_{avg}$** | Media Attesa | Media del tempo di attesa | $\frac{\sum WT}{n}$ |

---

## 2. FCFS (First-Come, First-Served)
**Tipo:** Non-preemptive. Serve i processi nell'ordine esatto di arrivo.



### 📝 Formule Medie
- **Tempo di Attesa Medio:** $WT_{avg} = \frac{\sum (TAT_i - BT_i)}{n}$
- **Tempo di Completamento Medio:** $TAT_{avg} = \frac{\sum (CT_i - AT_i)}{n}$

### 💡 Esempio di Calcolo
**Dati:** $P_1(AT=0, BT=5)$, $P_2(AT=1, BT=3)$.
1. **Gantt:** $P_1$ esegue da 0 a 5. $P_2$ esegue da 5 a 8.
2. **CT:** $CT_1 = 5, CT_2 = 8$.
3. **TAT:** $TAT_1 = 5-0=5; TAT_2 = 8-1=7$.
   - **$TAT_{avg} = (5+7)/2 = 6.0$**
4. **WT:** $WT_1 = 5-5=0; WT_2 = 7-3=4$.
   - **$WT_{avg} = (0+4)/2 = 2.0$**

---

## 3. SJF (Shortest Job First)
**Tipo:** Non-preemptive. Tra i processi pronti, sceglie quello con $BT$ minore.



### 📝 Formule Medie
- **Tempo di Attesa Medio:** $WT_{avg} = \frac{\sum WT_i}{n}$
- **Tempo di Completamento Medio:** $TAT_{avg} = \frac{\sum TAT_i}{n}$

### 💡 Esempio di Calcolo
**Dati (tutti a $AT=0$):** $P_1(BT=6), P_2(BT=2), P_3(BT=4)$.
1. **Ordine:** $P_2(2) \to P_3(4) \to P_1(6)$.
2. **CT:** $CT_2 = 2, CT_3 = 6, CT_1 = 12$.
3. **TAT:** $TAT_1=12, TAT_2=2, TAT_3=6$.
   - **$TAT_{avg} = (12+2+6)/3 = 6.66$**
4. **WT:** $WT_1=6, WT_2=0, WT_3=2$.
   - **$WT_{avg} = (6+0+2)/3 = 2.66$**

---

## 4. SRTF (Shortest Remaining Time First)
**Tipo:** Preemptive. Versione "con diritto di prelazione" di SJF. Se arriva un processo con $BT$ < tempo rimanente del corrente, avviene lo scambio.



### 📝 Formule Medie
- **Tempo di Attesa Medio:** $WT_{avg} = \frac{\sum (CT_i - AT_i - BT_i)}{n}$
- **Tempo di Completamento Medio:** $TAT_{avg} = \frac{\sum (CT_i - AT_i)}{n}$

### 💡 Esempio di Calcolo
**Dati:** $P_1(AT=0, BT=8), P_2(AT=1, BT=2)$.
1. **Gantt:** $P_1$ (0-1), arriva $P_2$ (più corto di 7), $P_2$ (1-3), $P_1$ (3-10).
2. **CT:** $CT_1 = 10, CT_2 = 3$.
3. **TAT:** $TAT_1=10, TAT_2=2$.
   - **$TAT_{avg} = (10+2)/2 = 6.0$**
4. **WT:** $WT_1=10-8=2, WT_2=2-2=0$.
   - **$WT_{avg} = (2+0)/2 = 1.0$**

---

## 5. RR (Round Robin)
**Tipo:** Preemptive con quanto di tempo $q$. Ogni processo usa la CPU per max $q$ secondi, poi torna in fondo alla coda.



### 📝 Formule Medie
- **Tempo di Attesa Medio:** $WT_{avg} = \frac{\sum (CT_i - AT_i - BT_i)}{n}$
- **Tempo di Completamento Medio:** $TAT_{avg} = \frac{\sum (CT_i - AT_i)}{n}$

### 💡 Esempio di Calcolo ($q=4$)
**Dati:** $P_1(AT=0, BT=10), P_2(AT=0, BT=3)$.
1. **Gantt:** $P_1$ (0-4), $P_2$ (4-7 - *Termina*), $P_1$ (7-11), $P_1$ (11-13 - *Termina*).
2. **CT:** $CT_1 = 13, CT_2 = 7$.
3. **TAT:** $TAT_1=13, TAT_2=7$.
   - **$TAT_{avg} = (13+7)/2 = 10.0$**
4. **WT:** $WT_1=13-10=3, WT_2=7-3=4$.
   - **$WT_{avg} = (3+4)/2 = 3.5$**