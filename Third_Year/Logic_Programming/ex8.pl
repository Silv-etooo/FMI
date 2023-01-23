graph_color([[], _], _ , _).
graph_color([V, E], K , C):-
    generateColoring(V, K, C),
    is_graph_color(E, K, C).

generateColoring([], _, []).
generateColoring([H|V], K, [[H,A]|C]):-
    my_between(0, K, A),
    generateColoring(V, K, C).
    
my_between(A, B, A):- A<B.
my_between(A, B, C):- 
    A<B,
    A1 is A+1,
    my_between(A1, B, C).

is_graph_color([], _, _).
is_graph_color([[V1, V2]| E], K, C):-
    color_of(V1, C, A),
    color_of(V2, C, B),
    A \= B,
	is_graph_color(E, K, C).

color_of(V, [[V,Color]|_], Color).
color_of(V, [_|R], Color):-
    color_of(V, R, Color).


%generate path in graph between U and W
path([V, E],U , W, P):-
    subset(V, SV),
    permutate(SV, SPV),
    is_valid_path(SPV, E),
    firstAndLast(Path, U, W, P),
