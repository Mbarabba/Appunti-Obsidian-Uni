% membro di una lista

lista([X,[X|_]).

lista([X,[_|T]):-
    lista([X,T]).

G: lista(2, [3, 2]).
% non funziona
% X/2, _/3, T/[2]
