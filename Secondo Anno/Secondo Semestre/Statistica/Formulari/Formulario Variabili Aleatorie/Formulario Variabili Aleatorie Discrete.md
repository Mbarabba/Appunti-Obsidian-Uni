# Densità Discreta (Distribuzione di Probabilità)
$$\large
p_{X}(x_{i})=P(X=x_{i}) \text{ con la proprietà } \sum_{i\geq 1}p_{X}(x_{i})=1$$
- $X$ è la variabile aleatoria discreta
- $x_{i}$ sono i singoli valori specifici assunti da $X$
- $p_{X}(x_{i})$ è la densità discreta
## Cosa fa?
Associa a ogni singolo valore assunto dalla variabile aleatoria la sua rispettiva probabilità esatta, assicurandosi che la somma di tutte le probabilità dello spazio campionario valga 1
## Quando usarla?
Si usa come base per descrivere l'intera distribuzione di probabilità di un esperimento i cui risultati possibili sono finiti o infiniti numerabili

---
# Valore Medio (Speranza Matematica o Valore Atteso)
$$\large
E[X]=\sum^n_{i=1} c_{i} \cdot p_{X}(x_{i}) = \sum^n_{i=1} x_{i} \cdot P(X=x_{i})
$$
- $x_{i}$ sono i valori misurati della variabili $X$
- $p_{X}(x_{i})$ le loro probabilità
## Cosa fa?
Calcola il baricentro teorico dei valori assunti dalla variabili aleatoria, calcolando la somma dei valori "pesati" con le loro rispettive probabilità
## Quando usarla?
Da utilizzare per trovare la tendenza centrale attesa di un esperimento Grazie alla legge dei grandi numeri, si usa quando l'esperimento viene ripetuto un numero elevato di volte per prevedere il valore in cui la media si concentrerà

---
# Formula di Trasferimento
$$\large
E[f(X)]=\sum^n_{i=1}f(x_{i})\cdot p_{X}(x_{i})
$$
- $f(X)$ è una qualsiasi funzione matematica applicata alal variabile aleatoria reale $X$
## Cosa fa?
Estende il calcolo del valore medio applicando una trasformazione funzionale ai valori $x_{i}$, ma mantenendo intatte le probabilità originali $p_{X}(x_{i})$
## Quando usarla?
È fondamentale quando si vuole calcolare il valore atteso di una variabile trasformata, come ad esempio i quadretti $E[X^2]$ necessari a determinare la varianza, senza dover determinare da zero una nuova densità discreta per $f(X)$

---