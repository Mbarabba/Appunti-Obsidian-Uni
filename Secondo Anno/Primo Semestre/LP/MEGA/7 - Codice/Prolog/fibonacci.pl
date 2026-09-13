% successione di fibonacci
% funziona

fibonacci(0, 0). % il numero alla posizione 0 è 1
fibonacci(1, 1).

fibonacci(N, R):- % R -> risultato, N -> posizione
    N>1,
    N1 is N-1,
    N2 is N-2,
    fibonacci(N1, R1),
    fibonacci(N2, R2),
    R is R1 + R2.
