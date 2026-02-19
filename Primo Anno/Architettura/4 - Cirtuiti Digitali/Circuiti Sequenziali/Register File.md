# Cos'è?
È una memoria estremamente veloce e di piccole dimensioni situata direttamente all'interno della CPU

Serve come "magazzino temporaneo" per i dati che il processore sta elaborando attivamente che il processore sta elaborando attivamente

- È composto da 32 registri
- Ogni registro contiene 32 bit
---
# Da cosa è composto?
È un circuito sequenziale complesso costruito assemblando componenti base
1. [[Flip Flop]]
   Sono le celle di memoria vere e proprie
2. [[Multiplexer]]
   Servono per la lettura, selezionano quale tra i 32 registri deve mandare il suo dato in uscita
   Poichè il Register File deve poter leggere due numeri contemporaneamente, ci sono 2 [[Multiplexer]] giganti
3. [[Decoder]]
   Serve per la scrittura, riceve il numero del registro di destinazione e attiva solo quella specifica fila di Flip Flop per la scrittura
4. **Logica di controllo***
   [[Porta AND | Porte AND]] che combinano il segnale di [[Clock]] con il segnale di controllo Write per sincronizzare la scrittura

![[Pasted image 20260129163231.png]]

---
# Cosa fa?
La sua funzione principale è supportare l'esecuzione delle istruzioni aritmetiche

In un singolo ciclo di clock, il Register File è capace di fare 3 cose contemporaneamente : 
1. Leggere 2 registri
2. Scrivere 1 registro
---
# Come lo fa?
Il funzionamento si divide in 2 flussi paralleli
## Lettura
Per leggere un dato, <u>non serve il clock</u>
1. La CPU invia il numero del registro da leggere (5 bit) agli ingressi `Read register number`
2. Questi 5 bit pilotano il [[Multiplexer]]
3. Il Multiplexer collega l'uscita dei Flip Flop del registro selezionato direttamente all'uscita del Register File, essendoci 2 porte di lettura, questo avviene 2 volte in parallelo
4. ![[Pasted image 20260129163714.png]]
## Scrittura
La scrittura è un operazione delicata che modifica lo stato, quindi <u>è sincronizzata</u>
1. La CPU invia il numero del registro da scrivere (5 bit) al [[Decoder]]
2. La CPU invia i dati da scrivere (32 bit) all'ingresso `Write data`
3. Controllo, esiste un segnale chiamato Write
	- Il clock non entra direttamente nel [[Flip Flop]], ma viene messo in [[Porta AND|AND]] con il segnale write
	- Solo se `Write = 1` e arriva il fronte del clock, il dato viene effettivamente salvato nel registro selezionato dal deconder
4. ![[Pasted image 20260129164026.png]] 