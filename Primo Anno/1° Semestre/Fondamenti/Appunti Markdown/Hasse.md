# 💎 Guida ai Reticoli: Meet, Join e Proprietà

## 1. Meet e Join: Definizioni e Intuizione

In un insieme parzialmente ordinato (poset), il **Meet** e il **Join** descrivono come due elementi si "incontrano" verso il basso o verso l'alto.

### 🔼 Join (Estremo Superiore)
* **Simbolo:** $a \lor b$
* **Definizione:** È il più piccolo dei maggioranti comuni tra $a$ e $b$.
* **Intuizione:** Immagina di risalire il diagramma di Hasse partendo da $a$ e $b$. Il Join è il **primo nodo** che incontri dove i due percorsi si ricongiungono risalendo.
* **Esempio (Divisibilità):** Se la relazione è $x|y$, il Join è il **minimo comune multiplo (m.c.m.)**.
    * *Esempio:* $Join(2, 3) = 6$ (se 6 è nell'insieme).

### 🔽 Meet (Estremo Inferiore)
* **Simbolo:** $a \land b$
* **Definizione:** È il più grande dei minoranti comuni tra $a$ e $b$.
* **Intuizione:** Immagina di scendere nel diagramma di Hasse partendo da $a$ e $b$. Il Meet è il **primo nodo** che incontri dove i due percorsi si ricongiungono scendendo.
* **Esempio (Divisibilità):** Se la relazione è $x|y$, il Meet è il **Massimo Comune Divisore (M.C.D.)**.
    * *Esempio:* $Meet(4, 6) = 2$.

---

## 2. Cos'è un Reticolo?

Un insieme parzialmente ordinato si dice **Reticolo** se e solo se **per ogni coppia di elementi** $a, b \in A$, esistono sempre sia il loro Meet ($a \land b$) che il loro Join ($a \lor b$) all'interno dell'insieme stesso.

> [!warning] Attenzione
> Se calcoli il Join di due elementi (es. il m.c.m.) ma il risultato **non appartiene** al tuo insieme $A$, allora la struttura **non è un reticolo**.

---

## 3. Proprietà Strutturali del Reticolo

### 📏 Reticolo Limitato
Un reticolo si dice **limitato** se possiede entrambi gli elementi neutri:
1.  **Minimo assoluto ($\bot$):** L'elemento più "basso" di tutti, tale che $\forall x, \bot \le x$.
2.  **Massimo assoluto ($\top$):** L'elemento più "alto" di tutti, tale che $\forall x, x \le \top$.

*In breve: se il diagramma di Hasse ha una "punta" in alto e un "fondo" unico in basso, è limitato.*

### ♾️ Reticolo Completo
Un reticolo si dice **completo** se ogni suo sottoinsieme (anche infinito o vuoto) possiede un estremo superiore (Sup) e un estremo inferiore (Inf) all'interno dell'insieme.

#### 💡 Regola pratica per l'esame:
* **Se l'insieme $A$ è FINITO:** Ogni reticolo che sia anche limitato (ovvero con massimo e minimo) è **automaticamente completo**.
* **Se l'insieme $A$ è INFINITO:** Potrebbe essere limitato ma non completo (es. l'intervallo $(0, 1)$ nei numeri reali non ha minimo e massimo nell'insieme, mentre $[0, 1]$ è completo).

---

## Tabella di Controllo Rapido
| Se vedi... | La struttura è... |
| :--- | :--- |
| Ogni coppia ha Sup e Inf in $A$ | **Reticolo** |
| C'è un unico $\top$ e un unico $\bot$ | **Limitato** |
| È un reticolo finito e limitato | **Completo** |