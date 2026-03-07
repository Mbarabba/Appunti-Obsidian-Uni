# Come funziona? 
Possiamo considera un sistema distribuito come una raccolta di **risorse** gestite individualmente dai componenti

Le risorse possono essere : 
- **Aggiunte**
- **Rimosse**
- **Recuperate**
- **Modificate**
---
# Interfaccia uniforme
**REST** (Representational State Transfer) vede il sistema distribuito come una raccolte di risorse identificate univocamente tramite un singolo schema di naming
## Operazioni
| Operazione | Descrizione                      |
| :--------: | -------------------------------- |
|    PUT     | Modifica / Crea una risorsa      |
|    POST    | Crea una nuova risorsa           |
|    GET     | Recupera lo stato di una risorsa |
|   DELETE   | Elimina una risorsa              |
- I messaggi in REST sono completamente **auto-descrittivi**, contenono tutti i metadati necessari per la loro implementazione 
- L'esecuzione è **stateless**, dopo ogni operazione il componente dimentica tutto del chiamante, rendendo le operazioni idempotenti e semplificando la scalabilità del sistema
---
# Vantaggi e Svantaggi
## Vantaggi
- Semplicità
- Scalabilità
- Messaggi Auto-descrittivi
- Idempotenza
## Svantaggi
- Complessità di comunicazione
- Efficienza messaggi
- Mancanza di stato sul server
---
# Confronto con le altre architetture