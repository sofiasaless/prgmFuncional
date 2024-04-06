# Guardas

Neste capítulo exploramos um recurso que permite fazer expressões condicionais: os guardas. Trata-se de tratamento condicional que conseguisse analisar arbitrariedades de uma forma simples e elegante.

## A limitação dos sistemas usados anteriormente

**Casamento padrão:** limita o sistema condicional à análise de um parâmetro já definido. Na maioria das vezes, este parâmetro se trata de uma lista pela facilidade que o casamento padrão permite que análises/processamentos sejam feitos recursivamente nestas estruturas.

**Case expressions:** Na maioria das vezes, este parâmetro se trata de uma única expressão pela facilidade que as “case-expressions” têm em executar fluxos condicionais com base em valores alfanuméricos (números ou caracteres);

Tendo em vista que o casamento de padrão utilizado na função <'length'> tem como objetivo principal a contagem recursiva de caracteres, e se caso seja necessário adaptar a função para que ela não contabilize o caractere "z"? Duas soluções possíveis:

- Aplicar um casamento de padrão extra e deixar a função menos elegante e menos legível.
- Abrir mão de trabalhar apenas com casamento de padrão e acrescentar um if-them-else na 3° linha, o que deixará o código menos legível ainda.

Ambas as soluções:

    {-1° solução-}
    lengthSemZ :: Num a => [Char] -> a
    lengthSemZ [] = 0
    lengthSemZ ('z':xs) = lengthSemZ xs
    lengthSemZ (x:xs) = 1 + lengthSemZ xs

    {-2° solução-}
    lengthSemZ' :: Num a => [Char] -> a
    lengthSemZ' [] = 0
    lengthSemZ' (x:xs) = if x=='z' then lengthSemZ' xs else 1+lengthSemZ' xs

*Na primeira solução:* o casamento de padrão deixa muito a desejar em termos de legibilidade.

*Na segunda solução:* possui um problema de legibilidade ainda mais evidente em virtude da dificuldade de escrita da expressão *if-then-else*.

## Uso dos *Guardas*

Exemplo de código inicial com guardas:

    qualificaPrioridade :: (Fractional a, Ord a) => a -> String
    qualificaPrioridade tarefa
        |tarefa <=250 = "Pouco importante" --1° guarda
        |tarefa <=500 = "Importância mediana" --2° guarda
        |tarefa <= 750 = "Importante"--3° guarda
        |otherwise = "Extremamente importante"-- guarda "cath-all"
    
A função <'qualificaPrioridade'> recebe um valor pertecente aos reais e há retorno de uma string que representa a sua classificação. Caso o valor seja menor ou igual a 250 a sua classificação é "pouco importante", assim a condição dos demais guardas não é executada e o programa encerrado.

Apesar dos guardas apresentados só avaliarem limites superiores da pontuação da tarefa, uma vez que para a condição do k-ésimo guarda seja executada é necessariamente verdade que a condição do guarda em k-1 seja falsa e isto segue para todo o guarda em uma posição "k" >= 2.

Na prática:

    qualificaPrioridade :: (Fractional a, Ord a) => a -> String
    qualificaPrioridade tarefa
        |tarefa > 0 && tarefa <=250 = "Pouco importante" --1° guarda
        |tarefa >250 && tarefa <=500 = "Importância mediana" --2° guarda
        |tarefa > 500 && tarefa <= 750 = "Importante" --3° guarda
        |otherwise = "Extremamente importante" -- guarda "cath-all"

O guarda **otherwise**: sua funcionalidade é atribuir o maior nível de importância a uma tarefa independente de sua pontuação e, uma vez que ele está no final da função, isto faz com que toda a tarefa com pontuação superior a 750 seja classificada como "Exetremamente importante".

**Sintaxe:** é bastante notável que a sintaxe de um guarda resume-se ao uso de indentação, seguido de um pipe ("|") e da condição a ser realizada juntamente ao valor de retorno da função caso a condição a ser avaliada seja verdadeira.

## Where

Apesar da função “qualificaPrioridade” estar correta, de modo geral, é mais desejoso que coisas como a prioridade de uma tarefa sejam calculadas pelo computador e não sejam fornecidas pelo 
usuário. Tendo isto em mente, a função abaixo expõe uma forma de fazer o cálculo de prioridade tendo em vista três parâmetros: 

1. imp: A importância inerente a tarefa;
2. ani: O ânimo que usuário sente em querer executar a tarefa;
3. arr: O arrependimento que o usuário sentirá se não executar a atividade.

- 

    qualificaPrioridade :: (Fractional a, Ord a) => a -> a -> a -> String
    qualificaPrioridade i ani arr
        |i*ani*arr <=250 = "Pouco importante"
        |i*ani*arr <=500 = "Importância mediana"
        |i*ani*arr <= 750 = "Tarefa importante"
        |otherwise = "Tarefa extremamente importante"

Problemas do código acima:

- Deselegância: a constante repetição da expressão aritmética "i*ans *arr" deixa o código cansativo de se ler, além de prejudicar a legibilidade.
- Lentidão: já que todos os guardas realizam a mesma operação, no pior caso a expressão "i*ans *arr" será repetido três vezes e tudo isso só para executar o "otherwise".

Para solucionar existe o "where", recurso que permite declarar funções auxiliares no escopo local das funções. O espírito da coisa consiste em definir o retorno de uma função secundária como sendo "i*ans *arr", assim, tornando o código mais limpo e otimizado.

    qualificaPrioridade :: (Fractional a, Ord a) => a -> a -> a -> String
    qualificaPrioridade i ani arr
        |tarefa <=250 = "Pouco importante"
        |tarefa <=500 = "Importância mediana"
        |tarefa <= 750 = "Tarefa importante"
        |otherwise = "Tarefa extremamente importante"
    where tarefa = i*ani*arr

É possível usar o where para criação de aliases, apelidos para os valores que os guardas usam.

    qualificaPrioridade :: (Fractional a, Ord a) => a -> a -> a -> String
    qualificaPrioridade i ani arr
        |tarefa <= categoria01 = "Pouco importante"
        |tarefa <= categoria02 = "Importância mediana"
        |tarefa <= categoria03 = "Tarefa importante"
        |otherwise = "Tarefa extremamente importante"
        where
            tarefa = i*ani*arr
            categoria01 = 250
            categoria02 = 500
            categoria03 = 750

No   exemplo acima, houve a declaração de mais três funções auxiliares: “categoria01”, “categoria02” e “categoria03”. A única funcionalidade delas é melhorar a legibilidade do código. No entanto, é bastante notável que elas falharam miseravelmente em alcançar seus objetivos, mas, a depender da função, o uso deste tipo de apelido pode trazer melhorias significativas para a legibilidade do código.

## Where e casamento de padrão

Para facilitar a escrita do código "qualificaPrioridade" um programador ainda poderia optar por definir os valores de retorno das categorias através de um casamento de padrão.

    qualificaPrioridade :: (Fractional a, Ord a) => a -> a -> a -> String
    qualificaPrioridade i ani arr
        |tarefa <= categoria01 = "Pouco importante"
        |tarefa <= categoria02 = "Importância mediana"
        |tarefa <= categoria03 = "Tarefa importante"
        |otherwise = "Tarefa extremamente importante"
    where 
        tarefa = i * ani * arr 
        (categoria01, categoria02, categoria03) = (250, 500, 750)

## Casamento de padrão, where e compreensão de listas

A função "qualificaPrioridade" tem um bom potencial no que diz respeito ao cálculo do nível de prioridade de uma tarefa, mas não é cabível que um usuário tenha 10 tarefas e tenha que calcular a prioridade dessas tarefas individualmente e anotá-las em algum lugar.

Basta que a função receba uma lista cujos elementos sejam "quadruplas" e retorne uma lista de tuplas contendo o nome da tarefa e sua prioridade. Os elementos que compõe a "quadrupla" consistem no nome da tarefa e dos 3 parâmetros que foram passados para "qualificaPrioridade".

    qualificaPrioridadeLote :: (Fractional a, Ord a) => [(String, a, a, a)] -> [(String,a)]
    qualificaPrioridadeLote tarefas = [calcPrioridade tarefa | tarefa <- tarefas]
    where
        calcPrioridade (nomeTarefa, i, ani, arr) = (nomeTarefa, i*ani*arr)

A função acima pode ser lida da seguinte forma: "calcule a prioridade de tarefa usando "calcPrioridade", onde "calcPrioridade" é dado pelo produto de 'i', 'ani' e 'arr3', de tal forma que tarefa pertença ao conjunto de tarefas.

    Entrada:
    qualificaPrioridadeLote   [("EDA",10,8,10),("Automatos",10,6,10),("Logica",   10,   8,   10), ("Probabilidade", 7, 7, 8), ("Programacao funcional", 10, 6, 10)] 

    Saida:
    [("EDA",800.0),("Automatos",600.0),("Logica",800.0),("Probabilidade",392.0),("Programacao funcional",600.0)]

Caso seja mais desejoso fazer com que o segundo elemento da tupla seja a classificação da tarefa quanto a sua prioridade e não o valor de sua prioridade em si, ainda poderíamos adaptar um pouco a função apresentada.

    qualificaPrioridadeLote' :: (Fractional a, Ord a) => [(String, a, a, a)] -> [(String,String)]
    qualificaPrioridadeLote' tarefas = [calcPrioridade tarefa | tarefa <- tarefas]
        where
            calcPrioridade (nomeTarefa, i, ani, arr)
                | tarefa' <= 250 = (nomeTarefa, "Pouco importante")
                | tarefa' <= 500 = (nomeTarefa, "Importância mediana")
                | tarefa' <= 750 = (nomeTarefa, "Importante")
                | otherwise = (nomeTarefa, "Extremamente importante")
                where 
                    tarefa' = i*ani*arr

- Observações interessantes sobre este código:
    - o "where" está ninhado, ou seja, há um "where" dentro de outro "where". A cláusula mais interna <'tarefa'> é responsável por calcular a prioridade da tarefa.
        - para retornar o produto entre "i", "ani" e "arr3", <'tarefa'> não necessita receber nenhum parâmetro e isto acontece porque estes dados já foram passados como parâmetro para função declarada no "where" mais externo, ou seja, as cláusulas mais internas têm acesso aos parâmetros das mais externas.
    - após calcular a prioridade de uma tarefa é preciso classificá-las de acordo com sua pontuação. Compara-se a pontuação com um limite superior de uma dada categoria.
    
## Let

Poderíamos definir uma função que encontra x' em haskell da seguinte forma:

    x' :: (Floating a, Ord a) => a -> a -> a -> Either String a
    x' a b c
        | delta < 0 = Left "Oops!"
        | otherwise = Right ((-b + sqrt delta) / (2 * a))
        where delta = b^2 - 4 * a * c

Agora com o let:

    _x' :: (Floating a, Ord a) => a -> a -> a -> a
    _x' a b c =
        let delta = b^2 - 4 * a * c
        in (-b + sqrt delta) / (2 * a)

Para chechar se a descriminante é negativa:

    __x' :: (Floating a, Ord a) => a -> a -> a -> Either String a
    __x' a b c =
        let delta = b^2 - 4 * a * c
        in
            if delta < 0
                then Left "Oops!"
                else Right ((-b + sqrt delta) / (2 * a))

A depender do caso em que o let for usado, pode melhorar a legibilidade do código, a maior desvantagem é que ele não trabalha bem com os guardas. 