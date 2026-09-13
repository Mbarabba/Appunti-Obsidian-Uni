% sostituzione di tutte le occorrenze N con W

sub([], _, _, []).

sub([N | Xs], N, W, [W | Ys]) :-
    sub(Xs, N, W, Ys),
    !.

sub([X | Xs], N, W, [X | Ys]) :-
    sub(Xs, N, W, Ys).
