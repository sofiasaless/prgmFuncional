atividade = "1"

-- Substitua seus dados
nome = "Sofia"
matricula = "556347"

-- 1
-- Recebe uma string e 
-- retorna-a sem as vogais.   
noVog :: String -> String
noVog s = [x | x <- s, notElem x "AEIOUaeiou"]

-- 2
-- retorna quantas vezes x é divisível por n
num'divs :: Int -> Int -> Int
num'divs x n = div x n

-- 3
-- Dado um inteiro n. determinar se
-- ele é ou não um número primeo
is'prime :: Int -> Bool
is'prime n = length [x | x <- [2..n], mod n x == 0] < 2
    
-- 4
-- inverte um inteiro, por exemplo
-- o inverso de 251 é 152.
int'inv :: Int -> Int
int'inv x = 0