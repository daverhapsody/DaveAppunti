compress([], []).
compress([X], [X]).
compress([Head | Tail], Result) :- 
	Tail = [Head | _TailT ],
	compress(Tail, Result).

compress([Head | Tail], TrueResult) :- 
%	Temp = [Head | Result].
	append(Head, Result, TrueResult),
	compress(Head, Result).