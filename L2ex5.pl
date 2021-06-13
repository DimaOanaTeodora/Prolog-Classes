/*
A) Scrieti un predicat scalarMult/3 al carui prim argument este un
intreg, al doilea argument este o lista de intregi, iar al treilea argument
este rezultatul inmultirii cu scalari al celui de-al doilea argument cu
primul.
De exemplu, la intrebarea
?-scalarMult(3,[2,7,4],Result).
ar trebui sa obtineti Result = [6,21,12].
*/

scalarMult(_, [], []).
scalarMult(N, [H|T], R) :- X is N * H, scalarMult(N, T, Rn), append(Rn, [X], R).

/*
B) Scrieti un predicat dot/3 al carui prim argument este o lista de
intregi, al doilea argument este o lista de intregi de lungimea primeia, iar
al treilea argument este produsul scalar dintre primele doua argumente.
De exemplu, la intrebarea
?-dot([2,5,6],[3,4,1],Result).
ar trebui sa obtineti Result = 32.
*/

dot([], [], 0).
dot([H1|T1], [H2|T2], R) :- X1 is H1 * H2, dot(T1, T2, Rn), R is Rn + X1.

/*
C) Scrieti un predicat max/2 care cauta elementul maxim intr-o lista de
numere naturale.
De exemplu, la intrebarea
?-max([4,2,6,8,1],Result).
ar trebui sa obtineti Result = 8.
*/
max([X],X).
max([X|L],X) :- max(L,R), X > R.
max([X|L],R) :- max(L,R), X =< R.