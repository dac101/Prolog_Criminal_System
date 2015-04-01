% Author:
% Date: 17/03/2015


suspect(fname(nestor), lname(schnabel), gender(male), eye_colour(blue),
hair_colour(brown), special_features('flowers tattoo shoulder'),
hair_style(wave), skin_colour(dark), height([5,9])).

go:-
   open('house.txt',read,Str),
   read_houses(Str,House),
   close(Str),
   write(House),nl.

store_crinimal  :-
         open('criminal.txt',append,Stream),
         write(Stream,'suspect('),write(Stream,'FirstName'), write(Stream,','),write(Stream,'LastName'),write(Stream,','),
         write(Stream,'gender'), write(Stream,','),write(Stream,'eye_color'), write(Stream,','),write(Stream,'hair_color'), write(Stream,','),
         write(Stream,'special_features'), write(Stream,','),write(Stream,'hair_style'), write(Stream,','),write(Stream,'skin_color'),   write(Stream,','),
         write(Stream,'height'),
         write(Stream,').'),
          nl(Stream),
         close(Stream).

store_crinimal(FirstName,LastName,Gender,EyeColor,HairColor,SpecialFeatures,HairStyle,SkinColor,Height)  :-
         open('criminal.txt',append,Stream),
         write(Stream,'suspect('),write(Stream,FirstName), write(Stream,','),write(Stream,LastName),write(Stream,','),
         write(Stream,Gender), write(Stream,','),write(Stream,EyeColor), write(Stream,','),write(Stream,HairColor), write(Stream,','),
         write(Stream,SpecialFeatures), write(Stream,','),write(Stream,HairStyle), write(Stream,','),write(Stream,SkinColor),write(Stream,','),
         write(Stream,Height),
         write(Stream,').'),
          nl(Stream),
         close(Stream).

         
adding :- open('a.txt', append, Handle), write(Handle, 'abc'), close(Handle).


 
read_houses(Stream,[]):-
  at_end_of_stream(Stream).
  
read_houses(Stream,[X|L]):-
  \+ at_end_of_stream(Stream),
  read(Stream,X),
  read_houses(Stream,L).
  