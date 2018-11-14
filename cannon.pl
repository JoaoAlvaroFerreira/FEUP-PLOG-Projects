
checkIfSame(Linha, Coluna, [H|T], R):-
	((Linha =:= H,
	Coluna =:= T,) -> 
	R = 1,
	;
	R = 0,).

checkValidMove([],[],[],[]).

checkValidMove(Linha, Coluna, [H|T], R) :- 
	checkIfSame(Linha,Coluna, H, R), 
	(R =:= 1 ->

		;
	checkValidMove(Linha, Coluna, T, R)).


whiteTurn(Tabuleiro, NovoTabuleiro, 'jogador' , 'human'):-
	write('Indique se quer utilizar uma peca ou um canhao (P ou C):'),
	read_line(tipoUso),
		((tipoUso =:= 'P')->
		write('Indique a posicao da peca:'),
		lerUserCelula(Linha1,Coluna1),
		getPeca(Linha1,Coluna1,Tabuleiro,Peca1),
			((Peca1 =:= 49)->
			write('Indique para onde quer mover a peca ou a posicao da peca inimiga a capturar:'),
			lerUserCelula(Linha2,Coluna2),
			getPeca(Linha2,Coluna2,Tabuleiro,Peca2),	
			getMovesPecaPlayer(1,Linha1,Coluna1,Tabuleiro,NovoMoves),
					;
					true,
					)

		;
		true,
		)
	
	.


play(Tabuleiro, PecasBrancas, PecasNegras,Dificuldade):-
	clearConsole,
	whiteTurn(Tabuleiro, NovoTabuleiro, PecasBrancas,Dificuldade),
	imprimirTabuleiro(NovoTabuleiro)
	checkVictory(NovoTabuleiro),
	blackTurn(NovoTabuleiro, ProximoTabuleiro, PecasBrancas,Dificuldade),
	imprimirTabuleiro(ProximoTabuleiro)
	checkVictory(ProximoTabuleiro),
	play(ProximoTabuleiro, PecasBrancas,PecasNegras).



placeCities(Tabuleiro,'jogador','jogador'):-
	imprimirTabuleiro(Tabuleiro),
	write('\nPrimeiro jogador (Pecas Brancas): Selecione a posicao da sua cidade [1-10]\n'),
	read_line(Posicao1),
	setPeca(Posicao1,1,Tabuleiro,NovoTabuleiro,51),
	write('\nSegundo jogador (Pecas Negras): Selecione a posicao da sua cidade [1-10]\n'),
	read_line(Posicao2),
	setPeca(Posicao2,10,Tabuleiro,NovoTabuleiro,52),
	imprimirTabuleiro(NovoTabuleiro).





startGame(PecasBrancas,PecasNegras,Dificuldade):-
	tabuleiroInicial(Tabuleiro),
	placeCities(Tabuleiro,PecasBrancas,PecasNegras),
	play(Tabuleiro,PecasBrancas,PecasNegras, Dificuldade),
    clearConsole,
    printScreen.