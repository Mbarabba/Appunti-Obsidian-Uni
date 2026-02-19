# Cosa è?
È un insieme di tecnologie di rete che operano a 2 livelli della pila ISO/OSI
- **Livello di Link** : Definisce come sono fatti i pacchetti e come vengono gestiti gli indirizzi MAC
- **Livello Fisico** : Definisce i tipi di cavi e i segnali elettrici o ottica da usare

Ethernet è un servizio **connectionless** e non **affidabile**

---
# Cosa fa?
Il compito di Ethernet è trasportare datagrammi tra due interfacce di rete nella stessa LAN in modo rapido ed economico

Le sue funzioni principali sono : 
1. **Framing** : Incapsula i dati in una struttura standard
2. **Consegna Locale** : Usa gli indirrizzi MAC per recapitare i dati al dispositivo corretto
3. **Rilevamento Errori** : Usa il CRC per assicurarsi che i dati non siano stati alternati durante il viaggio sul cavo
---
# Come lo fa?
Il funzionamento di Ethernet si basa su tre pilastri
## [[Framing#Come lo fa? | La struttura del frame ethernet]]
## Topologia 
- **Ethernet classica**
  In passato, tutti i computer erano collegati a un unico cavo coassiale. Era un "dominio di collisione" unico: se due parlavano insieme, i segnali collidevano (si usava il protocollo **CSMA/CD**)
- **Ethernet moderna**
  Oggi usiamo gli **Switch**. Ogni computer è collegato a una porta dello switch tramite un cavo dedicato (doppino in rame o fibra). Non ci sono più collisioni perché lo switch gestisce i flussi in modo isolato.
## Standard fisici
Ethernet non è un'unica velocità, ma una famiglia di standard che si distinguono per il mezzo trasmissivo:
- **10Base-T:** 10 Mbps su rame.
    
- **100Base-TX (Fast Ethernet):** 100 Mbps su rame.
    
- **1000Base-T (Gigabit Ethernet):** 1 Gbps su rame (il più comune oggi).
    
- **10GBASE-SR:** 10 Gbps su fibra ottica.