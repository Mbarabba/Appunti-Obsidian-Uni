% concatenazione di due liste ordinate
% rispettando l'ordine
% funziona

con([], Y, Y) :- !.
con(X, [], X) :- !.
 
con([X | Xs], [Y | Ys], [X | Zs]) :-
	X < Y, !,
	con(Xs, [Y | Ys], Zs).
% aggiungo l'elemento X alla lista Z se è minore di Y
% richiamo la funzione sul resto della lista

con([X | Xs], [Y | Ys], [Y | Zs]) :-
	X >= Y, !,
	con([X | Xs], Ys, Zs).
% aggiungo l'elemento Y alla lista Z se è minore/uguale a X
% richiamo la funzione sul resto della lista
