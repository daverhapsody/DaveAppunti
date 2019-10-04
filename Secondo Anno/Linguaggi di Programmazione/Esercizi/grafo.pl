% This buffer is for notes you don't want to save.
% If you want to create a file, visit that file with C-x C-f,
% then enter the text in that file's own buffer.

r(a,b).
r(b,c).

chiusura_transitiva(X, Y) :-
r(X, Z), r(Z, Y).

hello :- format('Hello world \n').
