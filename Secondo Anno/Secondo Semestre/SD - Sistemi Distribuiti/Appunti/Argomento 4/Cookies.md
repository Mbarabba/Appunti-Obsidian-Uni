# Cosa sono?
Sono strumento utilizzato dai client e dai server HTTP per mantenere lo stato nelle transizioni

Poichè il protocollo HTTP è di natura stateless, ogni singola richiesta è indipendente e il server non mantiene alcuna informazione sulle interazioni precedenti

I cookie nascono per superare questo limite, permettendo di collegare tra loro scambi su più passi

---
# Cosa fanno?
Il loro scopo è identificare e tracciare l'utente durante la navigazione, permettendo al server di ricordarsi di lui

I principali utilizzi dei cookie riguardano
- L'autorizzazione e l'autenticazione
- La gestione del carrello nei siti e-commerce
- Le raccomandazioni personalizzate e le pubblicità mirate

---
# Come lo fanno?
L'architettura dei cookie non si limita a un semplice file, ma si basa sull'interazione di 4 componenti fondamentali
1. Un database di backend, mantenuto e gestito dal server Web
2. Un file locale, mantenuto dal client e gestito dal browser
3. Una speciale riga di intestazione nella risposta HTTP inviata dal serve
4. Una speciale riga di intestazione nella richiesta HTTP inviata dal client

Quando visiti un sito web per la prima volta, la tua richiesta HTTP iniziale non ha cookie

1. Il server a riceve, genere un ID univoco per identificarti e crea una nuova voce associata a quell'ID nel suo database di backend
2. Il browser legge questa istruzione e salva l'ID nel file locale dei cookie
3. Da questo momento, ogni richiesta HTTP successiva verso quel sito, il browser includerà automaticamente una riga di intestazione con l'ID memorizzato
4. Leggendo questa intestazione, il server cercherà l'ID nel proprio database di backend, riuscendo cosi' a identificare la tua specifica transazione tra tutte quelle in corso

