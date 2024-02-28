## ALGUMAS FUNÇÕES DO HASKELL

*A função succ pega qualquer coisa e então define o seu sucessor e o retorna.*

    ghci> succ 8  
    9   

*As funções **min** e **max** pegam duas coisas que podem ser colocadas em ordem (como um número!) e retorna aquele que for o menor ou maior.*

    ghci> min 9 10  
    9  
    ghci> min 3.4 3.2  
    3.2  
    ghci> max 100 101  
    101

*Aplicar uma função (chamando a função colocando um espaço depois dela, e depois ir digitando os seus parâmetros) tem sempre a maior precedência. O que isto significa para nós é que estas duas declarações são equivalentes.*

    ghci> succ 9 + max 5 4 + 1  
    16  
    ghci> (succ 9) + (max 5 4) + 1  
    16  

## CRIANDO FUNÇÕES

    doubleMe x = x + x  

*no compilador...*

    ghci> :l baby  
    [1 of 1] Compiling Main             ( baby.hs, interpreted )  
    Ok, modules loaded: Main.  
    ghci> doubleMe 9  
    18  
    ghci> doubleMe 8.3  
    16.6   

*outra função...*

    doubleUs x y = x*2 + y*2 

*com resultado:*
    
    ghci> doubleUs 4 9  
    26  
    ghci> doubleUs 2.3 34.2  
    73.0  
    ghci> doubleUs 28 88 + doubleMe 123  
    478

*pode chamar suas próprias funções dentro de outras funções que você fez. Com isto em mente, nós iremos redefinir doubleUs da seguinte forma:*

    doubleUs x y = doubleMe x + doubleMe y

## INTRODUZINDO O "IF"

*função que multiplicará um número por 2 porém somente se este número for menor ou igual a 100, porque números maiores que 100 já são grandes o suficiente.*

    doubleSmallNumber x = if x > 100  
                            then x  
                            else x*2

#

    doubleSmallNumber' x = (if x > 100 then x else x*2) + 1  

*Aquela apóstrofe tem nenhum significado especial na sintaxe do Haskell. Ele é um caracter válido para ser usado em um nome de função. Normalmente nós utilizamos o ' para designar uma versão especifica de uma função (aqueles que não são preguiçosos) ou em uma versão levemente modificada de uma função ou variável.*

