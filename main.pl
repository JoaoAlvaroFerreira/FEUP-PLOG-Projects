:- include('tabuleiro.pl').
:-dynamic cell/3.
start:-

    printScreen.

    
printScreen:-

    tabuleiroInicial(Tabuleiro),
    repeat,
    imprimirTabuleiro(Tabuleiro),
    read(X),
    write(X), X=fim.