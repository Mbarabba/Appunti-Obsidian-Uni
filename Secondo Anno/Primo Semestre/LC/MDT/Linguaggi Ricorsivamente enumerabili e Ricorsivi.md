# ♾️ Linguaggi Ricorsivi e Ricorsivamente Enumerabili

---

### 🔹 1. Linguaggio Ricorsivo (Decidibile)
Un linguaggio $A$ è definito **Ricorsivo** se la sua funzione caratteristica $\chi_A$ è una **funzione totale calcolabile**.
* Esiste una Macchina di Turing $M$ che funge da **decisore**.
* Per ogni stringa di input $w$, la computazione **termina sempre** in un tempo finito.
* Se $w \in A$, la macchina accetta (restituisce 1); se $w \notin A$, la macchina rifiuta (restituisce 0).

### 🔹 2. Linguaggio Ricorsivamente Enumerabile (RE)
Un linguaggio $A$ è definito **Ricorsivamente Enumerabile (RE)** se la sua funzione caratteristica è una **funzione parziale calcolabile**.
* Esiste una Macchina di Turing $M$ che funge da **riconoscitore**.
* Se $w \in A$, la macchina termina la computazione e **accetta**.
* Se $w \notin A$, la macchina può terminare con un rifiuto oppure **entrare in un loop infinito**.

---

### 📊 Tabella di Confronto

| Caratteristica | Linguaggio Ricorsivo | Linguaggio RE |
| :--- | :--- | :--- |
| **Comportamento MT** | Termina sempre (Decisore) | Termina solo se $w \in L$ (Riconoscitore) |
| **Funzione Caratteristica** | Totale calcolabile | Parziale calcolabile |
| **Input $w \notin L$** | Accerta il rifiuto e si ferma | Può non fermarsi mai (loop) |
| **Complemento** | Il complemento è sempre Ricorsivo | Il complemento non è necessariamente RE |



---

### 🚫 Esistenza di Linguaggi NON Ricorsivamente Enumerabili

È matematicamente certo che esistano linguaggi che non sono nemmeno RE. La dimostrazione classica si avvale del **Linguaggio Diagonale ($L_d$)** e del metodo della diagonalizzazione di Cantor.

#### 1. Definizione del Linguaggio Diagonale ($L_d$)
Si consideri un elenco numerabile di tutte le possibili Macchine di Turing ($M_1, M_2, \dots$) e delle loro relative codifiche ($w_1, w_2, \dots$). Il linguaggio diagonale è definito come:
$$L_d = \{ w_i \mid w_i \notin L(M_i) \}$$
In altre parole, $L_d$ contiene le codifiche di tutte le macchine che **non accettano** la propria stessa codifica come input.

#### 2. Dimostrazione (Per Assurdo)


* **Assunzione**: Supponiamo per assurdo che $L_d$ sia Ricorsivamente Enumerabile.
* **Conseguenza**: Se $L_d$ è RE, allora deve esistere una Macchina di Turing $M_k$ tale che $L(M_k) = L_d$.
* **Verifica del Paradosso**: Ci chiediamo se la stringa $w_k$ (codifica di $M_k$) appartenga a $L_d$:
    * Se $w_k \in L_d$, allora per definizione di $L_d$, $w_k \notin L(M_k)$. Ma avevamo assunto $L(M_k) = L_d$, quindi $w_k \notin L_d$ (**Contraddizione**).
    * Se $w_k \notin L_d$, allora per definizione di $L_d$, $w_k \in L(M_k)$. Ma se la macchina $M_k$ accetta $w_k$, allora per definizione $w_k$ deve stare in $L_d$ (**Contraddizione**).
* **Conclusione**: Poiché l'esistenza di una macchina per $L_d$ genera un paradosso logico, concludiamo che **$L_d$ non è un linguaggio RE**.

#### 3. Ragionamento basato sulla Cardinalità
* L'insieme di tutte le Macchine di Turing è **numerabile** (infinito come i numeri naturali).
* L'insieme di tutti i possibili linguaggi su un alfabeto $\Sigma$ è **non numerabile** (ha la cardinalità del continuo).
* Esistono "più" linguaggi che macchine; pertanto, la maggior parte dei linguaggi esistenti non può avere una macchina che li riconosca.