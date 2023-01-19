% ex 4

nat(0).
nat(N):- nat(K), N is K + 1. 

even_member(X, LS) :- member(X, LS), X mod 2 =:= 0.

member(X, [X|_]).
member(X, [_|LS]) :- member(X, LS ).

% 0 1, 1 0
% 2 0, 1 1, 0 2
gen_pair_of_nats(X, Y) :- 
	nat(N), 
    my_between(0, N, X),
    Y is N - X.

my_between(A, B, A) :- A=< B.
my_between(A, B, C):-
    A < B,
    A1 is A+1,
    my_between(A1, B, C).

% 0, 0, 0, 0, 1
% 0, 0, 0, 1, 0
% 0, 0, 1, 0, 0
% 0, 1, 0, 0, 0
% 1, 0, 0, 0, 0
% 0, 0, 0, 0, 2
% 0, 0, 0, 1, 1
gen_Nat_K(K, T) :- 
    nat(N),
    gen_KS(K, N, T).

gen_KS(1, Sum, [Sum]).
gen_KS(K, Sum, [H|T]) :-
    K > 0,
    between(0, Sum, H), 
    K1 is K - 1,
    S is Sum- H, 
    gen_KS(K1, S, T).

% 0
% 1
% 00
% 2
% 01
% 10
% 000
gen_union_Nat_K(T) :- 
    gen_pair_of_nats(K, Sum), % lenght and sum of elements
    K > 0,
    gen_KS(k, Sum, T).
    
gen_pair_of_ints(A, B) :-
    gen_pair_of_nats(N, K),
    int(N, A), 
    int(K, B).

int(N, Z) :- N mod 2=:= 0, Z is N div 2. % positive
int(N, Z) :- N mod 2=:= 1, Z is -((N -1) div 2) - 1.% negative
