# Cosa sono?
I circuiti sequenziali sono una tipologia di circuiti digitali i n grado di calcolare funzioni che dipendono non solo dai dati presenti in ingresso in quel momento, ma anche da uno stato interno

Sono circuiti che <u>possiedono una forma di "memoria"</u>

Esistono in 2 varianti princiapli : 
- <u>**Asincroni**</u> : Non usano un [[Clock]]
- <u>**Sincroni**</u> : Usano un segnale di [[Clock]] per sincronizzare i cambiamenti di stato
---
# Cosa fanno?
La loro funzione principale è memorizzare ed elaborare informazioni nel tempo

A differenza di un [[Introduzione ai Circuiti Combinatori | circuito combinatorio]] che esegue un calcolo istantaneo e "dimentica" subito dopo, un circuito sequenziale mantiene un'informazione (lo stato corrente) che influenza come il circuito risponderà agli input futuri

---
# Come lo fanno?
I circuiti sequenziali sono costruiti collegando insieme due blocchi principali in un anello di feedback
1. [[Introduzione ai Circuiti Combinatori | Reti Combinatorie]] 
   Si occupano del calcolo logico, prendono in input dati esterni e lo stato corrente per calcolare le uscite e il prossimo stato
2. <u>**Elementi di memoria**</u>
   Servono a memorizzare lo "stato corrente" e mantenerlo stabile fino al prossimo ciclo
---
# [[Introduzione ai Circuiti Combinatori | Confronto con i Circuiti Combinatori]]
| Caratteristica    |              Circuiti Combinatori               |                    Circuiti Sequenziali                     |
| :---------------- | :---------------------------------------------: | :---------------------------------------------------------: |
| Dipendenza Output |        Dipende solo dagli input attuali         |    Dipende dagli input attuali e dallo stato precedente     |
| Memoria           | Assente<br>Non possono memorizzare informazioni |        Presente<br>Hanno elementi di memoria interi         |
| Fattore Tempo     |          Lo stato precedente non conta          |                   Lo stato è fondamentale                   |
| Componenti Base   |                  Porte logiche                  |             Porte logiche + Elementi di memoria             |
| Clock             |      Non necessario per la logica di base       | Fondamentale nei sequenziali sincroni per scandire il tempo |
| Esempi            |            ALU, Decoder, Multiplexer            |              Registri, Contatori, Memorie, FSM              |
