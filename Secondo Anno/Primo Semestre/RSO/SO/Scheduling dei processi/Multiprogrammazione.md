# Cos'è?
E' una **tecnica di gestione dei [[Processi e MultiThreading (Da rifare)#^def-processo| processi]]** progettata per massimizzare l'efficienza del sistema di elaborazione.

Il suo scopo principale è garantire che la CPU sia impegnata il più possibile nell'esecuzione di programmi , <u>riducendo al minimo i tempi di inattività</u>

---
# Cosa fa?
Il suo compito è impedire che la CPU rimanga inattiva quando il programma che la sta utilizzando è costretto a fermarsi per attendere un evento esterno

---
# Come lo fa?
## Funzionamento
Il funzionamento si basa sull'avere più processi in memoria contemporaneamente monitorandone l'esecuzione, sottraendo la CPU al processo in attesa ed assegnandola ad un altro

Un processo non usa la CPU in modo uniforme dall'inizio alla vita, alterna continuamente l'utilizzo di 2 stati :
### CPU Burst
  È il momento in cui il processore esegue calcoli/istruzioni ed accessi alla memoria, in questa face il processo deve avere il controllo della CPU per procedere
### I/O Burst
  Durante questa fase il processo è in stato di attesa , sta aspettando che un dispositivo I/O risponda
## Vincolo di memoria
La multiprogrammazione richiede che le immagini di tutti i processi attivi siano caricate all'interno della memoria, solo cosi' la CPU può passare rapidamente da un processo all'altro quando uno si blocca per I/O

Tuttavia, la memoria non è illimitata e per aumentare il grado di multiprogrammazione (il numero di processi gestibili), il sistema operativo usa 2 tecniche : 
1. Swapping
   Sposta temporaneamente le immagini intere dei processi inattivi dalla memoria al disco e viceversa quando tornato attivi
2. Memoria Virtuale
   Permette di eseguire un processo anche se la sua immagine è troppo grande per stare all'interno della memoria o se non è stata caricata completamente, caricandone solo i pezzi necessari al momento dell'esecuzione

--- 
# Grado di multiprogrammazione
Definiamo come grado di multiprogrammazione il **numero massimo di processi** che lo <u>[[Scheduler]] può mandare in esecuzione</u>