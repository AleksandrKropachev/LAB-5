count_nonzero([], 0).
count_nonzero([0|T], N) :-
    count_nonzero(T, N).
count_nonzero([H|T], N) :-
    H =\= 0,
    count_nonzero(T, N1),
    N is N1 + 1.

start :-
    write('Enter list (example: [1,0,2,0,3].):'), nl,
    read(List),
    count_nonzero(List, N),
    format('Non-zero elements: ~d~n', [N]),
    halt.

:- initialization(start).
