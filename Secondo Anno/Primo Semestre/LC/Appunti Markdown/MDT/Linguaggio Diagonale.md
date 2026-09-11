# 📐 Il Linguaggio Diagonale ($L_d$)

---

### 🔹 1. Che cos'è?
Il **Linguaggio Diagonale** $L_d$ è un linguaggio costruito specificamente per dimostrare i limiti della calcolabilità. Si basa sull'ordinamento canonico di tutte le possibili stringhe binarie ($\epsilon, 0, 1, 00, 01, \dots$) e, di conseguenza, di tutte le possibili Macchine di Turing ($M_1, M_2, M_3, \dots$).

**Definizione Formale:**
$$L_d = \{ w_i \mid w_i \notin L(M_i) \}$$
In parole semplici, $L_d$ è l'insieme di tutte le stringhe binarie $w_i$ tali che la Macchina di Turing $M_i$ (quella codificata dalla stringa $w_i$) **non accetta** la sua stessa codifica come input.

---

### 🔹 2. A cosa serve?
Il linguaggio diagonale è lo strumento fondamentale per:
1. **Dimostrare l'esistenza di linguaggi non RE**: È il primo esempio di un linguaggio che non può essere riconosciuto da alcuna Macchina di Turing.
2. **Fondare la teoria dell'indecidibilità**: Serve come base per dimostrare che altri problemi, come il Problema della Fermata o il Linguaggio Universale, sono indecidibili o non ricorsivi.
3. **Mostrare la discrepanza di cardinalità**: Evidenzia che, poiché le MT sono numerabili ma i linguaggi possibili no, devono esistere linguaggi "senza macchina".

---

### 🔹 3. Classificazione e Dimostrazione

#### ❌ $L_d$ NON è Ricorsivamente Enumerabile (e quindi nemmeno Ricorsivo)
Un linguaggio è Ricorsivamente Enumerabile (RE) se esiste una MT in grado di accettare tutte le stringhe appartenenti ad esso.

**Dimostrazione per Assurdo (Diagonalizzazione):**
1. **Assunzione**: Supponiamo che $L_d$ sia RE. Allora deve esistere una Macchina di Turing, chiamiamola $M_k$, tale che $L(M_k) = L_d$.
2. **Il Test**: Chiediamoci se la stringa $w_k$ (la codifica di $M_k$) appartiene a $L_d$.
3. **Analisi del Paradosso**:
    * Se $w_k \in L_d$, allora per definizione di $L_d$ sappiamo che $w_k \notin L(M_k)$. Ma avevamo detto che $L(M_k)$ riconosce esattamente $L_d$, quindi $w_k \notin L_d$. (**Contraddizione**).
    * Se $w_k \notin L_d$, allora per definizione di $L_d$ deve essere $w_k \in L(M_k)$. Ma se $M_k$ accetta $w_k$, allora per definizione $w_k$ deve essere in $L_d$. (**Contraddizione**).
4. **Conclusione**: L'esistenza di $M_k$ è logicamente impossibile. Pertanto, **$L_d$ non è un linguaggio RE**.

---

### 🔹 4. Esempio Pratico (La Matrice)
Immaginiamo una tabella infinita dove le righe sono le macchine ($M_i$) e le colonne sono gli input ($w_j$). Il valore nella cella $(i, j)$ è **1** se $M_i$ accetta $w_j$, e **0** se non la accetta.



| | $w_1$ | $w_2$ | $w_3$ | ... | $w_i$ |
| :--- | :---: | :---: | :---: | :---: | :---: |
| **$M_1$** | **0** | 1 | 0 | ... | 1 |
| **$M_2$** | 0 | **1** | 1 | ... | 0 |
| **$M_3$** | 1 | 0 | **0** | ... | 1 |
| ... | ... | ... | ... | ... | ... |
| **$M_i$** | 0 | 1 | 1 | ... | **0** |

**Come si costruisce $L_d$ in questo esempio?**
* Guardiamo la **diagonale** (i valori in grassetto): indica se la macchina $i$-esima accetta l'input $i$-esimo.
* Il linguaggio diagonale $L_d$ prende questi valori e li **inverte** (0 diventa 1, 1 diventa 0).
* Nell'esempio sopra, $w_1$ e $w_3$ e $w_i$ andrebbero in $L_d$ perché sulla diagonale hanno **0** (ovvero $M_i$ non accetta $w_i$).
* Poiché $L_d$ differisce da ogni riga $M_i$ in almeno un punto (proprio sulla diagonale), $L_d$ non può corrispondere a nessuna riga della tabella. **Nessuna macchina può riconoscerlo**.