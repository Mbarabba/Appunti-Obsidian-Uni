% rimuovo tutti gli elementi N da una lista

remove([], _, []) :-
    !.

remove([], _, Y) :-
    fail,
    !.

remove([X | Xs], N, [Y | Ys]) :-
    X \= N,
    X = Y,
    remove(Xs, N, Ys),
    !.

remove([X | Xs], N, Ys) :-
    X = N,
    remove(Xs, N, Ys).
