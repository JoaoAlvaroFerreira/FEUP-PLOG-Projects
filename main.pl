:- use_module(library(lists)).
:- use_module(library(random)).

:- include('tabuleiro.pl').
:- include('menu.pl').
:- include('regrasMove.pl').
:- include('regrasCapture.pl').
:- include('regrasCannon.pl').
:- include('tabuleiroHelp.pl').
:- dynamic player/1.
:- include('cannon.pl').


start:-
    menu.

    
printScreen:-

    tabuleiroInicial(Tabuleiro),
    imprimirTabuleiro(Tabuleiro).


pressToContinue:-
    write('\n\nPrima qualquer botao para continuar.\n'),
    read_line(_).

jogador(1).
/*
    player(N),
    write(N),
    retract(player(1)),
    assert((player(2) :- write('cun'))),
    player(N2),
    write(N2)
    .*/

test(NewBoard):-
    tabuleiroInicial(Tab),
    move([[2,2],[3,1]],Tab,NewBoard),
    imprimirTabuleiro(NewBoard)
    .
    
    
