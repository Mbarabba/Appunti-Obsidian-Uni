% primo programma prolog
% somma e successivo definiti ricorsivamente
% funziona

sum(0, X, X).
sum(s(X), Y, s(Z)):- sum(X, Y, Z).
