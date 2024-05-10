% P05: Reverse a list

% Predicate: my_reverse(L1, L2)
% Description: L2 is the list obtained from reversing the order of elements in L1.
% Arguments: 
% 	L1 - Input list to be reversed
% 	L2 - Resultant list after reversing L1
% Usage: my_reverse(+List1, -List2)

% Note: The built-in predicate reverse(+List1, -List2) can also be used for reversing lists.

% This predicate initializes the reversal process by calling my_rev with an empty accumulator
my_reverse(L1, L2) :- my_rev(L1, L2, []).

% Base case: When the first argument list is empty, the accumulator holds the reversed list.
% The cut (!) prevents backtracking, ensuring that once an empty is list encountered,
% the accumulator is immediately taken as the result without further processing.
my_rev([], L2, L2) :- !.

% Recursive case: Decompose the list into head X and tail Xs.
% Prepend the head X to the accumulator, effectively reversing the list order as recursion unwinds.
% Calls itself with the tail of the list, the yet to be completed reversed list, and the updated accumulator.
my_rev([X|Xs], L2, Acc) :- my_rev(Xs, L2, [X|Acc]).
