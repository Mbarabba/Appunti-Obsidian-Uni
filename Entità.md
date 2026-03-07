# Cosa sono?
Sono dei costrutti del [[Introduzione Modello ER|Modello ER]] che hanno lo scopo di rappresentare classi di oggetti che hanno proprietà comuni ed esistenza autonoma
>[!tip] Precisazione
>Tutti i grafici che vedrete da ora in poi sono grafici di **modelli concettuali** disegnati secondo la notazione di **Chen**

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
---
# Identificatori
Sono degli [[#Attributi di una Entità|attributi]] univoci deti