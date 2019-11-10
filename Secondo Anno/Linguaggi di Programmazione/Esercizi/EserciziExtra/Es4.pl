/*
The board is printed as
 1 2 3
 4 5 6
 7 8 9
*/

print_board([]).
print_board([H | T]) :- write(H), print_board2(T).
print_board2([H | T]) :- write(H), print_board3(T).
print_board3([H | T]) :- writeln(H), print_board(T).

win(X, [X, X, X, _, _, _, _, _, _]).
win(X, [_, _, _, X, X, X, _, _, _]).
win(X, [_, _, _, _, _, _, X, X, X]).

win(X, [X, _, _, X, _, _, X, _, _]).
win(X, [_, X, _, _, X, _, _, X, _]).
win(X, [_, _, X, _, _, X, _, _, X]).

win(X, [X, _, _, _, X, _, _, _, X]).
win(X, [_, _, X, _, X, _, X, _, _]).

replace_pos(Board, Pos, Symbol, NewBoard) :-
    nth0(Pos, Board, _, Rest),
    nth0(Pos, NewBoard, Symbol, Rest).

find_free_positions([], []).
find_free_positions([x | T1], T2) :- find_free_positions(T1, T2).
find_free_positions([o | T1], T2) :- find_free_positions(T1, T2).
find_free_positions([N | T1], [N | T2]) :- find_free_positions(T1, T2).

player_move(Player, Board, NewBoard) :-
    write("Inserisci dove inserire "),
    write(Player),
    write(": "),
    read(X),
    find_free_positions(Board, FP),
    member(X, FP),
    Pos is X - 1,
    replace_pos(Board, Pos, Player, NewBoard).

player_move(Player, Board, NewBoard) :-
    writeln("Posizione non valida"),
    player_move(Player, Board, NewBoard).

game(Board, _) :- print_board(Board), fail.
game(Board, _) :- win(x, Board), writeln("Ha vinto il giocatore 1").
game(Board, _) :- win(o, Board), writeln("Ha vinto il giocatore 2").
game(Board, _) :- find_free_positions(Board, []), writeln("Pareggio.").
game(Board, x) :- player_move(x, Board, NewBoard), game(NewBoard, o).
game(Board, o) :- player_move(o, Board, NewBoard), game(NewBoard, x).

one_game :- game([1, 2, 3, 4, 5, 6, 7, 8, 9], x).
    
    
%%% Divisione di una stringa in parole.

whitespace(X) :- findall(X, char_type(X, space), Spaces), member(X, Spaces).

first_word([], [], []).
first_word([C | Cs], [], Cs) :- whitespace(C), !.
first_word([C | Cs], [C | Xs], Rest) :- first_word(Cs, Xs, Rest).

split_string_into_words([], []).
split_string_into_words([C | Cs], Ws) :-
    whitespace(C),
    !,
    split_string_into_words(Cs, Ws).
split_string_into_words(CharCodes, [W | Ws]) :-    
    first_word(CharCodes, WCodes, Rest),
    string_codes(W, WCodes),
    split_string_into_words(Rest, Ws).
    
    
