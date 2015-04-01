% Author:
% Date: 25/03/2015

list_browser :-
        new(D, dialog('Prolog Source Files')),
        send(D, append, new(B, list_browser)),
        all_suspect(L),
        send_list(B, append, L),
        send(D, open).


all_suspect(L) :- findall([A,S],(suspect(A,S,D,F,G,H,Y,U,Z)),L).