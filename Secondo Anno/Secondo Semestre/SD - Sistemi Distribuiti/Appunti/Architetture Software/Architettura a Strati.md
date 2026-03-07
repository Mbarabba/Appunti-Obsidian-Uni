# Come funziona?
I componenti sono organizzati in una struttura a strati dove un componente allo strato $L_{i}$ permette di chiamare il livello sottostante $L_{i-1}$

Un livello può essere definito in modo approssimato come un insieme di (sotto)sistemi con lo stesso grado di generalità

Ogni livello offre un'interfaccia specifica al livello superiore nascondendo i dettagli implementativi
## Organizzazione degli strati
- Gli strati **superiori** so più application-specific
- Gli strati **inferiori** sono più generici
## Obiettivo
**Modularità** e facilità di sostituzione dei componenti

---
# Flusso di controllo
- **Downcalls**
  Un livello $L_{i}$ invoca solo funzioni del livello inferiore $L_{i-1}$
- **Uppcalls**
  Eccezionalmente, un livello inferiore invoca quello superiore
---
# Modelli Comuni
1. **Pura**
   Sono presenti solo downcall al livello immediatamente inferiore
   ![[Pasted image 20260307171510.png]]
2. **Mista**
   Le downcalls possono raggiungere diversi livelli "saltandone" altri
   ![[Pasted image 20260307171620.png]]
3. Con **Upcall**
   Sono permesse callbacks
   ![[Pasted image 20260307171656.png]]
---
# Vantaggi e Svantaggi
## Vantaggi
## Svantaggi
- Possibile presenza di forti **dipendenze** tra layer
---
# Confronto con le altre architetture