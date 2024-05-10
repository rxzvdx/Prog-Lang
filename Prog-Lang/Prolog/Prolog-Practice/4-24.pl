p([], [], 5).

p([H1|T1], [a|T2], X) :- p(T1, T2, Y),
X is H1 + Y + 10.

p([H1|T1], [b|T2], X) :- p(T1, T2, Y), 
X is H1 + Y.
