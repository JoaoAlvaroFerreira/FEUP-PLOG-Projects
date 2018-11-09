
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
    read(Escolha),
    clearConsole,
    (
        ((Escolha = 1)-> ola , pressToContinue, fail)|
        ((Escolha = 2)-> printScreen , pressToContinue, fail)|
        ((Escolha = 0))
    ),
    !.
                                                        
ola:- write('ola'),!.
                                                           



clearConsole :- write('\33\[2J').