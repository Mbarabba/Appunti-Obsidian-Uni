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
    S[Sovrano] ---|Successore| R{Successione}
    R{Successione} ---|Predecessore| S
```
 ```mermaid
 erDiagram
    SOVRANO {
        int ID_Sovrano PK
        string Nome
        int ID_Predecessore FK
    }
    
    SOVRANO ||--o| SOVRANO : "e' succeduto da"
 ```
## Relazioni $n$-arie
Sono relazioni che coinvolgono dalle 2 alle $n$ entità
```mermaid
graph TD
    %% Entità
    D[Docente]
    C[CorsoDiLaurea]
    F[Facoltà]

    %% Relazioni
    Aff{Afferenza}
    App{Appartenenza}

    %% Attributi Docente
    D --- CF((<u>CodiceFiscale</u>))
    D --- E((Età))

    %% Attributi CorsoDiLaurea
    C --- N_C((Nome))
    C --- Cod((<u>Codice</u>))

    %% Attributi Facoltà
    F --- N_F((<u>Nome</u>))

    %% Attributo Relazione
    Aff --- Dat((Data))

    %% Collegamenti
    D --- Aff
    Aff --- C
    C --- App
    App --- F

    %% Stili
    style D fill:#cce8f4,stroke:#004a7c,stroke-width:1px
    style C fill:#cce8f4,stroke:#004a7c,stroke-width:1px
    style F fill:#cce8f4,stroke:#004a7c,stroke-width:1px
    style Aff fill:#cce8f4,stroke:#004a7c,stroke-width:1px
    style App fill:#cce8f4,stroke:#004a7c,stroke-width:1px
```
```mermaid
erDiagram
    DOCENTE {
        string CodiceFiscale PK
        int Eta
    }

    FACOLTA {
        string Nome PK
    }

    CORSO_DI_LAUREA {
        string Codice PK
        string Nome
        string Nome_Facolta FK
    }

    AFFERENZA {
        string CF_Docente PK, FK
        string Codice_Corso PK, FK
        date Data
    }

    FACOLTA ||--o{ CORSO_DI_LAUREA : "ha"
    DOCENTE ||--o{ AFFERENZA : "partecipa"
    CORSO_DI_LAUREA ||--o{ AFFERENZA : "riceve"
```

---
# Attributi
