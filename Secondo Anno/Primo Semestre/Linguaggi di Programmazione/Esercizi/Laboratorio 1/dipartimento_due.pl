%Descrivere un insieme di fatti riguardanti i corsi offerti dal dipartimento
%Possibilità 1: Tutte le info sono concentrate in una unica relazione di 6 
%campi

corso(linguaggi, orario(lunedi, '9:30'), aula('U4', 3), antoniotti).
corso(biologia_computazionale, orario(lunedi, '14:30'), aula('U14', t023),
 		antoniotti).

%Partendo da questa definizione posso poi costruire altri predicati! Esempio:

aula(Corso, Edificio, Aula) :- corso(Corso, _, aula(Edificio, Aula), _).
docente(Corso, Docente) :- corso(Corso, _, _, Docente).
%OPPURE

aula(Corso, Luogo) :- corso(Corso, _, Luogo, _).