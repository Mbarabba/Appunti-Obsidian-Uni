# ♾️ Analisi Matematica: Gli Integrali

## 1. Cosa sono gli integrali?
L'integrazione è l'operazione inversa della derivazione. Se la derivata misura la pendenza, l'integrale misura l'accumulo.

- **Integrale Indefinito**: Rappresenta l'insieme di tutte le "primitive" di una funzione. Se $F'(x) = f(x)$, allora l'integrale di $f(x)$ è $F(x) + c$.
- **Integrale Definito**: Rappresenta l'**area netta** compresa tra il grafico della funzione e l'asse delle $x$ in un intervallo chiuso $[a, b]$.
- **Significato Fisico**: Ad esempio, l'integrale della velocità nel tempo fornisce lo spazio percorso.

---

## 2. Il Teorema Fondamentale del Calcolo
Per calcolare un integrale definito si usa la formula di Newton-Leibniz:

$$\int_{a}^{b} f(x) \, dx = F(b) - F(a)$$

Dove $F$ è una primitiva di $f$.

---

## 3. Integrali Fondamentali (Tabella)
Ecco gli integrali immediati più comuni (non dimenticare mai la costante $+ c$!):

| Funzione $f(x)$ | Integrale $\int f(x) dx$ | Note |
| :--- | :--- | :--- |
| $0$ | $c$ | Costante |
| $k$ | $kx + c$ | |
| $x^n$ | $\frac{x^{n+1}}{n+1} + c$ | Valido per $n \neq -1$ |
| $\frac{1}{x}$ | $\ln|x| + c$ | Il caso $n = -1$ |
| $e^x$ | $e^x + c$ | |
| $\sin(x)$ | $-\cos(x) + c$ | Attenzione al segno! |
| $\cos(x)$ | $\sin(x) + c$ | |
| $\frac{1}{\cos^2(x)}$ | $\tan(x) + c$ | |

---

## 4. Integrazione di Funzioni Composte
Esistono due metodi principali per gestire funzioni non immediate:

### A. Integrazione per Sostituzione
Si usa per "semplificare" l'integrale cambiando variabile. È l'inverso della regola della catena delle derivate.
Se abbiamo $\int f(g(x))g'(x) dx$, poniamo $u = g(x)$ e $du = g'(x)dx$:
$$\int f(u) \, du$$

### B. Integrazione per Parti
Si usa quando abbiamo il prodotto di due funzioni. Deriva dalla regola di derivazione del prodotto:
$$\int f(x) \cdot g'(x) \, dx = f(x) \cdot g(x) - \int f'(x) \cdot g(x) \, dx$$
*Trucco: Scegli come $f(x)$ la funzione che si semplifica derivandola (es. polinomi o logaritmi).*

---

## 5. Formule per Funzioni Composte "Immediate"
Molto utili per calcoli rapidi:
- $\int [f(x)]^n \cdot f'(x) \, dx = \frac{[f(x)]^{n+1}}{n+1} + c$
- $\int \frac{f'(x)}{f(x)} \, dx = \ln|f(x)| + c$
- $\int e^{f(x)} \cdot f'(x) \, dx = e^{f(x)} + c$

---
#matematica #analisi #integrali #studio