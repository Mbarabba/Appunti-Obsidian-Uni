# Cos'è?
È il più semplice esempio di [[Introduzione ai circuiti sequenziali | circuito sequenziale asincrono]]

È un elemento di memoria elementare composto fisicamente da 2 [[Porta NOR | porte NOR concatenate]]


---
# Da cosa è composto?
Possiede:
- **Due ingressi** : $S\text{ (set)}$ e $R \text{ (Reset)}$
- **Due uscite** : $Q$ e $\overline{Q}$ (che deve essere sempre l'opposto di $Q$)

![[Pasted image 20260129125942.png]]

---
# Cosa fa?
La sua funzione principale è memorizzare un singolo bit di informazione

È in grado di matenere il suo stato (uscita $Q$) indefinitamente finchè non riceve un segnale specifico per cambiarlo (Set o Reset)

---
# Come lo fa?
Il funzionamento si basa sulla tabella di verità determinata dagli ingressi $S$ e $R$

| **S (Set)** | **R (Reset)** | **Qnext​ (Stato Successivo)** | **Q​next​**           | **Descrizione / Azione**                          |
| ----------- | ------------- | ----------------------------- | --------------------- | ------------------------------------------------- |
| **0**       | **0**         | **$Q_{prev}$**                | $\overline{Q}_{prev}$ | **MEMORIA (Hold):** Mantiene lo stato precedente. |
| **0**       | **1**         | **0**                         | **1**                 | **RESET:** Forza l'uscita $Q$ a 0.                |
| **1**       | **0**         | **1**                         | **0**                 | **SET:** Forza l'uscita $Q$ a 1.                  |
| **1**       | **1**         | **0**                         | **0**                 | **PROIBITO:** Stato instabile/non valido.         |

1. <u>**Stato di Memoria (S = 0, R = 0)**</u>
   Questa è la combinazione di riposo, quando entrambi gli ingressi sono a 0, il latch non modifica il suo stato
   Se l'uscita $Q$ era 1, rimane 1, se era 0, rimane 0
   
   È proprio qui che **avviene la "memorizzazione"** del bit
2.  <u>**Stato di Reset (S = 0, R = 1)**</u>
   Arrivando l'ingresso di Reset ($R=1$), si forza il latch a spegnersi,l'uscita $Q$ diventa 0 indipendentemente da cosa c'era prima
3. **<u>Stato di Set (S = 1, R = 0)</u>**
   Attivando l'ingresso di Set $(S=1)$, si forza il latch ad accendersi, l'uscita $Q$ diventa 1, è l'operazione di un "1" in memoria
4. **<u>Stato proibito (S = 1, R = 1)</u>**
	-  In un latch realizzato con porte NOR, se S e R sono entrambi 1, entrambe le uscite Q e $\overline{Q}$​ verrebbero forzate a 0. Questo viola la regola logica fondamentale per cui Q $\overline{Q}$ deve essere sempre l'opposto di Q.
	- Se da questo stato si passa improvvisamente allo stato di memoria (0,0), il circuito entra in una condizione di "corsa critica" (race condition) e l'uscita finale sarà casuale e imprevedibile (instabile)

---
# [[D Latch|Confronto con D Latch]]
|  Caratteristica  |                    S-R Latch                    |                                                       D Latch                                                       |
| :--------------: | :---------------------------------------------: | :-----------------------------------------------------------------------------------------------------------------: |
|     Ingressi     |      Du ingressi di controllo<br>$S$ e $R$      |                                Un ingresso dati ($D$) e un ingresso [[Clock]] ($C$)                                 |
| Sincronizzazione |                   È asincrono                   |                              È sincronizzato, cambia stato solo quando il clock è alto                              |
|  Gestione input  |  Richiede che $S$ e $R$ non siano mai entrambi  |    Risolve il problema alla radice<br><br>$D=1$ equivale a set $(S=1,R=0)$<br>$D=0$ equivale a reset $(S=0,R=1)$    |
|   Trasparenza    |                  Sempre attivo                  | È "trasparente" solo durante la fase alta del clock<br><br>Quando il clock è basso, è isolato e mantiene la memoria |
|  Problema (1,1)  | Può entrare in stato instabile se $S=1$ e $R=1$ |      Impossibile<br><br>Non può avere set e reset attivi contemporaneamente grazie alla sua struttura interna       |
