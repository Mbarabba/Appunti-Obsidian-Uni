# 🎓 Simulazione Esame: Fondamenti dell'Informatica (Set Z - Finale)
**Data**: 2026-01-09
**Parametri**: 10 Esercizi | 1/0 Logic | Ordine Binario | Tableaux Cumulativi | Induzione 3-Fasi

---

## 1. Insiemi (3 Punti)
Siano $A = \{ n \in \mathbb{N} \mid 1 \le n \le 4 \}$ e $B = \{ 3, 4, 5 \}$.
1. Scrivere $A$ in forma estensionale.
2. Calcolare $A \cap B$, $A \cup B$ e $A \setminus B$.
3. Determinare la differenza simmetrica $A \Delta B$.

> [!success] Soluzione
> 1. $A = \{1, 2, 3, 4\}$.
> 2. $A \cap B = \{3, 4\}$; $A \cup B = \{1, 2, 3, 4, 5\}$; $A \setminus B = \{1, 2\}$.
> 3. $A \Delta B = \{1, 2, 5\}$.

---

## 2. Relazioni (3 Punti)
Sia $A = \{1, 2, 3, 4, 5\}$ e $R$ la relazione definita da $xRy \iff |x - y|$ è pari.
1. Rappresentare $R$ tramite **Matrice Booleana**.
2. Dimostrare che $R$ è una relazione di equivalenza.
3. Determinare le classi di equivalenza.

> [!success] Soluzione
> 1. **Matrice**: Blocchi di 1 per gli elementi con la stessa parità.
> 2. **Equivalenza**: Riflessiva ($|x-x|=0$ pari), Simmetrica ($|x-y|=|y-x|$), Transitiva (somma di differenze pari è pari).
> 3. **Classi**: $C_{pari} = \{2, 4\}$, $C_{dispari} = \{1, 3, 5\}$.

---

## 3. Funzioni (3 Punti)
Siano $f, g: \mathbb{Z} \to \mathbb{Z}$ con $f(n) = n^2 + 1$ e $g(n) = n - 2$.
1. Calcolare $(f \circ g)(n)$.
2. Calcolare $(g \circ f)(n)$.
3. Stabilire se $g$ è biunivoca e trovarne l'inversa.

> [!success] Soluzione
> 1. $(f \circ g)(n) = (n-2)^2 + 1 = n^2 - 4n + 5$.
> 2. $(g \circ f)(n) = (n^2 + 1) - 2 = n^2 - 1$.
> 3. $g$ è biunivoca. Inversa: $y = n - 2 \implies n = y + 2$, quindi $g^{-1}(n) = n + 2$.

---

## 4. Diagramma di Hasse (3 Punti)
Sia $A = \{ 1, 2, 3, 4, 6, 12 \}$ ordinato dalla relazione di divisibilità.
1. Disegnare il **Diagramma di Hasse**.
2. Verificare se è un **Reticolo**.
3. Determinare se è limitato ($\bot, \top$) e completo.

> [!success] Soluzione
> 1. **Hasse**: 1 base; 2,3 sopra 1; 4,6 sopra 2; 6 sopra 3; 12 sopra 4,6.
> 2. **Reticolo**: SÌ, ogni coppia ha $m.c.m.$ e $M.C.D.$ in $A$.
> 3. **Proprietà**: **Limitato** ($\bot=1, \top=12$). Essendo finito e limitato, è **Completo**.

---

## 5. Grafi / Alberi / ABR (3 Punti)
Costruire un **ABR** inserendo i valori: 15, 8, 25, 4, 12, 20, 30.
1. Disegnare l'albero.
2. Fornire la visita **In-Order**.
3. Fornire la visita **Post-Order**.

> [!success] Soluzione
> 1. **Albero**: 15 radice; 8(SX), 25(DX); 4,12 sotto 8; 20,30 sotto 25.
> 2. **In-Order**: 4, 8, 12, 15, 20, 25, 30.
> 3. **Post-Order**: 4, 12, 8, 20, 30, 25, 15.

---

## 6. Induzione / Ricorsione (3 Punti)
1. **Ricorsione**: Definire $nodi(T)$ che conta i nodi di un albero binario.
2. **Induzione**: Dimostrare per $n \ge 1$ che $\sum_{i=1}^n i = \frac{n(n+1)}{2}$.

> [!success] Soluzione Induzione (3 Fasi)
> 1. **Caso Base ($n=1$)**: $1 = \frac{1(2)}{2} = 1$. (Vero).
> 2. **Ipotesi Induttiva**: Supponiamo $\sum_{i=1}^n i = \frac{n(n+1)}{2}$ valga per $n$.
> 3. **Passo Induttivo**: Dimostriamo per $n+1$: $\sum_{i=1}^{n+1} i = \frac{(n+1)(n+2)}{2}$.
>    - Sviluppo: $[\sum_{i=1}^n i] + (n+1) = \frac{n(n+1)}{2} + (n+1)$.
>    - Raccolgo $(n+1)$: $(n+1)[\frac{n}{2} + 1] = (n+1)[\frac{n+2}{2}] = \frac{(n+1)(n+2)}{2}$. **CVD**.

---

## 7. Tavola di Verità (3 Punti)
Costruire la tavola di verità per $(P \land Q) \lor (\neg P \land R)$ in ordine binario (000 -> 111).

| $P$ | $Q$ | $R$ | $\neg P$ | $P \land Q$ | $\neg P \land R$ | **Formula** |
| :-- | :-- | :-- | :--: | :--: | :--: | :--: |
| 0 | 0 | 0 | 1 | 0 | 0 | **0** |
| 0 | 0 | 1 | 1 | 0 | 1 | **1** |
| 0 | 1 | 0 | 1 | 0 | 0 | **0** |
| 0 | 1 | 1 | 1 | 0 | 1 | **1** |
| 1 | 0 | 0 | 0 | 0 | 0 | **0** |
| 1 | 0 | 1 | 0 | 0 | 0 | **0** |
| 1 | 1 | 0 | 0 | 1 | 0 | **1** |
| 1 | 1 | 1 | 0 | 1 | 0 | **1** |

---

## 8. Tableaux Proposizionale (4 Variabili) (3 Punti)
Verificare se è una tautologia: $((P \to Q) \land (Q \to R) \land (P \lor S)) \to (R \lor S)$.

> [!success] Svolgimento Cumulativo
> 1. F $((P \to Q) \land (Q \to R) \land (P \lor S)) \to (R \lor S)$ **F $\to$**
> 2. T $(P \to Q) \land (Q \to R) \land (P \lor S)$, F $R$, F $S$ **F $\to$ / F $\lor$**
> 3. T $(P \to Q)$, T $(Q \to R)$, T $(P \lor S)$, F $R$, F $S$ **T $\land$**
> 4. (Ramo 1: T $P$ | Ramo 2: T $S$) **T $\lor$ su $P \lor S$**
> 5. Ramo 2: **CHIUSO** (contrasto T $S$ / F $S$).
> 6. Ramo 1 (T $P$): Espando T $P \to Q$: F $P$ (**Chiuso**) | T $Q$.
> 7. Da T $Q$: Espando T $Q \to R$: F $Q$ (**Chiuso**) | T $R$ (**Chiuso con F $R$**).
> **Tutti i rami chiusi: Tautologia.**

---

## 9. Frasi (Traduzioni Logiche) (3 Punti)
Tradurre le seguenti frasi in logica dei predicati:
1. "Ogni uomo è mortale."
2. "Esiste un pianeta che non ha acqua."
3. "Nessun gatto vola."

> [!success] Soluzione
> 1. $\forall x (Uomo(x) \to Mortale(x))$.
> 2. $\exists x (Pianeta(x) \land \neg HaAcqua(x))$.
> 3. $\forall x (Gatto(x) \to \neg Vola(x))$.

---

## 10. Tableaux Predicativo (3 Punti)
Verificare la validità di: $\forall x (P(x) \to Q(x)) \land P(a) \to Q(a)$.

> [!success] Svolgimento Cumulativo
> 1. F $(\forall x (P(x) \to Q(x)) \land P(a) \to Q(a))$ **F $\to$**
> 2. T $\forall x (P(x) \to Q(x))$, T $P(a)$, F $Q(a)$ **F $\to$ / T $\land$**
> 3. T $\forall x (P(x) \to Q(x))$, T $P(a)$, F $Q(a)$, T $(P(a) \to Q(a))$ **T $\forall [x/a]$**
> 4. T $\forall x \dots$, T $P(a)$, F $Q(a)$, (F $P(a)$ | T $Q(a)$) **T $\to$**
> 5. Ramo 1: **CHIUSO** (contrasto T $P(a)$ / F $P(a)$).
> 6. Ramo 2: **CHIUSO** (contrasto T $Q(a)$ / F $Q(a)$).
> **Valida.**