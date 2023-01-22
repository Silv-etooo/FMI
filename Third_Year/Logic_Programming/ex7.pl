% ex 7
% for every list S in L, exists A that is member of S and T
% 

is_list_transverzal([], _).
is_list_transverzal([H|L], T):-
    %exists_elem(H, T),
    is_elem(A, H),
    is_elem(A, T),
    !,
	is_list_transverzal(L, T).

% exists A that is member of LS and RS

exists_elem([H|_], RS):- is_elem(H, RS).
exists_elem([_|LS], RS):- exists_elem(LS, RS).

is_elem(H, [H|_]).
is_elem(H, [_|RS]):-  is_elem(H, RS).

%T is a subsequence of the union of L
gen_list_transverzal(L, T):-
    union(L, UL),
    subsequence(UL, T),
    is_list_transverzal(L, T).

union([], []).
union([A|L], LU):-
	union(L, R),
    set_minus(A, R, Temp), 
    append(Temp, R, LU).

% remove from A all elements that are members of R
set_minus([], _, []).
set_minus([H|A], R, [H|Temp]):-
    not(is_elem(H, R)),
    set_minus(A, R, Temp).
set_minus([H|A], R, Temp):-
    is_elem(H, R),
    set_minus(A, R, Temp).
    
%subsequence(LS, R):
subsequence([], []).
subsequence([H|LS], [H|R]):- subsequence(LS, R).
subsequence([_|LS], R):- subsequence(LS, R).



