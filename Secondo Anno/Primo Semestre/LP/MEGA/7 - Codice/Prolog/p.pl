% preparazione al parziale

% massimo
max([], 0) :- !.

max([X | Xs], Max) :-
    max(Xs, Max1),
    X > Max1,
    Max is X,
    !.

max([_ | Xs], Max) :-
    max(Xs, Max).

% inserimento ordinato
ins([], N, [N]) :- !.

ins([X | Xs], N, [N, X | Xs]) :-
    X > N,
    !.

ins([X | Xs], N, [X | Ys]) :-
    ins(Xs, N, Ys).

% somma elementi
sum([], 0) :- !.

sum([X | Xs], N) :-
    sum(Xs, N1),
    N is N1 + X.

% compress
compress([], []) :- !.

compress([X | Xs], Ys) :-
    member(X, Xs),
    compress(Xs, Ys),
    !.

compress([X | Xs], [X | Ys]) :-
    compress(Xs, Ys).

% decrement
dec([], _, []) :- !.

dec([X | Xs], N, [X1 | Ys]) :-
    X1 is X - N,
    dec(Xs, N, Ys).

% split at
split([], _, [], []) :- !.

split(Xs, 0, [], Xs) :- !.

split([X | Xs], N, [X | Ys], Zs) :-
    N1 is N - 1,
    split(Xs, N1, Ys, Zs).

% rimozione N
rmv([], _, []) :- !.

rmv([X | Xs], N, [X | Ys]) :-
    X \= N,
    rmv(Xs, N, Ys),
    !.

rmv([N | Xs], N, Ys) :-
    rmv(Xs, N, Ys).

% conteggio occorrenze di N
count([], _, 0) :- !.

count([N | Xs], N, Tot) :-
    count(Xs, N, Tot1),
    Tot is Tot1 + 1,
    !.

count([_ | Xs], N, Tot) :-
    count(Xs, N, Tot).

% fattoriale
f(1, 1) :- !.

f(N, F) :-
    N1 is N - 1,
    f(N1, F1),
    F is F1 * N.

% restituzione del penultimo elemento
slast([], 0).

slast([X, _], X) :- !.
slast([_, Y | Ys], X) :-
    slast([Y | Ys], X).

% append
append([], [], []) :- !.

append([X | Xs], Ys, [X | Zs]) :-
    append(Xs, Ys, Zs),
    !.

append([], Ys, Ys).

% reverse
reverse(Xs, Ys) :-
    reverse(Xs, Ys, []),
    !.

reverse([], Ys, Ys) :- !.

reverse([X | Xs], Ys, Zs) :-
    reverse(Xs, Ys, [X | Zs]).

% duplicazione
dup([], []) :- !.

dup([X | Xs], [X, X | Ys]) :-
    dup(Xs, Ys).

% intervalla con N
i([], _, []) :- !.

i([X | Xs], N, [X, N | Ys]) :-
    i(Xs, N, Ys).

% sostituisci vecchio con nuovo
sostituisci(_V, _N, [], []) :- !.

sostituisci(V, N, [V | Ins], [N | Outs]) :-
    sostituisci(V, N, Ins, Outs), !.

sostituisci(V, N, [X | Ins], [X | Outs]) :-
    sostituisci(V, N, Ins, Outs).

% duplica E
d(_, [], []) :- !.
d(E, [L | Ls], [L | Ys]) :-
    L \= E,
    d(E, Ls, Ys).
d(E, [E | Ls], [E, E | Ys]) :-
    d(E, Ls, Ys).
