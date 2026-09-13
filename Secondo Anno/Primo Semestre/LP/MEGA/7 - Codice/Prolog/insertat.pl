% inserisci alla posizione N

insert([], _, E, [E]) :- !.

insert(Xs, 0, E, [E | Xs]) :- !.

insert([X | Xs], N, E, [X | Ys]) :-
    N1 is N - 1,
    insert(Xs, N1, E, Ys).

