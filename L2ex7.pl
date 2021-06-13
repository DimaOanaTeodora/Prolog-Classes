/*
Definiti un predicat remove_duplicates/2 care sterge toate duplicatele
din lista data ca prim argument si intoarce rezultatul in al doilea
argument.
De exemplu, la intrebarea
?- remove_duplicates([a, b, a, c, d, d], List).
ar trebui sa obtineti List = [b, a, c, d].
*/
element_of(X,[X|_]).
element_of(X,[_|T]) :- element_of(X,T).

/*
Varianta 1
remove_duplicates(L, R) :- sort(L, R).
*/

remove_duplicates([], []).
remove_duplicates([H | T], NewT) :- member(H, T), remove_duplicates(T, NewT).
remove_duplicates([H | T], [H | NewT]) :- \+ member(H, T), remove_duplicates(T, NewT).