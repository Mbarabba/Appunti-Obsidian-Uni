# Cos'è?
È l'insieme delle architetture e dispositivi preposti al trasferimento di informazioni da e verso l'elaboratore

È un sistema complesso perchè deve gestire dispositivi estremamente eterogenei tra loro per :
- **Velocità**
- **Latenza**
- **Modalità di interazione**

---
# Cosa fa?
La sua funzione principale è permettere la comunicazione tra il coputer (CPU e Memoria) e il mondo esterno (Periferiche)

Si occupa di trasferire dati, ricevere comandi e segnalare lo stato delle operazionià

---
# Come lo fa?
Il funzionamento fisico avviene attraverso tre elementi chiave

## [[Bus di sistema]]
È il canale di comunicazione condiviso che collega CPU, Memoria e Periferiche, è composto da 3 sotto-linee :
- **Bus Dati** : Trasferisce i dati veri e propri
- **Bus Indirizzi** : Trasporta l'indirizzo della periferica o della memoria da contattare
- **Bus di Controllo** : Trasporta i comandi e i segnali di sincronizzazione
## Le interfacce
Le periferiche non sono collegate direttamente al bus, ma tramite interfacce standardizzate che hanno una componente hardware (controllore) e una software (driver)

Ogni interfaccia possiede dei Registri :
- **Registro Dati** : Contiene il dato in ingresso o in uscita
- **Registro di Stato** : Indica se la periferica è pronta, occupata o se ci sono dati disponibili
## Memory Mapped I/O
Per comunicare con questi registri, si usa spesso la tecnica del "Memory Mapped I/O"
- Una parte degli indirizzi di memoria è riservata alle periferiche anzichè alla RAM vera e propria
- Per la CPU, scrivere su una stampante o scrivere in RAM è la stessa cosa: usa le normali istruzioni `lw` e `sw` su quegli indirizzi specifici
---
# Tecniche di gestione
Esistono tre modalità principali con cui la CPU coordina il trasferimento dei dati, in ordine crescente di efficienza :

## [[Programmed Input Output| I/O Gestito da programma]]
La CPU ha il controllo totale e la periferica è passiva
- **Come funziona?**
  La CPU esegue un loop dove interroga continuamente il registro di stato della periferica per vedere se è pronta (Polling / Busy Waiting)
- **Pro** : Risposta molto veloce appena la periferica è pronta
- **Contro** : La CPU rimane bloccata nel ciclo di attesa e non può fare altro, sprecando tempo 
## [[Interrupt Driven | I/O guidato da interrupt]]
La gestione diventa asincrona
- **Come funziona?**
  La CPU non controllo continuamente
  Quando le periferica ha bisogno di attenzione, invia un segnale fisico (interrupt) sul bus di controllo, la CPU interrompe quello che sta facendo, salva lo stato del programma corrente, esegue la routine di gestione dell'I/O e poi riprende il lavoro interrotto
- **Pro** : Elimina il Busy Waiting, la CPU lavora ad altro mentre attende
- **Contro** : La CPU deve comunque interrompersi per gestire il trasferimento di ogni singolo dato, il che ha un costo in termini di latenza
## [[DMA - Direct Access Memory]]
Usato per trasferire grandi blocchi di dati velocemente
- **Come funziona?**
  La periferica (tramite un controllore DMA) accede direttamente alla memoria per leggere o scrivere dati, senza disturbare la CPU
  
  La CPU interviene solo all'inizio (per dire "trasferisci X dati a partire dall'indirizzo Y") e alla fine (ricevendo un interrupt quando il lavoro è finito)
- **Pro** : Banda passante massima, la CPU è quasi totalmente libera
- **Contro** : Richiede hardware aggiuntivo (registri per indirizzo e conteggio dati)