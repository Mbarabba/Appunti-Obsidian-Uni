# Cos'è?
È un architettura del [[Cosa è ISA - Instruction Set Architecture? | set di istruzioni (ISA)]] di tipo [[RISC - Reduced Instruction Set Computing|RISC]]

È il "linguaggio" standard che definisce come il software deve parlare all'hardware in una specifica famiglia di processori

Le sue caratteristiche fisiche fondamentali sono :
- È un architettura a **32 bit**
	- Le <u>istruzioni</u> sono lunghe 32 bit
	- I <u>dati standard</u> sono a 32 bit
- Possiede **32 Registri** generali all'interno della CPU

---
# Cosa fa?
Il compito del MIPS è definire esattamente quali operazioni il processore è in grado di eseguire e come codificarle

Nello specifico, permette di svolgere tre tipi principali di attività :
1. **Manipolazione di dati**
   Eseguire calcoli aritmetici o logici, ma solo lavorando sui dati che si trovano già nei registri
2. **Trasferimento dati**
   Spostare i dati dalla Memoria ai Registri e viceversa
3. **Controllo del flusso**
   Decidere quale istruzione eseguire dopo salti condizionati o salti incondizionati
---
# Come lo fa?
Il MIPS raggiunge l'obbiettivo della velocità e della semplicità attraverso una struttura rigida e organizzata:
- **Lunghezza Fissa**
  Ogni istruzione è composta esattamente da **32 bit**
- **Formati Standard**
  Per codificare tutte le operazioni possibili in soli 32 bit, MIPS usa solo 3 formati
	1. [[Istruzioni MIPS R (Register to Register) - Type]] : Operazioni aritmetico-logiche tra registri
	2. [[Istruzioni MIPS I (Immediate) - Type]] : Operazioni che coinvolgono un numero costante (valore immediato) o l'accesso alla Memoria
	3. [[Istruzioni MIPS J (Jump) - Type]] : Salti incondizionati a lungo raggio