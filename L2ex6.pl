/*
Definiti un predicat palindrome/1 care este adevarat daca lista primita ca
argument este palindrom (lista citita de la stanga la dreapta este identica
cu lista citita de la dreapta la stanga).
De exemplu, la intrebarea
?-palindrome([r,e,d,i,v,i,d,e,r]).
ar trebui sa obtineti true.
Nu folositi predicatul predefinit reverse, ci propria implementare a
acestui predicat.
*/

my_reverse(L1,L2) :- my_rev(L1,L2,[]).

my_rev([],L2,L2) :- !.
my_rev([H|T],L2,Acc) :- my_rev(T,L2,[H|Acc]).

palindrome(L) :- my_reverse(L,L).