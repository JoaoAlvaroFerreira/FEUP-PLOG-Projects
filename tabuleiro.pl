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
    write('+-+-+-+-+-+-+-+-+-+-+\n').
imprimirLine([Head|Tail]):-
    write('|'),
    write(Head),
    imprimirLine(Tail).

imprimir([]).
imprimir([Head|Tabuleiro]) :-
    imprimirLine(Head),
    imprimir(Tabuleiro).

imprimirTabuleiro(Tabuleiro) :-
    write('+-+-+-+-+-+-+-+-+-+-+\n'),
    imprimir(Tabuleiro).