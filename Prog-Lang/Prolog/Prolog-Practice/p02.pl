% P02: Find the last but one element of a list
% Problem: Define a predicate last_but_one(X, L) where X is the last but one element of the list L.


% Predicate: last_but_one(X, L)
% Purpose: Determines if X is the last but one element in the list L.
% Explanation: The predicate is defined in two parts (clauses).

% Base case: List with exactly two elements
% This clauses matches when the list has exactly two elements
% The first element in this scenario is the last but one element we are looking for 
% aka second to last
last_but_one(X, [X, _]).

% Recursive case: List with more than two elements
% This clause handles lists with more than two elements.
% It uses pattern matching to ignore the first element and then recurses on the remainder of the list.
% The recursion continues until it reduces to a list with exactly two elements, handled by the base case.
last_but_one(X, [_,Y|Ys]) :- last_but_one(X, [Y|Ys]).
% Explanation of the recursive transiiton:
% [_, Y | Ys] represents a list where '_' is the first element, 'Y' is the second, and 'Ys' is the rest of the list.
% The recursive call effectively strips the first element off and checks the new list starting from 'Y'.
