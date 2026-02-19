>[!definizione] Il problema dell'allocazione della memoria
>La gestione della memoria è uno dei servizi fondamentali che un #SO deve mettere a disposizione (questo rientra generalmente nei servizi di gestione delle risorse)
>
>Affinchè un programma possa essere esguito, esso deve avere a disposizone :
>1. Il processore, per eseguire il codice
>2. La memoria centrale, per memorizzare il codice e i dati su l quale il codice opera
>
>>[!INFO] &nbsp
>>Essendo che  **la memoria è una risorsa finita** e i #SO moderni permettono di avere più programmi caricati in memoria allo stesso momento, di conseguenza , avremo più immagini di processi contemporaneamente in memoria
>>
>>Il SO <u>deve allocare porzione di memoria centrale ai diversi processi in funzione della necessità di tali processi</u>

>[!definizione]- Loader e Linker
>Un programma sorgente è compilato in un file oggetto che deve poter essere caricato a partire da qualsiasi locazione di memoria fisica
>
>>[!approfondimento] #Linker
>>I liner (o linkage editor) **combinano più file oggetto** (file sorgente + librerie) <u>per formare un file eseguibile</u>
>
>>[!approfondimento] #Loader
>>I loader **si occupano di caricare in memoria i file eseguibili** nel <u>momento in cui devono essere eseguiti</u>
>
>![[Pasted image 20251021112101.png]]
>>[!sub-appro] Librerie dinamiche
>>I #Loader (o ulteriori #Linker dinamici) effettuano il linking delle **librerie dinamiche** che <u>vengono collegate quando il programma è caricato o durante l'esecuzione del programma stesso</u>
>>>[!INFO] Vantaggi delle librerie dinamiche
>>>- Possono essere condivise tra diversi programmi, riducendo cosi' la dimensione dei programmi stessi
>>>- Se aggiorno la libreria non devo ricompilare i programmi che la usano

>[!definizione] Spazio di indirizzamento
>>[!approfondimento]- Cos'è?
>>Ogni processo ha a disposizione un proprio **spazio di indirizzamento** ossia un insieme di indirizzi di memoria che può usare
>>>[!EXAMPLE]- Esempio programma C
>>>![[Pasted image 20251021104711.png]]
>>
>>>[!INFO] Problemi
>>>- Come sistemo quel Jump?
>>>- Cosa ci sarà a quel indirizzo?
>>>- Che problemi mi provocherà?
>
>>[!approfondimento] Spazio di indirizzamento **virtuale**
>>>[!sub-appro]- Cos'è?
>>>Lo spazio di indirizzamento virtuale **( #VAS - Virtual Address Space)** è uno spazio di indirizzamento indipendente dagli indirizzi fisici della RAM nella quale l'immagine è caricata.
>>
>>>[!sub-appro]- Come funziona?
>>>Tale spazio di indirizzamento si estende tipicamente dall'indirizzo 0 fino al **massimo indirizzo consentito dall'architettura del processore**
>>>
>>>Tecniche di associazione degli indirizzi fanno corrispondere lo spazio di indirizzamento virtuale del processo con la regione della RAM che la sua immagine occupa , in tal modo compilatore e #Linker possono lavorare "come se avessero a disposizione tutta la memoria"
>>>![[Pasted image 20251021134812.png]]
>>>
>>>Lo spazio di indirizzamento virtuale di un processo è di regola molto più ampio della memoria centrale.
>>>
>>>Questo significa che la maggior parte dello spazio di indirizzamento virtuale non è sfruttabile dal processo perchè non è associato a nessuna regione della RAM (solitamente tale regione è comrpesa tra lo stack e heap)
>>>
>>>La dimensione dello Stack e Heap può essere modificata dinamicamente attraverso l'uso di opportune #API 
>>>![[Pasted image 20251021135309.png]]
>>>
>>>>[!INFO]- Memory Mapping
>>>>
>>>>Normalmente , i SO mettono a disposizione #API  per mappare una regione inutilizzabile del #VAS su memoria centrale , cosi' che diventi utilizzabile
>>>>
>>>>Esistono anche #API che permettono di mappare una regione del VAS sul contenuto di un file (file mappati in memoria), rendendo cosi' accessibile il file attraverso istruzioni macchina per accedere alla memoria invece che #API del filesystem
>>>![[Pasted image 20251021135645.png]]
>>>
>>>>[!INFO]- Libreri dinamiche
>>>>Le librerie dinamiche vengono caricate nella zona tra Stack e Heap, da quando sono caricate devono essere compilate come #PIC 
>>>>![[Pasted image 20251021135918.png]]
>>>

>[!definizione] Associazione degli indirizzi 
>Nei #SO moderni , un programma viene caricato in aree di memoria diverse in momenti diversi a secondo di dove il sistema trova spazio disponibile 
>
>>[!INFO] Problema
>>Come fa, un'istruzione macchina di un programma a far riferimento ad una certa locazione di memoria se il suo indirizzo non è noto a priori ma dipende da dove il programma è caricato?
>
>Abbiamo 2 possibili soluzioni :
>1. **#PIC - Position Independent Code** , il codice macchina <u>deve usare solo modi di indirizzamento relativi</u>
>2. Associazione degli indirizzi / **#Binding**, <u>traduzione degli indirizzi assoluti</u> negli indirizzi corretti in funzione dell'indirizzo di caricamento
>
>L'associazione degli indirizzi **può essere eseguita in 3 momenti diversi**:
>>[!approfondimento]- Compilazione
>>Il #Linker , a partire dall'indirizzo di caricamento , effettua il #Binding e genera **codice assoluto** 
>>(codice macchina i cui riferimenti interni alla memoria sono già fissati e non modificabili) 
>>>[!INFO] Vantaggi 
>>>- **Soluzione semplice**
>>
>>>[!INFO] Svantaggi
>>>- Se cambia l'indirizzo di caricamento il codice **va ricompilato**
>
>>[!approfondimento]- Caricamento
>>Il #Linker genera **codice rilocabile** e il #Loader , a partire dall'indirizzo di caricamento <u>effettua il #Binding al momento del caricamento in memoria del codice</u>
>>>[!INFO] Vantaggi
>>>* Permette di variare liberamente l'indirizzo di caricamento da esecuzione ad esecuzione
>>
>>>[!INFO] Svantaggi
>>>- Scarse performance 
>>>- Difficilmente permette di riallocare l'immagine di un processo durante la sua esecuzione
>>>- L'eseguibile deve contenere delle opportune tabelle che indichino le istruzioni macchina da modificare
>
>>[!approfondimento]- Esecuzione
>>Il <u>#Binding viene effettuato dinamicamente dall'hardware mentre il codice viene eseguito</u> 
>>>[!INFO] Vantaggi
>>>- Alte performance
>>
>>>[!INFO] Svantaggi
>>- Richiede il supporto dell'hardware
>
>- Il ** #Binding in esecuzione** è quello usato oggi giorno per i SO moderni
>- Il ** #Binding in compilazione** può essere usato per alcuni eseguibili speciali di cui si sa a priori l'indirizzo di caricamento, come il #kernel o il bootloader