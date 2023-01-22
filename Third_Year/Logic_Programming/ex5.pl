% ex 5

nat(0).
nat(N):- nat(K), N is K + 1. 

%generate pairs of natural numbers
gen_pair(K, S):-
	nat(N), 
    gen_KS(2, N, [K, S]).

my_between(A, B, A) :- A=< B.
my_between(A, B, C):-
    A < B,
    A1 is A+1,
    my_between(A1, B, C).

% genereate all lists with K elements
gen_Nat_K(K, T) :- 
    nat(N),
    gen_KS(K, N, T).

% generate all lists with K elements that sum to S
gen_KS(1, Sum, [Sum]).
gen_KS(K, Sum, [H|T]) :-
    K > 0,
    between(0, Sum, H), 
    K1 is K - 1,
    S is Sum- H, 
    gen_KS(K1, S, T).


gen_fin_seq_Nat(T) :- 
    gen_pair(K, S), % lenght and sum of elements
    gen_KS(K, S, T).


    
% no repetition, no order - subset, 
gen_fin_sub_Nat([]).
gen_fin_sub_Nat(S):-
    gen_fin_seq_Nat(S),
    encodes_subset_with_not(S).

encodes_subset([_]).
encodes_subset([A, B|T]):- A<B, encodes_subset([B|T]).
    
encodes_subset_with_not(L) :- 
    not((append(_, [A, B | _], L), A >=B)).
    

% arithmetic progression - lenght, first num, step
gen_ar_prog([]).
gen_ar_prog(P):-
    nat(N),
    gen_KS(3, N, [A, B, C]),
    A > 0,
    int(B, B1),
    int(C, C1),
    gen_ar_prog(A, B1, C1, P).

gen_ar_prog(1, S, 0, [S]).
gen_ar_prog(L, S, Step, R):-
    L>1,
    gen_ar_prog_h(L, S, Step, R).

gen_ar_prog_h(1, S, _, [S]).
gen_ar_prog_h(L, S, Step, [S|R]):-
    L > 1,
    L0 is L - 1,
    S0 is S + Step,
    gen_ar_prog_h(L0, S0, Step, R).
    
int(0, 0).
int(N, N):- N > 0.
int(N, Z):- N > 0, Z is -N.
    
q(A, [X, Y], [Z, U]):-
    nat(A),
    gen_two_positive_rat_numbers([X, Y], [Z, U]).
	Y > X, Z > U, 
    X*Z =:= 2*Y*U,
    X + Z < A.

gen_two_positive_rat_numbers([X, Y], [Z, U]):-
    nat(N),
    gen_KS(4, N, [X,Y,Z,U] ),
    rat(X, Y),
    rat(Z, U).
    
rat(X, Y):-
    X>0,Y>0,
	gcd(X, Y, 1).
    
gcd(0, B, B).
gcd(A, B, D):-
    A > 0,
    R is B mod A,
    gcd(R, A, D).
    
