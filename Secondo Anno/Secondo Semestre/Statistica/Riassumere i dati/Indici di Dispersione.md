# Cosa sono? 
gli **indici di dispersione** (o indici di variabilità) sono grandezze matematiche che quantificano il grado di variabilità di una distribuzione di dati. Più nello specifico, essi misurano la tendenza delle singole osservazioni di un campione ad assumere valori diversi tra loro e ad allontanarsi da un indice di posizione centrale

---
# Varianza Campionaria
## Cosa è?
Fissiamo un insieme di dati 
$$x_{1},x_{2},\dots,x_{N}$$
e ne calcoliamo la [[Indici di posizione#Media Campionaria|media campionaria]]
$$\overline{x}=\frac{{x_{1}+x_{0}+\dots+x_{N}}}{N}$$
ora consideriamo gli [[Indici di posizione#Scarti|scarti]] $x_{i}-\overline{x}$ rispetto alla media, la somma di tutti gli scarti è nulla
$$
\sum^N_{i=1}(x_{i}-\overline{x})=0
$$
$$\text{gli scarti positivi e negativi si compensano}$$
Ora consideriamo $(x_{i}-\overline{x})^2$, facendone la media otteniamo :
$$
\text{Varianza Campionaria }= S^2=\frac{1}{N-1}\sum^N_{i=1}(x_{i}-\overline{x})^2
$$
## Difetto
L'unità di **misura** usata è <mark style="background: #BBFABBA6;">diversa rispetto ai dati originali</mark>
## Cosa indica?
Data la [[Indici di posizione#Media Campionaria|media campionaria]] di un insieme di dati, la varianza campionaria <mark style="background: #BBFABBA6;">indica quanto i dati si allontanino / avvicinino ad essa</mark>
## Esempio
$$
\begin{gather}x_{1}=0, x_{2}=3,x_{3}=7,x_{4}=14 \\  \\
N = 4 
  \\ \\
   
\overline{x} =\frac{{0+3+7+14}}{4}=\frac{24}{4}=6 
 \\
 \\ S^2 = \frac{1}{13}\sum^4_{i=1}(x_{i}-\overline{x})=\frac{110}{3} \simeq 36.7
\end{gather}
$$
---
# Deviazione Campionaria
## Cosa è? 
$$
S = \sqrt{ \frac{{{\sum^N_{i=1}}(x_{i}-\overline{x})^2}}{N-1} }
$$
è la radice quadrata della [[#Varianza Campionaria]], a differenza di essa però utilizza la stessa unità di misura dell'insieme dei dati 
## Disuguaglianza di Chebyshev
Dato un insieme di dati e la sua [[Indici di posizione#Media Campionaria|Media Campionaria]] $\overline{x}$ insieme alla sua Deviazione Campionaria $S$

$\forall c\in \mathbb{R}:c>1$ la frazione di dati $\alpha$ che appartiene all'intervallo $(\overline{x}-c \cdot S,\overline{x} + c \cdot S)$ soddisfa la seguente disuguaglianza

---
# Scarto Interquartile
Per costruzione, l'intervallo $[q_{1},q_{3}]$ <mark style="background: #BBFABBA6;">contiene almeno il $50\%$ dei dati</mark>
![[Pasted image 20260305123942.png]]

---
# Correlazione
Consideriamo un insieme di $N$ dati a coppie
$$
(x_{1},y_{1}) \quad (x_{2},y_{2}) \quad (x_{3},y_{3}) \quad \dots \quad (x_{N},y_{N})
$$
Essi rappresentano misurazioni di due variabili in un campione di $N$ individui
## Esempio
$$
\begin{gather}x = \text{ numero anni di scuola} \\
y = \text{ pulsazioni} \\ \\
(12,73)  (16,67)  (13,74)  (18,63)  (19,73) \\
(12,84)  (18,60)  (19,62)  (12,76)  (14,71)  \\
 \\

\end{gather}$$
```chart
type: scatter
series:
  - title: Diagramma di Dispersione
    data:
      - {x: 12, y: 83.5}
      - {x: 12, y: 76}
      - {x: 12, y: 73}
      - {x: 13, y: 74}
      - {x: 14, y: 71}
      - {x: 16, y: 67}
      - {x: 18, y: 63.5}
      - {x: 18, y: 60}
      - {x: 19, y: 73}
      - {x: 19, y: 62}
beginAtZero: true
```