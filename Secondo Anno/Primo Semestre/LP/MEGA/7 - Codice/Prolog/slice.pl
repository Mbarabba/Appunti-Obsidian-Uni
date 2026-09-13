% estrae una slice da una lista, dati inizio e fine

slice([], _, _, []) :- !.

slice([X | Xs], I, F, [Y | Ys]) :-
    I > 1,
    I1 is I - 1,
    F1 is F - 1,
    slice(Xs, I1, F1, [Y | Ys]),
    !.

% se I = 1
slice([X | Xs], 1, F, [X | Ys]) :-
    F > 0,
    F1 is F - 1,
    slice(Xs, 1, F1, Ys),
    !.
    
% se F = 0
slice([X | Xs], 1, 0, Ys) :-
    slice(Xs, 1, 0, Ys).
