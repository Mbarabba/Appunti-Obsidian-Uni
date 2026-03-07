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
Un attributo su una relazione associa a ogni occorrenza del legame un valore appartenente a un dominio specifico. Descrive una proprietà che ha senso **solo se il legame esiste**
```mermaid
graph TD
    %% Entità
    S[squadra]
    G[giocatore]

    %% Relazione
    C{composizione}

    %% Attributi Squadra
    S --- n1((<u>nome</u>))
    S --- a((allenatore))
    S --- p((presidente))

    %% Attributi Giocatore
    G --- n2((<u>nome</u>))
    G --- i((indirizzo))

    %% Attributi Relazione
    C --- r((ruolo))
    C --- an((anno))

    %% Collegamenti
    S --- C
    C --- G

    %% Stili (basati sull'immagine originale)
    style S fill:#003366,stroke:#333,stroke-width:1px,color:#fff
    style G fill:#003366,stroke:#333,stroke-width:1px,color:#fff
    style C fill:#003366,stroke:#333,stroke-width:1px,color:#fff
```
```mermaid
erDiagram
    SQUADRA {
        string nome PK
        string allenatore
        string presidente
    }

    GIOCATORE {
        string nome PK
        string indirizzo
    }

    COMPOSIZIONE {
        string nome_squadra PK, FK
        string nome_giocatore PK, FK
        string ruolo
        int anno
    }

    SQUADRA ||--o{ COMPOSIZIONE : "ha"
    GIOCATORE ||--o{ COMPOSIZIONE : "milita in"
```
---
# Cardinalità
Vengono specificate per ciascuna partecipazione di [[Entità]] a una relazione

Dicono quante volte, in una relazione tra [[Entità]], un'occorrenza di una di queste entià può essere legata a occorrenze delle altre entità coinvolte
```mermaid
graph TD
    %% Entità
    P[Persona]
    A[Attività lavorativa]
    C[Città]

    %% Relazioni
    L{Lavoro}
    N{Nascita}

    %% Collegamenti con cardinalità
    P ---|"(0,n)"| L
    L ---|"(1,n)"| A
    
    P ---|"(1,1)"| N
    N ---|"(1,n)"| C

    %% Stili
    style P fill:#7f7f7f,stroke:#333,stroke-width:2px,color:#fff
    style A fill:#7f7f7f,stroke:#333,stroke-width:2px,color:#fff
    style C fill:#7f7f7f,stroke:#333,stroke-width:2px,color:#fff
    style L fill:#7f7f7f,stroke:#333,stroke-width:2px,color:#fff
    style N fill:#7f7f7f,stroke:#333,stroke-width:2px,color:#fff

```

## Cardinalità 1 a 1
```mermaid
graph LR
    %% Scenario 1: Ordine - Fattura
    O1[Ordine] ---|"(0,1)"| V1{Vendita}
    V1 ---|"(1,1)"| F1[Fattura]

    %% Scenario 2: Professore - Corso
    P2[Professore] ---|"(1,1)"| D2{Docenza}
    D2 ---|"(0,1)"| C2[Corso]

    %% Scenario 3: Impiegato - Progetto
    I3[Impiegato] ---|"(0,1)"| Dir3{Direzione}
    Dir3 ---|"(1,1)"| P3[Progetto]

    %% Stili
    style O1 fill:#7f7f7f,stroke:#333,color:#fff
    style F1 fill:#7f7f7f,stroke:#333,color:#fff
    style V1 fill:#7f7f7f,stroke:#333,color:#fff
    
    style P2 fill:#7f7f7f,stroke:#333,color:#fff
    style C2 fill:#7f7f7f,stroke:#333,color:#fff
    style D2 fill:#7f7f7f,stroke:#333,color:#fff
    
    style I3 fill:#7f7f7f,stroke:#333,color:#fff
    style P3 fill:#7f7f7f,stroke:#333,color:#fff
    style Dir3 fill:#7f7f7f,stroke:#333,color:#fff
```
## Cardinalità 1 a molti
```mermaid
graph LR
    %% Scenario 1: Impiego
    P1[Persona] --- I1{Impiego}
    I1 --- A1[Azienda]
    P1 ---|"(0,1)"| I1
    I1 ---|"(1,N)"| A1

    %% Scenario 2: Nascita
    P2[Persona] --- N2{Nascita}
    N2 --- C2[Città]
    P2 ---|"(1,1)"| N2
    N2 ---|"(1,N)"| C2

    %% Scenario 3: Ubicazione
    Com3[Comune] --- U3{Ubicazione}
    U3 --- Pro3[Provincia]
    Com3 ---|"(1,1)"| U3
    U3 ---|"(1,N)"| Pro3

    %% Stili per coerenza con i tuoi appunti
    style P1 fill:#7f7f7f,stroke:#333,color:#fff
    style A1 fill:#7f7f7f,stroke:#333,color:#fff
    style I1 fill:#7f7f7f,stroke:#333,color:#fff
    style P2 fill:#7f7f7f,stroke:#333,color:#fff
    style C2 fill:#7f7f7f,stroke:#333,color:#fff
    style N2 fill:#7f7f7f,stroke:#333,color:#fff
    style Com3 fill:#7f7f7f,stroke:#333,color:#fff
    style Pro3 fill:#7f7f7f,stroke:#333,color:#fff
    style U3 fill:#7f7f7f,stroke:#333,color:#fff
```
## Cardinalità molti a molti