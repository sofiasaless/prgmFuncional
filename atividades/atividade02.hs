atividade = "2"

-- Substitua seus dados
nome = "Sofia Sales Lima"
matricula = "556347"

-- 1 
-- Sejam as tuplas u e v de inteiros
-- tal que exista um inteiro k onde
-- u = kv ou v = ku  
-- então u e v são mútiplos. Construa 
-- função que determine se duas 
-- tuplas de inteiros  são múltiplas.
isMult :: (Int,Int) -> (Int, Int) -> Bool    
isMult u v = length [k | k <- [1..100], k * fst u == fst v && k * fst v == fst u || k * snd v == snd u && k * snd u == snd v] > 0

-- 2
-- Sejam todos os triângulos retângulos
-- de perímetro p e de lados inteiros.
--   representados por tuplas (a,b,c) 
-- com  a>=b>=c. Criar  
--  função que determine 
-- o total destes triângulos dado p .

tot'tri  :: Int -> Int
tot'tri p = length [(a, b, c) | c <- [1..p], b <- [c..p], a <- [b..p], a^2 == b^2 + c^2, a+b+c == p]