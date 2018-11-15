
checkIfSame(Linha, Coluna, [H|T], R):-
	((Linha =:= H,
	Coluna =:= T) -> 
	R = 1
	;
	R = 0).

checkValidMove([],[],[],[]).

checkValidMove(Linha, Coluna, [H|T], R) :- 
	checkIfSame(Linha,Coluna, H, R), 
	(R =:= 1 ->
		true
	;
	checkValidMove(Linha, Coluna, T, R)).


playTurn(Tabuleiro, NovoTabuleiro, 'jogador' , 'human'):-
	write('Indique a posicao da peca:'),
	lerUserCelula(Linha1,Coluna1),
	write('Indique para onde quer mover a peca ou a posicao da peca inimiga a capturar:'),
	lerUserCelula(Linha2,Coluna2),
	move([Linha1,Coluna1],[Linha2,Coluna2],Tabuleiro,NovoTabuleiro).


play(Tabuleiro, PecasBrancas, PecasNegras,Dificuldade):-
	repeat,
	clearConsole,
	playTurn(Tabuleiro, NovoTabuleiro, PecasBrancas,Dificuldade),
	imprimirTabuleiro(NovoTabuleiro).


placeWhiteCity(Tabuleiro,NovoTabuleiro):-
repeat,
write('\nPrimeiro jogador (Pecas Brancas): Selecione a posicao da sua cidade [2-9]\n'),
read_line(Posicao),
(((Posicao>1),(Posicao<10))-> 
setPeca(Posicao,1,Tabuleiro,NovoTabuleiro,51)
;
write('\nA posicao tem de ser um numero de 2 a 9\n'),
fail
).


placeBlackCity(Tabuleiro,NovoTabuleiro):-
repeat,
write('\nSegundo jogador (Pecas Negras): Selecione a posicao da sua cidade [2-9]\n'),
read_line(Posicao),
(((Posicao>1),(Posicao<10))-> 
setPeca(Posicao,10,Tabuleiro,NovoTabuleiro,52)
;
write('\nA posicao tem de ser um numero de 2 a 9\n'),
fail).


placeCities(Tabuleiro,'jogador','jogador'):-
	imprimirTabuleiro(Tabuleiro),
	placeWhiteCity(Tabuleiro,NovoTabuleiro),
	placeBlackCity(Tabuleiro,NovoTabuleiro),
	imprimirTabuleiro(NovoTabuleiro).


placeCitiesBot1(Tabuleiro,'jogador','ai'):-
	imprimirTabuleiro(Tabuleiro),
	placeWhiteCity(Tabuleiro,NovoTabuleiro),
	random(2,10,Posicao),
	setPeca(Posicao,10,Tabuleiro,NovoTabuleiro,52),
	imprimirTabuleiro(NovoTabuleiro).

placeCitiesBot1(Tabuleiro,'ai','jogador'):-
	imprimirTabuleiro(Tabuleiro),
	random(2,10,Posicao),
	setPeca(Posicao,1,Tabuleiro,NovoTabuleiro,52),
	placeBlackCity(Tabuleiro,NovoTabuleiro),
	imprimirTabuleiro(NovoTabuleiro).


startGame(PecasBrancas,PecasNegras,Dificuldade):-
	tabuleiroInicial(Tabuleiro),
	placeCities(Tabuleiro,PecasBrancas,PecasNegras),
	play(Tabuleiro,PecasBrancas,PecasNegras, Dificuldade),
    clearConsole,
    printScreen.