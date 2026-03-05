# Definizione di Statistica
La <mark style="background: #ADCCFFA6;">quantità numerica calcolata</mark> partendo da un insieme di dati $N$ si chiama **statistica**

---
# Media Campionaria
Supponiamo di avere un campione di $N$ dati i cui valori sono 
$$\large x_{1},x_{2},\dots,x_{i},\dots,x_{n}$$
Una [[#Definizione di Statistica|statistica]] per indicare il centro di questo insieme di dati è la media campionaria, definita come la <mark style="background: #BBFABBA6;">media aritmetica dei valori dati</mark>
$$\Large
\overline{x}={\frac{\sum^n_{i=1}x_{i}}{N}}
$$
>[!example] Esempio
>- Insieme di dati = $\{ 1,0,7,4,4 \}$
>- $N=50$
>$$
>\overline{x}=\frac{{\sum^5_{i=1}x_{i}}}{5}=\frac{{1+0+7+4+4}}{5}=\frac{16}{5}=3.2
>$$

Data una tabella di frequenza

|  valori  | $f_{i}$  |
| :------: | :------: |
| $z_{1}$  | $f_{1}$  |
| $z_{2}$  | $f_{2}$  |
| $\vdots$ | $\vdots$ |
| $z_{M}$  | $f_{M}$  |
$$
\overline{x}=\frac{{z_{1}\cdot f_{1}+z_{2}\cdot f_{2}+\dots+z_{M}f_{M}}}{N}
$$
$$N=f_{1}+f_{2}+\dots+f_{M}$$

>[!example] Esempio

## Scarti
Gli scarti sono le differenze tra ciascun valore dei dati e la media campionari dell'$i$-esimo valore
$$\Large x_{i}-\overline{x}$$
Inoltre, c'è da notare che :
$$\large
\sum^N_{i=1}(x_{i}-\overline{x})=0
$$
## Trasformazioni lineari affini


---
# Mediana Campionaria
Si dispongano i valori dei dati in ordine crescente
- Se $N$ è **dispari** : 
  $$\Large m=x_{(\frac{{N+1}}{2})}$$
- Se $N$ è **pari** :
  $$\Large m=\frac{{x_{\left( \frac{N}{2} \right)}+x_{\left( \frac{N}{2}+1 \right)}}}{2}$$
## Percentili Campionari
