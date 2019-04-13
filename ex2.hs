{-- Lista Exercicios 2--}
--Aluno: Saulo Weikert Bicalho

--Questao 1

tresPrimeirasLetras:: [String] -> String
tresPrimeirasLetras = foldr ((++).tomaTres) []

tomaTres::  String -> String
tomaTres = take 3
