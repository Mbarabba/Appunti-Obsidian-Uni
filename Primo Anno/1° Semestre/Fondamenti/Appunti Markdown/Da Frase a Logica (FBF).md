---

## 🧱 1. I Componenti Fondamentali

Prima di scrivere la formula, devi dichiarare i tuoi strumenti (il "Dizionario").

### 👤 Costanti
Rappresentano individui o oggetti specifici (nomi propri).
* **Esempio:** Marco $\to m$, Lucia $\to l$, Zeus $\to z$.
* **Uso:** Si scrivono sempre in minuscolo.

### 🏷️ Predicati
Esprimono proprietà o relazioni tra oggetti.
* **Unari (Proprietà):** $Dio(x)$ significa "$x$ è un dio".
* **Binari (Relazioni):** $Nonno(x, y)$ significa "$x$ è nonno di $y$".

### ⚙️ Funzioni
Restituiscono un **unico** oggetto specifico partendo da un altro.
* **Esempio:** $proc(x)$ per "il procuratore di $x$".
* **Uso:** Usale solo quando sei sicuro che l'oggetto sia unico (es. "la madre di", "il cartellino di").

---

## 🔗 2. Connettivi e Quantificatori



| Nome | Simbolo | Linguaggio Naturale |
| :--- | :---: | :--- |
| **NOT** | $\neg$ | "non", "non è vero che" |
| **AND** | $\wedge$ | "e", "ma", "contemporaneamente" |
| **OR** | $\vee$ | "o", "oppure" |
| **IMPLICA** | $\to$ | "se... allora", "ogni volta che" |
| **DOPPIA IMPL.** | $\leftrightarrow$ | "se e solo se" |

### 🌍 I Quantificatori (Le Coppie Obbligatorie)
> [!IMPORTANT]
> 1. **$\forall x$ (Universale) + $\to$ (Implicazione):** Si usa per le categorie ("Tutti gli A sono B").
> 2. **$\exists x$ (Esistenziale) + $\wedge$ (Congiunzione):** Si usa per l'esistenza ("Esiste un A che è B").

---

## 🚀 3. Esercizi Guidati Passo-Passo

### Esempio 1: La Categoria (Esercizio 1.1)
**Frase:** *"Tutti i nonni sono anche antenati"*.

1. **Simboli:** $N(x)$: "$x$ è nonno"; $A(x)$: "$x$ è antenato".
2. **Logica:** "Se un individuo è un nonno, allora è necessariamente un antenato".
3. **Costruzione:**
   * Usiamo $\forall x$ perché parliamo di "Tutti".
   * Usiamo $\to$ perché è una proprietà condizionata.
**FBF:** $$\forall x (N(x) \to A(x))$$

---

### Esempio 2: L'Unicità e le Funzioni (Domanda 9.3)
**Frase:** *"Vlahovic e Lukaku hanno lo stesso procuratore"*.

1. **Simboli:** $v$: Vlahovic; $l$: Lukaku; $proc(x)$: funzione procuratore.
2. **Logica:** "Il procuratore di Vlahovic è identico al procuratore di Lukaku".
3. **Costruzione:** Poiché il procuratore è un oggetto unico restituito dalla funzione, usiamo l'uguaglianza.
**FBF:** $$proc(v) = proc(l)$$

---

### Esempio 3: Esistenza e Differenza (Esercizio 2.1)
**Frase:** *"Zeus ha almeno due figli"*.

1. **Simboli:** $z$: Zeus; $F(x, y)$: "$x$ è figlio di $y$".
2. **Logica:** "Esistono due individui diversi che sono entrambi figli di Zeus".
3. **Costruzione:**
   * Usiamo $\exists x \exists y$ per indicare i due figli.
   * Dobbiamo aggiungere $x \neq y$ per garantire che siano "almeno due" distinti.
**FBF:** $$\exists x \exists y (F(x, z) \wedge F(y, z) \wedge x \neq y)$$

---

## ⚠️ Checklist Anti-Errore
- [ ] **$\forall$ con $\wedge$?** NO! (Significherebbe che ogni cosa nell'universo ha entrambe le proprietà).
- [ ] **$\exists$ con $\to$?** NO! (Sarebbe vera anche se l'oggetto non esiste o non appartiene alla categoria).
- [ ] **Simboli dichiarati?** Assicurati di aver scritto costanti, predicati e funzioni prima della formula.
- [ ] **Parentesi?** Controlla che il quantificatore copra tutta la formula necessaria.

---