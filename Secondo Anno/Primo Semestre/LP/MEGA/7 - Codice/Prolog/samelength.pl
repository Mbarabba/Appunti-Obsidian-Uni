% verificare che due liste siano lunghe uguali

len([], []) :-
    !.

len([], _) :-
    fail,
    !.

len(_, []) :-
    fail,
    !.

len([X | Xs], [Y | Ys]) :-
    len(Xs, Ys).
