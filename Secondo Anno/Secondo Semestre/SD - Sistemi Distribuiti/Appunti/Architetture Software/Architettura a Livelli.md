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
- **Upcalls** : Un livello 