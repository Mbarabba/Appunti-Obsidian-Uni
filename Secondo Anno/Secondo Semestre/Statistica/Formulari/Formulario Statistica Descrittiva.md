# Frequenza Relativa
$$p_{i}=\frac{f_{i}}{N}
$$
- $f_{i}$ è la frequenza assoluta, ossia il numero di volte in cui il dato compare nell'insieme di dati
- $N$ è il numero totale di dati
## Cosa fa?
Calcola la frazione o la percentuale di volte in cui un determinato valore compare in un insieme di dati
## Quando usarla?
Si usa per riassumere i dati in una tabella delle frequenze e per confrontare la frequenza di una classe rispetto al totale, indipendentemente dalla grandezza del campione

---
# Media Campionaria
$$
\bar{x}=\frac{1}{N}\sum^N_{i=1}x_{i}
$$
$$
\text{ con le frequenze assolute } f_{i} \text{ abbiamo}
$$
$$
\bar{x}=\frac{{\sum^N_{i=1}x_{i}f_{i}}}{N}
$$
- $x_{i}$ è l'i-esimo valore
- $N$ è il numero totale di dati
## Cosa fa?
Fornisce un indice di posizione per descrivere il "centro" dell'insieme
## Quando usarla
Da utilizzare  quando si vuole tracciare il baricentro di un insieme di dati quantitativi e non si hanno valori estremi anomali che potrebbero distorcere pesantemente il risultato

---
# Mediana Campionaria
$$
\text{Se }N \text{ è dispari } m = x_{(\frac{N+1}{2})} 
$$
$$
\text{Se }N \text{ è pari } m = \frac{{x_{\left( \frac{N}{2} \right)}+x_{({\frac{N}{2}+1})}}}{2}
$$
- $x_{i}$ dato in i-esima posizione
## Cosa fa?
Trova il valore centrale dell'insieme di dati che divide esattamente a metà le osservazioni ordinate
## Quando usarla?
Si usa come alternativa alla media per descrivere la centralità di un set di dati, in particolar modo quando i dati contengono code pesanti o valori estremi, in quanto la media è "insensibile alle code"

---
# K-esimo Percentile Campionario
$$\begin{gather}\text{Posto } p = \frac{k}{100} \\
 \\
\text{Se }Np \text{ non è intero } t=x_{(i)} \text{ dove }i \text{ è l'intero successivo a }Np \\
\text{Se }Np \text{ è intero } t=\frac{{x_{(Np)}+x_{(Np+1)}}}{2}
\end{gather}$$
- $k$ è la percentuale
- $p$ la relativa frazione
- $N$ il numero totale dei dati
- $x_{(i)}$ il dato ordinato in posizione $i$
## Cosa fa?
Calcola un valore $t$ per cui almeno il $k\%$ dei dati è $\leq t$ e almeno $(100-k)\%$ dei dati è $\geq t$
## Quando usarla
Utile per calcolare i quartili o generare il Box Plot

---
# Varianza Campionaria
$$
\text{Formula Normale }:s^2=\frac{1}{N-1}\sum^N_{i=1}(x_{i}-\bar{x})^2
$$
$$
\text{Formula Calcolo Rapido }:s^2=\frac{1}{N-1}\sum^n_{i=1}x^2_{i}- N \bar{x}^2
$$
- $x_{i}$ sono gli scarti dei dati originali rispetto alla media campionaria
- $\bar{x}$ è la media campionaria
- $N$ è il numero totale di dati
## Cosa fa?
È un indice di dispersione che quantifica la media degli scarti elevati al quadrato
## Quando usarla
Si usa per misurare quanto i valori di un campione differiscono tra loro rispetto al baricentro centrale

**Attenzione** a non usarla per presentare la variabilità nell'unità di misura originale, poiché i risultati sono espressi al quadrato

---
# Deviazione Standard
$$
s = \sqrt{ s^2 }=\frac{1}{N-1}\sum^N_{i=1}(x_{i}-\bar{x}^2)
$$
- $s^2$ è la varianza campionaria
## Cosa fa?
Fornisce una statistica che misura la dispersione dei dati rispetto alla media ottenendo una quantità omogeneo ai dati di partenza
## Quando usarla?
Da usare sempre quando si descrive il "raggio" della dispersione tipica in un report o in accoppiata con il Teorema di Chebyshev

---
# Scarto Interquartile
$$
\Delta=q_{3}-q_{1}
$$
- $q_{3}$ è il terzo quartile ($75°$ percentile)
- $q_{1}$ è il primo quartile ($25°$ percentile)
## Cosa fa?
È un indicatore di variabilità che misura l'ampiezza dell'intervallo che contiene almeno il $50\%$ dei dati centrali
## Quando usarla?
Utile per quantificare la dispersione dei dati attorno alla mediana, ed è fondamentale nella costruzione del Box Plot e per definire e ignorare i valori estremi o anomali

---
# Coefficiente di Correlazione Lineare Campionario
$$\text{Formula Normale }:r=\frac{{\sum^N_{i=1}(x_{i}-\bar{x})(y_{i}-\bar{y})}}{(N-1)s_{x}s_{y}} \quad r\in [-1,1]
$$
$$\text{Formula Alternativa : }r=\frac{{\sum^N_{i=1}(x_{i}y_{i})(N \bar{x} \bar{y})}}{(N-1)s_{x}s_{y}} \quad r\in [-1,1]
$$
- $(x_{i},y_{i})$ sono coppie di dati bivariati
- $\bar{x}$ e $\bar{y}$ sono le rispettive medie
- $s_{x}$ e $s_{y}$ sono le deviazioni standard campionarie
- $N$ è il numero di coppie analizzate
## Cosa fa?
Quantifica numericamente numericamente l'associazione e la tendenza lineare tra 2 variabili in un diagramma di dispersione
## Quando usarla?
Si usa per capire se a valori alti/bassi della variabile $x$ corrispondo valori alti/bassi della variabile $y$

Va ricordato che misurare una correlazione matematica forte non implica stabilire necessariamente una causalità