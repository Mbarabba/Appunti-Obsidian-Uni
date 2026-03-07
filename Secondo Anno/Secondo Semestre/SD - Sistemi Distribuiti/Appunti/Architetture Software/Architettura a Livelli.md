# Cos'è?
È un architettura software organizzata in $L_{N}$ livelli

---
# Componenti
Un architettura è costituita da 3 componenti :
1. **Servizio** : Cosa viene offerto
2. **Interfaccia** : Come si accede al servizio
3. **Protocollo** : Le regole che le parti seguono per scambiarsi informazioni
---
# Tipi di chiamate
Abbiamo 2 tipi di chiamate :
- **Downcalls** : Un livello $L_{i}$ invoca solo funzioni del livello inferiore $L_{i-1}$
- **Upcalls** : Un livello $L_{i}$ invoca il livello superiore $L_{i+1}$
---
# Modelli Comuni
Esistono 3 varianti di organizzazione a livelli
## Organizzazione Pura
Sono permesso solo downcalls 
![[Pasted image 20260307161916.png]]
## Mista
Da un determinato livello $L_{i}$ posso raggiungere più di un livello
