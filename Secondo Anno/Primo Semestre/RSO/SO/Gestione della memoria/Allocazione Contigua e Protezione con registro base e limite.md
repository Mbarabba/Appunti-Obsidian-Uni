# Cosa sono?
## Allocazione Contigua
L'allocazione della memoria è il processo mediante il quale il sistema operativo assegna partizioni specifiche della memoria centrale ai processi che ne fanno richiesta cosi' che possano caricavi la propria immagine ed essere eseguiti.

La <u>RAM viene divisa in 2 partizione principali</u>
- Una riservata al sistema operativo
- Una riservata per i processi utente 

<u>Ogni processo deve occupare un blocco di memoria **unico e contiguo**</u>

## Protezione
È un **meccanismo supportato dall'hardware** che <u>vincola ogni processo ad eseguire esclusivamente all'intervallo di indirizzi fisici che gli è stato assegnato</u>

---
# Vantaggi e Svantaggi della allocazione contigua

|                                             Vantaggi                                              | Svantaggi                                                                                                                                                                                                                                                                               |
| :-----------------------------------------------------------------------------------------------: | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Semplicità**<br><br>È il metodo più semplice per gestire la memoria in sistemi multiprogrammati | **Frammentazione Esterna**<br><br><u>È il problema più critico</u><br><br>La memoria si frammenta in "buchi" non contigui, rendendo impossibile caricare  processi anche se la somma dello spazio libero totale sarebbe sufficiente, <u>perdendo cosi' circa un terzo della memoria</u> |
|                                     **Protezione Efficiente**                                     | **Costo della compattazione**<br><br>Per risolvere la frammentazione serve la compattazione (spostare i processi per unire i buchi)<br><br>Operazione molto onerosa a livello computazionale                                                                                            |
|                                  **Efficienza dell'allocazione**                                  | **Problemi con l'I/O**<br><br>Se un processo sta facendo I/O, non può essere spostato in memoria                                                                                                                                                                                        |
|                               **Assenza di frammentazione Interna**                               | **Mancanza di spazio virtuale**                                                                                                                                                                                                                                                         |

## Alternative alla allocazione contigua
- [[Allocazione contigua con MMU]]
- [[Paginazione]]

---
# Come funziona la protezione a registro base e limite?
Il processo utilizza 2 registri hardware speciali per ogni processo in esecuzione 
1. **Registro di base**
   Contiene l'indirizzo fisico iniziale dell'area assegnata al processo
2. **Registro limite**
   Contiene la dimensione dell'area assegnata

Durante l'esecuzione, per ogni indirizzo generato dalla CPU controlla che la seguente condizione si rispettata

$$\text{Registro Base} \leq Indirizzo < (\text{Registro Base} + \text{Registro Limite})$$
<u>Se la condizione non viene rispettata</u> è avvenuto un errore di indirizzamento **(Trap)**

## Come gestire un errore di indirizzamento

La gestione dell'errore di indirizzamento <u>avviene attraverso un **processo sequenziale**</u>

1. **Rilevamento Hardware** immediato
   Se l'indirizzo viola la condizione, l'hardware <u>blocca fisicamente l'accesso al bus della memoria</u>
2. Generazione del **Trap**
3. **Intervento** del Sistema operativo
   Essendo che siamo in un regime di allocazione contigua <u>un errore di indirizzamento non è recuperabile</u>
4. **Terminazione**
   Il sistema operativo **termina forzatamente il processo**

---
# Vantaggi e svantaggi della protezione a registro base e limite

| Categoria       |                               Vantaggi                               |          Svantaggi           |
| :-------------- | :------------------------------------------------------------------: | :--------------------------: |
| Implementazione |                      Estremamente **semplice**                       | Mancanza di memoria virtuale |
| Protezione      | **Veloce**<br>Il controllo viene eseguito direttamente dall'hardware |        Binding lento         |
| Sicurezza       |                         Isolamento  Efficace                         |      Rigidità operativa      |
