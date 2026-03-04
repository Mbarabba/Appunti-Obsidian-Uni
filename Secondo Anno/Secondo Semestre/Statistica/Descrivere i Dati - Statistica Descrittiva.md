# Cosa è?
È la branca della statistica dedita a <mark style="background: #BBFABBA6;">descrivere e riassumere i dati raccolti</mark>

---
# Insieme di Dati
Misuriamo una certa **variabile** in un campione, ottenendo un <mark style="background: #ADCCFFA6;">insieme di dati</mark>
$$\begin{gather}
\large x_{1},x_{2},x_{3},\dots,x_{N} \\
 \\
N = \text{Numero di dati} 
\end{gather}
$$
## Dati a Coppie/Bivariati
Talvolta è utile misurare poter mettere in relazione 
 variabili

Per fare ciò, dato un insieme di $N$ dati, li mettiamo a coppie
$$\large(x_{1},y_{1}),(x_{2},y_{2}),\dots,(x_{i},y_{i}),\dots,(x_{N},y_{N})$$
- **$x_{i} / y_{i}$** indicano l'i-esimo elemento dell'insieme 
>[!Example] Esempio
>Rileviamo il numero di anni di scuola e le pulsazioni a riposo in un campione di $N=10$ individui
>$$
>\begin{gather}(12,73) & (16,67) & (13,74) & (18,63) & (19,73) \\
>(12,84) & (18,60) & (19,62) & (12,76) & (14,71)
\end{gather}
>$$

---
# Tabella delle frequenze
Se un [[#Insieme di Dati|insieme di dati]] contiene un <mark style="background: #BBFABBA6;">numero ridotto di valori distinti</mark>, i dati possono essere riassunti in una <mark style="background: #ADCCFFA6;">tabella delle frequenze</mark>

La tabella è formata da :
- **Valori** : I diversi <mark style="background: #BBFABBA6;">valori distinti che il dato può assumere</mark>
- **$f_{i}$ Frequenza Assoluta** : Il <mark style="background: #BBFABBA6;">numero di volte</mark> che un dato valore appare all'interno dell'insieme di dati $N$ 
- **$p_{i}=f_{i}/N$ Frequenza Relativa** : È la <mark style="background: #BBFABBA6;">frazione di volte</mark> in cui un determinato valore compare nell'insieme di dati $n$

>[!example] Esempio
>Marta intervista i suo $N=20$ compagni di classe e chiede la squadra di calcio preferita, ottenendo la risposta
>
>$$\begin{gather}\text{ATA, ATA, NES, JUV, NES, INT, NES, JUV, NES, ATA} \\ 
\text{JUV, MIL, JUV, ATA, NES, NES, ATA, MIL, INT, NES}\end{gather}$$
>
>La tabella delle frequenze risultante sarà :
>
>|Valori|$f_{i} :$Frequenza Assoluta|$p_{i}=f_{i}/N$ : Frequenze relative|
>|:---:|:---:|:---:|
>|Juv|4|$\frac{4}{20}=0.2=20\%$|
>|Mil|2|$\frac{2}{20}=0.1=10\%$|
>|Ata|5|$\frac{5}{20}=0.25=25\%$|
>|Int|2|$\frac{2}{20}=0,1=10\%$|
>|Nes|7|$\frac{7}{20}=0.35=35\%$|

---
# Istogramma
## Cosa è?
È una rappresentazione equivalente della [[#Tabella delle frequenze|tabella delle frequenze]]
## A cosa serve?
Serve a mostrare visivamente la distribuzione dei dati suddivisi in intervalli, detti **classi**, allo scopo di rendere i dati più leggibili
## Come costruire un istogramma da un insieme di dati
1. **Disporre** i dati in ordine crescente
2. **Scegliere** le classi in modo da coprire tutti i punti
3. **Costruire** una [[#Tabella delle frequenze|tabella della frequenza]]
4. **Costruire** delle barre adiacenti che abbiano altezze determinate dalle frequenze del punto 3

>[!Example] Esempio di costruzione di un istogramma
>Vengano rilevati i giorni di assenza per malattia di $N=50$ lavoratori di un azienda negli ultimi 2 mesi
>
>$$\begin{gather}2,2,0,0,5,8,3,4,1,0,0,7,1,7,1,5 \\
 4,0,4,0,1,8,9,7,0,1,7,2,5,5,4,3 \\
 3,0,0,2,5,1,3,0,1,0,2,4,5,0,5,7,5,1
\end{gather}$$
>
>La [[#Tabella delle frequenze|tabella della frequenza risultante sarà]]
>
>|valori|$f_{i}$|$p_{i}$|
>|:---:|:---:|:---:|
>|0|12|$\frac{12}{50}=0.24=24\%$|
>|1|8|$\frac{8}{50}=0.16=16\%$|
>|2|5|$\frac{5}{50}=0.1=10\%$|
>|3|4|$\frac{4}{50}=0.08=8\%$|
>|4|5|$\frac{5}{50}=0.1=10\%$|
>|5|8|$\frac{8}{50}=0.16=16\%$|
>|6|0|$\frac{0}{50}=0=0\%$|
>|7|5|$\frac{5}{50}=0.1=10\%$|
>|8|2|$\frac{2}{50}=0.04=4\%$|
>|9|1|$\frac{1}{50}=0.02=2\%$|
>
>E con questa costruisco l'istogramma
>
>```chart
>type: bar
>labels: [0,1,2,3,4,5,6,7,8,9]
>series:
  >- title: 
 >   data: [12,8,5,4,5,8,0,5,2,1]
>tension: 0.2
<width: 80%
>labelColors: false
>fill: false
>beginAtZero: false
>bestFit: false
>bestFitTitle: undefined
>bestFitNumber: 0
>```
>


---
# Diagramma di dispersione
## Cosa è?
È la rappresentazione grafica di un insieme di $N$ [[#Dati a Coppie/Bivariati|dati bivariati]]
Ogni dato bivariato$(x_{i},y_{i})$ viene visualizzato come un <mark style="background: #BBFABBA6;">punto isolato in un piano cartesiano
</mark>
## A cosa serve?
Serve a evidenziare visivamente se esiste una **correlazione** tra le due variabili
## Come rappresentarlo
1. **Raccolgo** $N$ [[#Dati a Coppie/Bivariati|dati bivariati]]
2. **Dispongo** i valori della prima variabile sull'asse delle ascisse e quelli della seconda sull'asse delle ordinate
3. **Traccio** un punto per ogni dato bivario 

>[!example]
>Rileviamo il numero di anni di scuola e la pulsazione a riposo in un campione di $N=10$ individui
>$$
>\begin{gather} (12,73) & (16,67) & 
\end{gather}
>$$