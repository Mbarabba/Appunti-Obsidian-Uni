% duplica gli elementi di una lista

dup([], []).

dup([X | Xs], [Y, Y | Ys]) :-
    Y is X,
    dup(Xs, Ys).
