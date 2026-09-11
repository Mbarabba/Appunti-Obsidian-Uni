# 📚 La Proprietà del Prefisso (Dimostrazioni Formali)

### 🔹 Definizione Formale
Un linguaggio $L$ gode della **proprietà del prefisso** se:
$$\forall x, y \in L, x = yz \implies z = \epsilon$$
In altre parole, se $x$ e $y$ appartengono a $L$ e $x$ inizia come $y$, allora $x$ deve essere identica a $y$.

---

### 🛠️ Metodo di Dimostrazione: "Generic String Proof"
Per dimostrare che un linguaggio **è** Prefix-Free:
1.  **Definisci una stringa generica** $x \in L$ usando variabili (es. $x = a^n b^n$).
2.  **Ipotizza un'estensione** $y = xz$ con $z \neq \epsilon$.
3.  **Analizza la struttura di $y$**: Verifica se $y$ può rispettare la forma e i vincoli di $L$.
4.  **Trova la contraddizione**: Mostra che per rispettare i vincoli di $L$, $z$ dovrebbe essere vuoto.

---

### ✅ 3 Esempi di Linguaggi PREFIX-FREE (Dimostrazione Formale)

#### 1. Bilanciamento: $L = \{ a^n b^n \mid n \ge 1 \}$
* **Stringa generica $x$**: $x = a^n b^n$.
* **Assunzione**: Esista $y = xz \in L$ con $z \neq \epsilon$.
* **Analisi**: Poiché $y \in L$, deve avere la forma $a^k b^k$. Quindi $y = a^n b^n z = a^k b^k$.
* **Contraddizione**: Se $z$ inizia con $b$, allora $y$ avrebbe più $b$ che $a$ ($b^{n+|z|} \neq a^n$), violando $n=k$. Se $z$ inizia con $a$, violerebbe l'ordine dei caratteri (una $a$ dopo una $b$). L'unica soluzione è $z = \epsilon$.
* **Conclusione**: **È Prefix-Free**.

#### 2. Struttura Annidata: $L = \{ a^n b^m c^m d^n \mid n, m \ge 1 \}$
* **Stringa generica $x$**: $x = a^n b^m c^m d^n$.
* **Assunzione**: Esista $y = xz \in L$. Quindi $y = a^n b^m c^m d^n z = a^{n'} b^{m'} c^{m'} d^{n'}$.
* **Analisi**: Poiché $y$ deve iniziare con $a^{n'}$, e $x$ inizia con $a^n$, deve essere $n' = n$. Di conseguenza, $y$ deve finire con esattamente $n$ lettere $d$. 
* **Contraddizione**: Ma $x$ contiene già tutte le $n$ lettere $d$ alla sua fine. Se $z$ contenesse qualsiasi carattere, questo apparirebbe **dopo** l'ultima $d$ di $x$, rompendo l'ordine alfabetico o eccedendo il numero di $d$ consentite.
* **Conclusione**: **È Prefix-Free**.

#### 3. Vincoli Incatenati: $L = \{ 0^m 1^{n+m} 2^{n+1} \mid m > 0, n \ge 0 \}$
* **Stringa generica $x$**: $x = 0^m 1^{n+m} 2^{n+1}$.
* **Assunzione**: Esista $y = xz = 0^{m'} 1^{n'+m'} 2^{n'+1}$.
* **Analisi**: Per l'uguaglianza dei prefissi, $m' = m$. Se $z$ aggiunge dei '2' alla fine, l'esponente dei '2' in $y$ diventa $(n+1) + |z|$.
* **Contraddizione**: Per la definizione di $L$, se l'esponente dei '2' aumenta a $n'+1$, allora anche l'esponente degli '1' deve aumentare a $n'+m$. Ma gli '1' in $y$ sono "bloccati" dentro il prefisso $x$ e il loro numero è fisso a $n+m$. È impossibile aumentare $n$ solo per il blocco '2' senza cambiare il blocco '1'.
* **Conclusione**: **È Prefix-Free**.

---

### ❌ 3 Esempi di Linguaggi NON PREFIX-FREE (Controesempio Formale)

#### 1. Disuguaglianza: $L = \{ a^n b^m \mid n > m \ge 1 \}$
* **Dimostrazione**: Sia $x = a^n b^m$ con $n=3, m=1 \implies x = aaab \in L$. 
* **Estensione**: Sia $z = b$. Allora $y = xz = aaabb$.
* **Verifica**: In $y$, $n=3$ e $m=2$. Poiché $3 > 2$ è ancora vero, $y \in L$. 
* **Esito**: Esistono $x, y \in L$ con $x$ prefisso di $y$. **NON è Prefix-Free**.

#### 2. Coda Opzionale: $L = \{ a^n b^n c^k \mid n \ge 1, k \ge 0 \}$
* **Dimostrazione**: Sia $x = a^n b^n c^0$ ($k=0$) e $y = a^n b^n c^1$ ($k=1$).
* **Verifica**: Entrambe le stringhe appartengono a $L$ per ogni $n \ge 1$. Chiaramente $x$ è prefisso di $y$.
* **Esito**: **NON è Prefix-Free**.

#### 3. Linguaggi con simboli Jolly: $L = \{ 0w \mid w \in \{0, 1\}^* \}$
* **Dimostrazione**: Sia $x = 0$ (dove $w = \epsilon$) e $y = 00$ (dove $w = 0$).
* **Verifica**: Entrambe iniziano con $0$, quindi appartengono a $L$. $x$ è prefisso di $y$.
* **Esito**: **NON è Prefix-Free**.
