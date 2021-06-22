/*
Vom descrie acesta problema in Prolog, facand urmatoarele presupuneri:
- daca mercenarul este un om religios, atunci nu va ucide preotul,
- daca mercenarul este un om care respecta autoritatea, atunci nu va
ucide regele,
- daca mercenarul este un om care doreste bani, atunci nu va ucide omul
bogat.

is_killed(C,X,Y) verifica faptul ca X si Y sunt ucisi de alegerea C a mercenarului.
?- is killed(god, X,Y).
X = king,
Y = richMan
*/

char(king).
char(priest).
char(rich).

/* pe cine nu omoara */
choice(god, priest).
choice(authoroty, king).
choice(money, rich).

/* X si Y sunt ucisi de C*/
is_killed(C, X, Y) :- char(X), char(Y), X \= Y, choice(C, Z), X \= Z, Y \= Z.
