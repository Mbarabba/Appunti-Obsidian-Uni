# 📚 Analisi Matematica: Le Derivate

## 1. Cosa sono le derivate?
La **derivata** di una funzione è uno dei concetti cardine dell'analisi matematica. Rappresenta la misura di quanto il valore di una funzione cambi al variare del suo argomento.

- **Significato Geometrico**: La derivata di $f(x)$ in un punto $x_0$ è il **coefficiente angolare** (la pendenza) della retta tangente al grafico della funzione nel punto $(x_0, f(x_0))$.
- **Significato Fisico**: Rappresenta il **tasso di variazione istantaneo**. Ad esempio, la derivata della posizione rispetto al tempo è la velocità istantanea.

---

## 2. Come calcolarle (Il Limite)
Matematicamente, la derivata $f'(x)$ è definita come il **limite del rapporto incrementale** al tendere dell'incremento $h$ a zero:

$$f'(x) = \lim_{h \to 0} \frac{f(x+h) - f(x)}{h}$$

Se questo limite esiste ed è finito, la funzione si dice *derivabile* in quel punto.

---

## 3. Derivate Fondamentali
Per velocizzare i calcoli, si utilizzano delle derivate già note derivanti dalla definizione sopra:

| Funzione $f(x)$ | Derivata $f'(x)$ |
| :--- | :--- |
| $c$ (costante) | $0$ |
| $x^n$ | $n \cdot x^{n-1}$ |
| $e^x$ | $e^x$ |
| $\ln(x)$ | $\frac{1}{x}$ |
| $\sin(x)$ | $\cos(x)$ |
| $\cos(x)$ | $-\sin(x)$ |
| $\tan(x)$ | $\frac{1}{\cos^2(x)} = 1 + \tan^2(x)$ |

---

## 4. Derivate di Funzioni Composte
Quando abbiamo una funzione dentro l'altra, del tipo $y = f(g(x))$, si applica la **Regola della Catena** (Chain Rule).

### Formula:
$$D[f(g(x))] = f'(g(x)) \cdot g'(x)$$

### Procedura:
1. Si deriva la funzione **esterna** ($f$), mantenendo invariato l'argomento interno ($g(x)$).
2. Si moltiplica il risultato per la derivata della funzione **interna** ($g'(x)$).

**Esempio:**
Calcolare la derivata di $y = \ln(\sin(x))$
- Funzione esterna: $\ln(u) \to \frac{1}{u}$
- Funzione interna: $\sin(x) \to \cos(x)$
- **Risultato**: $y' = \frac{1}{\sin(x)} \cdot \cos(x) = \cot(x)$

---

## 5. Regole di Derivazione Rapide
- **Somma**: $(f \pm g)' = f' \pm g'$
- **Prodotto**: $(f \cdot g)' = f'g + fg'$
- **Quoziente**: $\left(\frac{f}{g}\right)' = \frac{f'g - fg'}{g^2}$

#matematica #analisi #derivate #studio