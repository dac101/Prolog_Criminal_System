shape(rectangle).
shape(triangle).
shape(circle).

inside(rectangle,triangle).
inside(triangle,circle).
inside(circle,star).

contains(X,Y):- inside(X,Y).

contains(X,Y):- inside(X,Z),
                 contains(Z,Y).
