# Cos'è?
È un circuito combinatorio che agisce come un selettore digitale

È l'opposto concettuale del [[Decoder]], mentre il Decoder ha pochi ingressi e tante uscite, il Multiplexer ha tanti ingressi di dati e una sola uscita, gestita da alcuni ingressi di controllo

---
# Cosa fa?
La sua funzione è scegliere uno tra i diversi segnali in ingresso e incanalarlo verso l'unica uscita disponibile

- Ha $2^n$ linee di dati in ingresso
- Ha $n$ linee di selezione 
- Ha 1 linea di uscita
---
# Da cosa è composto?
Internamente, il MUX è costruito usando una combinazione di porte logiche a 2 livelli
1. [[Porta AND | Porte AND]]
   Ogni ingresso dati entra in una porta AND insieme al segnale di selezione
   Se la selezione non corrisponde a quell'ingresso, la porta AND restituisce 0 (blocca il dato), se corrisponde, lascia passare il dato
2. [[Porta OR]] (Collettore)
   Le uscite di tutte le porte AND confluiscono in un'unica porta OR
   Poiche solo una AND sarà attiva alla volta, la OR lascera passare quell'unico segnale verso l'uscita finale 

![[Pasted image 20260128155657.png]]
## Grafica ridotta
![[Pasted image 20260128162823.png]]

---
# Come lo fa?
Il comportamento dipende interamente dai bit di selezione ($P$)

Prendiamo il caso più semplice, un MUX a 2 ingressi dati  $(A,B)$ e 1 selettore ($S$)
![[Pasted image 20260128155351.png]]