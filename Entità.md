# Cosa sono?
Sono dei costrutti del [[Introduzione Modello ER|Modello ER]] che hanno lo scopo di rappresentare classi di oggetti che hanno proprietà comuni ed esistenza autonoma
## Rappresentazione Grafica

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
flowchart LR
    %% Entità
    I[Impiegato]
    
    %% Attributo principale e sotto-attributi
    Ind((Indirizzo))
    V((Via))
    N((Numero))
    C((CAP))

    %% Collegamenti
    I --- Ind
    Ind --- V
    Ind --- N
    Ind --- C

    %% Stili
    classDef entita fill:#888,stroke:#333,color:#fff;
    class I entita;
```