# 🎓 Esame "Master" Open Book (Set J)
**Tags:** #esame #fondamenti #simulazione #soluzioni-visibili
**Istruzioni:** Prova completa con soluzioni immediatamente visibili e pronte per la lettura.

---

> [!question] Esercizio 1: Insiemi (3 Punti)
> Siano $A = \{\emptyset, 1, \{1\}\}$ e $B = \{1, 2, \{1\}\}$.
> Eseguire le seguenti operazioni:
> 1. **Intersezione e Unione:** Calcolare $A \cap B$ e $A \cup B$.
> 2. **Differenza:** Calcolare $A \setminus B$.
> 3. **Insieme delle Parti:** Calcolare $\mathcal{P}(A \setminus B)$.
> 4. **Verità:** Dire se l'affermazione $\{1\} \in A$ è vera o falsa.
> 5. **Partizione:** Scrivere un esempio di partizione di $B$ in 2 sottoinsiemi.
>
> > [!quote] ✍️ Il tuo Svolgimento
> >
> >
> >
>
> > [!success] Soluzione
> > **1. Intersezione e Unione**
> > * $A \cap B = \{1, \{1\}\}$.
> > * $A \cup B = \{\emptyset, 1, 2, \{1\}\}$.
> >
> > **2. Differenza ($A \setminus B$)**
> > * Elementi in A non presenti in B. L'unico è $\emptyset$.
> > * Risultato: $\{\emptyset\}$.
> >
> > **3. Insieme delle Parti $\mathcal{P}(A \setminus B)$**
> > * L'insieme è $\{\emptyset\}$. Le parti sono: $\{\emptyset, \{\emptyset\}\}$.
> >
> > **4. Verità**
> > * $\{1\} \in A$? Sì, l'elemento $\{1\}$ è presente in A come elemento. **VERO**.
> >
> > **5. Partizione di B**
> > * $B = \{1, 2, \{1\}\}$. Esempio di partizione: $X_1 = \{1, \{1\}\}$, $X_2 = \{2\}$.

---

> [!question] Esercizio 2: Relazioni (3 Punti)
> Sia $A = \{1, 2, 3, 4\}$. Sia $R$ definita da: $x R y \iff x \le y$.
> Consideriamo la relazione inversa $R^{-1}$ (ovvero $x R^{-1} y \iff y \le x$, cioè $x \ge y$).
> 1. **Rappresentazione:** Matrice Booleana e Grafo Orientato di $R^{-1}$.
> 2. **Proprietà:** Proprietà di $R^{-1}$ (Riflessiva, Simmetrica, Antisimmetrica, Transitiva).
> 3. **Sottorelazione:** Rimuovere coppie da $R^{-1}$ per renderla **Simmetrica**.
>
> > [!quote] ✍️ Il tuo Svolgimento
> >
> >
> >
>
> > [!success] Soluzione
> > **1. Rappresentazione ($x \ge y$)**
> > * Coppie: $\{(1,1), (2,1), (2,2), (3,1), (3,2), (3,3), (4,1), (4,2), (4,3), (4,4)\}$.
> > * **Matrice:**
> >   $$M = \begin{pmatrix} 1 & 0 & 0 & 0 \\ 1 & 1 & 0 & 0 \\ 1 & 1 & 1 & 0 \\ 1 & 1 & 1 & 1 \end{pmatrix}$$
> > * **Grafo Orientato:**
> > ```mermaid
> > graph LR
> >     1((1)) --> 1
> >     2((2)) --> 2
> >     3((3)) --> 3
> >     4((4)) --> 4
> >     2 --> 1
> >     3 --> 2
> >     3 --> 1
> >     4 --> 3
> >     4 --> 2
> >     4 --> 1
> > ```
> >
> > **2. Proprietà**
> > * **Riflessiva:** SÌ.
> > * **Simmetrica:** NO (es. $2 \ge 1$ ma non $1 \ge 2$).
> > * **Antisimmetrica:** SÌ.
> > * **Transitiva:** SÌ.
> >
> > **3. Sottorelazione Simmetrica**
> > Tengo solo le coppie della diagonale (identità), rimuovendo tutte le relazioni d'ordine stretto.
> > $R' = \{(1,1), (2,2), (3,3), (4,4)\}$.

---

> [!question] Esercizio 3: Funzioni (3 Punti)
> Siano $f, g: \mathbb{Z} \to \mathbb{Z}$ definite da:
> $$f(n) = n - 5$$
> $$g(n) = |n|$$
>
> 1. Proprietà di $f$ (Totale, Iniettiva, Suriettiva, Biunivoca).
> 2. Proprietà di $g$ (Totale, Iniettiva, Suriettiva, Biunivoca).
> 3. Calcolo di $(f \circ g)(n)$.
> 4. Calcolo di $(g \circ f)(n)$.
>
> > [!quote] ✍️ Il tuo Svolgimento
> >
> >
> >
>
> > [!success] Soluzione
> > **1. Proprietà di $f(n)=n-5$**
> > * Totale: SÌ.
> > * Iniettiva: SÌ.
> > * Suriettiva: SÌ.
> > * Biunivoca: SÌ.
> >
> > **2. Proprietà di $g(n)=|n|$**
> > * Totale: SÌ.
> > * Iniettiva: NO (es. $g(-2)=g(2)=2$).
> > * Suriettiva: NO (nessun numero negativo in output).
> > * Biunivoca: NO.
> >
> > **3. $(f \circ g)(n) = f(g(n))$**
> > $$f(|n|) = |n| - 5$$
> >
> > **4. $(g \circ f)(n) = g(f(n))$**
> > $$g(n - 5) = |n - 5|$$

---

> [!question] Esercizio 4: Diagrammi di Hasse (3 Punti)
> Sia $A = \{2, 3, 4, 6, 8, 12, 24\}$ ordinato per divisibilità.
> 1. **Grafo:** Diagramma di Hasse (Bottom-Top, no frecce).
> 2. **Coppie:** Join e Meet di $\{6, 8\}$.
> 3. **Totale:** Join e Meet del diagramma.
> 4. **Reticolo:** È un reticolo?
>
> > [!quote] ✍️ Il tuo Svolgimento
> >
> >
> >
>
> > [!success] Soluzione
> > **1. Diagramma di Hasse**
> > * 2 divide 4, 6.
> > * 3 divide 6.
> > * 4 divide 8, 12.
> > * 6 divide 12, 24.
> > * 8 divide 24.
> > * 12 divide 24.
> >
> > ```mermaid
> > graph BT
> >     2((2)) --- 4((4))
> >     2 --- 6((6))
> >     3((3)) --- 6
> >     4 --- 8((8))
> >     4 --- 12((12))
> >     6 --- 12
> >     6 --- 24((24))
> >     8 --- 24
> >     12 --- 24
> > ```
> >
> > **2. Coppia $\{6, 8\}$**
> > * **Join ($6 \lor 8$):** MCM(6,8) = 24. (È presente in A).
> > * **Meet ($6 \land 8$):** MCD(6,8) = 2. (È presente in A).
> >
> > **3. Totale**
> > * **Join ($\bigvee A$):** 24 (Massimo).
> > * **Meet ($\bigwedge A$):** Non esiste unico (2 e 3 sono minimali distinti).
> >
> > **4. Reticolo?**
> > **NO**. La coppia $\{2, 3\}$ ha MCD=1, ma 1 non è nell'insieme. Quindi non esiste il loro Meet in A.

---

> [!question] Esercizio 5: Alberi Binari (3 Punti)
> Albero: Radice A. Figli: B(sx), C(dx). Figli di B: D(sx), E(dx). Figli di C: F(sx).
> ```mermaid
> graph TD
>     A-->B
>     A-->C
>     B-->D
>     B-->E
>     C-->F
> ```
> 1. **Classificazione:** Pieno? Completo? Bilanciato?
> 2. **Tabella:** Rappresentazione con array/tabella.
>
> > [!quote] ✍️ Il tuo Svolgimento
> >
> >
> >
>
> > [!success] Soluzione
> > **1. Classificazione**
> > * **Pieno?** NO. Il nodo C ha solo 1 figlio (F).
> > * **Completo?** SÌ. Livelli 0 e 1 pieni. Livello 2 riempito da sx (D, E, F presenti, manca solo l'ultimo a dx).
> > * **Bilanciato?** SÌ. (A: sx altezza 1, dx altezza 1. Diff 0).
> >
> > **2. Tabella**
> > | Ind | Info | SX | DX |
> > |:-:|:-:|:-:|:-:|
> > | 0 | A | 1 | 2 |
> > | 1 | B | 3 | 4 |
> > | 2 | C | 5 | - |
> > | 3 | D | - | - |
> > | 4 | E | - | - |
> > | 5 | F | - | - |

---

> [!question] Esercizio 6: Induzione e Ricorsione (3 Punti)
> 1. **Ricorsione:** Definire l'insieme $M$ delle stringhe binarie che iniziano con '1' e finiscono con '0'.
> 2. **Induzione:** Dimostrare $\sum_{k=1}^{n} \frac{1}{k(k+1)} = \frac{n}{n+1}$.
>
> > [!quote] ✍️ Il tuo Svolgimento
> >
> >
> >
>
> > [!success] Soluzione
> > **1. Ricorsione**
> > * Base: $10 \in M$.
> > * Passo: Se $w \in \{0,1\}^*$ (una qualsiasi stringa binaria), allora $1w0 \in M$.
> >   *(Definizione costruttiva basata sulla concatenazione).*
> >
> > **2. Induzione**
> > * **Base ($n=1$):** Sx: $1/(1\cdot 2) = 1/2$. Dx: $1/(1+1) = 1/2$.
> > * **Passo ($n+1$):**
> >   Obiettivo: $\frac{n+1}{n+2}$.
> >   Calcolo: $\frac{n}{n+1} + \frac{1}{(n+1)(n+2)}$
> >   $= \frac{n(n+2) + 1}{(n+1)(n+2)} = \frac{n^2 + 2n + 1}{(n+1)(n+2)}$
> >   $= \frac{(n+1)^2}{(n+1)(n+2)} = \frac{n+1}{n+2}$.
> >   **C.V.D.**

---

> [!question] Esercizio 7: Logica Proposizionale 1 (3 Punti)
> Formula: $\neg (P \land Q) \to R$.
> 1. **Albero Sintattico:** Disegnarlo.
> 2. **Tavola:** Tautologia, Contraddizione o Soddisfacibile?
>
> > [!quote] ✍️ Il tuo Svolgimento
> >
> >
> >
>
> > [!success] Soluzione
> > **1. Albero Sintattico**
> > ```mermaid
> > graph TD
> >     I(→) --- N(¬)
> >     I --- R
> >     N --- A(∧)
> >     A --- P
> >     A --- Q
> > ```
> >
> > **2. Tavola**
> > Basta trovare un caso falso.
> > Se $P=0, Q=0, R=0$:
> > * $P \land Q$ è Falso.
> > * $\neg(P \land Q)$ è Vero.
> > * Implicazione $Vero \to R(Falso)$ è **Falsa**.
> > **Formula Soddisfacibile** (non Tautologia, non Contraddizione).

---

> [!question] Esercizio 8: Logica Proposizionale 2 (3 Punti)
> Tableaux: $(P \to (Q \to R)) \to ((P \to Q) \to (P \to R))$.
> *(Legge di distribuzione dell'implicazione).*
>
> > [!quote] ✍️ Il tuo Svolgimento
> >
> >
> >
>
> > [!success] Soluzione
> > 1. Nego la formula intera.
> > 2. $T(P \to (Q \to R))$ e $F((P \to Q) \to (P \to R))$.
> > 3. Espando la seconda parte falsa: $T(P \to Q)$ e $F(P \to R)$.
> > 4. Espando $F(P \to R)$: $T(P)$ e $F(R)$.
> > 5. Espando $T(P \to Q)$ (usando $T(P)$ trovato sopra):
> >    * Ramo A: $F(P)$. CHIUSO.
> >    * Ramo B: $T(Q)$.
> > 6. Espando la prima parte vera $T(P \to (Q \to R))$:
> >    * Ramo C: $F(P)$. CHIUSO.
> >    * Ramo D: $T(Q \to R)$.
> >      * Ramo D1: $F(Q)$. CHIUSO (perché ho $T(Q)$ dal punto 5B).
> >      * Ramo D2: $T(R)$. CHIUSO (perché ho $F(R)$ dal punto 4).
> >
> > **Tautologia (Formula Valida).**

---

> [!question] Esercizio 9: Logica Predicativa 1 (3 Punti)
> Tradurre:
> 1. "Tutti gli algoritmi hanno una complessità."
> 2. "Alcuni servizi cloud non sono sicuri."
> 3. "Se l'utente è admin, può accedere a tutti i file."
>
> > [!quote] ✍️ Il tuo Svolgimento
> >
> >
> >
>
> > [!success] Soluzione
> > 1. $\forall x (Algoritmo(x) \to \exists y (Complessita(y) \land Ha(x, y)))$.
> > 2. $\exists x (Cloud(x) \land \neg Sicuro(x))$.
> > 3. $Admin(utente) \to \forall y (File(y) \to Accesso(utente, y))$.

---

> [!question] Esercizio 10: Logica Predicativa 2 (3 Punti)
> Tableaux Validità: $\exists x (P(x) \land Q(x)) \to (\exists x P(x) \land \exists x Q(x))$.
>
> > [!quote] ✍️ Il tuo Svolgimento
> >
> >
> >
>
> > [!success] Soluzione
> > 1. Nego la formula.
> > 2. $T(\exists x (P(x) \land Q(x)))$.
> > 3. $F(\exists x P(x) \land \exists x Q(x))$.
> > 4. Da (2), creo costante $a$: $T(P(a) \land Q(a)) \implies T(P(a))$ e $T(Q(a))$.
> > 5. Ramifico (3) $F(\land)$:
> >    * Ramo A: $F(\exists x P(x)) \implies \forall x \neg P(x)$.
> >      * Uso la costante $a$: $F(P(a))$.
> >      * CHIUSO (contraddice $T(P(a))$).
> >    * Ramo B: $F(\exists x Q(x)) \implies \forall x \neg Q(x)$.
> >      * Uso la costante $a$: $F(Q(a))$.
> >      * CHIUSO (contraddice $T(Q(a))$).
> >
> > **Tautologia.**