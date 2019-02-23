{--ex lista2 - cap4.4-1a 6 menos 5--}


module Teste where

data Pessoa = Pessoa {nome::Nome, idade::Idade, id::RG}
type Nome = String
type Idade = Integer
type RG = String

{--ex2

achaIdade p = idade p

somaIdades = foldr ((+).(achaIdade)) 0
--}

--{--ex3

maisNovo = foldr (min . idade) 999

--}
