# Cos'è?
È una filosofia di progettazione che punta a ridurre il numero di linee di codice necessarie per scrivere un programma, fornendo al processore  istruzioni molto potenti e capaci

---
# Cosa fa?
Il CISC mira a facilitare il compito del programmatore/compilatore offrendo istruzioni "ad alto livello" direttamente nell'hardware

Invece di dover combinare 3 o 4 istruzione semplici per eseguire un'operazione completa il CISC offre una singola istruzione complessa che svolte tutto il lavoro in una volta sola

---
# Come lo fa?
- **Hardware Complesso**
  La struttura interna del processore è "circuitamente complicata"
  La CPU deve avere circuiti sofisticati per decodificare ed eseguire comandi che possono essere molto diversi tra loro
- **Istruzioni Potenti**
  Una singola istruzione può eseguire operazioni che richiedono più passi interni

---
# Pro e Contro
## Vantaggi
- **Codice Compatto**
  Poichè ogni istruzione fa molto lavoro, "occorrono meno istruzioni" per scrivere un programma, ciò risulta in un eseguibile di minori dimensioni
- **Meno traffico in memoria**
  Dovendo leggere meno istruzioni, si riducono gli accessi alla memoria per il prelievo del codice
## Svantaggi
- **Lentezza della singola istruzione**
  L'esecuzione di una singola istruzione è "più lenta" rispetto a [[RISC - Reduced Instruction Set Computing | RISC]], perchè deve attraversare circuiti più complessi e richiede più tempo
- **Complessità Hardware**
  Progettare e costruire questi chip è più difficile a causa della struttura complicata

---
# [[RISC - Reduced Instruction Set Computing | Confronto con RISC]]
| Aspetto   |             CISC              |               RISC               |
| :-------- | :---------------------------: | :------------------------------: |
| Filosofia | Fai tanto con un solo comando | Fai una cosa sola ma velocissima |
| Struttura |   Circuitamente complicata    |      Circuitamente semplice      |
| Programmi |   Richiede meno istruzioni    |    Richiedono più istruzioni     |
| Velocità  | Singola istruzione più lenta  | Singola istruzione molto veloce  |
