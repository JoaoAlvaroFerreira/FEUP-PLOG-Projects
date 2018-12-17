tabuleiro(tab1,[
    [6,5,6,6,5],
    [6,6,6,5,6],
    [6,6,6,6,6],
    [6,6,6,6,5],
    [2,6,6,6,6]
]).

tabuleiro(tab2,[
    [5,2,6,6,2,5],
    [2,6,6,6,6,2],
    [6,6,6,6,6,6],
    [6,6,6,6,6,6],
    [2,6,6,6,6,2],
    [5,2,6,6,2,5]
]).

tabuleiro(tab3,[
    [2,6,6,6,5,6,6,6,5,5],
    [6,6,6,5,6,6,6,6,6,6],
    [6,6,6,6,6,6,5,6,6,6],
    [6,6,6,6,6,6,6,6,6,6],
    [6,6,4,6,6,6,6,6,6,2],
    [5,6,6,6,6,6,6,6,2,6],
    [6,6,6,6,6,6,4,6,6,6],
    [6,6,6,6,6,5,6,6,6,6],
    [6,6,6,6,5,6,6,6,5,6],
    [2,6,6,2,6,6,6,6,5,6]
]).

tabuleiro(tab4,[
    [6,6,6,6,5],
    [6,6,6,6,6],
    [0,2,6,6,6],
    [5,6,6,6,6],
    [5,6,6,1,6]
]).

tabuleiro(tab5,[
    [6,6,6,2,6,6,6,6,6,6],
    [6,6,6,6,6,6,5,6,6,6],
    [6,6,6,6,6,2,6,6,6,5],
    [6,6,6,6,6,6,6,6,6,0],
    [6,5,0,5,6,6,5,6,6,6],
    [5,6,6,6,6,4,6,6,6,6],
    [5,6,6,6,6,6,6,6,6,6],
    [0,6,6,6,6,6,6,6,6,5],
    [5,6,6,6,6,6,6,6,6,6],
    [5,5,5,6,6,0,6,6,6,6]
]).

tabuleiro(tab6,[
    [0,6,0],
    [6,0,0],
    [0,0,0]
]).

tabuleiro(tab7,[
    [1,6,6,6,6,6,6,0,6,6],
    [6,6,6,6,6,6,6,6,6,6],
    [6,6,6,6,4,6,6,6,6,6],
    [6,6,3,6,6,6,6,6,3,6],
    [3,6,6,6,6,6,6,2,6,6],
    [6,6,6,6,6,6,6,6,6,6],
    [6,6,6,6,6,6,6,6,2,6],
    [6,2,6,6,6,6,3,6,6,6],
    [6,6,6,6,6,6,6,6,6,1],
    [6,6,6,3,6,6,6,6,6,6]
]).

getIterativo(Natual,Nobjetivo,[LinhaAtual|_],LinhaAtual):-
    Natual =:= Nobjetivo,!.
getIterativo(Natual,Nobjetivo,[_|Resto],Linha):-
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

criarElemento([],[]).
criarElemento([Elemento|Eresto],[NovoElem|NEresto]):-
    ((Elemento =:= 6) ->
        domain([NovoElem],7,11)
    ;
        NovoElem = Elemento
    ),
    criarElemento(Eresto,NEresto).

criarLinhas(_,[],[]).
criarLinhas(Length,[Linha|Lresto],[NovaLinha|NLresto]):-
    length(NovaLinha,Length),
    criarElemento(Linha,NovaLinha),
    criarLinhas(Length,Lresto,NLresto).

criarLabelingElemento([]).
criarLabelingElemento([Elemento|Resto]):-
    labeling([],[Elemento]),
    criarLabelingElemento(Resto).

criarLabeling(_,[]).
criarLabeling(Length,[Linha|Resto]):-
    criarLabelingElemento(Linha),
    criarLabeling(Length,Resto).

getPecaConstraint(Nlinha,Ncoluna,Tab,Tipo,Valor):-
    getPeca(Nlinha,Ncoluna,Tab,Peca),!,
    (Peca #= Tipo #/\ Valor #= 1) #\/ (Peca #\= Tipo #/\ Valor #= 0) .
getPecaConstraint(_,_,_,_,Valor):-
    Valor #= 0.


imprimirDivisao(Quantidade):-
    Quantidade > 0,
    write('+-'),
    NovaQ is Quantidade - 1,
    imprimirDivisao(NovaQ).
imprimirDivisao(_):-
    write('+\n').

imprimirLine([],Tamanho,_):-
    write('|'),
    nl.

    

imprimirLine([9|Tail],Tamanho,2):-
    write('|'),
    write('# /'),
    imprimirLine(Tail,Tamanho,2).
imprimirLine([7|Tail],Tamanho,2):-
    write('|'),
    write('  /'),
    imprimirLine(Tail,Tamanho,2).
imprimirLine([8|Tail],Tamanho,2):-
    write('|'),
    write('\\  '),
    imprimirLine(Tail,Tamanho,2).
imprimirLine([10|Tail],Tamanho,2):-
    write('|'),
    write('\\ #'),
    imprimirLine(Tail,Tamanho,2).
imprimirLine([11|Tail],Tamanho,2):-
    write('|'),
    write('   '),
    imprimirLine(Tail,Tamanho,2).
imprimirLine([5|Tail],Tamanho,2):-
    write('|'),
    write('###'),
    imprimirLine(Tail,Tamanho,2).
imprimirLine([Head|Tail],Tamanho,2):-
    write('|'),
    format('#~d#',[Head]),
    imprimirLine(Tail,Tamanho,2).


imprimirLine([9|Tail],Tamanho,1):-
    write('|'),
    write('/  '),
    imprimirLine(Tail,Tamanho,1).
imprimirLine([7|Tail],Tamanho,1):-
    write('|'),
    write('/ #'),
    imprimirLine(Tail,Tamanho,1).
imprimirLine([8|Tail],Tamanho,1):-
    write('|'),
    write('# \\'),
    imprimirLine(Tail,Tamanho,1).
imprimirLine([10|Tail],Tamanho,1):-
    write('|'),
    write('  \\'),
    imprimirLine(Tail,Tamanho,1).
imprimirLine([11|Tail],Tamanho,1):-
    write('|'),
    write('   '),
    imprimirLine(Tail,Tamanho,1).
imprimirLine([5|Tail],Tamanho,1):-
    write('|'),
    write('###'),
    imprimirLine(Tail,Tamanho,1).
imprimirLine([Head|Tail],Tamanho,1):-
    write('|'),
    format('#~d#',[Head]),
    imprimirLine(Tail,Tamanho,1).

imprimir([],_,_).
imprimir([Head|Tabuleiro],Linha,Tamanho) :-
    imprimirLine(Head,Tamanho,2),
    imprimirLine(Head,Tamanho,1),
    NewNumber is Linha + 1,
    imprimir(Tabuleiro,NewNumber,Tamanho).

imprimirTabuleiro(Tabuleiro) :-
    length(Tabuleiro,Tamanho),
    imprimir(Tabuleiro,1,Tamanho),!.