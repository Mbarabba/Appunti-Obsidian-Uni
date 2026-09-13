% elevamento a potenza di un numero
% N = numero, P = potenza, R = risultato

pow(_N, 0, 1).
pow(0, _P, 0).
% un numero elevato alla zero è 1, alla 1 è N

pow(N, P, R):-
    P1 is P - 1,
    pow(N, P1, R1),
    R is R1 * N.

?- pow(2, 3, 8).
