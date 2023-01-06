
append([], L2, L2).
append([H|L1], L2, [H|R]) :- append(L1, L2, R).

% упр 4

%1. join(LS, L) list of lists - list
join([], []).
join([L|LS], R) :- join(LS, R1), append(L, R1, R ).

%2. partition(P,L). does the oposite of join
partition([], []).
partition([ [H1]      | P], [H1|L]) :- partition( P      , L). % new list with one elem
partition([ [H1 | H2] | P], [H1|L]) :- partition( [H2|P] , L). % build on that one elem lists

%2.1 partition with append
partition_a([], []).

%3 min of two numbers
min(A, B, A) :- A =< B.
min(A, B, B) :- B < A.

%4 mIn num in a list
min(M, [M]).
min(M, [A, B|L]) :- min(M1, [B|L]), min(A, M1, M).

%5 list length
list_length(0, []).
list_length(L, [_|LS]) :- list_length(L1, LS), L is L1+1.

%6 is element at N position X
list_elementAt(X, [X|_], 0).
list_elementAt(X, [_|LS], N):- list_elementAt(X, LS, K), N is K+1. 

%7 is list sorted
is_list_sorted([]).
is_list_sorted([_]).
is_list_sorted([A, B|T]):- order(A, B),  is_list_sorted([B|T]).

order(A, B):- A=<B.

%8 bogo_sort - FAV SORT OF LOGIC
bogo_sort(L, P) :- permutate(L , P), is_list_sorted(P).

permutate([], []).
permutate([H|L], P) :- permutate(L, P1), insert(H, P1, P).

%insert(X, [], [X]).
insert(X, L, [X|L]).
insert(X, [H|L], [H|R]) :- insert(X, L, R).

%9 quick sort - FAV SORT OF FUNCTIONALIST
quick_sort([], []).
quick_sort( [H|T], P ) :-
    split(T, H, Smaller, Bigger),
    quick_sort(Smaller, Sorted_s),
    quick_sort(Bigger, Sorted_b),
    append(Sorted_s, [H| Sorted_b], P).
    

split( [], _, [], []).
split( [H|T], X, Smaller, Bigger) :- split( T, X, L, B), add(H, X, L, B, Smaller, Bigger).

add(E, X, L, B, [E|L], B) :- order(E, X).
add(E, X, L, B, L, [E|B]) :- not(order(E, X)).
    
    
    
