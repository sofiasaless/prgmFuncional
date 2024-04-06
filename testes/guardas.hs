qualificaPrioridadeLote :: (Fractional a, Ord a) => [(String, a, a, a)] -> [(String,a)]
qualificaPrioridadeLote tarefas = [calcPrioridade tarefa | tarefa <- tarefas]
  where
    calcPrioridade (nomeTarefa, i, ani, arr) = (nomeTarefa, i*ani*arr)

__x' :: (Floating a, Ord a) => a -> a -> a -> Either String a
__x' a b c =
    let delta = b^2 - 4 * a * c
    in
        if delta < 0
            then Left "Oops!"
            else Right ((-b + sqrt delta) / (2 * a))

