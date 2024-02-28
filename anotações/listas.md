*Nós podemos utilizar a palavra-chave let para definir o nome correto no GHCi. Fazer let a = 1 dentro do GHCi é o equivalente a escrever a = 1 em um script e carregá-lo.*

    ghci> let lostNumbers = [4,8,15,16,23,48]  
    ghci> lostNumbers  
    [4,8,15,16,23,48]

## OPERADORES EM LISTAS

*Uma prática comum é colocar duas listas juntas. Fazemos isso utilizando o operador ++.*

    ghci> [1,2,3,4] ++ [9,10,11,12]  
    [1,2,3,4,9,10,11,12]  
    ghci> "hello" ++ " " ++ "world"  
    "hello world"  
    ghci> ['w','o'] ++ ['o','t']  
    "woot" 

*Colocar alguma coisa no início de uma lista utilizando o operador : (também chamado de contra operador) será instantâneo.*

*O **:** recebe um número e uma lista de números ou um caractere e uma lista de caracteres, enquanto o ++ recebe duas listas.*

    ghci> 'Q':" GATINHA"  
    "Q GATINHA"  
    ghci> 5:[1,2,3,4,5]  
    [5,1,2,3,4,5]

*Se você deseja obter um elemento de uma lista pelo seu índice, utilize !!. O índice inicia a partir de 0.*

    ghci> "Steve Buscemi" !! 6  
    'B'  
    ghci> [9.4,33.2,96.2,11.2,23.25] !! 1  
    33.2

*Listas também podem conter listas.*
*As listas dentro de uma lista podem conter lengths diferentes, mas eles não podem ser de tipos diferentes. Assim como você não pode ter uma lista que tem alguns caracteres e alguns números, você não pode ter uma lista que contém algumas listas de caracteres e algumas listas de números.*

    ghci> let b = [[1,2,3,4],[5,3,3,3],[1,2,2,3,4],[1,2,3]]  
    ghci> b  
    [[1,2,3,4],[5,3,3,3],[1,2,2,3,4],[1,2,3]]  
    ghci> b ++ [[1,1,1,1]]  
    [[1,2,3,4],[5,3,3,3],[1,2,2,3,4],[1,2,3],[1,1,1,1]]  
    ghci> [6,6,6]:b  
    [[6,6,6],[1,2,3,4],[5,3,3,3],[1,2,2,3,4],[1,2,3]]  
    ghci> b !! 2  
    [1,2,2,3,4] 

**Comparando listas...**

    ghci> [3,2,1] > [2,1,0]  
    True  
    ghci> [3,2,1] > [2,10,100]  
    True  
    ghci> [3,4,2] > [3,4]  
    True  
    ghci> [3,4,2] > [2,4]  
    True  
    ghci> [3,4,2] == [3,4,2]  
    True

## FUNÇÕES EM LISTAS

**HEAD**

    ghci> head [5,4,3,2,1]  
    5  

**TAIL**

    ghci> tail [5,4,3,2,1]  
    [4,3,2,1]   

**LAST**

    ghci> last [5,4,3,2,1]  
    1   

**INIT**

    ghci> init [5,4,3,2,1]  
    [5,4,3,2]  

**LENGTH**

    ghci> length [5,4,3,2,1]  
    5  

**NULL**

    ghci> null [1,2,3]  
    False  
    ghci> null []  
    True  

**REVERSE**

    ghci> reverse [5,4,3,2,1]  
    [1,2,3,4,5]  

**TAKE**

    ghci> take 3 [5,4,3,2,1]  
    [5,4,3]  
    ghci> take 1 [3,9,3]  
    [3]  
    ghci> take 5 [1,2]  
    [1,2]  
    ghci> take 0 [6,6,6]  
    []  

**DROP**

    ghci> drop 3 [8,4,2,1,5,6]  
    [1,5,6]  
    ghci> drop 1 [7,6,5,4]  
    [6,5,4]  
    ghci> drop 0 [1,2,3,4]  
    [1,2,3,4]  
    ghci> drop 100 [1,2,3,4]  
    []   

**MAXIMUM**
**MINIMUM**

    ghci> minimum [8,4,2,1,5,6]  
    1  
    ghci> maximum [1,9,2,3,4]  
    9   

**SUM**
**PRODUCT**

    ghci> sum [5,2,1,6,3,2,5,7]  
    31  
    ghci> product [6,2,1,2]  
    24  
    ghci> product [1,2,5,6,7,9,2,0]  
    0   

**ELEM**

    ghci> 4 `elem` [3,4,5,6]  
    True  
    ghci> 10 `elem` [3,4,5,6]  
    False  

## LISTAS COM RANGES

*[1..20]. Isto é o equivalente a ter escrito [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20] e não há diferença entre um e outro com a exceção de que escrever longas seqüências enumeradas manualmente é algo bastante estúpido.*

    ghci> [1..20]  
    [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]  
    ghci> ['a'..'z']  
    "abcdefghijklmnopqrstuvwxyz"  
    ghci> ['K'..'Z']  
    "KLMNOPQRSTUVWXYZ"  

*E se nós quisermos todos os números ímpares entre 1 e 20? Ou se nós quisermos sempre ter o terceiro número entre 1 e 20?*

    ghci> [2,4..20]  
    [2,4,6,8,10,12,14,16,18,20]  
    ghci> [3,6..20]  
    [3,6,9,12,15,18] 

*Para ter uma lista com todos os números entre 20 e 1, você não pode simplesmente fazer [20..1], você deve fazer [20,19..1].*

    ghci> take 24 [13,26..]  
    [13,26,39,52,65,78,91,104,117,130,143,156,169,182,195,208,221,234,247,260,273,286,299,312]

## FUNÇÕES PARA LISTAS INFINITAS

**CYCLE** : *recebe uma lista e gera ciclos infinitos dela. Se você tentar mostrar o resultado, continuará para sempre até que você tente cortá-lo fora em algum lugar.*

    ghci> take 10 (cycle [1,2,3])  
    [1,2,3,1,2,3,1,2,3,1]  
    ghci> take 12 (cycle "LOL ")  
    "LOL LOL LOL "

**REPEAT** : *recebe um elemento e produz uma lista infinita dele. Isto é como o ciclo de uma lista com somente um elemento.*

    ghci> take 10 (repeat 5)  
    [5,5,5,5,5,5,5,5,5,5]

## COMPREENDENDO LISTAS

