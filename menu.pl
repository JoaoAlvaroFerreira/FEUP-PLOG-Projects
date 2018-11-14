
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
    write('1 - Iniciar Jogo\n'),
    write('2 - Imprimir tabuleiro\n'),
    write('0 - Exit\n'),
    read_line(Escolher),
    name(Escolha,Escolher),
    clearConsole,
    (
        ((Escolha = 1)-> modeChoice , pressToContinue, fail)|
        ((Escolha = 2)-> printScreen , pressToContinue, fail)|
        ((Escolha = 0))
    ),
    !.
                                                        
ola:- write('ola'),!.
                                                           



clearConsole :- write('\33\[2J').

modeChoice:-
    clearConsole,
    write('Escolha o modo de jogo: \n'),
    write('1 - Jogador vs PC\n'),
    write('2 - Jogador vs Jogador\n'),
    write('0 - Exit\n'),
    read_line(Escolher),
    name(Escolha,Escolher),
    clearConsole,
    (
        ((Escolha = 1)-> sideChoice, pressToContinue, fail)|
        ((Escolha = 2)-> startGame('jogador','jogador') , pressToContinue, fail)|
        ((Escolha = 0)->pressToContinue)
    ),
    !.





sideChoice:-
    clearConsole,
    write('Escolha as pecas com que quer jogar: \n'),
    write('1 - Pecas Brancas\n'),
    write('2 - Pecas Negras\n'),
    write('0 - Exit\n'),
    read_line(Escolher),
    name(Escolha,Escolher),
    clearConsole,
    (
        ((Escolha = 1)-> startGame('jogador','ai', 'human') , pressToContinue, fail)|
        ((Escolha = 2)-> startGame('ai','jogador','human'), pressToContinue, fail)|
        ((Escolha = 0)->pressToContinue)
    ),
    !.


difficultyChoice(''):-
     clearConsole,
    write('Escolha a dificuldade: \n'),
    write('1 - Facil\n'),
    write('2 - DificiL\n'),
    write('0 - Exit\n'),
    read_line(Escolher),
    name(Escolha,Escolher),
    clearConsole,
    (
        ((Escolha = 1)-> startGame(PecasBrancas,PecasNegras,'facil') , pressToContinue, fail)|
        ((Escolha = 2)-> startGame(PecasBrancas,PecasNegras,'dificil'), pressToContinue, fail)|
        ((Escolha = 0)->pressToContinue)
    ),
    !.


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