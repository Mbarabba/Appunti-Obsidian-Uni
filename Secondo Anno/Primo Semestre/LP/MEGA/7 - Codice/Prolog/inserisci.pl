inserisci([], X, [X]) :- !.

inserisci([X | Xs], A, [X | Ys]) :-
    A > X, !,
    inserisci(Xs, A, Ys).

inserisci([X | Xs], A, [A, X | Xs]) :- !.
