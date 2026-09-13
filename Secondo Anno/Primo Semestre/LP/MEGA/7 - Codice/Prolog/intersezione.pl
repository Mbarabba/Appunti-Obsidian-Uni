% intersezione tra due liste non ordinate

in([], _, []) :- !.

in([X | Xs], Ys, [X | Zs]) :-
    member(X, Ys),
    in(Xs, Ys, Zs),
    !.

in([_ | Xs], Ys, Zs) :-
    in(Xs, Ys, Zs).

