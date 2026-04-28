# Disposizioni con ripetizione
$$\large
n^k=n\cdot n\cdot n\dots \cdot n \quad\text{(Moltiplicato per k volte)}
$$
- $n$ è il numero di elementi totali possibili tra cui scegliere
- $k$ è il numero di elementi da estrarre
## Cosa fa?
Conta il numero di sequenze ordinate di $k$ elementi in cui gli oggetti o gli esiti possono essere ripetuti
## Quando Usarla?
SI usa per estrazioni con reinserimento, o quando un esito può manifestarsi più volte e l'ordine delle estrazioni è importante

---
# Disposizioni Semplici
$$\large
\frac{{n!}}{(n-k)!}
$$
- $n$ è il numero di elementi totali possibili
- $k$ è il numero di elementi scelti in successione
## Cosa fa?
Conta il numero di sequenze ordinate formate da k elementi che devono essere tutti distinti tra loro
## Quando usarla
Si usa quando si devono effettuare estrazioni senza reinserimento e in cui l'ordine conta

---
# Permutazioni
$$\large
n! = n \cdot(n-1)\cdot(n-2)\cdot \dots 2 \cdot 1
$$
- $n$ è il numero totale degli oggetti a disposizione
## Cosa fa?
Trova il numero di possibili ordinamenti unici in cui si possono disporre tutti gli $n$ oggetti distinti presi tutti insieme
## Quando usarla?
Si usa quando è necessario riordinare o allineare un gruppo intero di elementi e si vuole sapere quante disposizioni possono creare

---
# Combinazioni
$$
\binom{n}{k}=\frac{{n!}}{k!(n-k!)}
$$
- $n$ è il numero totale di elementi
- $k$ è il numero di elementi distinti scelti per formare il sottoinsieme
## Cosa fa?
Contare i sottoinsiemi, ovvero le collezioni **non ordinate** di $k$ elementi distinti scelti da un gruppo di $n$ possibili
## Quando usarla?
Si usa ogniqualvolta non si è interessati all'ordine in cui vengono estratti o disposti gli elementi