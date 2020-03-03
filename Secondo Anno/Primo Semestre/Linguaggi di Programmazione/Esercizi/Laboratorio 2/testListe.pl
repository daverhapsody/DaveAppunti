% SE Un elemento che chiamiamo testa coincide con se stesso nella lista, allora 
% è membro
membro([Elemento | _ ], Elemento).

aggiungiTesta([Elemento | Lista], Elemento, Lista).
aggiungiCoda(Risultato, Elemento, Lista) :-
		Y = [Elemento],
		append(Lista, Y, Risultato).

rimuovi([], _, []).
rimuovi([], Elemento, [Elemento]).
rimuovi(Risultato, Elemento, [Elemento | Lista]) :- 
		rimuovi(Risultato, Elemento, Lista).

% ------------------------------------------------------------------------------
% SE Un elemento che chiamiamo ricerca coincide con un elemento della lista 
% (escludendo tutti gli altri) ALLORA
% Ricerca sarà quell'elemento, ergo sarà nella lista. O meglio ancora, prendo 
% la lista senza la testa, e rifaccio
% il confronto
% membro([ _ |  Elementi], Ricerca) :- membro(Elementi, Ricerca).


% Aggiunta di un elemento ad una lista 
% aggiungiTesta(Elemento, [] , [Elemento | _]).
% aggiungiCoda(Elemento, [] , [_ | Elemento]).

% Rimuovi da una lista 
% Base: Se la lista è vuota, allora tolgo un elemento, rimane vuota
% Passo: 
% rimuovi(_ , [], []).
% rimuovi(Elemento , [Elemento], []).
% rimuovi(Elemento , [Elemento | Lista], Res) :- 
% 								rimuovi(Elemento, Lista , Res).
% rimuovi(Elemento, [X | Lista1], [X | Lista2]) :- Elemento\=X , 
%											 rimuovi(Elemento, Lista1, Lista2).



