:- use_module(library(lists)).
:- use_module(library(random)).

:- include('tabuleiro.pl').
:- include('menu.pl').
:- include('regrasMove.pl').
:- include('regrasCapture.pl').
:- include('regrasCannon.pl').
:- include('cannon.pl').

:- dynamic cell/3.

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

    
    
