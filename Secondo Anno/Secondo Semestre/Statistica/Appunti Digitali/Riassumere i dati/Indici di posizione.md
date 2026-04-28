# Definizione di Statistica
La <mark style="background: #ADCCFFA6;">quantità numerica calcolata</mark> partendo da un insieme di dati $N$ si chiama **statistica**

---
# Cosa sono gli indici di posizione? 
Gli **indici di posizione** sono dei numeri riassuntivi che servono a<mark style="background: #BBFABBA6;"> trovare e descrivere il "centro"</mark> di un insieme di dati

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
Fissato un numero $K\in[0,100]$ , $K$-esimo percentile è definito come quel valore $t$ tale che :
- Almeno il $K\%$ dei dati è $\leq t$
- Almeno il $(100-K)\%$ dei dati è $\geq t$
### Casi più importanti
$$k= 25, 50, 75$$
Scriviamo $p=\frac{K}{100}\in[0,1]\iff K=100p$
- **$p$** è la percentuale di $K$ in <mark style="background: #BBFABBA6;">proporzione matematica</mark>

Da qui otteniamo che :
- $p=\frac{1}{4}:k=25\text{-esimo percentile}=\text{primo quartile }q_{1}$
- $p=\frac{1}{2}:K=50\text{-esimo percentile}=\text{secondo quartile} q_{2} =\text{mediana }$
- $p=\frac{3}{4}:K=75\text{-esimo percentile}=\text{terzo quartile }q_{3}$
### Come si calcola il $K$-esimo percentile $t$?
$$
\text{Scriviamo } \begin{cases}
p=\frac{K}{100} \\
K=100p
\end{cases}
$$
1. **Ordiniamo** l'insieme di dati : $x_{1}\leq x_{2}\leq\dots\leq x_{N}$
2. Se $N\cdot p$ non è intera, $t=x_{i}$ è il dato la cui posizione $i$ è l'intero successo a $N \cdot p$
3. Se $N \cdot p$ è intera, $r=\frac{{x_{Np}+x_{Np+1}}}{2}$ è la media aritmetica del dato in posizione $N \cdot p$ e del dato successivo

>[!example] Esempio
>Consideriamo l'insieme di dati $N=10$ dati già ordinati
>$$-6,-3,-3,0,0,1,10,10,10,17$$
>- $p=\frac{1}{2}:\left( N\cdot  \frac{1}{2} = 5 \right)\text{ mediana } m=\frac{{0+1}}{2}=0.5 = \text{2° quartile }q_{2}$
>- $p=\frac{1}{4}:\left( N \cdot \frac{1}{4}=2.5 \right)\text{ 1° quartile } q_{1}=-3=25°\text{ percentile}$
>- $p=\frac{3}{4} :(N \cdot \frac{3}{4}=7.5)  \text{  3° quartile } q_{3}=10=75° \text{ percentile}$

---
# Box Plot
## Cosa è?
È una <mark style="background: #ADCCFFA6;">rappresentazione grafica</mark> della [[#Mediana Campionaria|mediana]]e dei [[#Mediana Campionaria#Percentili Campionari|quartili]]  di un insieme di dati
## Cosa fa? 
Serve a dare un'idea di come e in che modo sono distribuiti i dati
## Rappresentazione grafica
![[Pasted image 20260305111937.png]]

---
# Moda
È il **valore** che <mark style="background: #BBFABBA6;">si verifica con maggior frequenza</mark> nell'insieme dei dati

>[!example] Esempio
>$$12,5,18,7,12,3,22,12,9,15$$
>$$\text{Moda = } 12$$
