% elementi maggiori e minori di N

split([], _, [], []).

split([X | Xs], N, [X | Ys], Zs) :-
    X > N,
    split(Xs, N, Ys, Zs),
    !.

split([X | Xs], N, Ys, [X | Zs]) :-
    split(Xs, N, Ys, Zs).
