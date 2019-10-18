%Legami di parentela

genitore(d,e). %E è genitore di D
genitore(c,d). %D è genitore di C
genitore(b,c). %C è genitore di B
genitore(a,b). %B è genitore di A



antenato(X, Y) :- genitore(X, Y).
antenato(X, Z) :- genitore(Y, Z), antenato(X, Y).
nonno(X, Y) :- genitore(X, Z), genitore(Z, Y).


%Domande:
%1) E' B antenato di A? 
%2) E' C antenato di A?
%3) E' D antenato di B?
%4) E' D antenato di C?
%%Risposte:
%1) true: B è genitore di A, quindi è suo antenato
%2) true: C è genitore di B che è genitore di A, quindi C è antenato di A
%3) true: D è genitore di C, che è genitore di B
%4) true: D è genitore di C 
%
%
%Riflessioni
%E' volutamente fatto in scala gerarchica, perciò è naturale dire che
%E è antenato di tutti, mentre progressivamente per esempio D lo sarà
%di tutti meno che proprio E, e così via, fino ad A che NON è antenato
%di nessuno. Infatti l'unico caso in cui non si ha mai un true è se 
%mettete antenato(VARIABILE, a). Provate voi stessi ;)))))