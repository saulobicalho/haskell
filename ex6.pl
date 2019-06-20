% Lista de Exercicios 6 - Saulo Weikert Bicalho

% Ex1
soma([],0).
soma([H|T],S):-soma(T,P),S is H+P.

% Ex2
prefixo([],_).
prefixo([H|T],[H|C]) :- prefixo(T,C).

% ex3
sufixo(L,L).
sufixo(Xs,[Y|Ys]) :- sufixo(Xs,Ys).

% ex4
sublista( [], _ ).
sublista( [X|XS], [X|XSS] ) :- sublista( XS, XSS ).
sublista( [X|XS], [_|XSS] ) :- sublista( [X|XS], XSS ).

% ex5
