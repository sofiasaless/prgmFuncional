## TIPOS

### Casamento de padrão
é a especificação de análise dados. A função abaixo analisa se um determinado inteiro é 12 ou não.

    verificador :: (Eq a,Num a) => a -> String --“a” tem que ser instância de “Eq” e de “Num”
    verificador 12 = "100% doze"
    verificador x = "0% doze"

para o casamento de padrão funcionar é preciso que todas as "instancias da função" estejam implementadas consecutivamente. O código abaixo apresenta um erro pois há uma função entre a **verificador**, portanto a função está apenas sendo reimplementada.

    verificador :: (Eq a,Num a) => a -> String
    verificador 12 = "100% doze"
    haskell = "é legal"
    verificador x = "0% doze"

a ordem do casamento também importa, por exemplo, caso a função **verificador** seja implementada da seguinte maneira:

    verificador :: (Eq a,Num a) => a -> String
    verificador x = "0% doze"
    verificador 12 = "100% doze"

"100% doze" nunca será impresso, já que o 1° padrão sempre será satisfeito independente do número.

Uma vantagem do casamento padrão é a facilidade que para criar funções recursivas quando necessário.

    somaTudo :: Integral a => a -> a 
    somaTudo 1 = 1 
    somaTudo n = somaTudo (n-1) + n

- a função retorna o somatório dos primeiros "n" números partindo do 1, uma vez que o somatório de 1 é ele próprio. Por sua vez, o somatório de 3 é “somatório de 2 + 3”, o que é igual à :somatório de 1 + somatório de 2 + 3”.

### Um parâmetro genérico nulo para o casamento de padrão
é um parâmetro que sempre será ignorado pelo haskell, é representado pelo **_**


    numerosLegais :: (Num a, Eq a) => a -> String -- “a” tem que ser instância de “Num” e de “Eq” 
    numerosLegais 1 = "Unidade"
    numerosLegais 2 = "Vida"
    numerosLegais 3 = "Unidade"
    numerosLegais _ = "Outro numero legal"

- aqui é mostrado que, desde que o tipo passado para a função pertença a classe de tipo Num e Eq e diferente de 1, 2, e 3, a quinta linha será sempre executada e retornará "Outro número legal".

### Casamento de padrão com listas

    goodSaying :: String -> String
    goodSaying [] = "A lista está vazia !"
    goodSaying ['C', 'S', 'S', 'M', 'L'] = "Uma lista escrita da forma convencional"
    goodSaying ('N':'D':'S':'M':'D':[]) = "Uma lista escrita da forma como o haskell lê listas"
    goodSaying _ = "Padrão de lista não reconhecido"

Uma coisa extremamente importante a ser notada no exemplo anterior é que existem diferentesformas de declarar uma lista, mas todas são equivalentes, por exemplo:


    'V':'R':'S':'N':'S':'M':'V':[] == ['V','R','S','N','S','M','V']
        True
    "SMQLIVB" == ['S','M','Q','L','I','V','B']
        True
    'I' : "HS" == "IHS"
        True

A variedade de formas de expressar a mesma coisa é muito útil para o casamento de padrão, o código abaixo que lê um texto recursivamente e retorna a primeira letra maiúscula queencontrar.

    leRecursivamente :: String -> String
    leRecursivamente [] = "Não há letras maiúculas !"
    leRecursivamente (x:xs) = if x >= 'A' && x <= 'Z' then "primeira: " ++ show x else leRecursivamente xs
    >> leRecursivamente "amDg""primeira: 'D'"

- A especificação da lista através de “x:xs” na linha 2 é extremamente útil, pois, a pré-anexação do caractere “x” à string “xs”, possibilita que a função “leRecursivamente” analise umcaractere por vez (“x”), enquanto o restante da string (“xs”) será analisado somente na próximachamada recursiva.

**EXEMPLOS DE CASAMENTOS DE PADRÕES DE LISTAS**

    head' :: (Show a) => [a] -> String
    head' [] = "A lista está vazia !"
    head' (x:xs) = show x

    last' :: (Show a) => [a] -> String
    last' [] = "A lista está vazia !"
    last' (x:[]) = show x
    last' (x:xs) = last' xs

    tail' :: (Show a) => [a] -> String
    tail' [] = "A lista está vazia !"1
    tail' (x:xs) = show xs1

    length' :: (Show a) => [a] -> Int1
    length' [] = 01
    length' (x:xs) = 1 + length' xs

### Referenciamento de uma lista completa em um casamento de padrão

Ao invés de ter acesso apenas ao head e ao tail realizando (x:xs), basta usar um recurso simples:

    head' :: (Show a) => [a] -> String
    head' [] = "A lista está vazia !"
    head' listaInteira@(x:xs) = "lista inteira: " ++ show listaInteira ++ " head: " ++ show x
    >> head' [1,3,10,12,14]
        "lista inteira: [1,3,10,12,14] head: 1

