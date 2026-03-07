# Cosa sono?
Rappresentano legami logici tra 2 o più [[Entità]] 
```mermaid
graph TD
    F[Fornitore] --- For{Fornitura}
    P[Prodotto] --- For
    D[Dipartimento] --- For

    style F fill:#7f7f7f,stroke:#333,stroke-width:2px,color:#fff
    style P fill:#7f7f7f,stroke:#333,stroke-width:2px,color:#fff
    style D fill:#7f7f7f,stroke:#333,stroke-width:2px,color:#fff
    style For fill:#7f7f7f,stroke:#333,stroke-width:2px,color:#fff
```

```mermaid
erDiagram
    FORNITORE ||--o{ FORNITURA : "effettua"
    PRODOTTO ||--o{ FORNITURA : "e' fornito"
    DIPARTIMENTO ||--o{ FORNITURA : "riceve"

    FORNITORE {
        int id_fornitore PK
        string nome
    }

    PRODOTTO {
        int id_prodotto PK
        string descrizione
    }

    DIPARTIMENTO {
        int id_dipartimento PK
        string nome_dip
    }

    FORNITURA {
        int id_fornitore FK
        int id_prodotto FK
        int id_dipartimento FK
        date data_fornitura
    }
```

---
# Tipi di relazione
## Relazioni Ricorsive
Sono relazioni tra un [[Entità]] e se stessa, nelle relazioni di questo tipo è necessario aggiungere la specifica dei ruoli
```mermaid
graph TD
    S[Sovrano] --- R{Successione}
    R ---|Successore| S
    R ---|Predecessore| S

    style S fill:#cce8f4,stroke:#004a7c,stroke-width:2px,color:#004a7c
    style R fill:#cce8f4,stroke:#004a7c,stroke-width:2px,color:#004a7c
```

---
# Attributi
