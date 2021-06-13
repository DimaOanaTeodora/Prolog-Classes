/*A) Definiti un predicat all_a/1 care primeste ca argument o lista si care
verifica daca argumentul sau este format doar din a-uri.
?- all_a([a,a,a,a]).
?- all_a([a,a,A,a]). A este variabila
*/
all_a([]).
all_a([a|L]) :- all_a(L).

/*B) Scrieti un predicat trans_a_b/2 care "traduce" o lista de a-uri intr-o
lista de b-uri. trans_a_b(X,Y) trebuie sa fie adevarat daca "intrarea" X
este o lista de a-uri si "iesirea" Y este o lista de b-uri, iar cele doua liste
au lungimi egale.
?- trans_a_b([a,a,a],L).
?- trans_a_b([a,a,a],[b]).
?- trans_a_b(L,[b,b]).
*/
trans_a_b([], []).
trans_a_b([a], [b]).
trans_a_b([a|L], R) :- trans_a_b(L, Ln), append(Ln, [b], R).