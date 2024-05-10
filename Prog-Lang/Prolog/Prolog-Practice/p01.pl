% P01 (*): Find the last element of a list
% Problem: Define a predicate my_last(X, L) where X is the last element of list L.

% Predicate: my_last(X, L)
% Purpose: Determine if X is the last element of the list L
% Explanation: The predicate is defined in two parts (clauses).

% Base case: Single-element list
% This clause matches when the list has only one element. That element is the last element.
% 	my_last(X, [X]).

% Recursive case: List with more than one element
% This clause is used when the list has more than one element.
% It ignores the first element of the list (using an underscore to denote an anonymous variable)
% and recurses on the rest of the list
% my_last(X, [_|L]) :- my_last(X, L)
my_last(X,[X]).
my_last(X,[_|L]) :- my_last(X, L).
% Note: Prolog has a built-in predicate 'last(?Elem, ?List)' that can also be used to find the last element of a list.
