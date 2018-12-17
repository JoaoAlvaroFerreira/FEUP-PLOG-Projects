
constraintDomain(Nlinha,Ncoluna,Tab):-
    getPecaConstraint(Nlinha,Ncoluna,Tab,6,Valor1),
    Valor1 #= 0,
    Baixo is Nlinha + 1,
    Direita is Ncoluna + 1,
    Cima is Nlinha - 1,
    Esquerda is Ncoluna - 1,
    getPecaConstraint(Baixo,Ncoluna,Tab,6,Valor2),
    getPecaConstraint(Cima,Ncoluna,Tab,6,Valor3),
    getPecaConstraint(Nlinha,Direita,Tab,6,Valor4),
    getPecaConstraint(Nlinha,Esquerda,Tab,6,Valor5),
    getPeca(Nlinha,Ncoluna,Tab,Valor6),
    Valor2 + Valor3 + Valor4 + Valor5 #= Valor6.
constraintDomain(Nlinha,Ncoluna,Tab):-
    getPecaConstraint(Nlinha,Ncoluna,Tab,6,Valor1),
    Valor1 #=1.

criarConstraintsElementoD(_,_,[],_).
criarConstraintsElementoD(Nlinha,Ncoluna,[Elemento|Resto],Tab):-
    constraintDomain(Nlinha,Ncoluna,Tab),
    NovoNumero is Ncoluna +1,
    criarConstraintsElementoD(Nlinha,NovoNumero,Resto,Tab).

criarConstraintsD(_,_,[],_).
criarConstraintsD(Nlinha,Length,[Linha|Resto],Tab):-
    criarConstraintsElementoD(Nlinha,1,Linha,Tab),
    NovoNumero is Nlinha + 1,
    criarConstraintsD(NovoNumero,Length,Resto,Tab).

criarLinha(0,[],_).
criarLinha(N,[Linha|Resto],Length):-
    N > 0,
    length(Linha,Length),
    domain(Linha,0,6),
    NovoN is N - 1,
    criarLinha(NovoN,Resto,Length).
criarLinha(0,[],_).

criarDinamicoTabuleiro(N,Devolver):-
    criarLinha(N,Devolver,N),
    criarConstraintsD(1,N,Devolver,Devolver),
    criarLabeling(N,Devolver).
