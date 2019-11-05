% REGOLE
antenato(X, Y) :- genitore(X, Y).
antenato(X, Z) :- genitore(Y, Z), antenato(X, Y).
figlio(X, Y) :- genitore(Y, X).
nonno(X, Y) :- genitore(X, Z), genitore(Z, Y).
nipote(X, Y) :- nonno(Y, X).
discendente(X, Y) :- antenato(Y, X).
parente(X, Y) :- antenato(X, Y).
parente(X, Y) :- discendente(X, Y). 
%nonno(X, Y) :- genitore(genitore(X, _), Y).
% FATTI
genitore(a, b).
genitore(b, c).
genitore(c, d).
genitore(d, e).
genitore(e, f).
