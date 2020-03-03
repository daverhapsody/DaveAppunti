% SE genitore(a,b) ALLORA antenato(a,b).
% SE c che è antenato di a MA non è genitore ALLORA è comunque antenato

antenato(A, B) :- genitore(A, B).
antenato(A, C) :- genitore(B, C), antenato(A, B).
nonno(A, B) :- genitore(C, B), genitore(A, C). 
nipote(A, B) :- nonno(B, A).

genitore(a, b).
genitore(b, c).
genitore(c, d).
genitore(d, e).