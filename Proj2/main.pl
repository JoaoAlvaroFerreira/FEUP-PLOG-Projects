
:- use_module(library(clpfd)).
:- include('constraints.pl').
:- include('tabuleiro.pl').

criarConstraintsElemento(_,_,[],_,_).
criarConstraintsElemento(Nlinha,Ncoluna,[Elemento|Resto],Tab,[OrgElemento|OrgResto]):-
    constraint1(Nlinha,Ncoluna,Tab,OrgElemento),
    constraint2(Nlinha,Ncoluna,Tab,OrgElemento),
    constraint3(Nlinha,Ncoluna,Tab,OrgElemento),
    constraint4(Nlinha,Ncoluna,Tab,OrgElemento),
    constraint5(Nlinha,Ncoluna,Tab,OrgElemento),
    constraint6(Nlinha,Ncoluna,Tab,OrgElemento),
    %constraint7(Nlinha,Ncoluna,Elemento,Tab,OrgElemento),
    NovoNumero is Ncoluna +1,
    criarConstraintsElemento(Nlinha,NovoNumero,Resto,Tab,OrgResto).

criarConstraints(_,_,[],_,_).
criarConstraints(Nlinha,Length,[Linha|Resto],Tab,[OrgLinha|OrgResto]):-
    criarConstraintsElemento(Nlinha,1,Linha,Tab,OrgLinha),
    NovoNumero is Nlinha + 1,
    criarConstraints(NovoNumero,Length,Resto,Tab,OrgResto).


criarTabuleiro(Length,Tab):-
    length(NovoTab,Length),
    criarLinhas(Length,Tab,NovoTab),
    criarConstraints(1,Length,NovoTab,NovoTab,Tab),!,
    criarLabeling(Length,NovoTab),
    imprimirTabuleiro(NovoTab).

shakashaka(Name):-
    tabuleiro(Name,Tab),
    length(Tab,Tamanho),
    criarTabuleiro(Tamanho,Tab).
