# Tipi di strutture
>[!definizione]+ Struttura Monolitica
>## Come funziona
>L'intero sistema operativo è compilato in un **unico file binario statico** di grandi dimensioni che <u>viene eseguito interamente in modalità kernel</u>
>
>## Vantaggi
>### Prestazioni elevate
>Poichè tutte le componenti si trovano nello stesso spazio di indirizzamento, possono comunicare direttamente tra loro con un **overhead minimo**
>## Svantaggi
>### Fragilità
>Un bug in una singola componente può far crashare l'intero sistema operativo, poichè non c'è protezione tra le parti
>### Difficolta di gestione
>Il codice è enorme e complesso da mantenere
>### Scarsa flessibilità
>Per aggiungere una nuova funzionalità o un driver, è spesso necessario ricompilare l'intero kernel e riavviare la macchina
>^def-monolitica

>[!definizione]+ Struttura a strati
>## Come funziona
>Il sistema è organizzato in una gerarchia di strati.
>Lo **strato 0 è l'hardware**, lo **strato N è l'interfaccia utente**.
>La regola fondamentale è che <u>uno strato n può interagire solo con lo strato immediatamente sottostante $(n-1)$</u>
>## Vantaggi
>### Modularità e Debugging
>Ogni strato può essere progettato e testato indipendentemente.
>Se c'è un errore nello strato n, si sa che il problema non è negli stati inferiori già testati
>### Astrazione 
>Ogni livello nasconde i dettagli implementativi di quelli sottostanti
>## Svantaggi
>### Prestazioni ridotte
>Ogni operazione deve attraversare molti strati, e ogni passo introduce un overhead
>### Difficoltà di progettazione
>E' difficile definire esattamente quali funzionalità appartengono a quale strato ^def-strati

>[!definizione]+ Struttura a microkernel
>## Come funziona
><u>Il kernel contiene solo i servizi essenziali.</u>
><u>Tutti gli altri servizi</u> vengono spostati fuori da kernel e trasformati in **programmi di sistema** che girano in [[User mode | modalità utente]].
>La comunicazione avviene tramite scambio di messaggi attraverso il microkernel
>## Vantaggi
>### Estendibilità
>E' facile aggiungere nuovi servizi senza toccare il kernel base
>### Affidabilità e Sicurezza
>Se un servizio va in crash, si blocca solo quel processo utente, il resto del sistema e il kernel rimangono stabili
>## Svantaggi
>### Overhead
>Le prestazioni ne risentono a causa del continuo scambio di messaggi e dei frequenti cambi di contesto necessari per passare tra [[User mode | modalità utente]] e [[Kernel mode | modalità kernel]] per ogni richiesta ^def-microkernel

>[!definizione]+ Struttura a moduli
>## Come funziona
>Il kernel ha un nucleo centrale, ma <u>può caricare e scaricare componenti (moduli) dinamicamente</u> durante l'esecuzione
>## Vantaggi
>### Flessibilità
>Combina la dinamicità del microkernel con la potenza del monolitico.
>Non serve ricompilare il kernel per aggiungere funzioni
>## Svantaggi
>### Minore isolamento
>Poichè i moduli girano nel kernel, un bug in un modulo caricato può comunque compromettere l'intero sistema ^def-moduli

---
# Confronto tra le strutture

|  Struttura  |                     Descrizione                     |     Vantaggi<br>principali      |                    Svantaggi<br>principali                     |
| :---------: | :-------------------------------------------------: | :-----------------------------: | :------------------------------------------------------------: |
| Monolitica  |    Unico file binario statico che contiene tutto    |       Prestazioni elevate       |                            Fragile                             |
|  A Strati   |         Organizzazione gerarchica a livelli         |    Facilità di test e debug     | Basse prestazioni,<br>Difficile definire i confini dei livelli |
| Microkernel |  Kernel minimo, servizi spostati in spazio utenti   |        Alta affidabilità        |                       Basse prestazioni                        |
|  A Moduli   | Nucleo base con componenti caricabili dinamicamente | Flessibilità e alte prestazioni |                       Minore isolamento                        |
