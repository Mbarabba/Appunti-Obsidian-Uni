# 🧮 Guida Completa all'Induzione Matematica

Il principio di induzione si utilizza per dimostrare che una proprietà $P(n)$ è vera per tutti i numeri naturali $n \ge n_0$. Ogni dimostrazione deve seguire rigorosamente tre fasi:

1.  **Caso Base**: Si verifica che la proprietà è vera per il valore minimo (solitamente $n=0$, $n=1$ o $n=4$).
2.  **Ipotesi Induttiva**: Si assume che la proprietà sia vera per un generico valore $n$.
3.  **Passo Induttivo**: Si dimostra che, se la proprietà vale per $n$, allora deve valere anche per $n+1$.

---

## 1. Sommatorie ➕
In queste prove, l'obiettivo è dimostrare che la somma di una serie corrisponde a una formula chiusa.

### Esempio 1: Somma dei primi $n$ numeri
**Proprietà**: $\sum_{i=1}^n i = \frac{n(n+1)}{2}$
- **Caso Base ($n=1$)**: $1 = \frac{1(2)}{2} \implies 1 = 1$. (Vero)
- **Ipotesi Induttiva**: Assumiamo $\sum_{i=1}^n i = \frac{n(n+1)}{2}$.
- **Passo Induttivo**: Dimostriamo $\sum_{i=1}^{n+1} i = \frac{(n+1)(n+2)}{2}$.
    - Sviluppo: $[\sum_{i=1}^n i] + (n+1)$.
    - Sostituisco l'ipotesi: $\frac{n(n+1)}{2} + (n+1)$.
    - Raccoglimento: $(n+1)(\frac{n}{2} + 1) = (n+1)(\frac{n+2}{2}) = \frac{(n+1)(n+2)}{2}$. **CVD**.

### Esempio 2: Somma dei numeri dispari
**Proprietà**: $\sum_{i=1}^n (2i-1) = n^2$
- **Caso Base ($n=1$)**: $2(1)-1 = 1^2 \implies 1 = 1$. (Vero)
- **Ipotesi Induttiva**: Assumiamo $\sum_{i=1}^n (2i-1) = n^2$.
- **Passo Induttivo**: Dimostriamo $\sum_{i=1}^{n+1} (2i-1) = (n+1)^2$.
    - Sviluppo: $[\sum_{i=1}^n (2i-1)] + (2(n+1)-1)$.
    - Sostituisco l'ipotesi: $n^2 + 2n + 2 - 1 = n^2 + 2n + 1$.
    - Risultato: $n^2 + 2n + 1 = (n+1)^2$. **CVD**.

### Esempio 3: Somma delle potenze di 2
**Proprietà**: $\sum_{i=0}^n 2^i = 2^{n+1} - 1$
- **Caso Base ($n=0$)**: $2^0 = 2^{0+1}-1 \implies 1 = 2-1 \implies 1=1$. (Vero)
- **Ipotesi Induttiva**: Assumiamo $\sum_{i=0}^n 2^i = 2^{n+1} - 1$.
- **Passo Induttivo**: Dimostriamo $\sum_{i=0}^{n+1} 2^i = 2^{n+2} - 1$.
    - Sviluppo: $[\sum_{i=0}^n 2^i] + 2^{n+1}$.
    - Sostituisco l'ipotesi: $(2^{n+1} - 1) + 2^{n+1}$.
    - Calcolo: $2 \cdot 2^{n+1} - 1 = 2^{n+2} - 1$. **CVD**.

---

## 2. Disequazioni 📈
Si usano per dimostrare che una funzione cresce più velocemente di un'altra.

### Esempio 1: Esponenziale vs Lineare
**Proprietà**: $2^n > n$ per ogni $n \ge 0$.
- **Caso Base ($n=0$)**: $2^0 > 0 \implies 1 > 0$. (Vero)
- **Ipotesi Induttiva**: Assumiamo $2^n > n$.
- **Passo Induttivo**: Dimostriamo $2^{n+1} > n+1$.
    - Sviluppo: $2^{n+1} = 2 \cdot 2^n$.
    - Per ipotesi: $2 \cdot 2^n > 2n$.
    - Poiché per $n \ge 1$ sappiamo che $2n \ge n+1$, allora $2^{n+1} > n+1$. **CVD**.

### Esempio 2: Fattoriale vs Esponenziale
**Proprietà**: $n! > 2^n$ per ogni $n \ge 4$.
- **Caso Base ($n=4$)**: $4! = 24$, $2^4 = 16$. $24 > 16$. (Vero)
- **Ipotesi Induttiva**: Assumiamo $n! > 2^n$.
- **Passo Induttivo**: Dimostriamo $(n+1)! > 2^{n+1}$.
    - Sviluppo: $(n+1)! = (n+1) \cdot n!$.
    - Per ipotesi: $(n+1) \cdot n! > (n+1) \cdot 2^n$.
    - Poiché $n \ge 4$, allora $(n+1) > 2$. Quindi $(n+1) \cdot 2^n > 2 \cdot 2^n = 2^{n+1}$. **CVD**.

### Esempio 3: Altra disequazione esponenziale
**Proprietà**: $2^n \ge n+1$ per ogni $n \ge 1$.
- **Caso Base ($n=1$)**: $2^1 \ge 1+1 \implies 2 \ge 2$. (Vero)
- **Ipotesi Induttiva**: Assumiamo $2^n \ge n+1$.
- **Passo Induttivo**: Dimostriamo $2^{n+1} \ge n+2$.
    - Sviluppo: $2^{n+1} = 2 \cdot 2^n$.
    - Per ipotesi: $2 \cdot 2^n \ge 2(n+1) = 2n + 2$.
    - Poiché $2n + 2 \ge n + 2$ per ogni $n \ge 1$, la tesi è dimostrata. **CVD**.

---

## 3. Divisibilità ➗
In queste prove bisogna dimostrare che una formula restituisce sempre un multiplo di un numero $x$.

### Esempio 1: Divisibilità per 3
**Proprietà**: $n^3 - n$ è divisibile per 3.
- **Caso Base ($n=1$)**: $1^3 - 1 = 0$. ($0$ è divisibile per 3). (Vero)
- **Ipotesi Induttiva**: Assumiamo $n^3 - n = 3k$ per qualche intero $k$.
- **Passo Induttivo**: Dimostriamo $(n+1)^3 - (n+1)$ è divisibile per 3.
    - Sviluppo: $(n^3 + 3n^2 + 3n + 1) - (n + 1) = n^3 + 3n^2 + 2n$.
    - Riorganizzo: $(n^3 - n) + 3n^2 + 3n$.
    - Sostituisco l'ipotesi: $3k + 3(n^2 + n) = 3(k + n^2 + n)$.
    - Poiché il risultato è un multiplo di 3, la tesi è dimostrata. **CVD**.

### Esempio 2: Numeri pari
**Proprietà**: $n^2 + n$ è divisibile per 2 (pari).
- **Caso Base ($n=1$)**: $1^2 + 1 = 2$. (Vero)
- **Ipotesi Induttiva**: Assumiamo $n^2 + n = 2k$.
- **Passo Induttivo**: Dimostriamo $(n+1)^2 + (n+1)$ è pari.
    - Sviluppo: $(n^2 + 2n + 1) + (n + 1) = (n^2 + n) + 2n + 2$.
    - Sostituisco l'ipotesi: $2k + 2(n + 1) = 2(k + n + 1)$.
    - Risultato divisibile per 2. **CVD**.

### Esempio 3: Divisibilità per 8
**Proprietà**: $3^{2n} - 1$ è divisibile per 8.
- **Caso Base ($n=1$)**: $3^2 - 1 = 8$. (Vero)
- **Ipotesi Induttiva**: Assumiamo $3^{2n} - 1 = 8k$.
- **Passo Induttivo**: Dimostriamo $3^{2(n+1)} - 1$ è divisibile per 8.
    - Sviluppo: $3^{2n} \cdot 3^2 - 1 = 9 \cdot 3^{2n} - 1$.
    - Trucco algebrico ($9 = 8+1$): $(8 + 1) \cdot 3^{2n} - 1 = 8 \cdot 3^{2n} + (3^{2n} - 1)$.
    - Sostituisco l'ipotesi: $8 \cdot 3^{2n} + 8k = 8(3^{2n} + k)$.
    - Risultato divisibile per 8. **CVD**.