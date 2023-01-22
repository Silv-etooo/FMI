% ex 6

is_hamiltonov([V, E]):-
    permutate(V, V1),
    is_path([V1, E]),
    first(V1, S),
    my_last(V1, L),
    edge(E, L, S).

permutate([H], [H]).
permutate([H|LS], R):-
    permutate(LS, R1), insert(H, R1, R).

insert(Elem, LS, [Elem|LS]).
insert(Elem, [H|LS], [H|R]):- insert(Elem, LS, R). 

is_path([[_], _]).
is_path([[A, B | V1], E]):-
	edge(E, A, B), is_path([ [B|V1], E] ).
                           
first([A|_], A).

my_last([H], H).
my_last([_|V], H) :- my_last(V, H).

edge([[A, B] | _], A, B).
edge([_ | E], A, B) :- edge(E, A, B).

                      
                           

                      
