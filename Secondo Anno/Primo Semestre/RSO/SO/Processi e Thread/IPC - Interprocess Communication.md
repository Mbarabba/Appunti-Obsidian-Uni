>[!definizione] Cos'è un IPC?
>L'IPC è uno dei servizi principali di un #SO 
>
>E' un insieme di primitive e servizi che il SO mette a disposizione dei [[Processi e MultiThreading (Da rifare)| processi]] per **permettere la loro  cooperazione e lo  scambio d'informazioni tra di essi**
>
>>[!approfondimento]+ Abbiamo 2 categorie principali di IPC
>>>[!sub-appro]+ Memoria condivisa
>>>Il meccanismo della **memoria condivisa** si basa sulla creazione di una zona di memoria <u>che viene condivisa tra i processi che intendono comunicare</u>
>>>
>>>La comunicazione <u>è gestita dai processi che comunicano</u>, non dal sistema operativo
>>>
>>>![[Pasted image 20251019131511.png]]
>>
>>>[!sub-appro]+ Message passing (Passaggio di messaggi)
>>>I processi comunicano tra di loro **senza condividere memoria**, <u>attraverso la mediazione del sistema operativo</u> che mette a disposizione :
>>>- Un'operazione #send(message) con la quale un processo può inviare un messaggio ad un altro processo
>>>- Un'operazione #receive(message) con la quale può ricevere un messaggio da un altro processo
>>>  
>>>Per comunicare due processi devono:
>>>- Stabilire un **link di comunicazione** tra di loro
>>>- Scambiarsi i messaggi usando #send e #receive
>>>
>>>![[Pasted image 20251019132219.png]]

