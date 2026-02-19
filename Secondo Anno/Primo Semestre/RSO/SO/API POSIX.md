
>[!definizione] Cos'è  #API POSIX
>L'API POSIX è un insieme di standard che definisce come i programmi dovrebbero interagire con un sistema operativo. Il suo scopo principale è garantire la **portabilità del codice sorgente** tra diversi sistemi operativi, in particolare quelli della famiglia UN
>
>>[!approfondimento] Funzioni per operazioni su processi 
>>- #fork
>>	- Crea un nuovo processo figlio; il figlio è un duplicato del padre ed esegue concorrentemente ad esso; ritorna al padre un numero identificatore ( #PID ) del processo figlio, e al figlio il PID 0
>>- #exec
>>	- Sostituisce il programma in esecuzione da un processo con un altro programma, che viene eseguito dall’inizio , viene tipicamente usata dopo una fork() dal figlio per iniziare ad eseguire un programma diverso da quello del padre
>>- #wait
>>	-  Viene chiamata dal padre per attendere la fine dell’esecuzione di un figlio.
>>	  Ritorna :
>>		- Il PID del figlio che è terminato
>>		- Il codice di ritorno del figlio (passato come parametro alla exit)
>>- #exit 
>>	- Fa terminare il processo che lo invoca
>>		- Acceta come paramentro un codice di ritorno numerico
>>		- Il SO elimina il processo e recupera le sue risorse
>>		- Resituisce al processo padre il codice di ritorno (se ha invocato #wait , altrimenti lo memorizza per quando lo invocherà)
>>		- Viene implicitamente invocata se il processo esce dalla funzione main
>>- #abort 
>>	- Fa terminare forzatamente un processo figlio
>>
>>>[!EXAMPLE]- Tipica sequenza fork-exec
>>>![[Pasted image 20251019132529.png]]
>>^operazioni-processi