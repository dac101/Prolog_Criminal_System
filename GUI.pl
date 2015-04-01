% load the file that contains all the external database
:- [criminalSystemFacts].

% user facts to enable the user to log in
user(dac,dac11).
user(dac101,daa).

% login Gui. checks the database to log in
loginGui :- new(Dialog,dialog('Login')),
          send_list(Dialog, append,
                  [
                    new( UserName, text_item(username)),
                    new(Password, text_item(password)),
                    button(enter, and(message(@prolog,
                               checkUser,
                              UserName?selection,
                               Password?selection),
                                message(Dialog, destroy)
                               ))]),
                    send(Dialog, default_button, enter),
                    send(Dialog, open).
                    
% verfies user logging
checkUser(UserName,Password):-user(UserName,Password),
                               UserName \== Password,
                               new(Dialog,dialog('Login')),
                  send_list(Dialog, append,
                  [
                    new(  label(welcome_to_criminal_system,welcome_to_criminal_system)),
                    button(enter, and(message(@prolog,
                               ask_user),
                                message(Dialog, destroy)
                               ))]),
                    send(Dialog, default_button, enter),
                    send(Dialog, open).


% main menu loggin , user can search or select different option
ask_user :-
        new(Dialog, dialog('Main Menu')),
        all_offence(T),all_eye_color(E),all_skin_colour(Skin),
         all_hair_colour(HC) ,all_hair_style(HS),
        send_list(Dialog, append,
                  [ new(N1, text_item(firstName)),
                    new(N2, text_item(lastName)),
                    new(N3, new(S, menu(gender))),
                    new(N4, new(Offense, menu(offense,cycle))),
                    new(N5 , new(Eye,menu(eye_color,cycle))),
                    new(N6,  new(Hair,menu(hair_color,cycle))),
                    new(N8,  new(HairStyle,menu(hair_style,cycle))),
                    new(N9, new(Skincolor,menu(skin_color,cycle))),
                    button(all_criminals,and(message(@prolog,
                                                      all_criminals),
                                                             message(Dialog, destroy))),
                    button(add_criminals,and(message(@prolog,add_criminal_gui), message(Dialog, destroy))),
                    button(exit, message(Dialog, destroy)),
                    button(enter, and(message(@prolog,
                                              pick_search_algorithm,
                                              N1?selection,
                                              N2?selection,
                                              N3?selection,
                                              N4?selection,
                                              N5?selection,
                                              N6?selection,
                                              N8?selection,
                                              N9?selection),
                                      message(Dialog, destroy)))
                  ]),
        send_list(Offense, append,T),
        send_list(Eye, append,E),
        send_list(Hair, append,HC),
        send_list(HairStyle, append,HS),
        send_list(Skincolor, append,Skin),
        send_list(S, append,  [male, female,none]),
        send(Dialog, default_button, enter),
        send(Dialog, open).


         % generate a list of all the criminal     from the fact file
all_criminals :-
        new(D, dialog('Prolog Source Files')),
        send_list(D, append,[ new(B, list_browser),
                      button(back, and(message(@prolog,
                                                       ask_user),
                                                   message(D, destroy)))]),
        all_suspect(L),
        send_list(B, append, L),

        send(D, open).


%  store new criminal records to the file
store_crinimal(FirstName,LastName,Gender,Offense,EyeColor,HairColor,SpecialFeatures,HairStyle,SkinColor,Height)  :-
         open('criminalSystemFacts.pl',append,Stream),
         write(Stream,'suspect('),write(Stream,FirstName), write(Stream,','),write(Stream,LastName),write(Stream,','),
         write(Stream,Gender), write(Stream,','),write(Stream,Offense), write(Stream,','),write(Stream,EyeColor), write(Stream,','),write(Stream,HairColor), write(Stream,','),
         write(Stream,SpecialFeatures), write(Stream,','),write(Stream,HairStyle), write(Stream,','),write(Stream,SkinColor),write(Stream,','),
         write(Stream,Height),
         write(Stream,').'),
          nl(Stream),
         close(Stream),
         consult('criminalSystemFacts.pl'),
         ask_user.


 add_criminal_gui :-
        new(Dialog, dialog('Add Criminal')),
        all_offence(T),all_eye_color(E),all_skin_colour(Skin),
         all_special_features(SP), all_hair_colour(HC) ,all_hair_style(HS),
        send_list(Dialog, append,
                  [ new(N1, text_item(firstName)),
                    new(N2, text_item(lastName)),
                    new(N3, new(S, menu(gender))),
                    new(N4, new(Offense, menu(offense,cycle))),
                    new(N5 , new(Eye,menu(eye_color,cycle))),
                    new(N6,  new(Hair,menu(hair_color,cycle))),
                    new(N7, text_item(special_feature)),
                    new(N8,  new(HairStyle,menu(hair_style,cycle))),
                    new(N9, new(Skincolor,menu(skin_color,cycle))),
                    new(N10,  int_item(height, low := 0, high := 10)),
                    button(exit, and(message(@prolog,
                                                    ask_user),
                                                   message(Dialog, destroy))),
                    button(enter, and(message(@prolog,
                                              store_crinimal,
                                              N1?selection,
                                              N2?selection,
                                              N3?selection,
                                              N4?selection,
                                              N5?selection,
                                              N6?selection,
                                              N7?selection,
                                              N8?selection,
                                              N9?selection,
                                              N10?selection),
                                      message(Dialog, destroy)))
                  ]),
        send_list(Offense, append,T),
        send_list(Eye, append,E),
        send_list(Hair, append,HC),
        send_list(HairStyle, append,HS),
        send_list(Skincolor, append,Skin),
        send_list(S, append,  [male, female]),
        send(Dialog, default_button, enter),
        send(Dialog, open).
        

result(Value):-
         new(Dialog,dialog('Define employee')),
          send_list(Dialog, append,
                  [
                  new(  label(Value,Value)),
                  button(enter, and(message(@prolog,ask_user),
                               message(Dialog, destroy)))]),
          send(Dialog, default_button, enter),
          send(Dialog, open).
          
not_found :-
         new(Dialog,dialog('Not Found')),
          send_list(Dialog, append,
                  [
                  new(  label(not_found,not_found)),
                  button(enter, and(message(@prolog,ask_user),
                               message(Dialog, destroy)))]),
          send(Dialog, default_button, enter),
          send(Dialog, open).

assert_employee(FirstName, FamilyName, Sex, Age, Depth,BodyType) :-
        format('Adding ~w ~w ~w, age ~w, working at ~w~n',
               [ Sex, FirstName, FamilyName, Age, Depth,BodyType]),
               result(Age).


% generate all the facts in the database to different list
all_suspect(L) :- findall(A,(suspect(A,S,D,F,G,H,Y,U,Z,M)),L).
all_offence(L) :- findall(S,(offence(S)),L).
all_eye_color(L) :- findall(A,(eye_colour(A)),L).
all_skin_colour(L) :- findall(A,(skin_colour(A)),L).
all_special_features(L) :- findall(A,(special_features(A)),L).
all_hair_colour(L) :- findall(A,(hair_colour(A)),L).
all_hair_style(L) :- findall(A,(hair_style(A)),L).


% deciede which search algorithm to choose
pick_search_algorithm(FirstName,LastName, Gender,Offence, EyeColor, HairColor, HairStyle, SkinColor) :-
                                                                                           Offence == 'none',HairStyle == 'none',
                                                                                           find_criminal_by_fLG(FirstName,LastName, Gender);
                                                                                           Gender == 'none',HairStyle == 'none',
                                                                                           find_criminal_by_OEH(Offence,EyeColor,HairColor);
                                                                                           find_criminal_by_all(FirstName,LastName, Gender,Offence, EyeColor, HairColor, HairStyle, SkinColor);
                                                                                           not_found.

 %  the follow predicate generate a  criminal based on certain records

find_criminal_by_all(FirstName,LastName, Gender,Offence, EyeColor, HairColor, HairStyle, SkinColor):-
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