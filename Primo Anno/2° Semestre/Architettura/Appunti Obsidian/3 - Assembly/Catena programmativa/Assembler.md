# Cos'è?
L'assemblatore è un programma che ha il compito di tradurre il codice scritto in [[Assembly]] nel linguaggio comprensibile della macchina

È il secondo anello della [[Catena programmativa | catena programmativa]] : prende l'output del compilatore (o il codice scritto a mano del programmatore) e produce l'input per il linker

---
# Cosa fa?
Il suo compito principale è la traduzione 1-a-1 delle istruzioni simboliche a bit, ma svolge diverse funioni specifiche per rendere possibile la programmazione
- **Traduzione Mnemonica**
  Converte i codici mnemonici delle istruzioni (`add`,`lw`) nei corrispondenti codici operativi binari (opcode)
- **Gestione Simboli**
  Traduce i nomi simbolici (etichette, nomi di variabili) in indirizzi di memoria numerici
- **Gestione Pseudo-istruzioni**
  Riconosce le pseudo-istruzioni e le traduce nella sequenza corretta di istruzioni reali
- **Gestione Formati**
  Accetta numeri scritti in base diversa
- **Creazione File Oggetto**
  Genera un Object File che contiene il codice macchina, i dati e le informazioni per il linker
---
# Come lo fa?
Il processo di assemblaggio è sequenziale (legge riga per riga), ma per risolvere alcuni problemi logici deve operare generalmente in due passaggi

Ecco come funziona il meccanismo :
1. <u>**Creazione Tabella dei simboli (Symbol Table)**</u>
   L'assemblatore costruisce una tabella che mappa ogni "Etichetta" al suo corrispondente indirizzo di memoria
2. <u>**Gestione dei "Riferimenti in avanti"**</u>
   Spesso un programma salta a un'etichetta che è definita più avanti nel codice
   Se l'assemblatore leggesse il file una volta sola, quando incontra il salto non saprebbe ancora a quale indirizzo corrisponde quell'etichetta
	1. <u>**Primo passo**</u>
	   Legge tutto il programma per trovate tutte le etichette e costruire la **tabella dei simboli**, associando a ogni etichetta il suo futuro indirizzo di memoria
	2. <u>**Secondo Passo**</u>
	   Rilegge il programma e sostituisce i simboli con gli indirizzi numerici calcolati nel primo passo, generando il codice binario finale
---
# Confronto con compilatore
| Caratteristica        |                                   Compilatore                                   |                            Assembler                             |
| :-------------------- | :-----------------------------------------------------------------------------: | :--------------------------------------------------------------: |
| Input                 |                             Codice ad Alto livello                              |                       Codice [[Assembly]]                        |
| Output                |                               Codice [[Assembly]]                               |                   Codice macchine / file .obj                    |
| Livello di Astrazione |           Alto<br><br>Traduce logica complessa in istruzioni semplici           |          Basso<br><br>Traduce simboli mnemonici in bit           |
| Rapporto Traduzione   | 1 a Molti<br><br>Una riga di C può essere tradotta in diverse righe di assembly | 1 a 1<br><br>Una riga di Assembly diventa un'istruzione macchina |
| Inteligenza           |                                      Alta                                       |                            Meccanica                             |