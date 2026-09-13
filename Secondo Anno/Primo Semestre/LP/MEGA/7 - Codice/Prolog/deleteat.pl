% data una lista, data una posizione (si parte da 0)
% rimuovere l'elemento alla posizione

del([], _, []) :- !.

del([_ | Xs], N, Ys) :-
    N = 0,
    N1 is N - 1,
    del(Xs, N1, Ys),
    !.

del([X | Xs], N, [X | Ys]) :-
    N1 is N - 1,
    del(Xs, N1, Ys).
