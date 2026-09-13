% rimuove gli elementi in posizione
% multiple di N da una lista

drop([], _, []) :- !.
drop([], _, [], _) :- !.

drop(X, N, Y) :-
    drop(X, N, Y, N),
    !.

drop([X | Xs], N, [X | Ys], T) :-
    N > 1,
    N1 is N - 1,
    drop(Xs, N1, Ys, T),
    !.

drop([X | Xs], 1, Ys, T) :-
    drop(Xs, 0, Ys, T),
    !.

drop(X, 0, Y, T) :-
    drop(X, T, Y, T).
