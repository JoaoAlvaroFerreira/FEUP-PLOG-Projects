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
    [6,6,6,6,6],
    [6,6,6,6,6],
    [6,6,1,5,6],
    [6,6,6,6,6],
    [0,5,6,6,6]
]).

tabuleiro(tab5,[
    [0,6,6,6,6,6,6,6,6,6],
    [6,6,6,6,6,6,6,6,6,6],
    [6,6,6,6,6,6,6,6,6,6],
    [6,6,6,6,6,6,6,6,6,6],
    [6,6,6,6,6,6,6,6,6,6],
    [6,6,6,6,6,6,6,6,6,6],
    [6,6,6,6,6,6,6,6,6,6],
    [6,6,6,6,6,6,6,6,6,6],
    [6,6,6,6,6,6,6,6,6,6],
    [6,6,6,6,6,6,6,6,6,0]
]).

tabuleiro(tab6,[
    [6,6,6],
    [6,4,6],
    [6,6,6]
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