
menu:-
    repeat,
    clearConsole,
    write(' _______  _______  _        _        _______  _         \n'),
    write('(  ____ \\(  ___  )( (    /|( (    /|(  ___  )( (    /|  \n'),
    write('| (    \\/| (   ) ||  \\  ( ||  \\  ( || (   ) ||  \\  ( |  \n'),
    write('| |      | (___) ||   \\ | ||   \\ | || |   | ||   \\ | |  \n'),
    write('| |      |  ___  || (\\ \\) || (\\ \\) || |   | || (\\ \\) |  \n'),
    write('| |      | (   ) || | \\   || | \\   || |   | || | \\   |  \n'),
    write('| (____/\\| )   ( || )  \\  || )  \\  || (___) || )  \\  |  \n'),
    write('(_______/|/     \\||/    )_)|/    )_)(_______)|/    )_)  \n'),
    write('1-Iniciar Jogo\n'),
    write('2-Imprimir tabuleiro\n'),
    write('0-Exit\n'),
    read_line(Escolher),
    name(Escolha,Escolher),
    clearConsole,
    (
        ((Escolha = 1)-> ola , pressToContinue, fail)|
        ((Escolha = 2)-> printScreen , pressToContinue, fail)|
        ((Escolha = 0))
    ),
    !.
                                                        
ola:- write('ola'),!.
                                                           



clearConsole :- write('\33\[2J').



separar(Linha,Coluna,[Letra|Resto]):-
    name(Coluna,Resto),
    integer(Coluna),
    Coluna >= 1,
    Coluna =< 10,
    integer(Letra),
    Linha is Letra - 64,
    Linha >= 1,
    Linha =< 10
    .


lerUserCelula(Linha,Coluna):-
    repeat,
    write('Porfavor insira uma celula valida (LetraNumero) : '),
    read_line(ValorLido),
    length(ValorLido,Tamanho),
    Tamanho =< 4,
    Tamanho >= 2, 
    separar(Linha,Coluna,ValorLido).