% append

append([], X, X) :-
    !.
append(X, [], X) :-
    !.

append([X | Xs], Y, [X | Z]) :-
    append(Xs, Y, Z).

