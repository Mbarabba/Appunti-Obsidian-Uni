# 🌀 Ripasso Integrali per Analisi 2
> [!abstract] Perché ripassarli?
> In Analisi 2 non risolverai quasi mai un integrale "singolo". Dovrai però risolvere **integrali iterati** (uno dentro l'altro). Se la tecnica di integrazione a una variabile è incerta, l'errore è garantito.

---

## 1. Tabella delle Primitive Fondamentali
| Funzione $f(x)$ | Integrale $\int f(x) dx$ | Note |
| :--- | :--- | :--- |
| $x^n$ | $\frac{x^{n+1}}{n+1} + c$ | Vale per $n \neq -1$ |
| $\frac{1}{x}$ | $\ln|x| + c$ | Caso $n = -1$ |
| $e^{ax}$ | $\frac{1}{a} e^{ax} + c$ | Molto comune nei flussi |
| $\sin(ax)$ | $-\frac{1}{a}\cos(ax) + c$ | |
| $\cos(ax)$ | $\frac{1}{a}\sin(ax) + c$ | |
| $\frac{1}{1+x^2}$ | $\arctan(x) + c$ | Fondamentale per le frazioni razionali |
| $\frac{1}{\sqrt{1-x^2}}$ | $\arcsin(x) + c$ | |

---

## 2. Tecniche di Integrazione "Salvavita"

### A. Integrazione per Parti
Da usare quando hai un prodotto di funzioni (es. $x e^x$, $x \sin(x)$).
> [!formula] Formula
> $$\int f(x)g'(x) dx = f(x)g(x) - \int f'(x)g(x) dx$$

### B. Integrazione per Sostituzione
Fondamentale per i **cambi di variabile** (es. coordinate polari, cilindriche, sferiche).
> [!example] Procedura
> 1. Scegli $t = g(x)$
> 2. Calcola il differenziale $dt = g'(x)dx$
> 3. Sostituisci tutto nell'integrale e risolvi in $t$.

---

## 3. Integrali di Funzioni Razionali Fratte
Spesso in Analisi 2 i calcoli portano a frazioni del tipo $\frac{P(x)}{Q(x)}$.
* **Grado Num < Grado Den:** Si scompone il denominatore (metodo dei fratti semplici / fratti parziali).
* **Grado Num $\ge$ Grado Den:** Si esegue prima la divisione tra polinomi.

---

## 4. 💡 Tips per Analisi 2
> [!todo] Cosa tenere a mente
> 1. **Linearità:** L'integrale della somma è la somma degli integrali. Usalo per "spezzare" problemi complessi.
> 2. **Simmetrie:** Se integri una funzione **dispari** su un intervallo simmetrico $[-a, a]$, il risultato è **0**. In Analisi 2 risparmierai ore di calcolo se noti le simmetrie del dominio.
> 3. **Teorema Fondamentale:** Ricorda che $\int_a^b f(x) dx = F(b) - F(a)$. Gli errori di segno qui sono i più frequenti.

---

## 5. Formule Goniometriche Utili per Integrali
Spesso incontrerai $\sin^2(x)$ o $\cos^2(x)$ integrando su cerchi o sfere:
* $\cos^2(x) = \frac{1 + \cos(2x)}{2}$
* $\sin^2(x) = \frac{1 - \cos(2x)}{2}$
* $\sin(x)\cos(x) = \frac{1}{2}\sin(2x)$

---
#Analisi2 #Matematica #Ripasso #Integrali