%Descrivere un insieme di fatti riguardanti i corsi offerti dal dipartimento
%Possibilità 1: Tutte le info sono concentrate in una unica relazione di 6 
%campi

corso(linguaggi, lunedi, '9:30', 'U4', 3, antoniotti).
corso(biologia_computazionale, lunedi, '14:30', 'U14', t023, antoniotti).

%Partendo da questa definizione posso poi costruire altri predicati! Esempio:

aula(Corso, Edificio, Aula) :- corso(Corso, _, _, Edificio, Aula, _).
docente(Corso, Docente) :- corso(Corso, _, _, _, _, Docente).