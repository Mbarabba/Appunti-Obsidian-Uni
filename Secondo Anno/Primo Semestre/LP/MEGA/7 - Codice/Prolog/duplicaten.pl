% duplica gli elementi di una lista n volte

dup([], _, []) :- !.

dup(Xs, N, Ys) :-
    W is N,
    dup(Xs, N, Ys, W),
    !.

dup([], _, [], _) :- !.

% caso N = 1
dup([X | Xs], 1, [X | Ys], W) :-
    dup(Xs, W, Ys, W).

dup([X | Xs], N, [X | Ys], W) :-
    N > 1,
    N1 is N - 1,
    dup([X | Xs], N1, Ys, W),
    !.
