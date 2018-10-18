:- include('tabuleiro.pl').
:- include('menu.pl').
:-dynamic cell/3.
start:-
    menu.

    
printScreen:-

    tabuleiroInicial(Tabuleiro),
    repeat,
    imprimirTabuleiro(Tabuleiro),

    read(X),
    write(X), X=fim.