constraint1(Nlinha,Ncoluna,Tab,OrgElemento):-
    OrgElemento =:=6,!,
    getPecaConstraint(Nlinha,Ncoluna,Tab,7,Valor1),
    getPecaConstraint(Nlinha,Ncoluna,Tab,8,Valor2),
    getPecaConstraint(Nlinha,Ncoluna,Tab,9,Valor3),
    getPecaConstraint(Nlinha,Ncoluna,Tab,10,Valor4),
    getPecaConstraint(Nlinha,Ncoluna,Tab,11,Valor5),
    Valor1 + Valor2 + Valor3 + Valor4 + Valor5 #= 1.
constraint1(_,_,_,_).

constraint2(Nlinha,Ncoluna,Tab,OrgElemento):-
    OrgElemento =:= 5,!,
    length(Tab,Tamanho),
    Ncima is Nlinha - 1,
    Nbaixo is Nlinha + 1,
    Nesquerda is Ncoluna - 1,
    Ndireita is Ncoluna + 1,
    ((Ncima>0)->
        getPecaConstraint(Ncima,Ncoluna,Tab,9,Valor1),
        getPecaConstraint(Ncima,Ncoluna,Tab,10,Valor2),
        Valor1 + Valor2  #= 0
    ;
        true
    ),
    ((Nbaixo=<Tamanho)->
        getPecaConstraint(Nbaixo,Ncoluna,Tab,7,Valor4),
        getPecaConstraint(Nbaixo,Ncoluna,Tab,8,Valor3),
        Valor4 + Valor3  #= 0
    ;
        true
    ),
    ((Nesquerda>0)->
        getPecaConstraint(Nlinha,Nesquerda,Tab,8,Valor5),
        getPecaConstraint(Nlinha,Nesquerda,Tab,9,Valor6),
        Valor5 + Valor6 #= 0
    ;
        true
    ),
    ((Nesquerda=<Tamanho)->
        getPecaConstraint(Nlinha,Ndireita,Tab,7,Valor7),
        getPecaConstraint(Nlinha,Ndireita,Tab,10,Valor8),
        Valor7 + Valor8 #= 0    
    ;
        true
    ).
constraint2(_,_,_,_).
    
constraint3(Nlinha,Ncoluna,Tab,OrgElemento):-
    OrgElemento =\= 6, OrgElemento =\= 5,!,
    Ncima is Nlinha - 1,
    Nbaixo is Nlinha + 1,
    Nesquerda is Ncoluna - 1,
    Ndireita is Ncoluna + 1,
    getPecaConstraint(Ncima,Ncoluna,Tab,8,Valor1),
    getPecaConstraint(Ncima,Ncoluna,Tab,7,Valor2),
    getPecaConstraint(Nbaixo,Ncoluna,Tab,10,Valor3),
    getPecaConstraint(Nbaixo,Ncoluna,Tab,9,Valor4),
    getPecaConstraint(Nlinha,Nesquerda,Tab,10,Valor5),
    getPecaConstraint(Nlinha,Nesquerda,Tab,7,Valor6),
    getPecaConstraint(Nlinha,Ndireita,Tab,8,Valor7),
    getPecaConstraint(Nlinha,Ndireita,Tab,9,Valor8),
    Valor1 + Valor2 + Valor3 + Valor4 + Valor5 + Valor6 + Valor7 + Valor8 #= OrgElemento.
constraint3(_,_,_,_).

constraint4(Nlinha,Ncoluna,Tab,OrgElemento):-
    OrgElemento =:= 6,!,
    Ncima is Nlinha - 1,
    Nbaixo is Nlinha + 1,
    Nesquerda is Ncoluna - 1,
    Ndireita is Ncoluna + 1,
    getPecaConstraint(Nlinha,Ncoluna,Tab,8,Valor1),
    getPecaConstraint(Nlinha,Ndireita,Tab,7,Valor2),
    getPecaConstraint(Nbaixo,Ndireita,Tab,8,Valor3),
    getPecaConstraint(Nlinha,Ncoluna,Tab,8,Valor4),
    getPecaConstraint(Ncima,Ncoluna,Tab,9,Valor5),
    getPecaConstraint(Ncima,Nesquerda,Tab,8,Valor6),
    Valor1 #=< Valor2 + Valor3 , Valor4 #=< Valor5 + Valor6,
    getPecaConstraint(Nlinha,Ncoluna,Tab,7,Valor7),
    getPecaConstraint(Ncima,Ncoluna,Tab,10,Valor8),
    getPecaConstraint(Ncima,Ndireita,Tab,7,Valor9),
    getPecaConstraint(Nlinha,Ncoluna,Tab,7,Valor10),
    getPecaConstraint(Nlinha,Nesquerda,Tab,8,Valor11),
    getPecaConstraint(Nbaixo,Nesquerda,Tab,7,Valor12),
    Valor7 #=< Valor8 + Valor9 , Valor10 #=< Valor11 + Valor12,
    getPecaConstraint(Nlinha,Ncoluna,Tab,10,Valor13),
    getPecaConstraint(Nlinha,Nesquerda,Tab,9,Valor14),
    getPecaConstraint(Ncima,Nesquerda,Tab,10,Valor15),
    getPecaConstraint(Nlinha,Ncoluna,Tab,10,Valor16),
    getPecaConstraint(Nbaixo,Ncoluna,Tab,7,Valor17),
    getPecaConstraint(Nbaixo,Ndireita,Tab,10,Valor18),
    Valor13 #=< Valor14 + Valor15 , Valor16 #=< Valor17 + Valor18,
    getPecaConstraint(Nlinha,Ncoluna,Tab,9,Valor19),
    getPecaConstraint(Nbaixo,Ncoluna,Tab,8,Valor20),
    getPecaConstraint(Nbaixo,Nesquerda,Tab,9,Valor21),
    getPecaConstraint(Nlinha,Ncoluna,Tab,9,Valor22),
    getPecaConstraint(Nlinha,Ndireita,Tab,10,Valor23),
    getPecaConstraint(Ncima,Ndireita,Tab,9,Valor24),
    Valor19 #=< Valor20 + Valor21 , Valor22 #=< Valor23 + Valor24.
constraint4(_,_,_,_).

constraint5(Nlinha,Ncoluna,Tab,OrgElemento):-
    OrgElemento =:= 6,!,
    Nbaixo is Nlinha + 1,
    Nesquerda is Ncoluna - 1,
    Ndireita is Ncoluna + 1,
    getPecaConstraint(Nlinha,Ncoluna,Tab,8,Valor1),
    getPecaConstraint(Nbaixo,Ndireita,Tab,8,Valor2),
    getPecaConstraint(Nlinha,Ndireita,Tab,11,Valor3),
    Valor1 + Valor2 #=< Valor3 + 1,
    getPecaConstraint(Nlinha,Ncoluna,Tab,7,Valor4),
    getPecaConstraint(Nbaixo,Nesquerda,Tab,7,Valor5),
    getPecaConstraint(Nlinha,Nesquerda,Tab,11,Valor6),
    Valor4 + Valor5 #=< Valor6 + 1,
    getPecaConstraint(Nlinha,Ncoluna,Tab,10,Valor7),
    getPecaConstraint(Nbaixo,Ndireita,Tab,10,Valor8),
    getPecaConstraint(Nbaixo,Ncoluna,Tab,11,Valor9),
    Valor7 + Valor8 #=< Valor9 + 1,
    getPecaConstraint(Nlinha,Ncoluna,Tab,9,Valor10),
    getPecaConstraint(Nbaixo,Nesquerda,Tab,9,Valor11),
    getPecaConstraint(Nbaixo,Ncoluna,Tab,11,Valor12),
    Valor10 + Valor11 #=< Valor12 + 1.
constraint5(_,_,_,_).

constraint6(Nlinha,Ncoluna,Tab,OrgElemento):-
    OrgElemento =:= 6,!,
    Ncima is Nlinha - 1,
    Nbaixo is Nlinha + 1,
    Nesquerda is Ncoluna - 1,
    Ndireita is Ncoluna + 1,
    getPecaConstraint(Nlinha,Ncoluna,Tab,11,Valor1),
    getPecaConstraint(Nbaixo,Ncoluna,Tab,11,Valor2),
    getPecaConstraint(Nlinha,Ndireita,Tab,11,Valor3),
    getPecaConstraint(Nbaixo,Ndireita,Tab,11,Valor4),
    getPecaConstraint(Nbaixo,Ndireita,Tab,7,Valor5),
    Valor1 + Valor2 + Valor3 #=< Valor4 + Valor5 + 2,
    getPecaConstraint(Nlinha,Ncoluna,Tab,11,Valor6),
    getPecaConstraint(Ncima,Ncoluna,Tab,11,Valor7),
    getPecaConstraint(Nlinha,Ndireita,Tab,11,Valor8),
    getPecaConstraint(Ncima,Ndireita,Tab,11,Valor9),
    getPecaConstraint(Ncima,Ndireita,Tab,10,Valor10),
    Valor6 + Valor7 + Valor8 #=< Valor9 + Valor10 + 2,
    getPecaConstraint(Nlinha,Ncoluna,Tab,11,Valor11),
    getPecaConstraint(Nbaixo,Ncoluna,Tab,11,Valor12),
    getPecaConstraint(Nlinha,Nesquerda,Tab,11,Valor13),
    getPecaConstraint(Nbaixo,Nesquerda,Tab,11,Valor14),
    getPecaConstraint(Nbaixo,Nesquerda,Tab,8,Valor15),
    Valor11 + Valor12 + Valor13 #=< Valor14 + Valor15 + 2,
    getPecaConstraint(Nlinha,Ncoluna,Tab,11,Valor16),
    getPecaConstraint(Ncima,Ncoluna,Tab,11,Valor17),
    getPecaConstraint(Nlinha,Nesquerda,Tab,11,Valor18),
    getPecaConstraint(Ncima,Nesquerda,Tab,11,Valor19),
    getPecaConstraint(Ncima,Nesquerda,Tab,9,Valor20),
    Valor16 + Valor17 + Valor18 #=< Valor19 + Valor20 + 2.
constraint6(_,_,_,_).

percurrerKlinha1(_,_,_,_,K,Tamanho,Valor):-  K >= Tamanho,!,Valor #= 0.
percurrerKlinha1(Nlinha,Ncoluna,Elemento,Tab,K,Tamanho,Value):-
    NovoK is K + 1,
    percurrerKlinha1(Nlinha,Ncoluna,Elemento,Tab,NovoK,Tamanho,AnteriorValor),!,
    NovaLinha is Nlinha + K,
    NovaColuna is Ncoluna + K,
    getPecaConstraint(NovaLinha,NovaColuna,Tab,7,Valor),
    Value #= AnteriorValor + Valor.

percurrerKlinha2(_,_,_,_,K,Tamanho,Valor):- K >= Tamanho,!,Valor #= 0.
percurrerKlinha2(Nlinha,Ncoluna,Elemento,Tab,K,Tamanho,Value):-
    NovoK is K + 1,
    percurrerKlinha2(Nlinha,Ncoluna,Elemento,Tab,NovoK,Tamanho,AnteriorValor),!,
    NovaLinha is Nlinha + K,
    NovaColuna is Ncoluna + K,
    getPecaConstraint(NovaLinha,NovaColuna,Tab,8,Valor),
    Value #= AnteriorValor + Valor.

percurrerK1(Nlinha,Ncoluna,Elemento,Tab,K):-
    length(Tab,Tamanho),
    NovaLinha is Nlinha + K,
    NovaColuna is Ncoluna + K,
    ((NovaLinha =< Tamanho , NovaColuna =< Tamanho) ->
        percurrerKlinha1(Nlinha,Ncoluna,Elemento,Tab,1,K,Valor1),
        getPecaConstraint(NovaLinha,NovaColuna,Tab,9,Valor2),
        getPecaConstraint(Nlinha,Ncoluna,Tab,9,Valor3),
        Valor3 + Valor2 #=< Valor1 + 1,

        NovoK is K + 1,
        percurrerK1(Nlinha,Ncoluna,Elemento,Tab,NovoK)
    ;
        true
    ).

percurrerK2(Nlinha,Ncoluna,Elemento,Tab,K):-
    length(Tab,Tamanho),
    NovaLinha is Nlinha + K,
    NovaColuna is Ncoluna - K,
    ((NovaLinha =< Tamanho , NovaColuna > 0) ->
        percurrerKlinha2(Nlinha,Ncoluna,Elemento,Tab,1,K,Valor1),
        getPecaConstraint(NovaLinha,NovaColuna,Tab,10,Valor2),
        getPecaConstraint(Nlinha,Ncoluna,Tab,10,Valor3),
        Valor3 + Valor2 #=< Valor1 + 1,

        NovoK is K + 1,
        percurrerK2(Nlinha,Ncoluna,Elemento,Tab,NovoK)
    ;
        true
    ).


constraint7(Nlinha,Ncoluna,Elemento,Tab,OrgElemento):-
    OrgElemento =:= 6,!,
    percurrerK1(Nlinha,Ncoluna,Elemento,Tab,1),
    percurrerK2(Nlinha,Ncoluna,Elemento,Tab,1).
constraint7(_,_,_,_,_).