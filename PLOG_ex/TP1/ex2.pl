/* Pilotos */
piloto('Lamb').
piloto('Besenyei').
piloto('Chambliss').
piloto('MacLean').
piloto('Mangold').
piloto('Jones').
piloto('Bonhomme').
/* Equipas */
equipa('Lamb','Breitling').
equipa('Lamb','Besenyei').
equipa('Lamb','Chambliss').
equipa('MacLean','Mediterranean').
equipa('Mangold','Cobra').
equipa('Jones','Matador').
equipa('Bonhomme','Matador').
/* Avião */
aviao('Lamb','MX2').
aviao('Besenyei','Edge540').
aviao('Chambliss','Edge540').
aviao('MacLean','Edge540').
aviao('Mangold','Edge540').
aviao('Jones','Edge540').
aviao('Bonhomme','Edge540').
/* Circuitos */
circuito('Istanbul').
circuito('Budapest').
circuito('Porto').
/* Vencedores */
vencedor('Jones','Porto').
vencedor('Mangold','Budapest').
vencedor('Mangold','Istanbul').
/* Gates */
gate('Istanbul',9).
gate('Budapest',6).
gate('Porto',5).



/*
a)vencedor(Pilot,'Porto').
b)equipa(Pilot,Equipa),vencedor(Pilot,'Porto').
c)vencedor(Pilot,Corrida),vencedor(Pilot,Corrida2),Corrida \= Corrida2.
d)gate(Circuito,Valor),Valor>8.
e)aviao(Pilot,Avi),Avi \= 'Edge540'.

*/