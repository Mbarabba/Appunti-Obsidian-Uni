# Cos'è? 
È un <mark style="background: #ADCCFFA6;">modello concettuale</mark> di dati che fornisce una serie di **strutture** detti <mark style="background: #BBFABBA6;">**costrutti** atte a descrivere la realtà di interesse</mark>

---
# Costrutti
- **Entità**
  Rappresentano classi di oggetti che hanno proprietà comuni ed esistenza "autonoma" ai fini dell'applicazione d'interesse
  ![[Pasted image 20260306180210.png]]
	- **Identificatore Identità**
	  Strumento per l'identificazione univoca delle occorrenze di un'entità
		- **Identificatore interno**
			  Formato da soli attributi interni all'entità
			  ![[Pasted image 20260306183107.png]]
		- **Identificatore Esterno**
		  Formato da uno o più attributi dell'entità oltre a entità esterne attraverso relazioni
		  ![[Pasted image 20260306183216.png]]	  

- **Attributi**
  Descrivono le <mark style="background: #BBFABBA6;">proprietà elementari</mark> di entità o relazioni
  ![[Pasted image 20260306180307.png]]
	- **Cardinalità di un attributo**
	  È possibile associare ad un attributo una cardinalità per indicarne :
		- L'opzionalità
		- Atributi multivalore
		  ![[Pasted image 20260306182521.png]]
		  
- **Attributi Composti**
  Si ottengono raggruppando attributi di una medesima entità o relazione che presentano affinità nel loro significato o uso
  ![[Pasted image 20260306180720.png]] 
- **Relazione / Associazione**
  Rappresentano i legami logici tra 2 o più entità 
  ![[Pasted image 20260306180900.png]]
- **Cardinalità**
  Coppia di valori che si associa a ogni entità che partecipa a una relazione
  Specifica il numero minimo e massimo di occorrenze della relazione cui ciascuna occorrenza di una entità può partecipare
  ![[Pasted image 20260306182324.png]] 
---
# Generalizzazioni
Rappresentano legami logici tra un entità $E$ detta **genitore**, e una o più entità $E_{1},\dots,E_{n}$ dette entità figlie, di cui $E$ è più generale 

Uno generalizzazione può essere di due tipi 
1. **Completa**
   L'unione delle istanze delle sottoentità è uguale all'insieme delle istanze dell'entità padre
   
2. **Incompleta**
   mette in relazione una o più entità $E_{1},E_{2},\dots ,E_{N}$ con un entità $E$, che le comprende come un caso particolare 
   ![[Pasted image 20260306183834.png]]