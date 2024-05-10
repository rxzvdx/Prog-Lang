% P06: Determine if a list is a palindrome.
% A palindrome is a sequence that reads the same forward and backward, e.g., [x, a, m, a, x].

% Predicate: is_palindrome(L)
% Description: Checks if the list L is a palindrome.
% Argument:
%	L - List to be checked for palindrome properties.
% Usage: is_palindrome(?List)

% This predicate checks if a list L is a palindrome by reversing the list and comparing the result with the original list.
% If the reversed list is the same as the original, the list is a palindrome.
is_palindrome(L) :- reverse(L, L).
