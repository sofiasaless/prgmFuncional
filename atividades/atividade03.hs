atividade = "3"
nome = "Sofia Sales"
matricula = "556347"

tls :: String -> [(Char, Int)]
tls [] = []
tls s = [(c, contagem c s) | c <- semRep s]
        where
            contagem :: Char -> String -> Int
            contagem _ [] = 0
            contagem c (x:xs) = if c == x then 
                                    1 + contagem c xs 
                                else contagem c xs

            semRep :: String -> String
            semRep [] = []
            semRep (x:xs) = if elem x xs then
                                semRep xs
                            else x : semRep xs


sfq :: String -> (String, Int)
sfq [] = (" ", 0)
sfq s = frequente (dividirPalavras (semTokens s) [])
        where
            semTokens :: String -> String
            semTokens [] = []
            semTokens l = [x | x <- l, notElem x "!.?,"]

            dividirPalavras :: String -> String -> [String]
            dividirPalavras "" y = [y]
            dividirPalavras (x:xs) y = if elem x " " && not (null y) then
                                           y : dividirPalavras xs ""
                                       else
                                        if elem x " " && null y then
                                            dividirPalavras xs ""
                                        else dividirPalavras xs (y ++ [x])

            contagem :: Eq a => a -> [a] -> Int
            contagem _ [] = 0
            contagem y (x:xs) = if y == x then
                                    1 + contagem y xs
                                else contagem y xs

            frequente :: [String] -> (String, Int)
            frequente [x] = (x, 1)
            frequente (x:xs) = let (palavraRep, quantas) = frequente xs in 
                    if x == fst (frequente xs) then
                        (x, quantas + 1)
                    else (palavraRep, quantas)