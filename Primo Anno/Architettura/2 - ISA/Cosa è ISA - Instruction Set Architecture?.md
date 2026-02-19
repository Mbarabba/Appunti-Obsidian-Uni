# Cosa è?
L'instruction Set Architecture *(ISA)* è l'interfaccia critica tra l'hardware e il software

Si può immaginare come "il vocabolario" di comandi che il processore è in grado di capire nativamente

---
# Cosa fa?
L'ISA definisce le capacità logiche del processore
- **Istruzioni disponibili**
  Quali operazioni può fare la CPU
- **Tipi di dati**
  Su quali di dati può lavorare
- **Registri**
  Quanti sono, come si chiamano e come si usano
- **Gestione della memoria**
  Come il processore accede ai dati salvati in RAM
- **Formato delle istruzioni**
  Come i comandi devono essere codificati in bit per essere eseguiti
---
# Come lo fa?
L'ISA realizza questo compito fornendo uno standard preciso che il processore esegue meccanicamente attraverso il ciclo **Fetch-Decode-Execute** *(Preleva-Codifica-Esegui)*
1. **Fetch (Prelievo)**
   Il processore legge l'istruzione dalla memoria
2. **Decode (Decodifica)**
   Utilizzando le regole dell'ISA, la Control Unit interpreta quei bit
3. **Execute (Esecuzione)**
   L'hardware esegue l'operazione richiesta e salva il risultato