# Cos'è?
È un evoluzione del [[S-R Latch]] progettata per risolvere i problemi di ambiguità e per introdurre la sincronizzazione

È un circuito di memoria elementare che elimina la configurazione proibita $(S=1,R=1)$ garantendo che gli ingressi di set e reset sian sempre opposti

---
# Da cosa è composto?
È costruito internamente utilizzando un S-R Latch standard, a cui viene aggiunta una logica di interfaccia in ingresso per gestire il [[Clock]] e il dato $D$

La struttura tipica prevede :
- **<u>L'ingresso $D$</u>** viene collegato direttamente al ramo $S$
-  **<u>L'ingresso $D$ invertito</u>** e collegato al ramo $R$, questo assicura che $S$ e $R$ non siano mai 1 contemporaneamente
-  **<u>Due [[Porta AND| porte AND]] (o [[Porta NAND| NAND]])</u>** agiscono da "cancelli" lasciano passare i segnali $S$ e $R$ verso il cuore del latch solo quando il Clock è a 1

![[Pasted image 20260129152503.png]]

---
# Cosa fa?
La sua funzione è memorizzare un bit di dato $(D)$ in modo sincronizzato con un segnale di controllo chiamato Clock $(C)$
- <u>**Quando il Clock è alto (1)**</u> il latch è "trasparente", l'uscita $Q$ segue esattamente l'ingresso $D$
  Se $D$ cambia, anche $Q$ cambia immediatamente
- <u>**Quando il Clock è basso (0)**</u> il latch p "opaco", ignora l'ingresso $D$ e mantiene memorizzato l'ultimo valore che aveva l'uscita $Q$ prima che il clock scendesse
---
# Come lo fa?
Il comportamento è dettato dal livello del Clock

| Clock |    Input (D)     | Output (Q) |                 Azione                  |
| :---: | :--------------: | :--------: | :-------------------------------------: |
|   0   | X<br>(Qualsiasi) | Invariato  | Memoria<br>Mantiene lo stato precedente |
|   1   |        0         |     0      |            Reset<br>Scrive 0            |
|   1   |        1         |     1      |            Set <br>Scrive 1             |


---
# [[S-R Latch | Confronto con S-R Latch]]
| **Caratteristica**   | **D Latch (Data/Delay)**                                                 | **S-R Latch (Set-Reset)**                                                        |
| -------------------- | ------------------------------------------------------------------------ | -------------------------------------------------------------------------------- |
| **Ingressi**         | Un ingresso Dati (**D**) e un ingresso **Clock** (C).                    | Due ingressi di controllo: **S** e **R**.                                        |
| **Sincronizzazione** | **Sincrono**: cambia stato solo quando il Clock è attivo (livello alto). | **Asincrono**: cambia stato istantaneamente appena cambiano gli ingressi.        |
| **Gestione Input**   | Semplificata: $D=1 \to$ Set, $D=0 \to$ Reset .                           | Manuale: Richiede di gestire due segnali distinti per Set e Reset.               |
| **Problema (1,1)**   | **Risolto**: È fisicamente impossibile avere Set e Reset attivi insieme. | **Presente**: La combinazione $S=1, R=1$ è proibita e causa instabilità.         |
| **Trasparenza**      | Attiva **solo** durante la fase alta del Clock (Level-triggered) .       | **Sempre** attivo: qualsiasi variazione su S o R si riflette subito sull'uscita. |
| **Struttura**        | Più complessa: Contiene un S-R Latch + logica di controllo (NOT e AND).  | Elementare: Costituito da 2 porte NOR (o NAND) incrociate.                       |