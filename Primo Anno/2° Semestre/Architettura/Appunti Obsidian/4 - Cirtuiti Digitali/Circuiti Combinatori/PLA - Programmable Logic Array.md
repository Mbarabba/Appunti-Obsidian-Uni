# Cos'è?
È un componente logico combinatorio versatile utilizzato per implementare qualsiasi funzione logica complessa su un singolo chip

A differenza di porte fisse o di circuiti rigidi, il PLA è strutturato per essere "programmato" per rispondere a specifiche tabelle di verità personalizzate

---
# Cosa fa?
Il compito del PLA è trasformare un insieme di input in un insieme di output basandosi sulla logica della "Somma di prodotti"

In pratica, traduce una tabella di verita arbitraria direttamente in un circuito fisso

Se hai una funzione logica complicata, invece di collegare a mano decine di porte logiche singole, usi un unico PLA configurato per quella funzione

---
# Da cosa è composto?
Un PLA è costituito da 3 elementi fondamentali che lavorano in sequenza
1. **Ingressi e [[Porta NOT|inverter]]**
   Il PLA riceve un insieme di input, ognuno di questi viene sdoppiato
	- Passa in forma "normale"
	- Passa in forma "negata" attraverso degli [[Porta NOT|inverter]]
2. **Primo Stadio: Pano degli [[Porta AND|AND]]**
   È costituito da un array di porte logiche AND
	- Cosa fa? : Ogni porta AND in questo stadio è collegata a una specifica combinazione degli ingressi
	- Scopo : Genera i termini prodotto, ovvero le condizioni specifiche che attivano una certa parte della logica
3. **Secondo Stadio: Piano degli [[Porta OR|OR]]**
   È costituito da un array di porte logiche OR
	- Cosa fa? : Le uscite delle porte AND entrano in questo secondo stadio, le porte OR sommano i prodotti selezionati
	- Scopo : Genera le uscite finali realizzando la cosiddetta  "Somma di prodotti"

![[Pasted image 20260128162651.png]]

## Grafica ridotta
![[Pasted image 20260128162721.png]]

---
# Come lo fa?
Il PLA realizza le funzioni attraverso una struttura molto regolare divisa in  stati
 1. Piano degli [[Porta AND | AND]] (Generazione dei prodotti)
	 1. Ricevein ingresso tutti i segnali
	 2. Crea i cosiddetti mintermini o "prodotti logici"
	    Ogni [[Porta AND]] in questo stadio riconosce una specifica combinazione degli ignressi (es $A \cdot \overline{B} \cdot C$)
2. Piano degli [[Porta OR | OR]] (Somma dei prodotti)
	1. Riceve le uscite del piano AND
	2. Collega (somma) insieme i prodotti che servono per generare l'uscita finale desiderata
## Esempio
![[Pasted image 20260128161419.png]]
$$\large D = (\overline{A}\cdot\overline{B}\cdot C)+(\overline{A}\cdot B\cdot\overline{C})+(A\cdot\overline{B}\cdot\overline{C})+(A\cdot B\cdot C)$$
