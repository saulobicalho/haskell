{-- Lista Exercicios 2--}
--Aluno: Saulo Weikert Bicalho

--Questao 1

retornaTresCaracteres:: [String] -> String
retornaTresCaracteres = foldl take 3 []
