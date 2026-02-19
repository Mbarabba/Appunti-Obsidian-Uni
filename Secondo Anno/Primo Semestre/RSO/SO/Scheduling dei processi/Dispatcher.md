# Cos'è?
Il Dispatcher è il [[Strutture del kernel#^def-moduli| modulo]] del sistema operativo che conferisce il controllo della CPU al processo selezionato dallo [[Scheduler | scheduler]] a breve termine

---
# Cosa fa?
Affichè il dispatcher possa "dare il controllo" al processo scelto deve eseguire 3 operazioni sequenziali fondamentali
1. **Context Switch**
   Salva lo stato del vecchio processo e carica quello del nuovo
2. Passare alla [[User mode | modalità utente]]
3. **Saltare** all'istruzione corrente
   Imposta il PC per riavviare l'esecuzione del programma esattamente dal punto in cui era stato interrotto
---
# Context Switch
## Cos'è?
È il processo tecnica mediante il quale la CPU sospende l'esecuzione di un processo corrente per iniziare o riprenderne un altro.

È il meccanismo fondamentale che rende possibile la [[Multiprogrammazione | multiprogrammazione]]
## Cosa fa?
Il suo compito è "gestire il **contesto**" del processo.

Il contesto è <u>l'insieme delle informazioni necessarie per ripristinare l'esecuzione</u> interrotta esattamente com'era, e comprende principalmente :
1. Valori **registri** della CPU
2. **Program Counter**
3. **Stack Pointer**
Il context switch garantisce che quando un processo $P_{0}$ viene fermato per dare spazio a $P_{1}$, $P_{0}$ possa essere ripreso in futuro senza perdere dati o "il filo del discorso"

## Come lo fa?
L'operazione è eseguita dal dispatcher e avviene attraverso una <u>sequenza precisa di passi</u> :
1. **Interruzione**
   Arriva un segnale che dice al sistema operativo di cambiare processo
2. **Salvataggio**
   Il sistema salva il contesto del processo che sis ta fermando all'interno del suo [[Processi#PCB - Process Control Block | PCB]]
3. **Caricamento**
   Il sistema operativo preleva i dati del [[Processi#PCB - Process Control Block | PCB]] del nuovo processo che deve essere eseguito e li carica nei registri della CPU
4. **Riavvio**
   Il dispatcher imposta il Program Counter alvalore appena caricato, facendo saltare la CPU all'istruzione esatta dove il nuovo processo si era interrotto l'ultima volta
---
# Latenza di Dispatch
Il Context Switch non è gratuito, il tempo impiegato per salvare e caricare i registri si chiama **latenza di dispatch**
- È **puro overhead**
- <u>Più è complesso</u> è il processo <u>più è grande</u> la latenza di dispatch
---
# Dispatcher VS [[Scheduler]]

## Tabella

|      Caratteristica       |                  Scheduler                   |                         Dispatcher                         |
| :-----------------------: | :------------------------------------------: | :--------------------------------------------------------: |
|     Ruolo Principale      |      Selezione il processo da eseguire       |     Dà il controllo della CPU al processo selezionato      |
|       Azione Chiave       |      Ready queue e scelta del processo       |       Context Switch e salto all'istruzione corretta       |
|       Quando agisce       | Agisce quando cambia lo stato di un processo | Agisce subito dopo che lo scheduler ha preso una decisione |
| Impatto sulle prestazioni |       Determina la qualità del sistema       |              Determina la latenza di dispatch              |
|        Dipendenza         |   Indipendente dall'architettura hardware    |            Fortemente dipendente dall'hardware             |
## In sintesi
- **Scheduler**
  Decide chi deve usare la CPU
- **Dispatcher**
  Gestisce come avviene il passaggio alla CPU