% Author:
% Date: 25/03/2015

%human(name, gender, offence,eyecolour, hair colour, special features, hair style, skin colur, height, weight)
 %suspect((rozanne), lname(mansour), gender(female), offense(prostitution), eye_colour(grey), hair_colour(black), special_features(none),  hair_style(comb-over), skin_colour(light), height([5.3])).


%  gradePrediction(LetterGrade,Value):-
%                Value @>= 84,
%                LetterGrade = a;
%                 Value @>= 70,Value < 84,
%                LetterGrade = b;
%                  Value @>= 50, Value < 70,
%                LetterGrade = c;
%                  Value < 50,
%                LetterGrade = d .
%suspect(dac,smith,male,assault,amber,black,dacorie,afro,dark,9).

pick_search_algorithm(FirstName,LastName, Gender,Offence, EyeColor, HairColor, HairStyle, SkinColor) :-
                                                                                           Offence == 'none',HairStyle == 'none',
                                                                                           find_criminal_by_fLG(FirstName,LastName, Gender);
                                                                                           Gender == 'none',HairStyle == 'none',
                                                                                           find_criminal_by_OEH(Offence,EyeColor,HairColor).


find_criminal_by_HSO(HairStyle,SkinColor,Offence):-
                           suspect(FirstName,LastName, Gender,Offence, EyeColor, HairColor, U, HairStyle, SkinColor, P),
                           atom_concat('The criminal is ',FirstName,Value),
                           atom_concat(Value,' ',FinalValue),
                            atom_concat(FinalValue,LastName,FFinalValue),
                                        new(Dialog,dialog('Define employee')),
          send_list(Dialog, append,
                  [
                  new(  label(FirstName,FFinalValue)),
                  button(enter, and(message(@prolog,ask_user),
                               message(Dialog, destroy)))]),
          send(Dialog, default_button, enter),
          send(Dialog, open).

find_criminal_by_fLG(FirstName,LastName,Gender):-
                           suspect(FirstName,LastName, Gender,R, T, Y, U, I, O, P),
                           atom_concat('The criminal is ',FirstName,Value),
                           atom_concat(Value,' ',FinalValue),
                            atom_concat(FinalValue,LastName,FFinalValue),
                                        new(Dialog,dialog('Define employee')),
          send_list(Dialog, append,
                  [
                  new(  label(FirstName,FFinalValue)),
                  button(enter, and(message(@prolog,ask_user),
                               message(Dialog, destroy)))]),
          send(Dialog, default_button, enter),
          send(Dialog, open).
          



find_criminal_by_OEH(Offence,EyeColor,HairColor):-
                           suspect(FirstName,LastName, Gender,Offence, EyeColor, HairColor, U, I, O, P),
                           atom_concat('The criminal is ',FirstName,Value),
                           atom_concat(Value,' ',FinalValue),
                            atom_concat(FinalValue,LastName,FFinalValue),
                                        new(Dialog,dialog('Define employee')),
          send_list(Dialog, append,
                  [
                  new(  label(FirstName,FFinalValue)),
                  button(enter, and(message(@prolog,ask_user),
                               message(Dialog, destroy)))]),
          send(Dialog, default_button, enter),
          send(Dialog, open).