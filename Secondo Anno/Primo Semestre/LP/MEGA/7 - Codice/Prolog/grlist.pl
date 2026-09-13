% lista ordinata
% dato il primo elemento e N,
% restituire la lista contenente
% i numeri maggiori di N

list([], _, []).

list([X | Xs], N, Ys) :-
    X < N,
    list(Xs, N, Ys),
    !.

list(Xs, N, Xs).

% modifico il predicato con lista
% non in ordine

list1([], _, []).

list1([X | Xs], N, Ys) :-
    X < N,
    list1(Xs, N, Ys),
    !.

list1([X | Xs], N, [X | Ys]) :-
    list1(Xs, N, Ys).
