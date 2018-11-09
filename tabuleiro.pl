/*
0 - Empty Cell
1 - White Soldier
2 - White City
3 - Black Soldier
4 - Black City
10x10 Rows,
*/

tabuleiroVazio([[0,0,0,0,0,0,0,0,0,0],
                [0,0,0,0,0,0,0,0,0,0],
                [0,0,0,0,0,0,0,0,0,0],
                [0,0,0,0,0,0,0,0,0,0],
                [0,0,0,0,0,0,0,0,0,0],
                [0,0,0,0,0,0,0,0,0,0],
                [0,0,0,0,0,0,0,0,0,0],
                [0,0,0,0,0,0,0,0,0,0],
                [0,0,0,0,0,0,0,0,0,0],
                [0,0,0,0,0,0,0,0,0,0]]).


tabuleiroInicial([[0,0,0,0,0,0,0,0,0,0],
                  [0,1,0,1,0,1,0,1,0,1],
                  [0,1,0,1,0,1,0,1,0,1],
                  [0,1,0,1,0,1,0,1,0,1],
                  [0,0,0,0,0,0,0,0,0,0],
                  [0,0,0,0,0,0,0,0,0,0],
                  [2,0,2,0,2,0,2,0,2,0],
                  [2,0,2,0,2,0,2,0,2,0],
                  [2,0,2,0,2,0,2,0,2,0],
                  [0,0,0,0,0,0,0,0,0,0]]).

imprimirLine([]):-
    write('|'),
    write('\n'),
    write('--+-+-+-+-+-+-+-+-+-+-+\n').
imprimirLine([Head|Tail]):-
    write('|'),
    write(Head),
    imprimirLine(Tail).

imprimir([],Linha).
imprimir([Head|Tabuleiro],Linha) :-
    Linha =:= 10,
    write(Linha),
    imprimirLine(Head),
    NewNumber is Linha + 1,
    imprimir(Tabuleiro,NewNumber).
imprimir([Head|Tabuleiro],Linha) :-
    write(' '),
    write(Linha),
    imprimirLine(Head),
    NewNumber is Linha + 1,
    imprimir(Tabuleiro,NewNumber).

imprimirTabuleiro(Tabuleiro) :-
    write('  |A|B|C|D|E|D|G|H|I|J|\n'),
    write('--+-+-+-+-+-+-+-+-+-+-+\n'),
    imprimir(Tabuleiro,1).