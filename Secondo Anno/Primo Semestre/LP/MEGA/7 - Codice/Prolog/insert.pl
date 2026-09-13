insert([], N, [N]) :- !.

insert([X | Xs], N, [Y | Ys]) :-
    X < N, !,
    insert(Xs, N, Ys).

insert(X, N, [N | X]).
