# 📈 Ripasso Taylor e Limiti per Analisi 2
> [!abstract] Perché sono fondamentali?
> I **Limiti** in due variabili non si risolvono più con De L'Hôpital (che non esiste in $\mathbb{R}^2$!). Gli **Sviluppi di Taylor** sono l'unico modo affidabile per studiare il comportamento locale delle funzioni e classificare i punti di massimo e minimo.

---

## 1. Sviluppi di Maclaurin (Taylor centrato in 0)
Questi sono i "mattoncini" per semplificare funzioni mostruose. Imparali a memoria.

| Funzione $f(x)$ | Sviluppo al 3° o 4° ordine | $o$-piccolo |
| :--- | :--- | :--- |
| $e^x$ | $1 + x + \frac{x^2}{2!} + \frac{x^3}{3!} + \dots$ | $+ o(x^n)$ |
| $\sin(x)$ | $x - \frac{x^3}{3!} + \frac{x^5}{5!} - \dots$ | $+ o(x^{2n+2})$ |
| $\cos(x)$ | $1 - \frac{x^2}{2!} + \frac{x^4}{4!} - \dots$ | $+ o(x^{2n+1})$ |
| $\ln(1+x)$ | $x - \frac{x^2}{2} + \frac{x^3}{3} - \dots$ | $+ o(x^n)$ |
| $(1+x)^\alpha$ | $1 + \alpha x + \frac{\alpha(\alpha-1)}{2!}x^2 + \dots$ | $+ o(x^n)$ |



---

## 2. Limiti e Forme Indeterminate
In Analisi 2 incontrerai spesso $\frac{0}{0}$ o $\infty \cdot 0$.

### Limiti Notevoli (da non dimenticare)
* $\lim_{x \to 0} \frac{\sin x}{x} = 1$
* $\lim_{x \to 0} \frac{1 - \cos x}{x^2} = \frac{1}{2}$
* $\lim_{x \to 0} \frac{e^x - 1}{x} = 1$
* $\lim_{x \to 0} \frac{\ln(1+x)}{x} = 1$

### Gerarchia degli Infiniti
Quando hai $x \to \infty$, vince chi cresce più velocemente:
$$\ln(x) \ll x^\alpha \ll e^x \ll x^x$$



---

## 3. Gestione del "Piccolo o" ($o$)
Le regole per manipolare gli scarti di Taylor:
* $o(x^n) \pm o(x^n) = o(x^n)$
* $x^m \cdot o(x^n) = o(x^{n+m})$
* $o(x^n) \cdot o(x^m) = o(x^{n+m})$
* $o(k \cdot x^n) = o(x^n)$

---

## 4. 🚀 Taylor in Analisi 2: Cosa ti aspetta
In Analisi 2 userai Taylor per approssimare una funzione $f(x,y)$ vicino a un punto critico $(x_0, y_0)$:

1. **Ordine 0:** Valore della funzione $f(x_0, y_0)$.
2. **Ordine 1:** Piano tangente (usa le derivate prime $\to$ Gradiente).
3. **Ordine 2:** Curvatura della superficie (usa le derivate seconde $\to$ Matrice Hessiana).

> [!tip] Trucco per i limiti in $\mathbb{R}^2$
> Se un limite in due variabili sembra risolvibile con Taylor, sostituisci le funzioni con i loro sviluppi di Maclaurin. Se il limite dipende dall'angolo $\theta$ (usando le polari), allora il limite **non esiste**.

---
#Analisi2 #Taylor #Limiti #Ripasso #Matematica