:- include('tabuleiro.pl').

start:-

    printScreen.

    
printScreen:-

    tabuleiroInicial(Tabuleiro),
    repeat,
    imprimirTabuleiro(Tabuleiro),
    read(X),
    write(X),
    !.