%%%% -*- Mode: Prolog -*-

%%%% famiglia.pl --
%%%% Esempio di un albero genealogico da "Art of Prolog" più "Mahabharata".

%%%% maschi e femmine.
padre(X,dio).
maschio(terach).
maschio(abraham).
maschio(nachor).
maschio(haran).
maschio(isaac).
maschio(lot).
maschio(esau).
maschio(jacob).
maschio(bethuel).
maschio(laban).
maschio(benjamin).
maschio(joseph).

maschio(shantanu).
maschio(bhishma).
maschio(parashara).
maschio(chitrangada).
maschio(vichitravirya).

maschio(vyasa).

maschio(pandu).
maschio(dhritarashtra).
maschio(vidura).

maschio(yudhishtira).
maschio(bhima).
maschio(arjuna).
maschio(nakula).
maschio(sahadeva).
maschio(vyasa).

maschio(karna).

maschio(dharma).
maschio(vayu).
maschio(indra).
maschio(surya).

maschio(duryodhana).
maschio(dushasana).
maschio(vikarna).
maschio(sukarna).

femmina(sarah).
femmina(milcah).
femmina(yiscah).
femmina(rebecca).
femmina(rachel).


femmina(ganga).

femmina(satyavati).

femmina(amba).
femmina(ambika).
femmina(ambalika).

femmina(gandhari).
femmina(kunti).
femmina(madri).


%%%% padre/2 --
%%%% padre(X, Y) means 'X is padre of Y'.

padre(terach, abraham).
padre(terach, nachor).
padre(terach, haran).
padre(abraham, isaac).
padre(haran, lot).
padre(haran, milcah).
padre(haran, yiscah).
padre(nachor, bethuel).
padre(isaac, esau).
padre(isaac, jacob).
padre(jacob, benjamin).
padre(jacob, joseph).

padre(shantanu, bhishma).
padre(shantanu, chitrangada).
padre(shantanu, vichitravirya).

padre(parashara, vyasa).

padre(vyasa, dhritarashtra).
padre(vyasa, pandu).
padre(vyasa, vidura).

padre(dharma, yudhistira).
padre(dharma, bhima).
padre(dharma, arjuna).

padre(vayu, yudhistira).
padre(vayu, bhima).
padre(vayu, arjuna).

padre(indra, yudhistira).
padre(indra, bhima).
padre(indra, arjuna).

padre(ashwini, sahadeva).
padre(ashwini, nakula).

padre(dhritarashtra, duryodhana).
padre(dhritarashtra, dushasana).
padre(dhritarashtra, vikarna).
padre(dhritarashtra, sukarna).

padre(surya, karna).


%%%% madre/2
%%%% madre(X, Y) means 'X is madre of Y'.

madre(sarah, isaac).
madre(rebecca, esau).
madre(rebecca, jacob).
madre(rachel, benjamin).
madre(rachel, joseph).
madre(milcah, bethuel).

madre(satyavati, vyasa).

madre(ambika, dhritarashtra).
madre(ambalika, pandu).
madre('ambalika and ambika\'s maid', vidura).

madre(kunti, yudhishtira).
madre(kunti, bhima).
madre(kunti, arjuna).
madre(kunti, karna).

madre(madri, nakula).
madre(madri, sahadeva).

madre(gandhari, duryodhana).
madre(gandhari, dushasana).
madre(gandhari, vikarna).
madre(gandhari, sukarna).


%%%% genitore/2
%%%% genitore(X, Y) means 'X is genitore of Y'.

genitore(X, Y) :- padre(X, Y).
genitore(X, Y) :- madre(X, Y).


%%%% antenato/2
%%%% antenato(X, Y) means 'X is an antenato of Y'.

antenato(X, Y) :- genitore(X, Y).
antenato(X, Y) :- genitore(X, Z), antenato(Z, Y).


%%%% discendente/2
%%%% discendente(X, Y) means 'X is a descendent of Y'.

discendente(X, Y) :- antenato(Y, X).


%%%% fratellanza/2
%%%% fratellanza(X, Y) means 'X is a fratello or sorella of Y'.

fratellanza(X, Y) :-
	genitore(Z, X),
	genitore(Z, Y),
	X \= Y.

sorella(X, Y) :- fratellanza(X, Y), femmina(X).
fratello(X, Y) :- fratellanza(X, Y), maschio(X).

zio(X, Y) :- fratello(X, Z), genitore(Z, Y).
zia(X, Y) :- sorella(X, Z), genitore(Z, Y).


%%%% end of file -- famiglia.pl --