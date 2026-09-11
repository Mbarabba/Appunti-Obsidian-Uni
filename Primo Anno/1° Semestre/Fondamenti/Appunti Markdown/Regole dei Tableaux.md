# 📑 Cheat Sheet Completo: Regole dei Tableaux Semantici
**Ambito:** Logica Proposizionale e Predicativa
**Nota sulla persistenza:** Le regole di tipo $\gamma$ (Universali) devono essere mantenute nel ramo dopo l'applicazione per garantire che possano essere riutilizzate con nuove costanti.

---

## 1. Negazione ($\neg$)
| Caso | Regola | Tipo | Azione |
| :--- | :--- | :--- | :--- |
| **$T(\neg A)$** | $F(A)$ | $\alpha$ | Scrivi $F(A)$ sotto la formula. |
| **$F(\neg A)$** | $T(A)$ | $\alpha$ | Scrivi $T(A)$ sotto la formula. |

---

## 2. Congiunzione ($\land$)
| Caso | Regola | Tipo | Azione |
| :--- | :--- | :--- | :--- |
| **$T(A \land B)$** | $T(A)$, $T(B)$ | $\alpha$ | Scrivi $T(A)$ e $T(B)$ uno sotto l'altro. |
| **$F(A \land B)$** | $F(A) \mid F(B)$ | $\beta$ | Apri un ramo con $F(A)$ e uno con $F(B)$. |

---

## 3. Disgiunzione ($\lor$)
| Caso | Regola | Tipo | Azione |
| :--- | :--- | :--- | :--- |
| **$T(A \lor B)$** | $T(A) \mid $T(B)$ | $\beta$ | Apri un ramo con $T(A)$ e uno con $T(B)$. |
| **$F(A \lor B)$** | $F(A)$, $F(B)$ | $\alpha$ | Scrivi $F(A)$ e $F(B)$ uno sotto l'altro. |

---

## 4. Implicazione ($\to$)
| Caso | Regola | Tipo | Azione |
| :--- | :--- | :--- | :--- |
| **$T(A \to B)$** | $F(A) \mid T(B)$ | $\beta$ | Apri un ramo con $F(A)$ e uno con $T(B)$. |
| **$F(A \to B)$** | $T(A)$, $F(B)$ | $\alpha$ | Scrivi $T(A)$ e $F(B)$ uno sotto l'altro. |

---

## 5. Bicondizionale ($\leftrightarrow$)
| Caso | Regola | Tipo | Azione |
| :--- | :--- | :--- | :--- |
| **$T(A \leftrightarrow B)$** | $(T(A), T(B)) \mid (F(A), F(B))$ | $\beta$ | Bivio: entrambi veri o entrambi falsi. |
| **$F(A \leftrightarrow B)$** | $(T(A), F(B)) \mid (F(A), T(B))$ | $\beta$ | Bivio: valori opposti (uno V e uno F). |

---

## 6. Quantificatore Universale ($\forall$)
| Caso | Tipo | Costante | Azione Corretta |
| :--- | :--- | :--- | :--- |
| **$T(\forall x \phi(x))$** | **$\gamma$** | Qualsiasi $a$ | Scrivi $T(\phi(a))$ e **MANTIENI** $T(\forall x \phi(x))$ nel ramo. |
| **$F(\forall x \phi(x))$** | **$\delta$** | **NUOVA** $a$ | Scrivi $F(\phi(a))$ (la formula originale non serve più). |

---

## 7. Quantificatore Esistenziale ($\exists$)
| Caso | Tipo | Costante | Azione Corretta |
| :--- | :--- | :--- | :--- |
| **$T(\exists x \phi(x))$** | **$\delta$** | **NUOVA** $a$ | Scrivi $T(\phi(a))$ (la formula originale non serve più). |
| **$F(\exists x \phi(x))$** | **$\gamma$** | Qualsiasi $a$ | Scrivi $F(\phi(a))$ e **MANTIENI** $F(\exists x \phi(x))$ nel ramo. |

---

> [!tip] Strategia per la Logica dei Predicati
> - Applica sempre prima le regole **$\delta$ (Esistenziali)**: queste richiedono una costante nuova, quindi è meglio "fissarle" subito.
> - Applica le regole **$\gamma$ (Universali)** usando le costanti già introdotte nel ramo.
> - Non rimuovere mai le formule $\gamma$: se compaiono nuove costanti più avanti nel ramo, dovrai riapplicare la formula universale anche a quelle.