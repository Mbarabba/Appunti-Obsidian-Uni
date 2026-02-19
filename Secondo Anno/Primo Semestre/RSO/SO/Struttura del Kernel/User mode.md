# Cos'è?
E' una delleu> 2 modalità di funzionamento fondamentali</u> supportate dalla CPU.
E' lo **stato "ristretto"** in cui vengono normalmente eseguiti i programmi applicativi degli utenti
# Cosa fa?
La sua funzione principale è <u>permettere l'esecuzione del codice dei programmi</u> garantendo al contempo la **protezione del sistema operativo** stesso dai programmi in esecuzione,
In questa modalità, <u>l'attività del processore è limitata</u>:
- Non può accedere direttamente alla memoria riservata del kernel
- Non può eseguire istruzioni macchina "privilegiate" (hardware / stato del sistema)
# Come lo fa?
Il funzionamento è garantito da un **supporto hardware specifico**:
- La CPU utilizza un bit di modalità per distinguere lo stato corrente
- Quando il bit indica **User mode**, l'hardware controlla ogni istruzione prima di eseguirla, se il programma tenta un' operazione vietata, la CPU la blocca
# User mode $\to$ [[Kernel mode]]
Un programma in User mode <u>non può passare arbitrariamente alla [[Kernel mode]]</u>, il passaggio avviene attraverso una **chiamata di sistema** in questo ordine :
1. Il programma invoca un'istruzione speciale che genera un'**eccezione software**
2. Questa eccezione fa scattare l'hardware, che cambia automaticamente il bit di modalità da User a Kernel
3. Il controllo viene trasferito a una specifica routine del kernel che esegue l'operazione richiesta  con i privilegi necessari
# Tabella di confronto
|    Caratteristica    |                                           User mode                                            |                    Kernel mode                     |
| :------------------: | :--------------------------------------------------------------------------------------------: | :------------------------------------------------: |
|      Chi la usa      |                                Applicazioni e programmi utenti                                 |                Il sistema operativo                |
|      Privilegi       |                       Limitati<br>Non può eseguire istruzioni pericolose                       | Completi<br>Può fare tutto ciò che la CPU consente |
| Accesso alla memoria | Limitato al proprio spazio di indirizzamento.<br>**Vietato l'accesso alla memoria del kernel** |       Accesso illimitato a tutta la memoria        |
|   Bit di modalità    |                                               1                                                |                         0                          |
|     Transizione      |                            Passa a Kernel Mode tramite system call                             |  Torna a User mode tramite istruzione di ritorno   |
