/* semantica SMALL STEP*/
:-include("L3ex1.pl").

% reprezentarea starilor
/* in s gaseste-l pe X si da-mi instantierea lui in I*/
get(_, _, 0).
get(S, X, I) :- member(vi(X,I), S).


set(S, X, I, [vi(X, I) | S1]) :- del(S, X, S1).

del([vi(X, _)|S], X, S).
del([H|S], X, [H|S1]) :- del(S, X, S1) .
del([], _, []).

/* semantica unei variabile
 atom(X) <=> X-ul trebuie sa fie o variabila*/
smallstepA(X, S, I, S) :- atom(X), get(S, X, I).

% semantica adunarii a doua expresii aritmetice
smallstepA(I1 + I2, S, I, S):- 
  integer(I1),
  integer(I2),
  I is I1 + I2.
smallstepA(I + AE1, S, I + AE2, S):- 
  integer(I),
  smallstepA(AE1, S, AE2, S).
smallstepA(AE1 + AE, S, AE2 + AE, S):- smallstepA(AE1, S, AE2, S).

% semantica o[eratorului de comparatie
smallstepB(I1 =< I2, S, true, S):- 
  integer(I1),
  integer(I2),
  (I1 =< I2).
smallstepB(I1 =< I2, S, false, S):- 
  integer(I1),
  integer(I2),
  (I1 > I2) .
smallstepB(I =< AE1, S, I =< AE2, S):- 
  integer(I),
  smallstepA(AE1, S, AE2, S).
smallstepB(AE1 =< AE, S, AE2 =< AE, S):- smallstepA(AE1, S, AE2, S).

%semantica blocurilor
smallstepS({E}, S, E, S).

%semantica compunerilor
smallstepS((skip ; St2), S, St2, S).
smallstepS((St1 ; St), S1, (St2 ; St), S2) :- smallstepS(St1, S1, St2, S2) .

%semantica atribuirii
smallstepS(X = I, S, skip, S1) :- 
  integer(I),
  set(S, X, I, S1) .
smallstepS(X = AE1,S,X = AE2,S) :- smallstepA(AE1, S, AE2, S) .

%semantica lui if
smallstepS(if(true, St1, _), S, St1, S) .
smallstepS(if(false, _, St2), S, St2, S).
smallstepS(if(BE1, St1, St2), S, if(BE2, St1, St2), S) :- smallstepB(BE1, S, BE2, S).

%semantica programelor
smallstepP(skip, AE1, S1, skip, AE2, S2) :- smallstepA(AE1, S1, AE2, S2) .
smallstepP(St1, AE, S1, St2, AE, S2) :- smallstepS(St1, S1, St2, S2).

run(skip, I, _, I):- integer(I).
run(St1, AE1, S1, I) :- 
  smallstepP(St1, AE1, S1, St2, AE2, S2),
  run(St2, AE2, S2, I). 

run_program(Name) :- 
  defpg(Name, {P}, E),
  run(P, E, [], I),
  write(I). 

  
defpg(pg3, {x=10; sum=0; if(0 =< x, sum=sum+x,sum=x+100)}, sum).
/*
Apel defpg(pg3, P, S). =>
P = {x=10;sum=0;if(0=<x, sum=sum+x, sum=x+100)},
S = sum.

?- run_program(pg3).
10
true . */

/*scrie ce face la fiecare pas
de incercat sa-l finalizam sa scriem si un while etc*/
mytrace(skip, I, _) :- integer(I).
mytrace(St1, AE1, S1) :- 
  smallstepP(St1, AE1, S1, St2, AE2, S2),
  write(St2), 
  nl, 
  write(AE2),
  nl,
  write(S2),
  nl,
  mytrace(St2, AE2, S2).  


trace_program(Name) :-
  defpg(Name,{P},E),
  mytrace(P,E,[]).


