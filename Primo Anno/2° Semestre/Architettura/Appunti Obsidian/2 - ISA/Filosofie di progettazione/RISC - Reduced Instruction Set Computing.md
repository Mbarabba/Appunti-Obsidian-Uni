# Cos'è?
È una filosofia di progettazione dei processori che si basa sul <u>principio della semplicità</u>

L'idea è costruire un hardware che conosce **poche istruzioni** elementari, ma che sia in grado di <u>eseguirle in modo estremamente rapido ed efficiente</u>

---
# Cosa fa?
L'obbiettivo del RISC è massimizzare la **velocità di esecuzione** delle operazioni più frequenti

Invece di avere comandi complessi che fanno tante cose assieme, RISC <u>scompone tutto in operazioni atomiche basilari</u>

---
# Come lo fa?
- **Istruzioni semplici**
  Il processore supporta un numero limitato di istruzioni facili da decodificare
- **Struttura Hardware semplice**
  Il circuito del processore è meno complesso, il che permette di avere frequenze di clock più alte e consumi minori
- **Uniformità**
  Nel caso del MIPS, ad esempio, le istruzioni hanno tutte la stessa lunghezza *(32 bit)*, il che permette di avere frequenze di clock più alte e consumi minori
- **Esecuzione veloce**
  Ogni singola istruzione viene completata molto rapidamente

---
# Pro e Contro
## Pro
- **Velocità**
  La singola istruzione è rapidissima da eseguire
- **Efficienza Hardware**
  Il chip è più semplice da progettare e costruire, occupando meno spazio fisico
- **Pipeline**
  La regolarità delle istruzioni facilità l'esecuzione di più istruzioni in parallelo
## Svantaggi
- **Codice più lungo**
  Poichè ogni istruzione fa poco, servono più istruzioni per completare un compito complesso
- **Maggiore lavoro per il compilatore**
  Il software deve occuparsi di scomporre operazioni complesse in tante istruzioni semplici

---
# [[CISC - Complex Instruction Set Computing| Confronto  con CISC]]

| Caratteristica         |              RISC               |             CISC             |
| :--------------------- | :-----------------------------: | :--------------------------: |
| Complessità istruzioni |        Poche e semplici         |      Molte e complesse       |
| Hardware               |       Struttura semplice        |     Struttura complicata     |
| Velocità Esecuzione    | Istruzione singola molto veloce | Istruzione singola più lenta |
| Lunghezza Programma    |    Più istruzioni necessarie    |  Meno istruzioni necessarie  |