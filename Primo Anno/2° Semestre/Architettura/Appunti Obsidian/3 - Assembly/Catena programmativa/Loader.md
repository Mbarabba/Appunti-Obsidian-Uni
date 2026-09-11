# Cos'è?
Il Loader è il programma che si occupa di prendere il file eseguibile (generato dal [[Linker]] e salvato sulla memoria di massa) e di metterlo in esecuzione attiva

Senza il loader il programma resterebbe solo un file inerte sull'hard disk, il loader lo trasforma in un [[Processi | processo]] attivo nella RAM

---
# Cosa fa?
Il suo compito principale è caricare il codice e i dati della memoria di massa alla memoria principale e preparare il processo affinchè possa iniziare a eseguire le istruzioni del programma

---
# Come lo fa?
Il loader segue una procedura precisa divisa in 6 passaggi fondamentali
1. **<u>Lettura dell'intestazione</u>**
   Legge l'intestazione del file eseguibile per capire quanto è grande il programma
   Determina le dimensioni del segmento di testo (codice / istruzioni) e del segmento dati (variabili globali)
2. **<u>Allocazione della Memoria</u>**
   Crea uno spazio di indirizzamento nella RAM sufficiente a contenere il testo e i dati del programma
3. **<u>Copia (Loading)</u>**
   Copia fisicamente le istruzioni e i dati dal file su disco all'interno dello spazio di memoria appena allocato
4. **<u>Gestione Argomenti</u>**
   Se al programma sono stati passati dei parametri, li copia nello stack affinchè il programma possa leggerli
5. **<u>Inizializzazione Registri</u>**
   Inizializza i registri del processore
   In particolare, imposta lo Stack Pointer affinchè punti alla prima locazione libera dello stack
6. **<u>Avvio (Jump)</u>**
   Salta a una procedura di startup
   Questa procedura copia i parametri nei registri argomento e chiama finalmente la funzione 