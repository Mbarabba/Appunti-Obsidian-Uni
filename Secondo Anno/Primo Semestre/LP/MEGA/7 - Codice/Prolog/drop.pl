% rimuovi l'ennesimo elemento di una lista

drop([], _, []) :- !.
drop([_ | Xs], 1, Xs) :- !.

drop([X | Xs], N, [X | Ys]) :-
    N1 is N - 1,
    drop(Xs, N1, Ys).

