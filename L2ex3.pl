/*
Scrieti un program in Prolog pentru a afisa un patrat de n x n caractere
pe ecran.
Denumiti predicatul square/2. Primul argument este un numar natural
diferit de 0, iar al doilea un caracter (i.e, orice termen in Prolog) care
trebuie afisat.
*/

% printez N caractere C pe o linie
/* ai grija la ce e dupa apelul recrusiv pt ca le pune la final 
daca aveam nl dupa apelul recrusiv imi punea la finalul randului cu N caractere, cele N new line-uri
*/
line(0, _).
line(N, C) :- N1 is N-1, write(C), line(N1, C).