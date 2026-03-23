solve :-
    permutation([druzhok, elisey, fantik, murlyka],
                [Misha, Maksim, Lenya, Dima]),

    permutation([black, white, red, gray],
                [CDruzhok, CElisey, CFantik, CMurlyka]),

    Colors = [
        druzhok-CDruzhok,
        elisey-CElisey,
        fantik-CFantik,
        murlyka-CMurlyka
    ],

    count_true([
        CFantik \= red,
        CMurlyka \= gray,
        CDruzhok \= white,
        CElisey \= gray,
        has_color(Misha, black, Colors),
        Maksim = murlyka,
        Lenya = elisey,
        has_color(Dima, white, Colors),
        Dima \= fantik,
        CDruzhok \= gray
    ], N),

    N =:= 9,

    write('RESULT:'), nl,
    write('Misha   - '), write(Misha), nl,
    write('Maksim  - '), write(Maksim), nl,
    write('Lenya   - '), write(Lenya), nl,
    write('Dima    - '), write(Dima), nl,

    nl, write('Colors:'), nl,
    print_colors(Colors),

    !.

has_color(Kitten, Color, Map) :-
    member(Kitten-Color, Map).

print_colors([]).
print_colors([K-C|T]) :-
    write(K), write(' - '), write(C), nl,
    print_colors(T).

count_true([], 0).
count_true([H|T], N) :-
    count_true(T, N1),
    (call(H) -> N is N1 + 1 ; N is N1).

start :-
    solve,
    halt.

:- initialization(start).