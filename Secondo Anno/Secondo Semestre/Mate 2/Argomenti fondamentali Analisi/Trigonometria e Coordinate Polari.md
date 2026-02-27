# 🎡 Trigonometria e Coordinate Polari
> [!abstract] L'arma segreta di Analisi 2
> In Analisi 2, passare dalle coordinate cartesiane $(x, y)$ a quelle polari $(\rho, \theta)$ trasforma integrali impossibili in calcoli banali. È fondamentale saper passare da un sistema all'altro "a vista".

---

## 1. Relazioni Fondamentali
Dato un punto $P(x, y)$ e la sua distanza dall'origine $\rho$ con angolo $\theta$:

$$x = \rho \cos(\theta)$$
$$y = \rho \sin(\theta)$$
$$x^2 + y^2 = \rho^2$$

> [!formula] Relazione Pitagorica
> $$\cos^2(\theta) + \sin^2(\theta) = 1$$
> Ricordala sempre quando vedi $x^2 + y^2$ sotto radice o in un denominatore!



---

## 2. Tabella Valori "Must-Know"
Devi sapere questi valori senza usare la calcolatrice (che spesso non è ammessa).

| Gradi | Radianti | $\sin(\theta)$ | $\cos(\theta)$ | $\tan(\theta)$ |
| :--- | :--- | :--- | :--- | :--- |
| $0^\circ$ | $0$ | $0$ | $1$ | $0$ |
| $30^\circ$ | $\pi/6$ | $1/2$ | $\sqrt{3}/2$ | $\sqrt{3}/3$ |
| $45^\circ$ | $\pi/4$ | $\sqrt{2}/2$ | $\sqrt{2}/2$ | $1$ |
| $60^\circ$ | $\pi/3$ | $\sqrt{3}/2$ | $1/2$ | $\sqrt{3}$ |
| $90^\circ$ | $\pi/2$ | $1$ | $0$ | $\nexists$ |



[Image of unit circle with trigonometric values]


---

## 3. Formule di Duplicazione e Bisezione
Servono tantissimo per risolvere gli integrali di $\sin^2(x)$ o $\cos^2(x)$ che spuntano fuori ogni volta che integri su un cerchio.

* **Duplicazione:** $\sin(2\theta) = 2\sin(\theta)\cos(\theta)$
* **Linearizzazione (fondamentali):**
	* $\cos^2(\theta) = \frac{1 + \cos(2\theta)}{2}$
	* $\sin^2(\theta) = \frac{1 - \cos(2\theta)}{2}$

---

## 4. 🚀 Il Jacobiano (Spoiler Analisi 2)
Quando passi in coordinate polari dentro un integrale doppio, non dimenticare **MAI** il fattore di scala (determinante della matrice Jacobiana).

$$dx \, dy \longrightarrow \rho \, d\rho \, d\theta$$

> [!danger] Errore da bocciatura
> Dimenticarsi di aggiungere quella $\rho$ ("il raggio") dopo il cambio di variabile è l'errore che fa fallire la metà degli esami di Analisi 2.



---

## 5. Angoli e Quadranti
Ricorda come determinare $\theta$ partendo da $x$ e $y$:
* $\theta = \arctan\left(\frac{y}{x}\right)$ (valido nel I e IV quadrante).
* Se sei nel II o III quadrante ($x < 0$), devi aggiungere $\pi$.

---
#Analisi2 #Trigonometria #CoordinatePolari #Matematica #Ripasso