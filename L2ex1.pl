/*
Definiti un predicat distance/3 pentru a calcula distanta dintre doua
puncte intr-un plan 2-dimensional. Punctele sunt date ca perechi de
coordonate.
distance (A,B,C) - in C trebuie sa gasesc valoarea calculata
*/

distance((X1,Y1), (X2,Y2), X) :- X is sqrt((X1 - X2)**2 + (Y1-Y2)**2).
