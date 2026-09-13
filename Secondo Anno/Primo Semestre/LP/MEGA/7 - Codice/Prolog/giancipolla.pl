%%%%

  dup([], []) :- !.
  dup([X | Xs], [X, X | Ys]) :-
      dup(Xs, Ys).
