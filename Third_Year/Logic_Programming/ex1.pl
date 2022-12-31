% Student exercise profile
:- set_prolog_flag(occurs_check, error).        % disallow cyclic terms
:- set_prolog_stack(global, limit(8 000 000)).  % limit term space (8Mb)
:- set_prolog_stack(local,  limit(2 000 000)).  % limit environment space

%upr 1

%1
nat(zero).
nat(s(Y)) :- nat(Y).

%2
%0+y=y
%x+y = 1+(x-1)+y = 1+ (x+y-1)
add(zero, Y, Y) :- nat(Y).
add(s(A), Y, s(T)) :- add(A, Y, T).
    
%3 list with elements a b c
abc_list([]).
abc_list([H|T]):- abc_list(T), is_Letter(H).

is_Letter(a).
is_Letter(b).
is_Letter(c).
    
%4 is_member(X, W) X is member in W
is_member(X, [H|_]) :- H = X.
is_member(X, [_|T]) :- is_member(X, T).
    
    
