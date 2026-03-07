# Cosa sono?
Sono dei costrutti del [[Modello ER|Modello ER]] che hanno lo scopo di rappresentare classi di oggetti che hanno proprietà comuni ed esistenza autonoma

```mermaid
flowchart LR
    %% Entità (Rettangoli)
    E[Entità]
```
---
# Attributi di una Entità
## Attributi "Semplici"
Descrivono le proprietà elementari di una entità

Un attributo associa a ciascuna occorrenza di un entità un valore appartenente ad un insieme detto dominio
```mermaid
graph LR
    E[Impiegato] --- C([Cognome])
    E --- A([Eta])
    E --- S([Stipendio])

    %% Stili grafici
    style E fill:#cce8f4,stroke:#333,stroke-width:1px
    style C fill:#ffffff,stroke:#333,stroke-width:1px
    style A fill:#ffffff,stroke:#333,stroke-width:1px
    style S fill:#ffffff,stroke:#333,stroke-width:1px
```

```mermaid
erDiagram
    IMPIEGATO {
        string Cognome
        int Eta
        float Stipendio
    }
```
## Attributi Composti
Può risultare comodo raggruppare attributi di una medesima entità che presentano affinità nel loro significato o uso

L'insieme di attributi che si ottiene in questa maniera viene detto attributo composto
```mermaid
graph TD
    E[Studente] --- A([Nome_Completo])
    A --- N((Nome))
    A --- C((Cognome))
    
    style E fill:#f9f9f9,stroke:#333,stroke-width:2px
    style A fill:#fff,stroke:#333,stroke-width:1px
```

```mermaid
erDiagram
    STUDENTE {
        string Nome
        string Cognome
    }
```
## Cardinalità degli attributi
È il numero minimo e massimo di valori dell'attributo associai a ogni occorrenza di entità o relazione 
```mermaid
graph LR
    I[Impiegato] --- N((Nome))
    I ---|"(0,N)"| T((Targa auto))
    I ---|"(0,1)"| P((Numero patente))

    style I fill:#7f7f7f,stroke:#333,stroke-width:2px,color:#fff
    style N fill:#b3b3b3,stroke:#333,stroke-width:1px
    style T fill:#b3b3b3,stroke:#333,stroke-width:1px
    style P fill:#b3b3b3,stroke:#333,stroke-width:1px
```
```mermaid
erDiagram
    IMPIEGATO {
        int ID_Impiegato PK
        string Nome
        string Numero_Patente "NULLable"
    }

    AUTO_IMPIEGATO {
        int ID_Impiegato FK
        string Targa_Auto PK
    }

    IMPIEGATO ||--o{ AUTO_IMPIEGATO : "possiede"
```

---
# Identificatori
Sono degli [[#Attributi di una Entità|attributi]] univoci definiti per ogni entità dediti alla identificazione di un entità

Essi possono essere
## Identificatori interni
Identificatore formato da uno o più attributi di una sola entità
```mermaid
graph LR
    %% Entità Automobile
    A[Automobile] --- T((<u>Targa</u>))
    A --- M((Modello))

    %% Entità Persona
    P[Persona] --- DN((<u>Data Nascita</u>))
    P --- C((<u>Cognome</u>))
    P --- N((<u>Nome</u>))
    P --- I((Indirizzo))

    %% Stili Entità (Grigio scuro)
    style A fill:#7f7f7f,stroke:#333,stroke-width:2px,color:#fff
    style P fill:#7f7f7f,stroke:#333,stroke-width:2px,color:#fff

    %% Stili Identificatori (Azzurro per Targa, Arancione per l'identificatore composto)
    style T fill:#3498db,stroke:#333,stroke-width:2px,color:#000
    style DN fill:#f39c12,stroke:#333,stroke-width:2px,color:#000
    style C fill:#f39c12,stroke:#333,stroke-width:2px,color:#000
    style N fill:#f39c12,stroke:#333,stroke-width:2px,color:#000

    %% Stili Attributi normali (Grigio chiaro)
    style M fill:#b3b3b3,stroke:#333,stroke-width:1px,color:#000
    style I fill:#b3b3b3,stroke:#333,stroke-width:1px,color:#000
```
```mermaid
erDiagram
    AUTOMOBILE {
        string targa PK
        string modello
    }

    PERSONA {
        date data_nascita PK
        string cognome PK
        string nome PK
        string indirizzo
    }
```
## Identificatori Esterni
Se l'identificatore è formato da attributi e [[Relazioni]]

```mermaid
graph LR
    %% Attributi Studente
    C((Cognome)) --- S
    M((<u>Matricola</u>)) --- S
    AC((Anno di corso)) --- S

    %% Entità e Relazione (con cardinalità)
    S[Studente] ---|"(1,1)"| I{Iscrizione}
    I ---|"(0,N)"| U[Università]

    %% Attributi Università
    U --- N((<u>Nome</u>))
    U --- Ind((Indirizzo))

    %% Stili Entità e Relazioni (Grigio scuro)
    style S fill:#7f7f7f,stroke:#333,stroke-width:2px,color:#fff
    style U fill:#7f7f7f,stroke:#333,stroke-width:2px,color:#fff
    style I fill:#7f7f7f,stroke:#3498db,stroke-width:3px,color:#fff
    
    %% Stili Attributi Base
    style C fill:#b3b3b3,stroke:#333,stroke-width:1px,color:#000
    style AC fill:#b3b3b3,stroke:#333,stroke-width:1px,color:#000
    style Ind fill:#b3b3b3,stroke:#333,stroke-width:1px,color:#000

    %% Stili Identificatori (Azzurro/Arancione come nell'immagine)
    %% Il bordo azzurro su Matricola e Iscrizione indica l'identificatore esterno
    style M fill:#b3b3b3,stroke:#3498db,stroke-width:3px,color:#000
    style N fill:#f39c12,stroke:#3498db,stroke-width:3px,color:#fff
```

```mermaid
erDiagram
    UNIVERSITA {
        string Nome PK
        string Indirizzo
    }

    STUDENTE {
        string Nome_Universita PK, FK
        string Matricola PK
        string Cognome
        int Anno_di_corso
    }

    UNIVERSITA ||--o{ STUDENTE : "ha iscritti"
```