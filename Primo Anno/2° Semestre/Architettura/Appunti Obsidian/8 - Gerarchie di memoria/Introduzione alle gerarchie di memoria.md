# Cos'é?
È un organizzazione strutturale delle risorse di memorizzazione di un calcolatore

Nasce per risolvere un problema fondamentale : i programmatori vorrebbero una memoria illimitata e velocissima, ma le memorie veloci costano e sono piccole, mentre quelle economiche sono lente

La gerarchia è quindi un sistema a livelli che crea l'illusione di avere una memoria grande quanto il livello più economico e veloce quanto il livello più costoso

---
# Da cosa è composta?
È rappresentata come una piramide dove, salendo verso la punta, diminuisce la capacità ma aumenta la velocità e il costo per bit
![[Pasted image 20260207102144.png]]
1. **Registri della CPU** 
2. **[[Cache memory | Cache]]** : Un livello intermedio inserito tra CPU e RAM per nascondere la lentezza della memoria centrale
3. RAM
4. Memoria Secondaria (Dischi / SSD)
---
# Cosa fa?
Il suo obbiettivo è sfruttare il **principio di località** per mantenere i dati usati più spesso nei livelli alti e quelli usati raramente nei livelli bassi

---
# Come lo fa?
Il meccanismo si basa sullo spostamento di blocchi (o linee) di dati tra 2 livelli adiacenti

Si basa su 2 concetti statistici chiamati "Località" :
- **Località Temporale** : Se la CPU usa un dato adesso, è probabile che lo riuserà a breve, quindi quel dato viene copiato nella Cache
- **Località Spaziale** : Se la CPU usa un dato all'indirizzo X, è probabile che presto userà i dati vicini ($X+1$), quindi, viene caricato in cache un intero blocco di dati contigui

Quando la CPU chiede un dato : 
- **HIT (Successo)** : Il dato è già nel livello veloce, la CPU lo legge subito
- **MISS (Fallimento)** : Il dato non c'è, il processore va in stallo, recupera il blocco dal livello inferiore, lo copia nel livello superiore e riprende l'esecuzione