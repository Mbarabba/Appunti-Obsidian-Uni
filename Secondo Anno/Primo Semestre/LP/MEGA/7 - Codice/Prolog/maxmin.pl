% massimo e minimo

maxmin([], 0, 100) :- !.

maxmin([X | Xs], Max, Min) :-
    maxmin(Xs, Max1, Min),
    X > Max1,
    Max is X,
    !.

maxmin([X | Xs], Max, Min) :-
    maxmin(Xs, Max, Min1),
    X < Min1,
    Min is X,
    !.

maxmin([X | Xs], Max, Min) :-
    maxmin(Xs, Max, Min).
