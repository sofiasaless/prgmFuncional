## OPERAÇÕES ARITMÉTICAS SIMPES

    ghci> 2 + 15  
    17  
    ghci> 49 * 100  
    4900  
    ghci> 1892 - 1472  
    420  
    ghci> 5 / 2  
    2.5  
    ghci>  

    ghci> (50 * 100) - 4999  
    1  
    ghci> 50 * 100 - 4999  
    1  
    ghci> 50 * (100 - 4999)  
    -244950  

## TESTANDO IGUALDADES

    ghci> 5 == 5  
    True  
    ghci> 1 == 0  
    False  
    ghci> 5 /= 5  
    False  
    ghci> 5 /= 4  
    True  
    ghci> "hello" == "hello"  
    True

*Que tal se fizermos 5 + "llama" ou 5 == True? Bem, se nós tentarmos o primeiro trecho destes código, nós teremos uma grande e assustadora mensagem de erro!*

    No instance for (Num [Char])  
    arising from a use of `+' at <interactive>:1:0-9  
    Possible fix: add an instance declaration for (Num [Char])  
    In the expression: 5 + "llama"  
    In the definition of `it': it = 5 + "llama" 

