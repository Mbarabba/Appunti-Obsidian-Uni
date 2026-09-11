# 🌳 Guida agli Alberi e ABR (Fondamenti dell'Informatica)

Per l'esame, un albero è considerato sia una struttura dati ricorsiva che un caso particolare di grafo.

---

## 1. Cos'è un Albero?
In teoria dei grafi, un **albero** è un grafo orientato o non orientato, **connesso e aciclico**.
Nella sua **definizione ricorsiva** (usata per gli algoritmi), un albero binario è:
* Un insieme vuoto ($\epsilon$).
* Oppure un nodo **radice** collegato a due sottoalberi (sinistro e destro), anch'essi alberi binari.

---

## 2. Cos'è un ABR (Albero Binario di Ricerca)?
Un **ABR** è un albero binario in cui i nodi sono organizzati secondo un ordine preciso (numerico o lessicografico):
* Per ogni nodo $u$, tutti i valori nel **sottoalbero sinistro** sono **minori** del valore di $u$.
* Tutti i valori nel **sottoalbero destro** sono **maggiori** del valore di $u$.
> [!caution] Attenzione
> Se un elemento si trova nel sottoalbero sbagliato rispetto alla radice, la struttura **non** è un ABR.

---

## 3. Visite dell'Albero
Le visite permettono di esplorare i nodi in ordine sistematico:

| Visita | Ordine di Esplorazione | Nota per l'esame |
| :--- | :--- | :--- |
| **Preorder** | Radice → Sinistra → Destra | Usata per copiare l'albero. |
| **Inorder** | Sinistra → Radice → Destra | In un ABR, restituisce i valori **ordinati**. |
| **Postorder**| Sinistra → Destra → Radice | Usata per eliminare l'albero o calcolare lo spazio. |

---

## 4. Proprietà Fondamentali
Nei compiti d'esame viene spesso chiesto di classificare un albero in base a queste tre proprietà:

* **Pieno (Full)**: Ogni nodo ha esattamente **0 o 2 figli**. Non esistono nodi con un figlio solo.
* **Completo (Complete)**: Tutti i livelli sono totalmente riempiti, tranne eventualmente l'ultimo, che deve essere riempito **da sinistra a destra**.
* **Bilanciato (Balanced)**: Per ogni nodo, la differenza di altezza tra il sottoalbero sinistro e quello destro è **al massimo 1**.

---

## 5. Rappresentazione Tabellare Livello per Livello
Questa forma viene usata per visualizzare la struttura senza disegnare il grafo. Si elencano i nodi raggruppandoli per il loro livello di profondità.

**Esempio di tabella (basato su un albero con radice 'a'):**

| Livello | Nodi | Percorso (S=0, D=1) |
| :--- | :--- | :--- |
| **Liv 1** | a | (Root) |
| **Liv 2** | b, c | 0, 1 |
| **Liv 3** | d, e, f | 00, 01, 10 |

> [!tip] Suggerimento
> Per identificare i livelli, parti dalla radice (Livello 1) e scendi. Ogni arco aggiunto aumenta il livello di 1.