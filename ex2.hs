{-- Lista Exercicios 2--}
--Aluno: Saulo Weikert Bicalho

import Prelude
import Data.Char
import Data.List

--Questao 1 OK

tresPrimeirasLetras:: [String] -> String
tresPrimeirasLetras = foldr ((++).tomaTres) []

tomaTres::  String -> String
tomaTres = take 3

--Questao 2 OK

data Pessoa = Pessoa {nome::Nome, idade::Idade, identidade::RG}
type Nome   = String
type Idade  = Integer
type RG     = String

maria = Pessoa {nome = "Maria", idade= 32, identidade= "083"}
carla = Pessoa {nome = "Carla", idade= 31, identidade= "082"}
alice = Pessoa {nome = "Alice", idade= 37, identidade= "081"}
grupo = [maria,carla,alice]

somaIdades :: [Pessoa] -> Idade
somaIdades = foldl  (flip((+).idade)) 0

--Questao 3 Tirar maria

pessoaMaisNova :: [Pessoa] -> Nome
pessoaMaisNova = nome.(foldr pegaMaisNovo maria)

pegaMaisNovo :: Pessoa -> Pessoa -> Pessoa
pegaMaisNovo a b
 | idade a <= idade b = a
 | otherwise = b

--Questao 4 OK

fazLista:: [String] ->[Char]
fazLista = foldr ((++).processaString) []

processaInicioString :: String-> String
processaInicioString = map toUpper.filter isAlpha.take 3

processaString:: String ->String
processaString a = processaInicioString a ++ drop 3 a

--Questao 5
--Questao 6 OK

remDups :: Eq a => [a] -> [a]
remDups = foldr (verificaDup) []

verificaDup :: Eq a => a -> [a] -> [a]
verificaDup a [] = [a]
verificaDup a b
 | a /= head b = a : b
 |otherwise = b
