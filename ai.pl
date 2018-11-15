
make_jogada_normal(2,DeX,DeY,ParaX,ParaY,Board,Nivel,Lista,Move,Pontuacao):-
    setPeca(DeX,DeY,Board,NewBoard1,32),
    setPeca(ParaX,ParaY,NewBoard1,NewBoard,50),
    valid_pecas_linhas(Player,NewBoard,1,[],Pecas),
    NovoNivel is Nivel - 1,
    NovaLista = [[ParaX,ParaY]|Lista],
    percurrer_pecas(Player,Pecas,NewBoard,NovoNivel,NovaLista,Move,Pontuacao).
make_jogada_normal(1,DeX,DeY,ParaX,ParaY,Board,Nivel,Lista,Move,Pontuacao):-
    setPeca(DeX,DeY,Board,NewBoard1,32),
    setPeca(ParaX,ParaY,NewBoard1,NewBoard,49),
    valid_pecas_linhas(Player,NewBoard,1,[],Pecas),
    NovoNivel is Nivel - 1,
    NovaLista = [[ParaX,ParaY]|Lista],
    percurrer_pecas(Player,Pecas,NewBoard,NovoNivel,NovaLista,Move,Pontuacao).

make_jogada_cannon(Player,DeX,DeY,ParaX,ParaY,Board,Nivel,Lista,Move,Pontuacao):-
    setPeca(ParaX,ParaY,NewBoard1,NewBoard,32),
    valid_pecas_linhas(Player,NewBoard,1,[],Pecas),
    NovoNivel is Nivel - 1,
    NovaLista = [[ParaX,ParaY]|Lista],
    percurrer_pecas(Player,Pecas,NewBoard,NovoNivel,NovaLista,Move,Pontuacao).

percurrer_jogadas(_,_,_,[],_,_,_,[],_).
percurrer_jogadas(Player,X,Y,[[ParaX,ParaY]|Resto],Board,Nivel,Lista,[Move|MoveResto],Pontuacao):-
    make_jogada_normal(Player,X,Y,ParaX,ParaY,Board,Nivel,Lista,Move,Pontuacao),
    percurrer_jogadas(Player,X,Y,Resto,Board,Nivel,Lista,MoveResto,Pontuacao).

percurrer_cannon(_,_,_,[],_,_,_,[],_).
percurrer_cannon(Player,X,Y,[[ParaX,ParaY]|Resto],Board,Nivel,Lista,[Move|MoveResto],Pontuacao):-
    make_jogada_cannon(Player,X,Y,ParaX,ParaY,Board,Nivel,Lista,Move,Pontuacao),
    percurrer_cannon(Player,X,Y,Resto,Board,Nivel,Lista,MoveResto,Pontuacao).

empty_list([]).

jogada_atual(Player,X,Y,Board,Nivel,Lista,Move,Pontuacao):-
    NovaLista = [[X,Y]|Lista],
    getMovesPecaPlayer(Player,X,Y,Board,MovesN),
    percurrer_jogadas(Player,X,Y,MovesN,Board,Nivel,NovaLista,Move1,Pontuacao),
    getCaptures(Player,X,Y,Board,MovesC),
    ((empty_list(MovesC)) ->
        true
    ;
        NovaPontuacao is Pontuacao + 1,
        write(NovaPontuacao),nl,
        percurrer_jogadas(Player,X,Y,MovesC,Board,Nivel,NovaLista,Move2,NovaPontuacao)),
    append(Move1,Move2,Move3),
    getCanonDisparos(Player,X,Y,Board,MovesD),
    ((empty_list(MovesD)) ->
        true
    ;
        NovaPontuacao2 is Pontuacao + 2,
        percurrer_cannon(Player,X,Y,MovesD,Board,Nivel,NovaLista,Move4,NovaPontuacao2)),
    append(Move3,Move4,Move).

percurrer_pecas(_,[],_,_,_,[],_).
percurrer_pecas(_,_,_,0,Proxima,Lista,Pontuacao):- Lista = [Pontuacao,Proxima].
percurrer_pecas(Player,[[X,Y]|Resto],Board,Nivel,Lista,Move,Pontuacao):-
    Nivel > 0,
    jogada_atual(Player,X,Y,Board,Nivel,Lista,MoveLista,Pontuacao),
    percurrer_pecas(Player,Resto,Board,Nivel,Lista,MoveLista2,Pontuacao),
    append(MoveLista,MoveLista2,Move).

escolher_movimento(Escolhido,[[_,Escolhido]|_]).

make_move(Board,NewBoard,Nivel,Pontuacao):-
    jogador(Player),
    valid_pecas_linhas(Player,Board,1,[],Pecas),
    write('Obteve Pecas'),nl,
    percurrer_pecas(Player,Pecas,Board,Nivel,[],Moves,0),
    write('Obteve Moves'),nl,
    sort(Moves,SortedMoves),
    reverse(SortedMoves,NewBoard).
    /*escolher_movimento(Escolha,ReversedMoves),
    reverse(Escolha,NewBoard).
    %move(Movimento,Board,NewBoard).*/