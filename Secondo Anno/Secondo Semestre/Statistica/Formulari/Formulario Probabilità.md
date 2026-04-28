# Probabilità Uniforme (su uno spazio finito)
$$\large
P(A)=\frac{{|A|}}{|\Omega|}=\frac{{\text{Casi favorevoli}}}{\text{Casi Possibili}}
$$
- $P(A)$ è la probabilità dell'evento $A$
- $|A|$ è la cardinalità dell'evento
- $|\Omega|$ è la cardinalità totale dello spazio campionario
## Cosa fa?
Assegna ad ogni evento una probabilità e confronta gli elementi di un insieme rispetto al totale
## Quando usarla?
Si deve usare esclusivamente come modello appropriato per esperimenti aleatori i cui esiti possibili siano considerati strettamente **equiprobabili**

<mark style="background: #ADCCFFA6;">Non può essere usata su insiemi infiniti</mark>

---
# Regola del Complementare
$$\large
P(A^c)=1-P(A)
$$
- $A^c$ è l'evento complementare, ovvero l'affermazione logica che "non si verifica $A$"
- $P(A)$ è la probabilità originaria dell'evento
- $1$ rappresenta la certezza dello spazio probabilistico
## Cosa fa?
Calcola la probabilità che un evento non accada, sfruttando il fatto che la probabilità totale di tutto lo spazio campionario è sempre 1
## Quando Usarla?
Spesso è molto utile usarla per semplificare calcoli elaborati, in particolar modo quando si vuole calcolare la probabilità di scenari come ottenere "almeno uno"

---
# Regola dell'Addizione (Unione di probabilità)
$$\large
P(A \cup B) = P(A) + P(B) - P(A \cap B)
$$
- $P(A \cup B)$ indica la probabilità che si verifichi l'evento $A$, oppure il $B$, o entrambi
- $P(A \cap B)$ è la probabilità che i due eventi si verifichino congiuntamente
## Cosa fa?
Calcola correttamente la probabilità di un'unione logica senza sovrastimare il risultato, sottrarre l'intersezione impedisce di contare la parte in comune due volte
## Quando usarla?
Da utilizzare quando ti chiedono la probabilità che accada almeno uno di due eventi

---
# Probabilità Condizionata
$$\large
P(A|B)=\frac{{P(A \cap B)}}{P(B)} \qquad P(B)\neq 0
$$
- $P(A|B)$ è la probabilità dell'evento $A$ "dato" o "sapendo che" si è verificato l'evento $B$
- $P(A \cap B)$ è la probabilità congiunta
## Cosa fa?
Aggiorna le probabilità di un evento $A$ per tenere conto di una informazione ricevuta : il fatto che l'esito dell'esperimento si trova già all'interno di uno scenario $B$ verificato
## Quando usarla
Si usa ogni qualvolta il problema probabilistico impone che non stiamo più guardando l'intero spazio delle probabilità, ma solo un "restringimento" di esso

---
# Regola del Prodotto
$$\large
P(A \cap B) = P(B) \cdot P(A|B)
$$
Questa regola si può estendere su più eventi in sequenza
$$\large
P(B_{1} \cap B_{2} \cap B_{3})=P(B_{1}) \cdot P(B_{2}|B_{1})\cdot P(B_{3}|B_{1} \cap B_{2})
$$
## Cosa fa?
Calcola la probabilità congiunta "srotolandola" in una catena logica di cause condizionate
## Quando usarla?
È estremamente pratica per determinare l'esito di eventi in successione senza rimpiazzo

---
# Formula di Disintegrazione e delle probabilità Totali
$$\large
\begin{gather}\text{Disintegrazione : } P(A)=P(A \cap B)+P(A \cap B^c)  \\ \\
\text{Probabilità Totali (Sosistituendo la regola del prodotto) } \\
P(A)=P(A|B_{1})P(B_{1})+P(A|B_{2})P(B_{2})+\dots+P(A|B_{n})P(B_{n})
\end{gather}
$$
- $A$ è l'evento d'interesse
- La famiglia $B$ costituisce una "partizione" dello spazio campionario
## Cosa?
Calcola la probabilità marginale di $A$ ricostruendola come somma pesati di rami o percorsi mutualmente esclusivi dell'esperimento
## Quando usarla?
Si usa quando un evento complesso deriva da scelte dipendenti in una struttura "ad albero"

---
# Formula di Bayes
$$\large
P(B|A)=\frac{{P(A|B)\cdot P(B)}}{P(A)}$$
## Cosa fa?
Inverte e rovescia il condizionamento tra la misurazione e la causa per trarre inferenze cruciali
## Quando usarla?
Il suo uso classico è nello screening per i test clinici o diagnostici diagnostica: il referto clinico ti dice qual è la percentuale che un test dia esito positivo in chi è malato $P(Test∣Malato)$, ma a un paziente serve conoscere il rovescio, ovvero qual è la probabilità di essere _realmente malati sapendo che il test ha dato esito positivo_ $P(Malato∣Test)$

--- 
# Indipendenza di Eventi
## Definizione
Due eventi $A$ e $B$ si dicono indipendenti se $P(A \cap B)=P(A) \cdot P(B)$ 
Equivale ad affermare che la probabilità condizionata coincide con la probabilità non condizionata $P(A|B)=P(A)$
## Cosa fa?
Fornisce una definizione matematica per dimostrare e stabilire se sapere che un evento si è verificato modifica o non altera minimamente le probabilità dell'altro evento
## Quando usarla?
Si usa per testare o supporre se non sussiste relazione tra i risultati, molto tipicamente usato quando si studiano lanci plurimi di monete in cui il successo del "secondo dado o moneta" non è per sua natura influenzato in alcun modo dal successo avvenuto nel primo lancio. (Attenzione che eventi indipendenti non significano "disgiunti": due eventi indipendenti, non banali, in genere si intersecano sempre).