# Cosa sono?
Sono uno dei 3 formati di codifica delle istruzioni MIPS

Sono il formato utilizzato quando l'operazione deve essere svolta esclusivamente all'interno del processore, lavorando solo sui dati già presenti nei registri, senza accedere alla memoria o usare costanti numeriche immediate

---
# Cosa fanno?
Eseguono le operazioni aritmetiche e logiche fondamentali

In pratica, prendono due numeri da due registri, li elaborano e salvano il risultato in un terzo registro

Le operazioni tipiche sono :
- **Aritmetica** :
	- Somma (`add`,`addu`)
	- Sottrazione (`sub`,`subu`)
- **Logica** : `and`,`or`,`nor`,`xor`
- **Confronto** : "Set on Less Than" (`slt` - imposta a 1 se minore)
- **Scorrimento** : Shift logico (`sll`,`srl`)

---
# Struttura
![[Pasted image 20260124114011.png]]
Per eseguire queste operazioni, il MIPS usa uno "stampo" fisso a 32 bit suddiviso in 6 campi specifici

| Campo |    Nome     |  Bit  | Dimensione |                                      Descrizione                                      |
| :---- | :---------: | :---: | :--------: | :-----------------------------------------------------------------------------------: |
| op    |   Opcode    | 31-26 |   6 bit    |          Indica il tipo di istruzione<br><br>Per le R-Type è quasi sempre 0           |
| rs    |  Source 1   | 25-21 |   5 bit    |                         Indirizzo del primo registro sorgente                         |
| rt    |  Source 2   | 20-16 |   5 bit    |                        Indirizzo del secondo registro sorgente                        |
| rd    | Destination | 15-11 |   5 bit    |                          Indirizzo del registro destinazione                          |
| shamt |    Shift    | 10-6  |   5 bit    | Shift Amount<br><br>Quantità di scorrimento, usato solo per `sll`/`srl`, altrimenti 0 |
| funct |  Function   |  5-0  |   6 bit    |                             Specifica l'operazione esatta                             |

---
# Macchina $\to$ Assembly (R-Type)

Supponiamo di avere il codice esadecimale `0x0232502A`

1. **Hex $\to$ Binario**
   `0x0232502A` = 000000|10001|10010|01010|00000|101010
2. **Taglia i bit secondo lo schema R-Type**
   op = 000000 $\to$ 0 , è una R-Tye
   rs =  10001 $\to$ 17, registro `$17` o `$s1`
   rt = 10010 $\to$ 18 , registro `$18` o `$s2`
   rd = 10010 $\to$ 10, registro `$10` o `$t2`
   shamt = 00000 $\to$ 0
   funct = 101010 $\to$ 42 , corrisponde a `slt`
3. **Ricostruisci la sintassi assembly**
   La sintassi assembly è : `Operazione rd, rs, rt`
   Risultato : `slt $10, $17, $18`

---
# Assembly $\to$ Macchina
Supponiamo di dover tradurre `sub $10, $8, $9`
1. **Identifica i valori dei campi**
	-  opcode : È una `sub` (R-type), quindi il codice operativo è 0 $\to$ `000000`
	-  funct : cerca il codice della `sub` all'interno della [[Appendice A.pdf]] 
	  $\text{sub}=34 \to$`100010`
	- shamt : Non è uno shift, quindi è 0
	- rd : $10=$`01010`
	- rs : $8=$`01000`
	- rt : $9=$`01001`
2. **Costruisci la stringa binaria**
   Prendi tutti i campi e concatenali correttamente
   op+rs+rt+rd+shamt+funct = `000000|01000|01001|01010|00000|100010`
   