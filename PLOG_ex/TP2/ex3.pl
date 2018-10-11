exec(X,Y) :- p(X,Y).
exec(X,X) :- s(X).
p(X,Y) :- q(X), r(Y).
p(X,Y) :- s(X), r(Y).
q(a).
q(b).
r(c).
r(d).
s(e). 

/*

 ?- exec(X,Y)
 exec(X,Y)
 p(X,Y)
q(X)   r(Y)
q(a)   r(c)

*/
