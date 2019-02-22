module Teste where

data Pessoa = Pessoa {nome::Nome, idade::Idade, id::RG}
type Nome = String
type Idade = Integer
type RG = String

somaIdades = foldr ((+)(idade)) 0
