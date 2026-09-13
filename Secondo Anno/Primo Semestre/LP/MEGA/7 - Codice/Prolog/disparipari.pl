% lista numeri dispari e numeri pari

n([], [], []).

n([X | Xs], [X | Ys], Zs) :-
    1 is mod(X, 2),
    n(Xs, Ys, Zs),
    !.

n([X | Xs], Ys, [X | Zs]) :-
    n(Xs, Ys, Zs).
