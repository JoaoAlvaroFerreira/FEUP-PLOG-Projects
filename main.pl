:- include('tabuleiro.pl').
:- include('menu.pl').
:- include('regras.pl').
:- dynamic cell/3.
start:-
    menu.

    
printScreen:-

    tabuleiroInicial(Tabuleiro),
    imprimirTabuleiro(Tabuleiro).


pressToContinue:-
    write('\n\nPrima qualquer botao para continuar.\n'),
    read_line(A).

test(Linha,Coluna):-
    lerUserCelula(Linha,Coluna).

    
    
