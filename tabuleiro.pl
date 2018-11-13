/*
0 - Empty Cell
1 - White Soldier
2 - White City
3 - Black Soldier
4 - Black City
10x10 Rows,
*/


tabuleiroInicial([[32,32,32,32,32,32,32,32,32,32],
                  [32,49,32,49,32,49,32,49,32,49],
                  [32,49,32,49,32,49,32,49,32,49],
                  [32,49,32,49,32,49,32,49,32,49],
                  [32,32,32,32,32,32,32,32,32,32],
                  [32,32,32,32,32,32,32,32,32,32],
                  [50,32,50,32,50,32,50,32,50,32],
                  [50,32,50,32,50,32,50,32,50,32],
                  [50,32,50,32,50,32,50,32,50,32],
                  [32,32,32,32,32,32,32,32,32,32]]).

/*        SETS              */

setColuna(1,[_|Resto],[Peca|Resto],Peca):- !.
setColuna(Natual,[PecaAtual|Resto],[PecaAtual|LinhaResto],Peca):-
    Natual>1,
    ProximoAtual is Natual - 1,
    setColuna(ProximoAtual,Resto,LinhaResto,Peca).

setPeca(1,Ncoluna,[Linha|Resto],[NovaLinha|Resto],Peca):-
    setColuna(Ncoluna,Linha,NovaLinha,Peca).

setPeca(Natual,Ncoluna,[LinhaAtual|Resto],[LinhaAtual|NovaLinha],Peca):-
    Natual>1,
    ProximoAtual is Natual - 1,
    setPeca(ProximoAtual,Ncoluna,Resto,NovaLinha,Peca).

/*         GETS            */

getIterativo(Natual,Nobjetivo,[LinhaAtual|Resto],LinhaAtual):-
    Natual =:= Nobjetivo,!.
getIterativo(Natual,Nobjetivo,[LinhaAtual|Resto],Linha):-
    Natual \= Nobjetivo,
    NovoIT is Natual + 1,
    getIterativo(NovoIT,Nobjetivo,Resto,Linha).

getPecaColuna(Ncoluna,Linha,Peca):-
    getIterativo(1,Ncoluna,Linha,Peca).

getLinha(Nlinha,Tabuleiro,Linha):-
    getIterativo(1,Nlinha,Tabuleiro,Linha).

getPeca(Nlinha,Ncoluna,Tabuleiro,Peca):-
    getLinha(Nlinha,Tabuleiro,Linha),
    getPecaColuna(Ncoluna,Linha,Peca).



/*       PRINT  TABULEIRO                */
write('\33\[2J').
writeNumber(Number):-
    ((Number >= 10) ->
    format('~d',Number);
    format(' ~d',Number)).
imprimirLine([]):-
    write('|'),
    write('\n'),
    write('--+-+-+-+-+-+-+-+-+-+-+\n').
imprimirLine([Head|Tail]):-
    write('|'),
    format('~c',Head),
    imprimirLine(Tail).

imprimir([],Linha).
imprimir([Head|Tabuleiro],Linha) :-
    writeNumber(Linha),
    imprimirLine(Head),
    NewNumber is Linha + 1,
    imprimir(Tabuleiro,NewNumber).

imprimirTabuleiro(Tabuleiro) :-
    write('  |A|B|C|D|E|D|G|H|I|J|\n'),
    write('--+-+-+-+-+-+-+-+-+-+-+\n'),
    imprimir(Tabuleiro,1).

