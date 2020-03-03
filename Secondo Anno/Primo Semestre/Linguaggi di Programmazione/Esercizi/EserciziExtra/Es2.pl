%% -*- Mode: Prolog -*-
%%% Esercitazione 1

%%% Definizione dei numeri naturali

%%% Definizione (Peano)
%%% - 0 è un numero naturale
%%% - se n è un numero naturale allora il successore di n,
%%%   indicato con s(n), è anch'esso un numero naturale.

%%% Fatto: 0 è un naturale
nat(0).
%%% Regola: se N è un numero naturale (parte destra),
%%% allora s(N) è un numero naturale.
nat(s(N)) :- nat(N).

%%% Definiamo un predicato binario che ci dice se i due
%%% argomenti sono uno il successore dell'altro.
succ(N, s(N)).

%%% Definiamo la somma in modo ricorsivo:
%%% N + 0 = N
%%% N + s(M) = s(N) + M. In altre parole: N + M = (N+1) + (M-1) se M > 0.

%%% Fatto: la somma di N e 0 è N
sum(N, 0 ,N).
%%% Regola:
sum(N, s(M), S) :- sum(s(N), M, S).

%%% Example: sum(s(s(s(0))), s(s(0)), X).

%%% Definiamo il prodotto in modo ricorsivo:
%%% N * 0 = 0
%%% N * s(M) = N * M + M. In altre parole: N * M = N * (M - 1) + M se M > 0.

%%% Fatto: il prodotto di un numero per zero è zero
prod(_, 0, 0).
%%% Regola:
prod(N, s(M), P) :- prod(N, M, Q), sum(Q, N, P).

%%% Example: prod(s(s(0)), s(s(s(0))), X).

%%% Numeri
fact(0, 1).
fact(N, M) :-
    N > 0,
    N1 is N - 1,
    fact(N1, M1),
    M is N * M1.

%%% Liste

%%% n-esimo elemento
nth(0, [H | _], H).
nth(N, [_ | T], X) :-
    N1 is N - 1,
    nth(N1, T, X).

%%% appendb
append([], L, L).
append([H | T], L, [H | X]) :- append(T, L, X).

%%% member
contains(X, [X | _]).
contains(X, [_ | T]) :- contains(X, T).

%%% Vero se la lista è ordinata
sorted([]).
sorted([_]).
sorted([X, Y | T]) :- X =< Y, sorted([Y | T]).

%%% Vero se il terzo argomento è la prima lista con
%%%% tutte le copie di X rimosse.
remove([], _, []).
remove([X | T], X, L) :- remove(T, X, L).
remove([Y | T], X, [Y | L]) :- X \= Y, remove(T, X, L).

%%% Ottiene l'ultimo elemento della lista
last([X], X).
last([_ | T], X) :- last(T, X).

%%% Elementi duplicati della lista
duplicate([], []).
duplicate([H | T1], [H, H | T2]) :- duplicate(T1, T2).

%%%% Somma della lista
sum_list([], 0).
sum_list([H | T], N) :- sum_list(T, N1), N is H + N1.
