/*
Scrieti un predicat fib/2 pentru a calcula al n-ulea numar Fibonacci.
Secventa de numere Fibonacci este definita prin:
F0 = 1
F1 = 1
Fn = Fn-2 + Fn-1, pt n>=2
fib (N, X) = X este al N-lea termen in sirul lui Fibonacci
*/

% --- Varianta 1-----

fib(0, 1).
fib(1, 1).
fib(N, X) :- 
      N1 is N-1,
      N2 is N-2,
      fib(N1, F1), 
      fib(N2, F2), 
      X is F1+F2.

/* Gresit: fib(N, X) :- X is fib(N-2, X) + fib(N-1, X).
In plus, fib este predicat deci intoarce true si false,
is asteapta expresie aritmetica*/

% --- Varianta 2(mai eficienta)-----
fibonaci(N, X) :- aux(N, _, X).

aux(0, 1, 1).
aux(1, 1, 1).
aux(N, F2, Y) :- 
      N1 is N-1,
      aux(N1, F1, F2),
      Y is F1+F2.

