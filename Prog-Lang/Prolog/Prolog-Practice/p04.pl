% P04: Find the number of elements of a list.
% Problem: Define a predicate my_length(L, N) where L is a list and N is the number of elements in L.

% Predicate: my_length(L, N)
% Purpose: Determines the number of elements N in the list L.
% Explanation: The predicate is defined with two clauses to handle different cases.

% Base case: Empty list
% This clause matches when the list L is empty ([]).
% An empty list has 0 elements, so N is set to 0.
my_length([], 0).

% Recursive case: List with at least one element
% This clause handles a non-empty list. It ignores the first element of the list (using an underscore)
% and recurses on the rest of the list L.
% N1 is the count of elements in the rest of the list, and N is the total count which is N1 plus 1.
my_length([_ | L], N) :-
	my_length(L, N1), 	% Recurse to count the elements in the sublist L
	N is N1 + 1.		% Increment the count from the sublist by 1 to include the current element
% Note: Prolog's built-in predicate length(?List, ?Int) can also be used to achieve this functionality.
% It directly provides the number of elements in a specified list.
