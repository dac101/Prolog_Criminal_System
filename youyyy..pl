% Author:
% Date: 25/03/2015

ask_user :-
        new(Dialog, dialog('Define employee')),
        all_hair_colour(HairColor),
        send_list(Dialog, append,
                  [
                    new(N1, text_item(first_Name)),
                    new(N2, text_item(last_Name)),
                    new(N3,  new(S, menu(sex))),
                    new(N4, menu(hair_color)),
                    new(N5, text_item(special_feature)),
                    new(N6, text_item(hair_style)),
                    new(N7, text_item(skin_color)),
                    new(N8, text_item(height)),
                    new(N9, text_item(last_name)),
                    new(A,  int_item(age, low := 18, high := 65)),
                    new(X,  menu(hair_color)),
                    new(D,  menu(country)),
                    button(all_criminals,and(message(@prolog,
                                                      all_criminals),
                                                             message(Dialog, destroy))),
                    button(add_criminals, message(Dialog, destroy)),
                    button(exit, message(Dialog, destroy)),
                    button(enter, and(message(@prolog,
                                              assert_employee,
                                              N1?selection,
                                              N2?selection,
                                              N3?selection,
                                              A?selection,
                                              D?selection),
                                      message(Dialog, destroy)))
                  ]),
        send_list(N3, append, [male, female]),
        send_list(N4, append,HairColor ),
        send(Dialog, default_button, enter),
        send(Dialog, open).
        
         all_hair_colour(L) :- findall(A,(hair_colour(A)),L).