% Author:
% Date: 15/03/2015

/* Q1 Pt 1
   Describe the map neighbourhood */

neighbour(a,b).
neighbour(a,c).
neighbour(a,d).
neighbour(a,i).
neighbour(b,a).
neighbour(b,c).
neighbour(b,d).
neighbour(c,a).
neighbour(c,b).
neighbour(c,d).
neighbour(c,f).
neighbour(c,g).
neighbour(c,i).
neighbour(d,a).
neighbour(d,b).
neighbour(d,c).
neighbour(d,e).
neighbour(d,f).
neighbour(e,d).
neighbour(e,f).
neighbour(e,h).
neighbour(f,c).
neighbour(f,d).
neighbour(f,e).
neighbour(f,g).
neighbour(f,h).
neighbour(g,c).
neighbour(g,f).
neighbour(g,h).
neighbour(g,i).
neighbour(h,e).
neighbour(h,f).
neighbour(h,g).
neighbour(h,i).
neighbour(i,a).
neighbour(i,c).
neighbour(i,g).
neighbour(i,h).

% X is the set of countries with no repetitions
countries(X) :-
    setof(Y,N^neighbour(Y,N),X).

/* Q1 Pt 2
   Map colourings */
colour(a,red).
colour(b,green).
colour(c,yellow).
colour(d,blue).
colour(e,blue).
colour(f,yellow).
colour(g,blue).
colour(h,yellow).
colour(i,green).

% Lists all distinct map colours used
colours(X) :-
    setof(Y,N^colour(N,Y),X).

/*
  Question 1 Pt 3
  Query and answers to find out if the map
  is perfectly coloured. It isn't.

  ?- colour(C1,Col), colour(C2,Col), neighbour(C1,C2).

  C1 = c
  Col = yellow
  C2 = f ;

  C1 = d
  Col = blue
  C2 = e ;

  C1 = e
  Col = blue
  C2 = d ;

  C1 = f
  Col = yellow
  C2 = c ;

  C1 = f
  Col = yellow
  C2 = h ;

  C1 = h
  Col = yellow
  C2 = f ;

  No
*/

/* Q1 Pt 4
   Find a path of countries
   through the map */

path([X,Y]) :-                  % Only two countries.
    neighbour(X,Y).             % Path if they are neighbours.

path([X,Y|T]) :-
    neighbour(X,Y),             % Path if the first 2 countries
    path([Y|T]).                % are neighbours and the tail is a path.

/* Q1 Pt 5
   Tour: a path through all the countries with no repetitions
   and the last country is a neighbour of the first */

tour([H|T]) :-
    length([H|T],9),                % [H|L] contains 9 countries
    path([H|T]),                % and is a path.
    append(_,[X],T),
    neighbour(H,X),                 % 1st country neighbours the last.
    setof(Y,member(Y,[H|T]),S),
    length(S,9).                % No repetitions.

% Another way to do it (I couldnt decide which is better):

tour2([H|T]) :-
    length([H|T],9),
    path([H|T]),
    append(_,[K],T),
    neighbour(H,K),
    findall(X,(append(_,[X|R],[H|T]), member(X,R)),L),
    L = [].                             % List of repetitions is empty.


/*
  Find all tours starting with [a,b,c,d] :

  ?- tour([a,b,c,d|L]).

  L = [e, f, g, h, i] ;

  L = [e, f, h, g, i] ;

  L = [e, h, f, g, i] ;

  L = [f, e, h, g, i] ;

  No
*/

/* Q1 Pt 6
   Find tours where all consecutive countries
   are a different colour                      */

perfect_tour([H|T]) :-
    tour([H|T]),

    % Find all of the places in T
    % where two consecutive countries
    % have the same colour

    findall(X,(append(_,[X,Y|_],[H|T]),
        append(_,[X,Y|_],[H|T]),colour(X,CX),colour(Y,CY),CX = CY),L),

    L = [],                 % No same neighbouring colours found
    append(_,[F],T),
    colour(F,CF),
    colour(H,CH),
    CF \= CH.                   % and the colour of the first country
                            % is not the same as the last country.

/* Find all perfect tours
   starting with [a,b,c]...

  ?- perfect_tour([a,b,c|T]).

  T = [d, f, e, h, g, i] ;

  T = [g, i, h, e, f, d] ;

  T = [i, g, h, e, f, d] ;

  No
*/

/* Q1 Pt 7
   Find perfect colourings of the map */

perfect_map([],Colouring,_) :-
    write(Colouring), nl, true.     % Print list

perfect_map([Country|Countries],List,Colours) :-
    member(Colour,Colours),
    % Find all of the same coloured neighbours of a country
    findall(Y,(neighbour(Country,Y), member([Y,Colour],List)),Same_Colour),
    Same_Colour = [],
    append(List,[[Country,Colour]],Next_List),
    perfect_map(Countries,Next_List,Colours).

/*
  Takes a list of colours and prints a perfect map
  colouring as a list of [Country,Colour] pairs.    */

perfect_map :-
    Colours = [red,yellow,blue,green],
    countries([Country|Countries]),
    perfect_map(Countries,[[Country,red]],Colours).

/*
  Output:

  ?- perfect_map.
  [[a, red], [b, yellow], [c, blue], [d, green], [e, red], [f, yellow], [g, red],
    [h, blue], [i, yellow]]
*/

/* Q2 Pt 1
   Find the smallest element in a list */

min_in_list([Min],Min).             % We've found the minimum

min_in_list([H,K|T],M) :-
    H =< K,                             % H is less than or equal to K
    min_in_list([H|T],M).               % so use H

min_in_list([H,K|T],M) :-
    H > K,                              % H is greater than K
    min_in_list([K|T],M).               % so use K


/* Q2 Pt 2
   Find a list of elements that occur only once in another list */

not_member(K,L) :- member(K,L),!, fail.
not_member(_,_).

list_of_singletons(K,L) :-
      % Find list of duplicated items in K
    findall(Y,(member(Y,K),append(_,[Y|T],K),member(Y,T)),X),
      % Find items in K that are not duplicates
    findall(A,(member(A,K),not_member(A,X)),L).

/* Q2 Pt 3
   Find the winning number and student number */

:- ensure_loaded([list_of_bets]).         % Use data in list_of_bets.pl

winning_number(N) :-
    findall(Y,bet(_,Y),K),              % List the bet numbers
    list_of_singletons(K,L),            % Remove duplicates
    min_in_list(L,N).                   % Get the lowest number

/*
  ?- winning_number(Number), bet(Student,Number).

  Number = 3
  Student = 330734 ;

  No

*/

/* Q3
   Output Pascal's triangle of height given by user */

pascal :-
    write('Enter a number followed by "." :> '),
    read(N),
    integer(N),                         % Check that input is an integer
    pascal(N,[1],0).

pascal(N,L,I) :-
    J is I + 1,
    write(L), nl,                       % Write the current line
    J =< N,
    pascal_next_line([0|L],NL),         % Get the next line
    pascal(N,NL,J).                     % Recurse to the next line

pascal_next_line([X],[X]).
pascal_next_line([H,H2|T],[A|B]) :-
    pascal_next_line([H2|T],B),         % Work out each number from the ones
    A is H + H2.                        %   diagonally above it.