# 📂 Guida alle Funzioni: Proprietà e Composizione

Una funzione $f: A \to B$ è una relazione che associa a ogni elemento dell'insieme di partenza $A$ (Dominio) **uno e un solo** elemento dell'insieme di arrivo $B$ (Codominio).

---

## 1. Proprietà delle Funzioni: Come riconoscerle
Per capire se una funzione è Iniettiva, Suriettiva o Biunivoca, dobbiamo guardare come gli elementi di $A$ "colpiscono" quelli di $B$.

### 🎯 Iniettività (Uno a Uno)
**Definizione**: Elementi distinti di $A$ hanno immagini distinte in $B$.
- **Test Matematico**: Se $f(x_1) = f(x_2)$, allora deve risultare $x_1 = x_2$.
- **Come riconoscerla**: 
    - Graficamente: Ogni linea orizzontale tocca il grafico **al massimo una volta**.
    - Esempio: $f(n) = 2n$ è iniettiva. $f(n) = n^2$ (su $\mathbb{Z}$) **non** lo è perché $f(-2) = 4$ e $f(2) = 4$.

### 🌊 Suriettività (Copertura Totale)
**Definizione**: Ogni elemento del Codominio $B$ è immagine di almeno un elemento del Dominio $A$. In breve: **Immagine = Codominio**.
- **Test Matematico**: L'equazione $y = f(x)$ deve avere sempre almeno una soluzione per ogni $y \in B$.
- **Come riconoscerla**:
    - Graficamente: Ogni linea orizzontale tocca il grafico **almeno una volta**.
    - Esempio: $f: \mathbb{R} \to \mathbb{R}$ con $f(x) = x + 1$ è suriettiva. $f: \mathbb{R} \to \mathbb{R}$ con $f(x) = e^x$ **non** lo è (non produce mai valori negativi).

### 🔄 Biunivocità (Biettiva)
**Definizione**: La funzione è sia **Iniettiva** che **Suriettiva**.
- **Caratteristica**: Esiste un accoppiamento perfetto 1-a-1 tra tutti gli elementi di $A$ e tutti quelli di $B$.
- **Conseguenza**: Solo le funzioni biunivoche sono **Invertibili** ($f^{-1}$).



---

## 2. Composizione di Funzioni ($g \circ f$)

La composizione consiste nell'applicare una funzione dopo l'altra. Scriviamo $(g \circ f)(x)$ per intendere $g(f(x))$.

### 🕵️‍♂️ Quando è possibile comporre? (Il Test)
Siano $f: A \to B$ e $g: C \to D$.
La composizione $g \circ f$ si può fare **SOLO SE** l'output della prima funzione è compatibile con l'input della seconda.

> **Regola d'oro**: Il Codominio di $f$ (o meglio, la sua Immagine) deve essere contenuto nel Dominio di $g$.
> $$Im(f) \subseteq C$$

**Esempio di Errore**:
- $f: \mathbb{R} \to \mathbb{R}$ con $f(x) = -5$
- $g: \mathbb{R}^+ \to \mathbb{R}$ con $g(x) = \sqrt{x}$
- **Analisi**: $f$ sputa fuori $-5$. Ma $g$ accetta solo numeri positivi. Quindi $g(f(x))$ è **impossibile** da calcolare.

### 🛠 Come si calcola la composizione?
Per calcolare $(g \circ f)(x)$, devi prendere l'intera espressione di $f(x)$ e sostituirla al posto della variabile $x$ dentro $g$.

**Esempio Passo-Passo**:
1. $f(n) = 2n + 1$
2. $g(n) = n - 3$
3. $(g \circ f)(n) = g(f(n))$
4. Sostituisco $f(n)$ dentro $g$: $(2n + 1) - 3$
5. Risultato: $2n - 2$.

---

## 📊 Tabella Riassuntiva Composizione

| Domanda | Risposta |
| :--- | :--- |
| **Ordine di lettura** | $(g \circ f)$ significa: "fai prima $f$, poi $g$". |
| **Condizione esistenza** | L'insieme di arrivo di $f$ deve "entrare" in quello di partenza di $g$. |
| **Proprietà Commutativa** | **NO**. In generale $(g \circ f) \neq (f \circ g)$. |
| **Identità** | $f \circ f^{-1} = id$ (ritorni al punto di partenza). |

```mermaid
graph LR
    X((x)) -- f --> FX((f(x)))
    FX -- g --> GFX((g(f(x))))
    X -. g o f .-> GFX
```

> [!warning] Attenzione all'ordine
> Molti studenti sbagliano l'ordine. Ricorda: la funzione più a destra nella scrittura $(g \circ f)$ è quella che viene applicata **per prima** sulla $x$.