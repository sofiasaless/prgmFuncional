atividade = "04"
nome = "Sofia Sales Lima"
matricula = "556347"

--  1

replace :: [Char] -> [Char] -> [Char] -> [Char]
replace [] [] [] = []
replace text from to = substituindo text from to
                    where
                        substituindo :: [Char] -> [Char] -> [Char] -> [Char]
                        substituindo [] _ _ = []
                        substituindo frase@(x:xs) aparicoes substituto
                            | identificando aparicoes frase = substituto ++ substituindo (drop (length aparicoes) frase) aparicoes substituto
                            | otherwise = x : substituindo xs aparicoes substituto
                            
                        identificando :: [Char] -> [Char] -> Bool
                        -- as condições vão ser atendidas a partir da recursão
                        identificando "" _ = True
                        identificando _ "" = False
                        identificando (x:xs) (y:ys) = x == y && identificando xs ys

-- 2

lsSplit :: [Int] -> ([Int], Int, [Int])
lsSplit [] = ([], 0, [])
lsSplit [x] = ([], x, [])
lsSplit ls = (fst (separador (maximum ls) ls), maximum ls, snd (separador (maximum ls) ls))
            where
                separador :: Int -> [Int] -> ([Int], [Int])
                separador maior (x:xs)
                    | x == maior = ([], xs)
                    | otherwise = let (inicio, fim) = separador maior xs
                                  in (x : inicio, fim)

-- 3

selectionSort :: Ord a => [a] -> [a]
selectionSort [] = []
selectionSort ls = ordenando (maximum ls) ls
                where
                    ordenando :: Ord a => a -> [a] -> [a]
                    ordenando _ [] = []
                    ordenando maior lista = let proxMaior = maximum lista
                                                listaOrdenada = proxMaior : ordenando maior (removerElem proxMaior lista)
                                            in listaOrdenada

                    removerElem :: Eq a => a -> [a] -> [a]
                    removerElem _ [] = []
                    removerElem elemento (x:xs)
                        | elemento == x = removerElem elemento xs
                        | otherwise = x : removerElem elemento xs
