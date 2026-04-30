# 🗺️ Mappa del Ripasso per Analisi 2
> [!info] Intro
> Analisi 2 è sostanzialmente Analisi 1 "estesa" a più dimensioni. Se queste basi sono solide, il 60% della fatica è fatto.

---

## 1. 📈 Derivate: Il Motore del Calcolo
Le derivate parziali e il gradiente si basano interamente su queste regole.

| Funzione $f(x)$ | Derivata $f'(x)$ |
| :--- | :--- |
| $x^n$ | $n x^{n-1}$ |
| $e^{ax}$ | $a e^{ax}$ |
| $\ln(x)$ | $1/x$ |
| $\sin(x)$ | $\cos(x)$ |
| $\cos(x)$ | $-\sin(x)$ |
| $\arctan(x)$ | $1 / (1+x^2)$ |

> [!danger] La Regola della Catena (Chain Rule)
> Fondamentale per le derivate composte:
> $$D[f(g(x))] = f'(g(x)) \cdot g'(x)$$

---

## 2. 🌀 Integrali: Calcolo di Aree e Volumi
In Analisi 2 userai gli integrali doppi e tripli. Dovrai risolvere "pezzi" di integrali a una variabile uno dopo l'altro.

### Metodi Fondamentali
1. **Per Parti:** $\int f \cdot g' = f \cdot g - \int f' \cdot g$
2. **Per Sostituzione:** $\int f(g(x)) g'(x) dx = \int f(t) dt$ (ponendo $t = g(x)$)



---

## 3. 📏 Sviluppi di Taylor
Servono per approssimare funzioni complicate e studiare i punti critici (Massimi/Minimi) tramite la matrice Hessiana.

**Formula base (centrata in $a$):**
$$f(x) \approx f(a) + f'(a)(x-a) + \frac{f''(a)}{2!}(x-a)^2 + \dots$$



---

## 4. 🌍 Coordinate Polari & Goniometria
Molti problemi di Analisi 2 hanno simmetria circolare. Passare alle polari salva la vita (e i calcoli).

**Trasformazione standard:**
- $x = \rho \cos(\theta)$
- $y = \rho \sin(\theta)$
- $x^2 + y^2 = \rho^2$



### Valori Goniometrici "Must-Know"
| $\theta$ | $\sin(\theta)$ | $\cos(\theta)$ |
| :--- | :--- | :--- |
| $0$ | $0$ | $1$ |
| $\pi/6$ ($30^\circ$) | $1/2$ | $\sqrt{3}/2$ |
| $\pi/4$ ($45^\circ$) | $\sqrt{2}/2$ | $\sqrt{2}/2$ |
| $\pi/3$ ($60^\circ$) | $\sqrt{3}/2$ | $1/2$ |
| $\pi/2$ ($90^\circ$) | $1$ | $0$ |

---

## 5. 📉 Geometria Analitica Rapida
Dovrai spesso disegnare il "dominio" di integrazione. Ripassa le equazioni di:
- **Circonferenza:** $(x-x_0)^2 + (y-y_0)^2 = r^2$
- **Ellisse:** $\frac{x^2}{a^2} + \frac{y^2}{b^2} = 1$
- **Parabola:** $y = ax^2 + bx + c$

---
#Analisi2 #Università #Matematica #Ripasso