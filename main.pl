:- include('tabuleiro.pl').
:- include('menu.pl').
:-dynamic cell/3.
start:-
    menu.

    
printScreen:-

    tabuleiroInicial(Tabuleiro),
    imprimirTabuleiro(Tabuleiro).