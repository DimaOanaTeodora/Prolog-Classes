
/** GOT riddle 
Varys - "Power is a curious thing, my lord. Are you fond of riddles?" 
Tyrion - "Why? Am I about to hear one?" 
Varys - "Three great men sit in a room, a king, a priest and the rich man. 
         Between them stands a common sellsword. 
         Each great man bids the sellsword kill the other two. 
         Who lives? Who dies?" 
Tyrion - "Depends on the sellsword" 
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







