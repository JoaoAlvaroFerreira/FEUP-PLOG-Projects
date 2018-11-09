:- include('tabuleiro.pl').
:- include('menu.pl').
:- dynamic cell/3.
start:-
    menu.

    
printScreen:-

    tabuleiroInicial(Tabuleiro),
    imprimirTabuleiro(Tabuleiro).


pressToContinue:-
    write('Press any button to continue.'),
    get_byte(A),
    get_byte(B).

test(Linha):-
    tabuleiroInicial(Tab),
    imprimirTabuleiro(Tab),
    setPeca(5,5,Tab,NovoTab,52),
    imprimirTabuleiro(NovoTab).

    
    
