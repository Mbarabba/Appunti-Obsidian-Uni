% sostituisce ogni N con New

sostituisci([], _, _, []) :- !.

sostituisci([X | Xs], N, New, [X | Ys]) :-
    X \= N,
    sostituisci(Xs, N, New, Ys),
    !.

sostituisci([N | Xs], N, New, [New | Ys]) :-
    sostituisci(Xs, N, New, Ys).
    

