# Cos'è?
È un circuito combinatorio che funge da traduttore tra un codice binario (di $n$ bit) e una serie di linee di uscita distinte

"Riconosce" uno specifico pattern binario in ingresso e attiva una corrispondente uscita univoca

---
# Cosa fa?
Il compito del Decoder è prendere un numero binario di $n$ bit in ingresso e attivare esclusivamente una delle sue $2^n$ uscite possibili
- Se hai 3 bit in ingresso, hai $2^3 = 8$ uscite
- Se l'ingresso è `000`, si accende solo l'uscita 0
- Se l'ingresso è `101`, si accende solo l'uscita 5
- Tutte le altre uscite rimangono spente
---
# Da cosa è composto?
Internamente, un decoder è costruita utilizzando porte logiche elementari

Specificatamente è composto da:
1. **Inverter ([[Porta NOT | Porte NOT]])**
   Per creare i segnali negati degli ingressi
2. [[Porta AND | Porte AND]]
   Una porta AND <u>per ogni uscita</u>
   Ogni porta AND riceve una combinazione unica di ingressi

![[Pasted image 20260128153750.png]]
## Grafica ridotta
![[Pasted image 20260128162906.png]]

---
# Come lo fa?
Il funzionamento logico si basa sulla combinazione unica degli ingressi

Ogni uscita corrisponde a una specifica combinazione

![[Pasted image 20260128153435.png]]
