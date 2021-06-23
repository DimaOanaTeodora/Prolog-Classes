/* verificare corectitudine program format*/
:- op(100, xf, {}).
:- op(1100, yf, ;).

stmt(skip).
stmt(X = AE) :- atom(X), aexp(AE).
stmt(St1 ; St2) :- stmt(St1), stmt(St2).  
stmt({St}) :- stmt(St).
stmt(if(B, S1, S2)) :- bexp(B), stmt(S1), stmt(S2).
stmt(while(B, S)) :- bexp(B), stmt(S).

% atomii din Prolog sunt identificatorii limbajului IMP
aexp(I) :- integer(I).
aexp(X) :- atom(X).
aexp(AE1 + AE2) :- aexp(AE1), aexp(AE2).

/*testare: aexp(sum+100). => true
stmt(sum=sum+100). => true
aexp(sum=sum+100). => false*/

bexp(AE1 =< AE2) :- aexp(AE1), aexp(AE2).

program(St,AE) :- stmt(St), aexp(AE).
% expresia AE se evalueaza in starea rezultata dupa rularea programului
 

test3 :- program({x=10; sum=0; if(11 =< x, sum=sum+x,sum=x+100)}, sum).
