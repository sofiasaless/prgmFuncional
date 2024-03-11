## TUPLAS

- tuplas são como listas, armazenam muitos valores em um lugar só, mas há diferenças.
- são usadas quando você sabe exatamente quantos valores você quer combinar e o seu tipo depende de quantos componentes ela tem e os tipos de componentes.
- são caracterizadas por parênteses com seus componentes separados por vírgulas.
- pode conter uma combinação de vários tipos.

##

*Em vez de contornar os vetores com colchetes, usamos parênteses: [(1,2),(8,11),(4,5)] E se eu quiser uma superfície como [(1,2),(8,11,5),(4,5)]? Bem, isto me dará um erro:*

    Couldn't match expected type `(t, t1)'  
    against inferred type `(t2, t3, t4)'  
    In the expression: (8, 11, 5)  
    In the expression: [(1, 2), (8, 11, 5), (4, 5)]  
    In the definition of `it': it = [(1, 2), (8, 11, 5), (4, 5)] 

- Ele esta me dizendo que tentei usar um par e um triplo na mesma lista, isso não pode acontecer. Você não pode fazer uma lista como **[(1,2),("One",2)]** porque o primeiro elemento da lista é um par de números e o segundo elemento é um par que consiste em uma string e um número.

## COMPARANDO TUPLAS

**fst**: recebe um par e retorna seu primeiro componente

    ghci> fst (8,11)  
    8  
    ghci> fst ("Wow", False)  
    "Wow"  

**snd**: recebe um par e retorna seu segundo componente

    ghci> snd (8,11)  
    11  
    ghci> snd ("Wow", False)  
    False

**zip**: produz uma lista de pares, pega duas listas e então as comprimem juntamente em uma única lista juntando os elementos que casarem em pares. É bastante útil especialmente quando precisamos combinar duas listas em um único formato ou cruzar duas listas simultaneamente.

    ghci> zip [1,2,3,4,5] [5,5,5,5,5]  
    [(1,5),(2,5),(3,5),(4,5),(5,5)]  
    ghci> zip [1 .. 5] ["um", "dois", "tres", "quatro", "cinco"]  
    [(1,"um"),(2,"dois"),(3,"tres"),(4,"quatro"),(5,"cinco")]  

*O que acontece se os tamanhos das listas forem diferentes?*

    ghci> zip [5,3,2,6,2,7,2,5,4,6,6] ["eu","sou","uma", "tartaruga"]  
    [(5,"eu"),(3,"sou"),(2,"uma"),(6,"tartaruga")]

**Problema para combinar tuplas e compreensão de listas:**

Que triângulo retângulo que tem números inteiros para todos os lados e todos os lados iguais ou menores que 10 e tem um perímetro de 24?

    ghci> let triangles = [ (a,b,c) | c <- [1..10], b <- [1..10], a <- [1..10] ]

- checando no ghci digitando **triangles** terá uma lista de todos os possíveis triângulos com lados menores ou iguais a 10.

*Agora adicionando uma condição em que todos serão triângulos retângulos, o lado b não é o maior que a hipotenusa e esse lado não é maior do que o lado b:*

    ghci> let rightTriangles = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2]

*Agora queremos triângulos com o perímetro é igual a 24:*

    ghci> let rightTriangles' = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2, a+b+c == 24]  
    ghci> rightTriangles'  
    [(6,8,10)]

