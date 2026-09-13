%%%& -*- Mode: Prolog -*-

% questo programma rappresenta il NFA
% che accetta il linguaggio a(01)*

initial(q0).
final(q1).

delta(q0, a, q1).
delta(q1, 0, q2).
delta(q2, 1, q1).

accept([X|Xs], S) :-
    delta(S, I, Q),
    accept(Xs, Q).

accept([], F) :- final(F).

recognize(Input) :- initial(S), accept(Input, S).
