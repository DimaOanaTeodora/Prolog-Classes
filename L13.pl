%---------------------------
% Knowledge base example 3
%---------------------------

father(eddard,sansa).
father(eddard,jon_snow).

mother(catelyn,sansa).
mother(wylla,jon_snow).

stark(eddard).
stark(catelyn).

stark(X) :- father(Y,X), stark(Y).

/** examples

?- stark(jon_snow).
?- stark(X).
stark(eddard) se duce si pe stark(eddard) si pe stark(X) => 2 raspunsuri
?- stark(X), mother(Y,X), stark(Y). 
*/