# Cosa sono?
Le istruzioni J-Type sono un formato dell'architettura MIPS

Sono progettate specificamente per gestire i salti incondizionati a lungo raggio, ovvero quando il programma deve spostarsi in un punto molto lontano del codice senza dover verificare alcuna condizione

---
# Cosa fanno?
Si occupano di alterare il flusso di controllo del programma in modo permanente 

Vengono usate in 2 casi principali
1. **Salti semplici (`j`)**
   L'equivalente di un "GOTO"
   Dici al processore: "Smetti di eseguire qui e vai immediatamente all'istruzione che si trova all'indirizzo X"
2. **Chiamate a Procedure (`jal`)**
   "Jump and Link", salta a una funzione, ma salva l'indirizzo di ritorno per poter tornare indietro quando la funzione ha finito
---
# Struttura
![[Pasted image 20260124151445.png]]
Ecco la suddivisione dei 32 bit :

| Campo   |      Nome      |  Bit  | Dimensione |                    Descrizione                     |
| :------ | :------------: | :---: | :--------: | :------------------------------------------------: |
| op      |     opcode     | 31-26 |   6 bit    |    Identifica l'istruzione<br>(es `j` o `jal`)     |
| address | target address | 25-0  |   26 bit   | L'indirizzo (indice) dell'istruzione a cui saltare |

---
# Macchina $\to$ Assembly
Abbiamo il codice esadecimale `0x0C000014`
1. **Converti da Hex a Binario**
   `000011|00000000000000000000010100`
2. **Taglia i bit (6-26)**
	- op (6 bit) :  000011 $\to$ 3 guarda l'[[Appendice A.pdf]], $3=$ `jal` (jump and link)
	- address (26 bit) : 00000000000000000000010100 $\to$ 20
3. **Ricostruisci la sintassi Assembly**
   Sintassi : `jal target`
   Risultato : `jal 20`
---
# Assembly $\to$ Macchina
Traduciamo `j 10000`
1. **Identifica i valori**
	- opcode : `j`  guarda l'[[Appendice A.pdf]] = 2
	- address : il numero è 10000 = `00000000000010011100010000`
2. **Costruisci la stringa**
   opcode+address = `000010|00000000000010011100010000` 