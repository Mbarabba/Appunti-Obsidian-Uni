% numeri pari

pari([], []) :- !.

pari([X | Xs], [X | Ys]) :-
    0 is mod(X, 2),
    pari(Xs, Ys),
    !.

pari([_ | Xs], Ys) :-
    pari(Xs, Ys).
