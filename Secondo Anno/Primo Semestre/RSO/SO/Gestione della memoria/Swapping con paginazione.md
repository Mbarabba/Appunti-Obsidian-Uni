# Cos'è?
È **l'evoluzione dello swapping** che integra il concetto di [[Paginazione]].

Invece di considerare un processo come un singolo blocco indivisibile, lo si considera come un <u>insieme di pagine</u>.

In questo modello, il <u>sistema non è costretto a spostare l'intero processo tra RAM e disco</u>

---
# Cosa fa?
Permette di liberare memoria fisica spostando su disco solo le <u>parti di un processo che non vengono utilizzate attivamente</u>, lasciando in RAM  **quelle necessarie** per l'esecuzione immediata.

---
# Come lo fa?
Il sistema operativo utilizza un componente software chiamato **Pager**.
1. **Identificazione**
   Il pager controlla quali pagine in memoria devono essere swappate
2. **Swap out**
   Swappa le pagine selezionate sul disco
3. **Esecuzione**
   Il processo continua a girare finchè tocca le pagine rimaste in RAM
4. **Swap in (Su richiesta)**
   Se il processo ha bisogno della pagine inizialmente trasferite sul disco le reintegra nella memoria RAM

---
# Vantaggi e svantaggi
| Categoria          |                                                                  Vantaggi                                                                   |                                  Svantaggi                                   |
| :----------------- | :-----------------------------------------------------------------------------------------------------------------------------------------: | :--------------------------------------------------------------------------: |
| Prestazione        |                                                          **Trasferimento veloce**                                                           | **Overhead di gestione**<br><br>Bisogna tener traccia di ogni singola pagina |
| Efficienza memoria | **Granularità**<br><br>Si libera spazio chirurgicamente.<br>Possiamo togliere grandi quantità di memoria ad un processo senza interromperlo |                          **Frammentazione Interna**                          |
| Flessibilità       |                         **Avvio rapido**<br><br>Non serve caricare tutto il programma per iniziare a eseguirlo<br>                          |                           **Complessità hardware**                           |
   