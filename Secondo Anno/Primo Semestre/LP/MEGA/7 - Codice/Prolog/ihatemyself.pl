%%%& -*- Mode: Prolog -*-

% questo programma rappresenta il NFA
% che accetta il linguaggio ((01)*10(0+1)*)*

initial(q0).
final(q0).
final(q4).

delta(q0, 0, q1).
delta(q0, 1, q3).
delta(q1, 1, q2).
delta(q2, 0, q1).
delta(q2, 1, q3).
delta(q3, 0, q4).
delta(q4, 0, q4).
delta(q4, 1, q4).
delta(q4, 0, q1).
delta(q4, 1, q3).

accept([], S) :- final(S).
accept(Input) :- initial(S), accept(Input, S).
accept([X | Xs], S) :-
    delta(S, X, Q),
    accept(Xs, Q).
