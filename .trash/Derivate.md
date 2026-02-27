# 🧠 Ripasso Derivate: Fondamenta per Analisi II

> [!IMPORTANT] Perché ripassare ora?
> In Analisi 2 non imparerai nuove regole di derivazione, ma applicherai queste a funzioni con più variabili. Se non padroneggi la **Chain Rule** e le **Derivate Fondamentali**, i calcoli diventeranno un incubo.

---

## 1. Il Significato Geometrico
La derivata $f'(x)$ è il **coefficiente angolare** della retta tangente al grafico nel punto $x$.
- Se $f'(x) > 0$, la funzione sale.
- Se $f'(x) < 0$, la funzione scende.
- Se $f'(x) = 0$, siamo in un punto stazionario (massimo, minimo o flesso).



---

## 2. Tabella Rapida delle Derivate "Must-Know"
Copia questa tabella e assicurati di non doverla consultare mentre risolvi gli esercizi.

| Funzione $f(x)$ | Derivata $f'(x)$ | Note |
| :--- | :--- | :--- |
| $x^n$ | $n \cdot x^{n-1}$ | Es: $D(x^3) = 3x^2$; $D(\sqrt{x}) = \frac{1}{2\sqrt{x}}$ |
| $e^x$ | $e^x$ | Invariata |
| $\ln(x)$ | $\frac{1}{x}$ | Per $x > 0$ |
| $\sin(x)$ | $\cos(x)$ | |
| $\cos(x)$ | $-\sin(x)$ | **Occhio al segno!** |
| $\tan(x)$ | $\frac{1}{\cos^2(x)}$ | O anche $1 + \tan^2(x)$ |
| $\arctan(x)$ | $\frac{1}{1+x^2}$ | **Frequente in Analisi 2** |
| $\arcsin(x)$ | $\frac{1}{\sqrt{1-x^2}}$ | |

---

## 3. Regole di Calcolo (Algebra delle Derivate)
Siano $u$ e $v$ due funzioni di $x$:

1. **Prodotto**: $D(u \cdot v) = u'v + uv'$
2. **Quoziente**: $D\left(\frac{u}{v}\right) = \frac{u'v - uv'}{v^2}$
3. **Costante**: $D(k \cdot u) = k \cdot u'$ (La costante "esce" dalla derivata)

---

## 4. La Regola della Catena (Chain Rule) ⚡
Questa è la regola più importante per Analisi 2. Serve a derivare funzioni composte $f(g(x))$.

**Formula:**
$$[f(g(x))]' = f'(g(x)) \cdot g'(x)$$

**Esempio Mentale (L'anello di cipolla):**
Deriva prima la parte esterna (lasciando stare l'interno) e poi moltiplica per la derivata di quello che c'è dentro.

- **Esempio**: $D(\ln(\cos(x)))$
  1. Derivo il logaritmo: $\frac{1}{\cos(x)}$
  2. Moltiplico per la derivata del coseno: $-\sin(x)$
  3. Risultato: $-\frac{\sin(x)}{\cos(x)} = -\tan(x)$

---

## 5. Casi Particolari da Ricordare
In Analisi 2 incontrerai spesso radici e potenze al denominatore. Ripassa queste scorciatoie:
- **Radice**: $D(\sqrt{f(x)}) = \frac{f'(x)}{2\sqrt{f(x)}}$
- **Potenza negativa**: $D\left(\frac{1}{x^n}\right) = D(x^{-n}) = -n \cdot x^{-n-1}$
- **Funzione elevata a funzione**: $f(x)^{g(x)}$ si deriva trasformandola prima in $e^{g(x)\ln(f(x))}$.

---

## 6. Sviluppi di Taylor (Cenni)
In Analisi 2 userai spesso Taylor per studiare i punti critici. Ricorda la formula base centrata in $x=0$:
$$f(x) \approx f(0) + f'(0)x + \frac{f''(0)}{2!}x^2 + \dots$$

---
#ripasso #analisi1 #derivate #fondamentali