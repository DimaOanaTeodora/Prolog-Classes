% Liste

/*
?- [H|T].
H = primul element
T = LISTA formata din restul de la al doilea in colo

O data ce a gasit o instantiere o aplica in restul termenului:
?-[X|[X|L]] = [1,1,2,3,4].
X=1
L=[2,3,4]

?-[X|[X|L]] = [2,1,2,3,4].
false
X=2 si dupa vrea sa potriveasca lista care incepe cu 2 -> [2,...] si nu gaseste 

Mai este predicatul predefinit append(l1, l2, rezultat) => R= l1++l2
*/

member_of(X,[X|_]).
member_of(X,[_|Tail]) :- member_of(X,Tail).

concat_lists([], List, List).
concat_lists([Elem | List1], List2, [Elem | List3]) :-
		concat_lists(List1, List2, List3).

/** <examples>
 
?- member_of(a,[a,b,c]).
?- member_of(X,[a,b,c]).
?- concat_lists([1, 2, 3], [d, e, f, g], X).
?- concat_lists(X, Y, [a, b, c, d]).

*/
