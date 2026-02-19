# Cosa è?
Il CRC è un codice a rilevazione di errore basato sulla divisione polinomiale.

Tratta le sequenze di bit come se fossero dei polinomi con coefficienti binari

È molto più efficace del semplice bit di parità o del checksum, perchè riesce a individuare errori che colpiscono gruppi di bit consecutivi 

---
# Cosa fa?
Il suo scopo è permettere al ricevente di capire se il frame ricevuto è identico a quello inviato o se ha subito alterazioni durante il viaggio sul mezzo fisico
- Se il calcolo del ricevente dà come **risultato zero**, il frame è considerato corretto
- Se il **risultato è diverso da zero**, il frame è corrotto e viene solitamente scartato
---
# Come lo fa?
Il processo si basa su un'operazione di divisione aritmetica modulo-2 *(XOR)*

Gli elementi necessari : 
- $D$ (Data) : I bit del messaggio originale che vogliamo inviare
- $G$ (Generator) : Una sequenza di bit concordata preventivamente tra mittente e ricevente.
  Se $G$ ha lunghezza di $r+1$ bit, il CRC avrà $r$ bit
- $R$ (Remainder) : Il resto della divisione, ovvero il codice CRC vero e proprio che verrà aggiungo ai dati

## Passaggi per il mittente
1. Il mittente aggiunge $r$ zeri alla fine dei dati $D$
2. Divide la sequenza ottenuta per il generatore $G$ usando la divisione modulo-2 *(XOR)*
3. Il **resto** di questa divisione è il codice $R$
4. Il mittente invia il pacchetto composto da $D$ seguito da $R$
## Passaggi per il ricevente
1. Riceve i bit $(D+R)$
2. Divide l'intera sequenza per lo stesso generatore $G$
3. **Verifica il resto**
	- Resto = 0 $\to$ dati validi
	- Resto $\not= 0 \to$ errore rilevato 
