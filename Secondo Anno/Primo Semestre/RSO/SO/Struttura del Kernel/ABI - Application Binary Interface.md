# Cosa sono?
E' l'insieme delle <u>convenzioni e regole che definiscono l'interfaccia tra il codice binario di un'applicazione e il codice binario delle librerie dinamiche che essa utilizza a runtime</u>.
Mentre l'API è un contratto a livello di codice sorgente, l'ABI è un **contratto a livello di codice macchina**
---
# Cosa fanno?
Permettono a moduli software compilati separatamente di "parlare" tra loro correttamente.
- **Interoperabilità**
  Assicurano che il tuo programma sappia esattamente  come chiamare una funzione in una libreria esterna, dove mettere i dati e come leggere i risultati
- **Compatibilità binaria**
  Se l'ABI rimane stabile, è possibile aggiornare le librerie di sistema senza dover ricompilare le applicazioni che le usano.
  Il vecchio eseguibile continuerà a funzionare con la nuova libreria
- ---
# Come lo fanno?
Definisce regole rigorose di basso livello che il compilatore deve seguire per generare il codice binario, queste regole includono :
- **Name Mangling**
  Il metodo con cui i nomi delle funzioni e delle variabili nel codice sorgente vengono trasformati in simboli univoci nel codice binario
- **Convenzioni di chiamata**
  L'ordine esatto in cui i parametri di una funzione vengono messi sullo stack prima di saltare all'indirizzo della funzione
- **Layout della memoria**
  Come sono strutturati i tipi di dati in memoria, inclusi dettagli come l'allineamento e l'ordine dei byte
- ---
# Portabilità
L'ABI è uno dei principali ostacoli alla portabilità degli eseguibili binari.
- Affinchè un programma compilato possa funzionare su un altro sistema senza essere ricompilato, non basta che l'architettura hardware sia la stessa,<u> deve essere identica anche l'ABI</u>
- **Se l'ABI cambia**, un eseguibile compilato per il primo sistema <u>non funzionerà sul secondo</u>, anche se il codice sorgente è identico
- Per ottenere portabilità tra sistemi con ABI diverse, è necessario usare **linguaggi interpretati**, **ambienti portabili** o **ricompilare** il codice sorgente per ogni sistema specifico
- ---
# Confronto con le API
| Caratteristica |                              API                               |                                       ABI                                        |
| :------------: | :------------------------------------------------------------: | :------------------------------------------------------------------------------: |
|    Livello     |                        Codice Sorgente                         |                                  Codice Binario                                  |
|   Definisce    | Funzioni, strutture, variabili<br>disponibili al programmatore |              Convenzioni di chiamata, layout memoria, name mangling              |
|    Utilizzo    |    Usata dal programmatore durante la scrittura del codice     |      Usata dal sistema operativo e dal linker dinamico durante l'esecuzione      |
|   Obiettivo    |                Portabilità del codice sorgente                 |                        Portabilità del codice eseguibile                         |
|  Cambiamenti   |       SE cambia l'API, il codice sorgente va modificato        | Se cambia l'ABI, l'eseguibile smette di funzionare e deve essere ricompilato<br> |
