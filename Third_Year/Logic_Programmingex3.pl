%upr 3

%1
min(A, A, B) :- A =< B.
min(B, A, B) :- A > B.

%2
min(M, [M]).
min(M, [A, B | R]) :- min(Min1, A, B), min(Min2, R), min(M, Min1, Min2).
%or min(M, [A, B | R])  :- min(Min1, [B|T]), min(M, A, Min1).

%list_length(N, L)
list_length(0, []).
list_length(N, [H|L]) :-list_length(K, L),  N is K+1.

nat(0).
nat(N) :-  nat(K), N is K+1.
