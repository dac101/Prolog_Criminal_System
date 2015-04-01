% Author:
% Date: 17/03/2015



        %       ask_name(+Prompt, +Label, -Name)
        %       Put a prompter on the screen and wait till the user has
        %       entered a name.  Pressing cancel makes this predicate fail.
        %       Prompt is a long string, giving explanation; Label is a short
        %       label displayed for the text entry field.


        :- pce_global(@name_prompter, make_name_prompter).

        make_name_prompter(P) :-
                new(P, dialog),
                send(P, kind, transient),
                send(P, append, label(prompt)),
                send(P, append, label(prompt)),
                send(P, append, label(prompt)),
                send(P, append,new(TI, text_item(name, '', message(P?ok_member, execute)))),
                send(P, append,new(T2, text_item(df, '',message(P?ok_member, execute)))),
                send(P, append, button(ok, message(P, return, TI?selection))),
                send(P, append, button(ok, message(P, return, TI?selection))),
                send(P, append, button(ok, message(P, return, TI?selection))),
                send(P, append, button(cancel, message(P, return, @nil))).


        ask_name(Prompt, Label, Name) :-
                send(@name_prompter?prompt_member, selection, Prompt),
                send(@name_prompter?name_member, label, Label),
                send(@name_prompter?name_member, clear),
                get(@name_prompter, confirm_centered, RawName),
                send(@name_prompter, show, @off),
                RawName \== @nil,
                Name = RawName.

        ask_name :-
                ask_name('Street',name, Street),
                writeln(Street).

        % Start the demo

        :- ask_name.
