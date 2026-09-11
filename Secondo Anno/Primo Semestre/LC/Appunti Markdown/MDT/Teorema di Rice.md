# 🧠 Teorema di Rice

---

> [!abstract] Enunciato Formale
> «Ogni proprietà non banale dei linguaggi ricorsivamente enumerabili è indecidibile».

---

### 🔹 1. Che cosa è?
È un teorema fondamentale della teoria della computabilità che definisce i limiti invalicabili dell'analisi automatica dei programmi. Stabilisce che è impossibile costruire un algoritmo universale capace di determinare caratteristiche comportamentali di altri programmi.

### 🔹 2. Che cosa fa?
Il teorema funge da "scorciatoia" per dimostrare l'**indecidibilità**:
* Invece di dover costruire ogni volta una riduzione complessa dal Problema della Fermata, basta verificare se il quesito riguarda una **proprietà semantica non banale**.
* Se la risposta è affermativa, il problema è automaticamente dichiarato **indecidibile**.

### 🔹 3. Che cosa è una Proprietà?
In questo contesto, una proprietà (semantica o estensionale) è una caratteristica che riguarda esclusivamente il **linguaggio** riconosciuto dalla macchina ($L(M)$) e non come essa è scritta.

* **Vincolo di coerenza**: Se due Macchine di Turing $M_1$ e $M_2$ riconoscono lo stesso linguaggio ($L(M_1) = L(M_2)$), allora la proprietà deve valere per entrambe o per nessuna delle due.
* **Esempi semantici**: "Il linguaggio è vuoto?", "Il linguaggio è infinito?".
* **Controesempio (proprietà sintattica)**: "Il codice ha più di 100 righe?" non è una proprietà semantica, poiché due programmi identici nel comportamento possono avere lunghezze diverse.



### 🔹 4. Cosa significa "Non Banale"?
Una proprietà si definisce tale se divide l'universo dei linguaggi $RE$ (Ricorsivamente Enumerabili) in due gruppi entrambi non vuoti:

* **Proprietà Banale**: È una caratteristica vera per **tutti** i linguaggi $RE$ (es: "il linguaggio è composto da stringhe") o per **nessuno** di essi. Queste proprietà sono decidibili perché la risposta è fissa.
* **Proprietà Non Banale**: Esiste almeno una Macchina di Turing $M_{sì}$ il cui linguaggio soddisfa la proprietà e almeno una $M_{no}$ il cui linguaggio non la soddisfa.

---