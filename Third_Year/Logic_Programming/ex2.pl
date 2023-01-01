%upr 2

%1 is smt a list
list([]).
list([_|T]) :- list(T).

%2 is X member of L
is_member(X, [X|_]).
is_member(X, [_|T]) :- is_member(X, T).
    
%3 l1.l2 = l3
append([], L2,L2).
append([H|T], L2, [H|Z]) :- append(T, L2, Z).

%4
%replace x with y in L
replace(_, _, [], []).
replace(X, Y, [X|T], [Y|R] ) :-  replace(X, Y, T, R).
replace(X, Y, [H|T], [H|R] ) :-  replace(X, Y, T, R).

%5
%fisrt x i fist element of l
first(X, [X|_]).

%6
%last X is last element of L
last(X, [X]).
last(X, [_|T]) :- last(X, T).

%6.2
%last with append
last_with_append(X, T) :- append(_, [X], T).

%7
%prefix P is of L
prefix_with_append(P, L) :- append(P, _, L).

%7.1
prefix([], _).
prefix([H1| P], [H1| L]) :- prefix( P,  L).

%8 suffix
suffix(S, L) :- append(_, S, L).

%9 subset S is .. of L
subset(S, L) :- 
    prefix(Pr, L), 
    suffix(Su, L), 
    append(Pr, S, R),
    append(R, Su, L).

subset2(S, L) :- 
    prefix(A, L), 
    suffix(S, A).

%10 reverse R is .. of L
reverse([], []).
reverse([H|R], L) :- reverse(R, R2), append(R2, [H], L). 

%10.1 another way
reverse_accum(L, R) :- reverse_accum(L, [], R).

reverse_accum( [], Acum, Acum).
reverse_accum( [H|L], Acum, R) :-  
    reverse_accum(  L,  [H|Acum] , R).

%11 palindrome
palindrome(L) :- reverse(L, L).

%12 remove first occurence of X in L to produce R
remove_fisrt(X, [X|L], L).
remove_first(_, [], []).
remove_first(X, [H|L], [H|R]) :- X \= H,  remove_first(X, L, R).

%13 remove all
remove_all(_, [], []).
remove_all(X, [X|L], R) :- remove_all(X, L, R).
remove_all(X, [H|L], [H| R]) :-   X \= H, remove_all(X, L, R).

%14 insert X add to L to produce R (in some position)
insert(X, L, R) :- append( P, S , L ), append(P ,[X|S] , R).

%15 permutate
permute([], []).
permute([H|P], L) :- permute(P, L2), insert(H, L2 ,L ).

%16 subsequence
subsequence([], []).
subsequence([H|L], [H|R]) :- subsequence(L, R). 
subsequence([_|L], R) :- subsequence(L, R).
    
%17 powerset, S has no repetitions()
% example powerSet([1, 2, 3] -> [[], [1], [2], [3], [1,2], [2,3], [1,3], [1,2,3])
power_set([[]], []).
power_set(P, [A|S]) :- 
    power_set(B, S), 
    prepend_to_all(A, B, C),
	append(B, C, P).

prepend_to_all(_, [], []).
prepend_to_all(X, [L|LS], [ [X|L] | RS]) :- 
    prepend_to_all(X, LS, RS).
