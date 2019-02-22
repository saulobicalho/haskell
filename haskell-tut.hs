module Teste where
funcao1 (a,b) (c,d) = ((+)(fst(a,b))(fst(c,d)),(*)(snd(a,b))(snd(c,d)))

data Pessoa = Pessoa {nome::Nome, idade::Idade, id::RG}
type Nome = String
type Idade = Integer
type RG = String

somaIdade :: (Pessoa -> Idade) -> Integer -> Idade
somaIdade pessoaA x = (idade pessoaA) + x

somaIdades :: [Pessoa] -> Idade
somaIdades = foldr somaIdade 0
