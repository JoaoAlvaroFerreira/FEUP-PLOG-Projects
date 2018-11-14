:- include('tabuleiro.pl').
:- include('menu.pl').
:- include('regrasMove.pl').
:- include('regrasCapture.pl').
:- include('regrasCannon.pl').
start:-
    menu.

    
printScreen:-

    tabuleiroInicial(Tabuleiro),
    imprimirTabuleiro(Tabuleiro).


pressToContinue:-
    write('\n\nPrima qualquer botao para continuar.\n'),
    read_line(_).


test(Moves):-
    tabuleiroInicial(Tab),
    getCanonDisparos(1,2,2,Tab,Moves)
    
    .

    
    
