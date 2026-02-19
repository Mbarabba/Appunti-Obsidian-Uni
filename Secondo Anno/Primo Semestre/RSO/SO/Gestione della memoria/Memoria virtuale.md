# Cos'è?
È una **tecnica** che permette l'esecuzione di processi che <u>non sono completamente in memoria.</u>

Rappresentazione la separazione netta tra la memoria logica e la memoria fisica

---
# Cosa fa?
Crea un **astrazione**, fornisce al programmatore un enorme spazio di indirizzamento <u>contiguo e privato</u>, mentre il sistema operativo si occupa di mappare questi indirizzi su una memoria fisica reale che può essere più piccolo e frammentata

---
# Come lo fa?
Implementa meccanismi per caricare i pezzi di un programma solo quando servono davvero.

Viene realizzata principalmente attraverso la [[Paginazione su richiesta]] o (meno frequentemente) la segmentazione a richiesta 