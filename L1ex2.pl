%---------------------------------
% Jon Snow and Daenerys Targaryen
%---------------------------------

male(rickardStark).
male(eddardStark).
male(brandonStark).
male(benjenStark).
male(robbStark).
male(branStark).
male(rickonStark).
male(jonSnow).
male(aerysTargaryen).
male(rhaegarTargaryen).
male(viserysTargaryen).
male(aegonTargaryen).

%---------------------------

female(lyarraStark).
female(catelynStark).
female(lyannaStark).
female(sansaStark).
female(aryaStark).
female(rhaellaTargaryen).
female(eliaTargaryen).
female(daenerysTargaryen).
female(rhaenysTargaryen).

%---------------------------

parent_of(rickardStark,eddardStark).
parent_of(rickardStark,brandonStark).
parent_of(rickardStark,benjenStark).
parent_of(rickardStark,lyannaStark).
parent_of(lyarraStark,eddardStark).
parent_of(lyarraStark,brandonStark).
parent_of(lyarraStark,benjenStark).
parent_of(lyarraStark,lyannaStark).

parent_of(eddardStark,robbStark).
parent_of(eddardStark,sansaStark).
parent_of(eddardStark,aryaStark).
parent_of(eddardStark,branStark).
parent_of(eddardStark,rickonStark).
parent_of(catelynStark,robbStark).
parent_of(catelynStark,sansaStark).
parent_of(catelynStark,aryaStark).
parent_of(catelynStark,branStark).
parent_of(catelynStark,rickonStark).

parent_of(aerysTargaryen,rhaegarTargaryen).
parent_of(aerysTargaryen,viserysTargaryen).
parent_of(aerysTargaryen,daenerysTargaryen).

parent_of(rhaellaTargaryen,rhaegarTargaryen).
parent_of(rhaellaTargaryen,viserysTargaryen).
parent_of(rhaellaTargaryen,daenerysTargaryen).

parent_of(rhaegarTargaryen,jonSnow).
parent_of(lyannaStark,jonSnow).

parent_of(rhaegarTargaryen,aegonTargaryen).
parent_of(rhaegarTargaryen,rhaenysTargaryen).

parent_of(eliaTargaryen,aegonTargaryen).
parent_of(eliaTargaryen,rhaenysTargaryen).

%--------------------------------------------

father_of(Father, Child) :- male(Father), parent_of(Father, Child).

mother_of(X, Y) :- female(X), parent_of(X, Y).

sister_of(Sister, Person) :- parent_of(X, Sister), parent_of(X, Person), female(Sister), Sister \= Person.

brother_of(Brother,Person) :- parent_of(X, Brother), parent_of(X, Person), male(Brother), Brother \= Person.

grandfather_of(Grandfather, Child) :- parent_of(Parent, Child), parent_of(Grandfather, Parent), male(Grandfather).

grandmother_of(Grandmother, Child) :- parent_of(Parent, Child), parent_of(Grandmother, Parent), female(Grandmother).

% sora tatalui/ mamei
aunt_of(Aunt,Person) :- female(Aunt), parent_of(Parent, Person), sister_of(Aunt, Parent).

% fratele tatalui/ mamei
uncle_of(Uncle,Person) :- male(Uncle), parent_of(Parent, Person), brother_of(Uncle, Parent).

/*--------- Recursivitate --------------
clauza de oprire trebuie sa fie prima 
Nu pune spatii intre numele predicatului si parametrii
*/

ancestor_of(Ancestor, Parent) :- parent_of(Ancestor, Parent).
ancestor_of(Ancestor, Parent) :- parent_of(P, Parent), ancestor_of(Ancestor, P).

%-------- Fortare instantiere ---------

/* not doar imi neaga raspunsul, dar nu-mi da variabilele instantiate
not_parent(X,Y) :- \+ parent_of(X,Y).
not_parent(X,Y) :- parent_of(X, _ ), \+ parent_of(X,Y)
not parent(X,jonSnow).=> ne da valorile lui X*/

/* asta da si valorile pt X si Y 
not_parent(X,Y) :- parent_of(Y, _ ), parent_of(X, _ ), \+ parent_of(X,Y).
*/

person(X) :- female(X) ; male(X).
not_parent(X,Y) :- person(X), person(Y), \+ parent_of(X,Y).

