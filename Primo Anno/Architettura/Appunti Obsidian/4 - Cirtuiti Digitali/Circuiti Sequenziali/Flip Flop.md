# Cos'è?
È un circuito sequenziale sincrono evoluto rispetto al latch

La sua caratteristica è di essere **Edge-Triggered**, ovvero cambia stato solo in un istante preciso (il fronte di salita o di discesa del [[Clock]]), e non per tutta la durata del segnale alto

---
# Da cosa è fatto?
Un Flip Flop è costruito mettendo in serie due [[D Latch]]
1. Il primo Latch è chiamato **Master**
2. Il secondo Latch è chiamato **Slave**

I due latch sono comandati dallo stesso segnale di Clock, ma in modo opposto, quando uno è attivo/trasparente, l'altro è bloccato
![[Pasted image 20260129154004.png]]
---
# Cosa fanno?
Memorizza un bit di informazione campionandolo esattamente nell'istante in cui il Clock cambia stato

Il risultato è che l'uscita $Q$ cambia "a scatti" precisi, rimanendo stabile per tutto il resto del tempo, indipendentemente da cosa succede all'ingresso $D$

---
# Come lo fa?
Il meccanismo Master-Slave funziona come una doppia porta di sicurezza
1. **Clock Basso (0)**
	- Il **Master** è aperto, ascolta l'ingresso $D$ e lo memorizza internamente
	- Lo **Slave** è chiuso, mantiene il vecchio valore in uscita $Q$ e isola il circuito esterno da quello che sta succedendo nel Maset
2. **Clock Sale (Fronte di salita $0\to1$)
	- Nell'istante esatto della salita, il Master si chiude
	- Contemporaneamente, lo Slave si apre, legge il valore bloccato nel Master e lo porta all'uscita $Q$
3. **Clock Alto (1)** 
	- L'uscita è aggiornata, ma poichè il Master è chiuso, qualsiasi cambiamento su $D$ viene ignorato fino al prossimo ciclo

Questo garantisce che la memorizzazione avvengo "istantaneamente" e senza ambiguità

---
# [[D Latch | Confronto con D Latch]]
| Caratteristica           |                                         D Latch                                          |                                              Flip Flop                                               |
| :----------------------- | :--------------------------------------------------------------------------------------: | :--------------------------------------------------------------------------------------------------: |
| Trigger<br>(Attivazione) |          Level Triggered<br><br>Attivo per tutto il tempo in cui Clock=1 (o 0)           |         Edge Triggered<br><br>Attivo solo nell'istante del cambio (fronte di salita/discesa)         |
| Comportamento            |                                       Trasparente                                        |         Opaco/Campionato<br><br>$Q$ cambia solo al tocco del clock, ignora $D$ nel frattempo         |
| Complessità              |                                          Bassa                                           |                           Alta<br><br>(2 Latch in serie = Master + Slave)                            |
| Uso Principale           |                      Memorie semplice dove il timing è meno critico                      | **Registri CPU, Register File, Contatori**<br>ovunque si debba leggere e scrivere nello stesso ciclo |
| Sicurezza                | Rischio di "feedback loop"<br><br>(il dato corre troppo veloce dall'uscita all'ingresso) |                         Sicuro<br>isola l'ingresso dall'uscita perfettamente                         |