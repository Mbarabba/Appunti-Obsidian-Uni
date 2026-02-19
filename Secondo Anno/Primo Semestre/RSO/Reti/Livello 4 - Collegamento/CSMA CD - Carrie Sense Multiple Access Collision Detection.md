# Cosa fa?
È un protocollo di livello di link che serve a gestire le collisioni in una rete dove più nodi condividono lo stesso canale fisico

---
# Cosa fa?
Il suo scopo è massimizzare l'efficienza della rete riducendo il tempo sprecato in collisioni, senza il *"Collision Detection"*, un nodo continuerebbe a trasmettere tutto il suo frame anche se questo è già stato corrotto da una collisione.

Con il CD, il nodo interrompe subito la trasmissione non appena rileva il problema, liberando il canale il prima possibile

---
# Come lo fa?
L'operazione della scheda di rete segue questi passaggi precisi :
1. **Carrier Sensing**
   La NIC riceve un datagramma dal livello superiore.
   Ascolta il canale :
	- Se il canale è libero, inizia la trasmessione
	- Se il canale è occupato, attende finchè non diventa libero e poi trasmette
2. **Trasmissione e Monitoraggio**
   Mentre i bit, la NIC monitora costantemente il livello di energia sul cavo per vedere se ci sono segnali proveniente da altri nodi 
3. **Collision Detection**
   Se la NIC trasmette l'intero frame senza rilevare interferenze ha finito con successo
	- Se invece rivela un segnale estraneo mentre sta trasmettendo, capisce che c'è una collisione
4. **Abort e Jam Signal**
   No appena rileva la collisione, la NIC
	- Interrompe immediatamente la trasmissione
	- Invia un Jam Signal per assicurarsi che tutti gli altri nodi sulla rete si accorgano della collisione e scartino i dati corrotti
5. **Backoff Esponenziale**
   Dopo l'interruzione, il nodo non può riprovare subito.
   Entra in una fase di attesa:
	- Dopo la collisione numero $n$, il nodo sceglie un numero casuale $K$ tra $0$ e $2^{n}-1$ 
	- Aspetta un tempo pari a $K \times 512$ bit-time *(il tempo necessario a trasmettere 512 bit)*
	- **Perché esponenziale?** Perché se ci sono molti nodi che provano a trasmettere, il range di K raddoppia ad ogni fallimento (0..1,0..3,0..7...), riducendo la probabilità che due nodi scelgano di nuovo lo stesso istante per riprovare.
