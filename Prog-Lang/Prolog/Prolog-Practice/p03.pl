% P03: Find the K'th element of a list.
% Problem: Define a predicate element_at(X, L, K) to find the K'th element X in the List L.
% Note: K is based on a 1-indexed system where the first element in the list is number 1.

% Predicate: element_at(X, L, K)
% Purpose: Determines if X is the K'th element of the list L.
% Explanation: The predicate is defined in two parts (clauses).

% Base case: The first element
% This clause matches when K is 1, which means we are looking for the first element in the list.
% In this scenario, X is the first element of the list. 
element_at(X, [X | _], 1).

% Recursive case: Finding the K'th element for K > 1
% This clause is used when K is greater than 1.
% It ignores the first element of the list (using an underscore to denote an anonymous variable)
% and decrements K by 1 to recurse down the list.
% The recursion continues until K becomes 1, which is handled by the base case.
element_at(X, [_ | L], K) :- 
	K > 1,			% Ensure K is greater than 1 to avoid infinite recursion and logical errors. 
	K1 is K - 1, 		% Decrement K to gradually approach the best case.
	element_at(X,L,K1).	% Recurse with the rest of the list and the decremented K.
% Note: Prolog's built-in predicate nth1(?Index, ?List, ?Elem) can also be used to achieve this functionality.
% It finds the element at the given 1-based index in the specified list.
