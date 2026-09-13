% restituisce il massimo tra i massimi di 3 liste

max([], [], [], 0) :- !.

max(X, Y, Z, N) :-
    max(X, M1),
    max(Y, M2),
    max(Z, M3),
    max([M1, M2, M3], N),
    !.

max([], 0) :- !.
    
max([L | Ls], L) :-
    max(Ls, M),
    L > M,
    !.

max([L | Ls], M) :-
    max(Ls, M),
    L =< M,
    !.

