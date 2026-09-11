# Definizione formale
Sia L un CFL, esiste una costante $n$ tale che , se $z$ è una stringa in $L$ tale che $|z|\geq n$ possiamo scrivere $z = uvwxy$ con le seguenti condizioni
1. $|vwz| \leq n$
2. $vx \not= \varepsilon$
3. $\forall i \geq 0 \quad uv^iwx^i \in L$
## Spiegazione
La differenza fondamentale con il [[Pumping Lemma | Pumping lemma per linguaggi regolari]] è che non stiamo più guardando una linea, ma un albero.
Il motivo per cui la stringa si divide in 5 parti $(u,v,w,x,y,)$ è che c'è una variabile che si ripete lungo un ramo dell'[[Alberi di derivazione | albero di derviazione]]
- La prima occorrenza della variabile genera tutto il blocco centrale
- La seconda genera la parte interna
- Le parti laterali sono quelle che vengono ripetute quando "pompi" la variabile ricorsiva
--- 
