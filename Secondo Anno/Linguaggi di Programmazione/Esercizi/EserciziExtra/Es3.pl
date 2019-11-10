

% Insert an element into an ordered list.
% For example:
%
% ?- sorted_insert([1, 2], 3, [1, 2, 3]).
% true
%
% ?- sorted_insert([1, 2, 3, 4, 6, 7], 5, X).
% X = [1, 2, 3, 4, 5, 6, 7]
%
% ?- sorted_insert(X, 5, [1, 2, 3, 4, 5, 6, 7]).
% X = [1, 2, 3, 4, 6, 7]
% 
sorted_insert([], X, [X]).
sorted_insert([H | T], X, [H | T1]) :-
    H < X,
    sorted_insert(T, X, T1).
sorted_insert([H | T], X, [X, H | T]) :- H >= X.

% Extract the minimum from a list of numbers
% For example:
%
% ?- min([2, 4, 1], 1).
% true
%
% ?- min([2, 1, 3], 1).
% 1
%
min([X], X).
min([H | T], H) :- min(T, H1), H1 >= H.
min([H | T], X) :- min(T, X), X < H.

% Remove one copy of an element from a list
% For example:
%
% ?- remove_one([1, 2, 3, 4], 2, X).
% X = [1, 3, 4] 
%
% ?- remove_one([1, 2, 3, 4, 2], 2, X).
% X = [1, 3, 4, 2]
%
% ?- remove_one([1, 3], 3, [1]).
% true
%
remove_one([], _, []).
remove_one([X | T], X, T).
remove_one([H | T], X, [H | T1]) :-
    X \= H,
    remove_one(T, X, T1).

% We can now define the selection sort. The main idea is to remove the smallest
% element of the list and insert it in the correct position in the sorted list.
% For example:
%
% ?- insertion_sort([3, 4, 1, 8], X).
% X = [1, 3, 4, 8] 
%
selection_sort([], []).
selection_sort(X, [H | T]) :-
    min(X, H),
    remove_one(X, H, Y),
    selection_sort(Y, T).

% We can now define the insertion sort. The main idea is to add the element of
% the list to sort one by one into a sorted list.
% For example:
%
% ?- insertion_sort([3, 4, 1, 8], X).
% X = [1, 3, 4, 8]
%
insertion_sort([], []).
insertion_sort([H | T], X) :-
    insertion_sort(T, Y),
    sorted_insert(Y, H, X).

% Merging of two sorted sequences
% For example:
% 
% ?- merge([1, 3, 5, 7], [2, 4, 6, 8], X).
% X = [1, 2, 3, 4, 5, 6, 7, 8]
%
merge([], X, X).
merge(X, [], X).
merge([H1 | T1], [H2 | T2], [H1 | T3]) :-
    H1 =< H2,
    merge(T1, [H2 | T2], T3).
merge([H1 | T1], [H2 | T2], [H2 | T3]) :-
    H1 > H2,
    merge([H1 | T1], T2, T3).
			  
% A relation that is used to "split" a list into two lists of similar length
% (equal length if the starting list is of even length or a difference of one
% if the length is odd).
% For example:
%
% ?- split_in_two([1, 3, 5, 4, 2], X, Y).
% X = [1, 5, 2],
% Y = [3, 4] 
%
% ?- split_in_two([1, 3, 5, 4, 2, 9], X, Y).
% X = [1, 5, 2],
% Y = [3, 4, 9].
%
split_in_two([], [], []).
split_in_two([X], [X], []).
split_in_two([H1, H2 | T], [H1 | T1], [H2 | T2]) :- split_in_two(T, T1, T2).

% The merge sort algorithm. The main idea is to split the list into two lists
% until they are so small that they are necessarily sorted. Then we merge the
% sorted sequences two at a time to obtain a larger sorted sequence.
% For example:
%
% ?- merge_sort([5, 2, 1, 3, 4, 9, 7], X).
% X = [1, 2, 3, 4, 5, 7, 9]
%
merge_sort([], []).
merge_sort([X], [X]).
merge_sort(X, Y) :-
    split_in_two(X, X1, X2),
    merge_sort(X1, Y1),
    merge_sort(X2, Y2),
    merge(Y1, Y2, Y).

% To use a list as a stack we must be able to push and pop from it
% empty_stack(empty_list)
empty_stack([]).
% pop(stack, top_element, new_stack)
pop([H|T],H,T).
% push(stack, element, new_stack)
push(S,X,[X|S]).

% We can now implement a sequence with a cursor as a triple:
% 1) elements before the current position (a stack)
% 2) current element (the one under the cursor)
% 3) elements after the current position (a stack)
% For example, from the list [1, 3, 5, 2, 4] with the cursor over 5 we have
% seq([3, 1], 5, [2, 4])
%
% The operations that we need to support are:
% 1) moving the cursor to the next element
% 2) moving the cursor to the previous element
% 3) transform a list into a sequence with a cursor on the first element

next(seq(B, C, A), seq(X, Y, Z)) :- push(B, C, X), pop(A, Y, Z).

previous(seq(B, C, A), seq(X, Y, Z)) :- push(A, C, Z), pop(B, Y, X).

from_list([H|T], seq([], H, T)).

% We can also create an associative array.
% Its form will be a list of pairs (each of them with two element:
% the key and the value).
% For example:
% [kv(john, 3), kv(bill, 5), kv(mary, 4)]
% has three objects: 3, 5, 4
% with keys: john, bill, mary
%
% bFeatures to implement:
% 1) insert an element (can replace the existing value)
% 2) check if an element is present
% 3) get an element
% 4) remove an element

aa_insert([], kv(K, V), [kv(K, V)]).
aa_insert([kv(K, _) | T ], kv(K, V), [kv(K, V) | T]).
aa_insert([X | T], Y, [X | T1]) :- X \= Y, aa_insert(T, Y, T1).

aa_present([kv(K, _) | _], K).
aa_present([kv(X, _) | T], K) :- X \= K, aa_present(T, K).

aa_get([kv(K, V) | _], K, V).
aa_get([kv(X, _) | T], K, V) :- X \= K, aa_get(T, K, V).

aa_remove([kv(K, _) | T], K, T).
aa_remove([kv(X, Y) | T], K, [kv(X, Y) | T1]) :-
    X \= K,
    aa_remove(T, K, T1).

% Other problems

% Flattening of a nested list structures
% For example:
% ?- flatten([1, [2, 3], [[4]]], X).
% [1, 2, 3, 4]
%
listp([]).
listp([_ | _]).

append([], X, X).
append([H | T], X, [H | Y]) :- append(T, X, Y).

flatten([], []).
flatten([H | T], Z) :- listp(H),
		       flatten(H, X),
		       flatten(T, Y),
		       append(X, Y, Z).
flatten([H | T], [H | Z]) :- flatten(T, Z).

% Length of a list
len([], 0).
len([_ | T], N) :- len(T, N1),
		   N is N1 + 1.

% Pack consecutive duplicates in a list into sublists
% [1, 1, 1, 2, 2, 3, 4, 4]
% [[1, 1, 1], [2, 2], [3], [4, 4]]

pack([], []).
pack([X], [[X]]).
pack([H, H | T], [Y | Z]) :- pack([H | T], [H1 | Z]), Y = [H | H1].
pack([H1, H2 | T], [[H1] | Z]) :- H1 \= H2, pack([H2 | T], Z).

% Run-length encoding of a list
% [1, 1, 2, 2, 2, 3, 4, 4, 4]
% [pair(1, 2), pair(2, 3), pair(3, 1), pair(4, 3)]

rle(X, Y) :- pack(X, Z), rle_helper(Z, Y).

rle_helper([], []).
rle_helper([H | T], [pair(A, B) | Z]) :-
    H = [A | _],
    len(H, B),
    rle_helper(T, Z).
					  
