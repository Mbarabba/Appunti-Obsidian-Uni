% eliminare gli elementi uguali

%%%& -*- Mode: Prolog -*-

compress([], []) :-
    !.

compress([X | Xs], Ys) :-
    member(X, Xs),
    compress(Xs, Ys),
    !.

compress([X | Xs], [X | Ys]) :-
    compress(Xs, Ys).

