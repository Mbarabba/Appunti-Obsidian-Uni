;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                           MEMBRI GRUPPO PROGETTO                             ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;                                                                           ;
;;;; Tinghino Christian     727160                                             ;
;;;; Vanzo Luca Samuele     735924                                             ;
;;;; Secci Stefano          756610                                             ;
;;;;                                                                           ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                             RICHIESTE PROGETTO
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;    == Introduzione ==
;    Ai tempi di Simula e del primo Smalltalk, molto molto tempo prima di
;    Python, Ruby, Perl e SLDJ, i programmatori Lisp gia' producevano una
;    pletora di linguaggi object oriented. Il vostro progetto consiste
;    nella costruzione di un sistema siffatto.
;
;    OOL e' un semplice linguaggio object-oriented con eredita' singola.
;    Il suo scopo e' didattico e mira soprattutto ad evidenziare aspetti
;    dell'implementazione di linguaggi object-oriented:
;
;       1) Il problema di dove e come recuperare i valori ereditati
;       2) Come rappresentare i metodi e le loro chiamate
;       3) Come manipolare il codice nei metodi stessi.
;
;    Dovrete produrre una versione di OOL in Common Lisp.
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                 PRIMITIVE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Nome: DEFINE-CLASS
;
; Sintassi:
;   (define-class <class-name> <parent> [<slot-name> <value>]*)
;
; Dettagli:
;   Definisce la struttura di una classe e la memorizza in una locazione
;   centralizzata (una variabile globale: *classes-specs*).
;
;   Quando invocata con i parametri corretti, ritorna il nome della
;   classe definita, diventando invocabile tramite la new.
;
;   Di default esiste la classe object nella variabile *classes-specs*, per
;   gestire l'ereditarietà con classe parent NIL.
;
;   Grazie all'ereditarietà singola, ciascuna classe può ereditare gli slot
;   della classe specificata nel campo 'parent', e se esiste uno slot con
;   lo stesso nome lo sovrascrivo.
;
;-------------------------------------------------------------------------------
;
; Nome: NEW
;
; Sintassi:
;   (new <class-name> [<slot-name> <value>]*)
;
; Dettagli:
;   Crea una nuova istanza di una classe precedentemente definita tramite
;   la primitiva define-class.
;
;   Se il campo <class-name> corrisponde al nome di una classe definita,
;   ritorna una istanza di <class-name>.
;
;   Sovrascrive gli <slot-value> del parent quando lo <slot-name> è uguale
;   a uno della classe parent.
;
;   Se il nome dell'istanza esiste già, la precedente istanza viene
;   sovrascritta in toto dalla nuova.
;
;-------------------------------------------------------------------------------
;
; Nome: GET-SLOT
;
; Sintassi:
;   (get-slot <instance> <slot-name>)
;
; Dettagli:
;   Se <instance> è un'istanza esistente (creata tramite la primitiva new)
;   e <slot-name> è il nome di uno slot dell'istanza (ereditato o meno),
;   ritorna lo <slot-value> associato relativo all'istanza.
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                   FUNZIONI
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Nome: PREPARE-BUILD-SLOTS
;
; Dettagli:
;   Controlla l'ereditarietà degli [<slot-name> <slot-value>]*.
;
;-------------------------------------------------------------------------------
;
; Nome: BUILD-SLOTS
;
; Dettagli:
;   Concatena gli slot relativi alla classe parent con quelli della classe
;   figlia, gestendo il caso in cui la classe figlia ridefinisce (per la
;   propria istanza) il valore di uno slot che eredita.
;
;-------------------------------------------------------------------------------
;
; Nome: BUILD-SLOTS-CHECKER
;
; Dettagli:
;   Controlla se un dato slot sia presente nella supercasse
;
;-------------------------------------------------------------------------------
;
; Nome: BUILD-SLOTS-REMOVER
;
; Dettagli:
;   Se ho lo stesso <slot-name> sia nella lista parent che nella lista figlia,
;   elimino quello della lista parent, così da eliminare i duplicati.
;
;-------------------------------------------------------------------------------
;
; Nome: PREPARE-METHOD
;
; Dettagli:
;   Per ogni slot controlla se lo <slot-value> è un metodo o un parametro, e
;   se è un metodo inizia l'elaborazione del corpo del metodo chiamando la
;   funzione process-method.
;
;-------------------------------------------------------------------------------
;
; Nome: PROCESS-METHOD
;
; Dettagli:
;   Crea una lambda con il corpo del metodo passatogli, e gli viene assegnato
;   un nome (<method-name>).
;   Viene chiamata la rewrite-method-code per inserire il parametro "this".
;   In sostanza, permette di richiamare un metodo con la notazione funzionale,
;   a patto che il primo argomento sia un'istanza valida.
;
;-------------------------------------------------------------------------------
;
; Nome: REWRITE-METHOD-CODE
;
; Dettagli:
;   Prende come parametri method-name e method-spec e inserisce il parametro
;   "this" in testa alla lista degli argomenti (in questo modo assumiamo che
;   nell'invocazione con la notazione funzionale, l'istanza sia sempre il
;   primo argomento).
;
;-------------------------------------------------------------------------------
;
; Nome: REWRITE-METHOD-ARGS
;
; Dettagli:
;   Accetta una lista di argomenti, in cui il primo argomento è già il
;   parametro "this", in cerca duplicati.
;   Ritorna la lista priva di duplicati.
;
;-------------------------------------------------------------------------------
;
; Nome: EVALUATOR-LSLOTS
;
; Dettagli:
;   Controlla la lista dei parametri in cerca di errori (se il numero di
;   argomenti è dispari, se il nome del parametro non è un simbolo ecc..) e
;   ritorna la lista di argomenti costruita come da specifiche.
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                               TEST ESEGUITI
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;   TEST RICORSIONE METODO DEFINITO
;
;------------------------------------------------------------------------------;
(define-class 'A nil 'class-ptr nil 'name "Pippo A")

(defparameter PA (new 'A))

(define-class 'B nil 'class-ptr PA)

(defparameter PB (new 'B))

(define-class 'C nil 'class-ptr PB)

(defparameter PC (new 'C))

(define-class 'D nil 'class-ptr PC)

(defparameter PD (new 'D))

(define-class 'E nil 'class-ptr PD)

(defparameter PE (new 'E))

(define-class 'F nil 'class-ptr PE 'surname "Rossi" 'talk '(method (ptr)
(if (null (get-slot ptr 'class-ptr)) (format nil "Ricorsione
(Classe F to A)--> Nome: ~A" (get-slot ptr 'name))
(talk this (get-slot ptr 'class-ptr)))))

(defparameter PF (new 'F))

(talk PF PF)
;------------------------------------------------------------------------------;
;
;   TEST EREDITARIETA' A CASCATA
;
;------------------------------------------------------------------------------;
(define-class 'A nil 'name "Nome CLasse A")

(define-class 'B 'A 'surname "Cognome CLasse B")

(define-class 'C 'B 'age "Eta' CLasse C")

(define-class 'D 'C 'university "Universita' CLasse D")

(define-class 'E 'D 'talk '(method (x) (format nil "Nome: ~A, Cognome: ~A,
Età: ~A, Università: ~A, Parametro: ~A" (get-slot this 'name) (get-slot this
'surname) (get-slot this 'age) (get-slot this 'university) x)))

(defparameter ptrE (new 'E))
;------------------------------------------------------------------------------;
;
; TEST PER DEFINE-CLASS
;
;------------------------------------------------------------------------------;
(define-class 'mezzo nil 'name "Mezzo" 'tipo nil)

(define-class 'mezzo-terra 'mezzo 'ruote "true")

(define-class 'automobile 'mezzo-terra 'num-portiere 3 'colore "nero")

(define-class 'person nil 'name "Eve" 'age "42" 'talk '(method ()
(format nil "My name is ~A; my age is ~D." (get-slot this 'name)
(get-slot this 'age))))

(define-class 'worker 'person 'name "Paperino" 'university "POLIMI" 'talk
'(method () (format nil "worker!!!! My name is ~A; my age is ~D."
(get-slot this 'name) (get-slot this 'age))))

(define-class 'worker 'person 'name "Thor" 'university nil 'talk
'(method () (format nil "My name is ~A, I work in ~B and my age is ~D."
(get-slot this 'name) (get-slot this 'university) (get-slot this 'age))))

(define-class 'worker-with-friend 'worker 'friend nil 'say-friend '(method ()
(format nil "My friend is ~A." (get-slot (get-slot this 'friend) 'name))) 'talk
'(method () (format nil "I'm a worker with friend. My friend is ~A." (get-slot
(get-slot this 'friend) 'name))))

(define-class 'converter nil 'from nil 'to nil 'convert '(method (from) (error
"Cannot convert ~S. Unknown conversion ~S -> ~S." (get-slot this 'from)
(get-slot this 'to))) 'to-string '(method () (format nil "Converter ~S -> ~S."
(get-slot this 'from) (get-slot this 'to))))

(define-class 'imperial-converter 'converter 'from 'feet 'to 'meters)

(define-class 'cf-converter 'converter 'from 'celsius 'to 'fahrenheit 'convert
'(method (c) (+ (* 9/5 c) 32)))

(define-class 'fc-converter 'converter 'from 'fahrenheit 'to 'celsius 'convert
'(method (f) (* 5/9 (- f 32))))

(define-class 'persona2 nil)

(talk (new 'persona2 'age 42 'talk '(method () (format nil "My age is ~D"
(get-slot this 'age)))))

(define-class 'persona3 nil 'name "anonymous")

(talk (new 'persona3 'age 42 'talk '(method ()
  (format nil "My name is ~A and my age is ~D"
  (get-slot this 'name) (get-slot this 'age)))))
;------------------------------------------------------------------------------;
;
;   TEST PER NEW
;
;------------------------------------------------------------------------------;
(defparameter ic1 (new 'imperial-converter))

(defparameter ic2 (new 'imperial-converter 'convert
'(method (feet) (/ feet 3))))

(defparameter cf (new 'cf-converter))

(defparameter fc (new 'fc-converter))

(defparameter p (new 'person 'name "myName" 'gender "male"))

(defparameter eve (new 'person))

(defparameter adam (new 'person 'name "Adam"))

(defparameter s1 (new 'worker 'name "Pimpa" 'age 2))

(defparameter s2 (new 'worker 'age 18 'university "UNIMI"))

(defparameter s3 (new 'worker-with-friend 'friend adam))

(defparameter s4 (new 'worker-with-friend 'friend s1))
;------------------------------------------------------------------------------;
;
;   TEST PER GET-SLOT
;
;------------------------------------------------------------------------------;
(get-slot (new 'person 'name "myName" 'age 42 'gender "male") 'gender)

(get-slot (new 'person 'name "myName" 'gender "male") 'gender)

(get-slot (new 'person 'name "myName" 'gender "male") 'age)

(get-slot eve 'age)

(get-slot adam 'name)

(get-slot s1 'name)

(get-slot s2 'name)
;------------------------------------------------------------------------------;
;
;   TEST INVOCAZIONE METODI
;
;------------------------------------------------------------------------------;
(convert ic2 42)

(convert fc 42)

(convert cf 42)

(say-friend s3)

(to-string (new 'cf-converter 'from 'centigrade))

(to-string fc)

(to-string (new 'converter))

(talk s1)

(talk s2)

(talk (get-slot s4 'friend))

(talk (new 'person 'name "Name" 'surname "Surname" 'age 42 'talk '(method ()
(format nil "Person ::-->  My name is ~A ~A, and my age is ~D." (get-slot this
'name) (get-slot this 'surname) (get-slot this 'age)))))
;------------------------------------------------------------------------------;
;
;   TEST STAMPE MULTIPLE CON PARAMETRI
;
;------------------------------------------------------------------------------;
(define-class 'test-multi nil 'talk '(method (a b c)
(format t "Parametro A:  ~A" a) (terpri) (format t "Parametro B:  ~A" b)
(terpri) (format t "Parametro C:  ~A" c)))

(talk (new 'test-multi) "Ciao" "Mondo" "!!!!")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                               EOF: END-OF-FILE                               ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
