# SWI-Prolog

#### Link-uri utile
[Ninety-Nine Prolog Problems](https://www.ic.unicamp.br/~meidanis/courses/mc336/problemas-prolog/)
[Arithmetic and lists in Prolog](https://faculty.nps.edu/ncrowe/book/chap5.html)

# Prolog Theory Summary

- Variabilele incep cu litera MARE sau cu _ +litera mica
- Atomii sunt cu litera MICA sau intre ' '
- la finalul fiecarui rand (instructiune) se pune .
- , inseamna SI
- ; inseamna SAU
- :- inseamna IMPLICATIE (un fel de "daca")
- Citeste mereu instructiunile de sus in jos
- Incarcare fisier ['C:/Users/Lenovo/Desktop/Prolog/kb1.pl']. sau doar [nume_fisier].
- Negatia unui predicat: \+ 
- fail/0 predicat care esueaza mereu
- ! este un predicat predefinit care opreste mecanismul de backtracking
- Constantele sunt atomi/numere
- Termenii compusi (PREDICATE) sunt formati dintr-un atom si mai multi termeni: nume_atom(t1, t2,..)
- Atentie! NU se pune spatiu intre numele atomului si paranteza
- Numarul de termeni reprezinta aritatea si se noteaza: nume_atom/nr_termeni
- Regula(afirmatia) este de forma HEAD :- BODY
- Faptul este o regula fara Body
- Atentie! Faptele si regulile se grupeaza mereu dupa numele atomilor
- mereu Prolog pune intrebari - intoarce raspunsuri de tipul true/false
- daca predicatele din intrebare au variabile => da valorile posibile pentru care predicatele sunt true
- Comentarii: % sau /* pe mai multe linii */
- Operatorul = compara termenii (nu valorile)
- 3+5 = 5+3 false
- 3+5 = 8 false
- Compararea aritmetica se face cu: is/2, =:=/2, =\=/2 >/2, </2, >=/2, <=/2
- Impartirea reala: /
- Impartirea intreaga: //
- Restul impartirii: operatorul mod
- Inmultire: * , ridicare la putere ** 
- 3+5 is 8 true
- X is 3+5 X=8
- X=4, 4 is 3+X true
- 8 > 3 true
- 8 =\= 3 true
- Functii disponibile: min/2, abs/2, sqrt/1, sin/1 etc.
- Cauta un unificator: =
- 2 ** 3 = 3 + 5 false
- La recursivitate conditia de oprire trebuie sa fie mereu prima
- Listele sunt ca in Haskell - pot sa combin cate tipuri vreau
- [HEAD | TAIL], unde TAIL este o LISTA cu coada, iar HEAD este o valoare/variabila
- Un predicat care verifica daca o lista contine un anumit termen: ```cod```
- Un predicat care concateneaza doua liste: ```cod```
- Predicatele predefinite: length(lista, lungime_lista), member(element de cautat, lista in care cauta), append(l1,l2,l3=l1+l2), last(lista, argument) => true daca argument este ultimul in lista, reverse(lista, lista oglindita)
