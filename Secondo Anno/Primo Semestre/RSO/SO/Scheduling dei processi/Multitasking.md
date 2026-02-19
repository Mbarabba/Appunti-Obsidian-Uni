# Cos'è?
Il multitasking è un estensione della multiprogrammazione pensate specificatamente per i sistemi interattivi.

Mentre la multiprogrammazione classica si preoccupa di tenere la CPU occupata, il multitasking si preoccupa dell'esperienza utente

---

# Cosa fa?
Il suo obiettivo principale è la reattività
- Vuole dare all'utente l'illusione che ogni programma stia avanzando continuamente e contemporaneamente, come se ogni processo avesse una CPU dedicata
- Garantisce che i programmi interattivo possano reagire agli input dell'utente in tempi accettabili, impedendo che un programma pesante monopolizzi il processore

---

# Come lo fa?
Il meccanismo chiave è il time slicing (prelazione a tempo) : 
1. Quantum
   Il sistema operativo assegna alla CPU un piccolo intervallo di tempo prefissato per ogni processo
2. Interruzione Forzata
   Quando il tempo scade, un timer genera un interrupt e il sistema operativo sottrae forzatamente la CPU al processo in esecuzione e la assegna al processo in attesa
3. Rotazione Rapida
   Questo scambio avviene cosi' velocemente e frequentemente che l'utente percepisce l'esecuzione come parallela e fuida