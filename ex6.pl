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
sublista( [X|XS], [X|YS] ) :- sublista( XS, YS ).
sublista( [X|XS], [_|YS] ) :- sublista( [X|XS], YS ).

% ex5
subseq([X|L],[X|M]) :- prefix(L,M),!.
subseq(L,[_|M]) :- subseq(L,M).

prefix([],_).
prefix([X|L],[X|M]) :- prefix(L,M).

% ex6
quebraNoMeio(Xs, Ys, Zs) :-
   length(Xs, N),
   M is N - N // 2,
   length(Ys, M),
   append(Ys, Zs, Xs).
