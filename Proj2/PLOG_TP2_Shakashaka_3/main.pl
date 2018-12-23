
:- use_module(library(clpfd)).
:- use_module(library(random)).
:- include('constraints.pl').
:- include('tabuleiro.pl').
:- include('dinamico.pl').

criarConstraintsElemento(_,_,[],_,_).
criarConstraintsElemento(Nlinha,Ncoluna,[Elemento|Resto],Tab,[OrgElemento|OrgResto]):-
    constraint1(Nlinha,Ncoluna,Tab,OrgElemento),
    constraint2(Nlinha,Ncoluna,Tab,OrgElemento),
    constraint3(Nlinha,Ncoluna,Tab,OrgElemento),
    constraint4(Nlinha,Ncoluna,Tab,OrgElemento),
    constraint5(Nlinha,Ncoluna,Tab,OrgElemento),
    constraint6(Nlinha,Ncoluna,Tab,OrgElemento),
    constraint7(Nlinha,Ncoluna,Elemento,Tab,OrgElemento),
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

criarTabuleiroTest(Length,Tab, StartTime):-
    length(NovoTab,Length),
    criarLinhas(Length,Tab,NovoTab),
    criarConstraints(1,Length,NovoTab,NovoTab,Tab),!,
    criarLabeling(Length,NovoTab),
    imprimirTabuleiro(NovoTab),
    statistics(runtime,[End|_]),
    RunTime is End-StartTime,
    format('Shakashaka dynamic table solving took ~3d sec.~n', [RunTime]),
    fd_statistics.

shakashaka(Name):-
    tabuleiro(Name,Tab),
    length(Tab,Tamanho),
    statistics(runtime,[Start|_]),
    criarTabuleiro(Tamanho,Tab),
    statistics(runtime,[End|_]),
    RunTime is End-Start,
    format('Shakashaka default table solving took ~3d sec.~n', [RunTime]),
    fd_statistics.

dinamico(N):-
statistics(runtime,[Start|_]),
    criarDinamicoTabuleiro(N,Tab),
    criarTabuleiroTest(N,Tab, Start),nl,fail.
