member_set(X, [X|_]).
member_set(X, [_|T]) :- member_set(X, T).

add_set(X, S, S) :- member_set(X, S), !.
add_set(X, S, [X|S]).

union([], S, S).
union([H|T], S, R) :-
    union(T, S, R1),
    add_set(H, R1, R).

intersection([], _, []).
intersection([H|T], S, [H|R]) :-
    member_set(H, S),
    intersection(T, S, R).
intersection([_|T], S, R) :-
    intersection(T, S, R).

start :-
    A = [1,2],
    B = [2,3],
    C = [1,3],

    union(B, C, BC),
    intersection(A, BC, Left),

    intersection(A, B, AB),
    intersection(A, C, AC),
    union(AB, AC, Right),

    sort(Left, LeftSorted),
    sort(Right, RightSorted),

    format('Left: ~w~n', [LeftSorted]),
    format('Right: ~w~n', [RightSorted]),

    (LeftSorted = RightSorted ->
        write('Distributive law holds'), nl
    ;
        write('Distributive law does NOT hold'), nl
    ),
    halt.

:- initialization(start).
