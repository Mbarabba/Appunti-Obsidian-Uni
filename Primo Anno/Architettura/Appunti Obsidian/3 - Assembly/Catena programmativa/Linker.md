# Cos'è
Il linker è un programma di sistema che interviene nella fase finale della creazione di un software eseguibile

Si colloca dopo [[Assembler | l'assemblatore]] e prima del [[Loader]]

Il suo nome deriva dal fatto che il suo scopo è unire diversi pezzi di codice separati in un'unica entità

---
# Cosa fa?
Il compito del Linker è prendere uno o più file oggetto e le librerie di sistema necessarie, e combinarli per produrre un unico file eseguibili

Risolve 3 problemi principali :
1. <u>**Unisce il codice**</u>
   Mette insieme il codice scritto dal programmatore con il codice delle funzioni di libreria già pronte
2. <u>**Risolve i riferimenti esterni**</u>
   Se il codice chiama una funziona che si trova in un altro file o in una libreria, l'assemblatore non conosceva l'indirizzo di quella funzione e ha lasciato un "buco", il linker trova l'indirizzo giusto e riempe quel buco
3. <u>**Rilocazione**</u>
   Decide la disposizione finale in memoria di istruzioni e dati, calcolando gli indirizzi assoluti o relativi definitivi
---
# Come lo fa?
Il processo di linking avviene attraverso questi passaggi logici :
1. **<u>Input</u>**
   Riceve in ingresso i moduli oggetto (che contengono codice macchina parziale, tabelle dei simboli e tabelle di rilocazione, il tutto precedentemente generato dall'[[Assembler]]) e le librerie statiche o dinamiche 
2. <u>**Combinazione**</u>
   Fonde i segmenti di codice e di dati di tutti i moduli in un unico spazio di indirizzamento virtuale
3. **<u>Risoluzione dei simboli</u>** 
   Controlla la "tabella dei simboli" di ogni modulo
   Se il modulo A chiama una funzione `foo` definita nel modulo B, il Linker collega la chiamata nel modulo A all'indirizzo della funzione nel Modulo B
4. <u>**Output**</u>
   Genera il file eseguibile, pronto per essere caricato in memoria dal [[Loader]]
 