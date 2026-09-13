% conta le occorrenze di una sequenza
% NON FUNZIONA UN CAZZO ED E' INCOMPLETO

count([], _, 0) :- !.

count(X, Y, N) :-
    count(X, Y, N, Y),
    !.

count(X, [], N, Y) :-
    count(X, Y, N1, Y),
    N is N1 + 1,
    !.

count([X | Xs], [X | Ys], N, Zs) :-
    count(Xs, Ys, N, Zs),
    !.

% se X e Y sono diverse toglie X e resetta Ys
count([X | Xs], _, N, Zs) :-
    count([X | Xs], Zs, N, Zs),
    !.

count([], _, 0, _).
