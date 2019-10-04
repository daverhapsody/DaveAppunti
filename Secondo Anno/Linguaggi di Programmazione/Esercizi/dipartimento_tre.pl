%I predicati che abbiamo definito dalle relazioni con 6 o 4 campi possono
%esser ricodificati con predicati binari
%Detto in altri termini, le relazioni a 6 o 4 argomenti possono essere ricostruiti
%a partire da appunto queste relazioni binarie.

giorno(linguaggi, martedi).
otario(linguaggi, '9:30').
edificio(linguaggi, 'U4').
aula(linguaggi, 3).
docente(linguaggi, antoniotti).

cls :- write('\33\[2J').

% aula(Corso, Edificio, Aula) :- corso(Corso, _, aula(Edificio, Aula), _).
% docente(Corso, Docente) :- corso(Corso, _, _, Docente).
% aula(Corso, Luogo) :- corso(Corso, _, Luogo, _).