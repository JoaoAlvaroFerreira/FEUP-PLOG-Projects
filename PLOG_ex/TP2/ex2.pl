a(a1,1).
a(A,2).
a(a3,N).
b(1,b1).
b(2,B).
b(N,b3).
c(X,Y) :- a(X,N), b(N,Y).
d(X,Y) :- a(X,N), b(Y,N).
d(X,Y) :- a(N,X), b(N,Y). 


/*
a) ?- a(X,2). 
true
b) ?- b(X,kalamazoo). 
X=2
yes
c) ?- c(X,b3). 
X=X=a1
Y=b3=N
yes
d) ?- c(X,Y). 
X=X=a1
Y=b1
e) ?- d(X,Y). 
X=a1
Y=2

*/