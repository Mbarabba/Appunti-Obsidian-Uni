# Cos'è?
E' la **modalità operativa "privilegiata"** della CPU, contrapposta alla modalità utente.
E' lo <u>stato in cui viene eseguito il codice del sistema operativo e delle sue componenti critiche</u>, come i driver
---
# Cosa fa?
In questa modalità, **il processore ha "pieni poteri"** sulla macchina.
La sua funzione è gestire le risorse hardware, rispondere alle richieste delle applicazione e garantire la sicurezza e stabilità del sistema.
Nello specifico la kernel mode può :
- Eseguire istruzioni privilegiate
  Istruzioni critiche che sono vietate in user mode, come quelle per gestire l'I/O, modificare la gestione della memoria o disabilitare gli interrupt
- Accedere a tutta la memoria
  Può leggere e scrivere sia nello spazio di memoria utente che nello spazio riservato al kernel
---
# Come lo fa?
Il funzionamento è garantito da un **meccanismo hardware**:
- Bit di modalità
  La CPU utilizza un bit di stato per sapere in quale modalità sta operando.
  Quando il sistema operativo è in esecuzione questo bit è impostato su "Kernel Mode"
- Nessuna restrizione
  Quando il bit è impostato su Kernel Mode, l'hardware disabilità i controlli di protezione che limitano la user mode, permettendo l'esecuzione di qualsiasi istruzione supportata dall'architettura
---
# Kernel mode $\to$ [[User mode]]
Il passaggio inverso, da Kernel a [[User mode]], <u>avviene quando il sistema operativo ha completato il servizio richiesto.</u>
Avviene in questa sequenza :
1. La routine del kernel termina il suo lavoro
2. Esegue un'istruzione speciale di ritorno da eccezione
3. Questa istruzione fa si che l'hardware cambi nuovamente il bit di modalità da Kernel mode a [[User mode]]
4. Il controllo viene restituito all'istruzione successiva del programma utente che aveva richiesto il servizio
---
# Tabella di confronto

|    Caratteristica    |                                           User mode                                            |                    Kernel mode                     |
| :------------------: | :--------------------------------------------------------------------------------------------: | :------------------------------------------------: |
|      Chi la usa      |                                Applicazioni e programmi utenti                                 |                Il sistema operativo                |
|      Privilegi       |                       Limitati<br>Non può eseguire istruzioni pericolose                       | Completi<br>Può fare tutto ciò che la CPU consente |
| Accesso alla memoria | Limitato al proprio spazio di indirizzamento.<br>**Vietato l'accesso alla memoria del kernel** |       Accesso illimitato a tutta la memoria        |
|   Bit di modalità    |                                               1                                                |                         0                          |
|     Transizione      |                            Passa a Kernel Mode tramite system call                             |  Torna a User mode tramite istruzione di ritorno   |
