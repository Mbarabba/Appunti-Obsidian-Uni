% lista palindroma

  pal([]) :-
  !.

  pal(X) :-
  reverse(X, X).
