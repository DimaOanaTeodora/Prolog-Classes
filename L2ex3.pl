/*
Scrieti un program in Prolog pentru a afisa un patrat de n x n caractere
pe ecran.
Denumiti predicatul square/2. Primul argument este un numar natural
diferit de 0, iar al doilea un caracter (i.e, orice termen in Prolog) care
trebuie afisat.
*/

% printez N caractere C pe o linie
/* 
- ai grija la ce e dupa apelul recrusiv pt ca le pune la final 
- daca aveam nl dupa apelul recrusiv imi punea la finalul randului cu N caractere,
 cele N new line-uri
*/

% ---- Deseneaza o linie cu N caractere ----
line(0, _).
line(N, C) :- 
      N1 is N-1,
      write(C),
      line(N1, C).

% ---- Printeaza de N ori o linie cu N caractere (L trebuie sa fie constant) ----
matrix(0, _, _).
matrix(N, L, C) :-
      N1 is N-1,
      nl,
      line(L, C),
      matrix(N1, L, C). 

square(0, _).
square(N, C) :- matrix(N, N, C).
