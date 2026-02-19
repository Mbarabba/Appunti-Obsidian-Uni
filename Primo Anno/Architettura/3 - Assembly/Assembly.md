# Cos'è?
L'assembly è la rappresentazione simbolica del linguaggio macchina 

Mentre il linguaggio macchina è composta da sequenze di bit difficili da leggere,l'Assembly utilizza simboli per rappresentare le istruzioni

È un linguaggio di basso livello, il che significa che è strettamente legato all'architettura hardware specifica del processore su cui viene eseguito a differenza dei linguaggi ad alto livello che sono più astratti e portabili

---
# Cosa fa?
Il suo scopo principale è permettere al programmatore di controllare direttamente l'hardware del calcolatore "parlando" la stessa lingua, ma in modo leggibile

- **Controlla l'hardware**
  Permette il massimo sfruttamento delle potenzialità del processore sottostante
- **Ottimizza le prestazioni**
  Consente di scrivere programmi estremamente efficienti e compatti, ottimizzando l'uso delle risorse meglio di quanto potrebbe fare un compilatore automatico
- **Gestisce dettagli critici**
  Viene usato per compiti specifici come la programmazione di sistemi embedded, driver, o parti critiche di sistemi operativi
---
# Come lo fa?
L'assembly funziona grazie a un processo di traduzione svolto da un programma chiamato [[Assembler]]
1. **Uso di simboli e mnemonici**
  Invece di scrivere `0000...`, il programmatore scrive istruzioni come `add`,`lw`,`sub`
  L'assembly permette anche di usare nomi simbolici (etichette) per indicare variabili o l'indirizzo di memoria, invece di dover calcolare manualmente gli indirizzi numerici
2. **Direttive e Pseudo-istruzioni**
	- Usa direttive (comandi che iniziano con `.`, come `.data` o `.text`) che non sono istruzioni per la CPU, ma comandi per l'[[Assembler | assemblatore]] per dirgli come organizzare la memoria
	- Usa pseudo-istruzioni (come `move` o `li`), che non esistono fisicamente nell'hardware, ma vengono tradotte automaticamente dall'assemblatore in una sequenza di istruzioni reali equivalenti
3. **Traduzione (Assemblaggio)**
   L'assemblatore legge il file sorgente (`.asm`), traduce riga per riga i simboli in bit e risolve gli indirizzi delle etichette, producendo un File Oggetto pronto per essere collegato dal [[Linker]] ed esser eseguito 
---
# Pro e Contro
## Pro
- **Massima Efficienza**
  Permette di ottimizzare le prestazioni del software in modo granulare
- **Controllo Hardware**
  Consente il massimo sfruttamento delle potenzialità della'hardware sottostante, poichè non ci sono strati di astrazione a nascondere i dettagli
- **Compattezza**
  I programmi possono risultare potenzialmente più compatti (occupano meno memoria) se scritti da un programmatore esperto
- **Ideale per sistemi specifici**
  È fondamentale per programmare sistemi _embedded_, dispositivi portatili o applicazioni _real-time_ dove le risorse sono limitate
## Contro
- **Mancanza di Portabilità**
  Il codice è legato all'architettura specifica
- **Difficile da scrivere e capire**
- **Bassa espressività**
- **Verbosità**
---
# Confronto con linguaggi di alto livello
| Caratteristica          |                              Assembly                              |          Linguaggio di alto livello           |
| :---------------------- | :----------------------------------------------------------------: | :-------------------------------------------: |
| Astrazione              |    Nulla<br><br>Dipende dai dettagli dell'architettura hardware    |                     Alta                      |
| Portabilità             |    Bassa<br><br>Il codice funziona solo su quella specifica CPU    |                     Alta                      |
| Produttività            |                               Bassa                                |                     Alta                      |
| Prestazioni             | Massime<br><br>Ottimizzabile manualmente al singolo ciclo di clock |                   Variabili                   |
| Leggibilità             |                               Bassa                                |                     Alta                      |
| Strumento di traduzione |                           [[Assembler]]                            |                  Compilatore                  |
| Uso tipico              |           Driver, Sistemi Embedded, Real-time, Firmware            | Applicazioni Desktop/Web , Gestionali, Mobile |
