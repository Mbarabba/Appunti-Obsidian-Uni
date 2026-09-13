% calcolo del resto in prolog

div(_, 0, _, _) :- fail, !.
div(X, 1, X, 0) :- !.
div(X, X, 1, 0) :- !.

div(N, D, X, Y) :-
    N > D,
    X1 is X - 1,
    N1 is N - D,
    div(N1, D, X1, Y),
    !.

% N < D
div(N, D, 0, N).
