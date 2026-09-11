# Cos'è?
La catena programmativa è l'insieme sequenziale di strumenti software che trasformano un programma scritto da un essere umano in un formato che il computer può effettivamente eseguire

---
# Cosa fa?
Il suo compito è prendere il codice sorgente e tradurlo passaggio dopo passaggio fino a ottenere un programma binario caricato nella memoria del processore pronto per l'esecuzione

---
# Come lo fa?
Il processo avviene quattro componenti principali che lavorano in cascata
![[Pasted image 20260126122058.png]]
1. <u>**Compilatore**</u>
   Traduce il programma scritto in un linguaggio ad alto livello in linguaggio [[Assembly]]
2. <u>**[[Assembler|Assemblatore]]**</u>
   Traduce il file assembly in un file oggetto
   Durante questo processo converte le istruzioni mnemoniche in bit e gestisce le etichette simboliche
3. <u>**[[Linker]]**</u>
   Collega il file oggetto creato con altri file oggetto e con le librerie di sistema
   Risolve i riferimenti esteri e produce un unico file eseguibile
4. <u>**[[Loader]]**</u>
   Carica il file eseguibile dal disco alla memoria
   Inizializza i registri, prepara lo stack e avvia l'esecuzione del programma