:- include('tabuleiro.pl').
:- include('menu.pl').
:- include('regrasMove.pl').
:- include('regrasCapture.pl').
:- dynamic cell/3.
start:-
    menu.

    
printScreen:-

    tabuleiroInicial(Tabuleiro),
    imprimirTabuleiro(Tabuleiro).


pressToContinue:-
    write('\n\nPrima qualquer botao para continuar.\n'),
    read_line(_).


test:-
    tabuleiroInicial(Tab),
    imprimirTabuleiro(Tab),
    setPeca(2,2,Tab,NTab,51),
    imprimirTabuleiro(NTab)
    
    .

    
    
