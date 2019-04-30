{-- Lista Exercicios 2--}
--Aluno: Saulo Weikert Bicalho

import Prelude
import Data.Char
import Data.List

--Questao 1

tresPrimeirasLetras:: [String] -> String
tresPrimeirasLetras = foldr ((++).tomaTres) []

tomaTres::  String -> String
tomaTres = take 3

--Questao 2

data Pessoa = Pessoa {nome::Nome, idade::Idade, identidade::RG} deriving (Eq)
type Nome   = String
type Idade  = Integer
type RG     = String

somaIdades :: [Pessoa] -> Idade
somaIdades = foldl  (flip((+).idade)) 0

--Questao 3

instance Ord Pessoa where
 p<= p' = idade p <= idade p'
pessoaMaisNova :: [Pessoa] -> Nome
pessoaMaisNova (p:ps)= nome $ foldr min p ps

--Questao 4

fazLista:: [String] ->[Char]
fazLista = foldr ((++).processaString) []

processaInicioString :: String-> String
processaInicioString = map toUpper.filter isAlpha.take 3

processaString:: String ->String
processaString a = processaInicioString a ++ drop 3 a

{--Questao 5

Segue da definição da função foldr que foldr f z (a:x) = f a (foldr f z x).
Dessa forma, tem-se que f a é lazy, ou seja, adota uma estratégia de avaliação
preguiçosa. Sendo assim, se o argumento "a" for suficiente para determinar o
resultado de f a (foldr f z x), não é necessário construir a computação para o
valor do resto da lista (representado aqui por x).
--}

--Questao 6

remDups :: Eq a => [a] -> [a]
remDups = foldr (verificaDup) []

verificaDup :: Eq a => a -> [a] -> [a]
verificaDup a [] = [a]
verificaDup a b
 | a /= head b = a : b
 |otherwise = b
