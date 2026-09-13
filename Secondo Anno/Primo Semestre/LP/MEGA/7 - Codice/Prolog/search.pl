  % ricerca di un oggetto in una lista non ordinata
  % funziona ma non so indentare

  search([], Y) :- fail.
  
  search([X | Xs], Y) :-
  X = Y, true.

  search([X | Xs], Y) :-
  search(Xs, Y).
  
  
