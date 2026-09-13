% valore assoluto di un numero
% funziona

abs(0, 0).
% N = numero, R = risultato
abs(N, R):-
    N > 0,
    R is N.

abs(N, R):-
    N < 0,
    R is -(N).
