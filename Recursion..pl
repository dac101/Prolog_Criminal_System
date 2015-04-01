% Author:
% Date: 05/02/2015

factorial(0,1).
factorial(N,F2):-
N>0,
New is N-1,
factorial(New,F1),
F2 is N*F1.


sub_numbers(N,F2):-
N>0,
New is N-1,
factorial(New,F1),
F2 is N +(N-1).

