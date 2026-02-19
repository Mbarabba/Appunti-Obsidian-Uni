# Cos'è?
Il datagramma IP è l'unità fondamentale di dati scambiata a livello di rete.

È il pacchetto di informazioni che viene instradato attraverso la rete internet dei router

---
# Cosa fa?
Il suo scopo principale è trasportare i dati provenienti dai livelli superiori dalla sorgente alla destinazione finale.

Esso agisce come un "involucro" che contiene sia le informazioni necessarie per la consegna sia il contenuto informativo vero e proprio

--- 
# Come lo fa?
Il datagramma realizza la consegna attravero un processo di **incapsulamento** e [[Forwarding | inoltro]] 
- **Incapsulamento**
  Il mittente inserisce il segmento del livello di trasporto nel campo dati del datagramma e aggiunge le informazioni di intestazione
- **Inoltro (Forwarding)**
  Ogni router lungo il percorso esamina i campi dell'intestazione e consulta una tabella di inoltro locale per decidere verso quale interfaccia di uscita inviare il pacchetto
- **Frammentazione**
  Se il pacchetto è troppo grande per un determinato collegamento,[[Protocollo IP | l'IP]] permette di dividerlo in frammenti più piccoli che vengono poi riassemblati a destinazione

---
# Struttura 
![[Pasted image 20260106141314.png]]
## Prima riga : Formato e lunghezza
### Scopo
Questa riga fornisce le informazioni di base sulla struttura del pacchetto e sulla sua dimensione totale
### Componenti
- **Versione** - 4 bit : Indica la versione del protocollo
- **Header Length** - 4 bit : Specifica la lunghezza dell'intestazione in parole di 32 bit
- **Type of service** - 8 bit : Indica la priorità o il tipo di trattamento richiesto per il traffico
- **Length** - 16 bit : La dimensione totale del datagramma (header + dati) espressa in byte
## Seconda riga : Frammentazione e Riassemblaggio
### Scopo
Gestire la scomposizione del pacchetto in pezzi più piccoli
### Componenti
- **16-bit identifier** - 16 bit : Un numero identificativo univoco che accomuna tutti i frammenti di uno stesso datagramma originale
- **Flags** - 3 bit : Bit di controllo per indicare se il pacchetto è un frammento o se ne seguono altri
- **Fragment offset** - 13 bit : Indica la posizione del frammento corrente all'interno del datagramma originale per permettere il riassemblaggio corretto.
## Terza riga : Sicurezza e instradamento
### Scopo
Gestire la "sopravvivenza" del pacchetto nella rete, l'integrità dei dati dell'header e la consegna al protocollo corretto 
### Componenti
- **Time to Live (TTL)** - 8 bit : Numero massimo di router che il pacchetto può attraversare prima di essere scartato, evitando loop infiniti
- **Upper Layer (Protocol)** - 8 bit : Identifica il protocollo del livello di trasporto (TCP / UDP) a cui consegnare il carico utile
- **Header checksum** - 16 bit : Valore di controllo calcolato solo sull'intestazione per rilevare errori di bit avvenuti durante il trasporto
## Quarta riga : Indirizzo sorgente
### Scopo
Identificare in modo univoco il mittente del messaggio
### Componenti
**Source IP address** - 32 bit : L'indirizzo logico dell'host che ha generato originariamente il datagramma
## Quinta riga : Indirizzo destinazione
### Scopo
Indicare ai router dove deve essere consegnato il pacchetto
### Componenti
**destination IP address** - 32 bit : L'indirizzo logico del destinatario finale del pacchetto

## Parte finale : Opzioni e dati
- **options (if any)** - Variabile : Campo opzionale per funzioni avanzate
- **Payload (Dati)** - Variabile : Contiene il segmento TCP o UDP, la dimensione massima teorica dell'intero datagramma è 65.535 byte ($\approx65$ Kbyte) ma tipicamente è limitata a 1500 byte