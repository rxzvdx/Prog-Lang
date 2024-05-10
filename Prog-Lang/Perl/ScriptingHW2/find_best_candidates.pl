#!/usr/bin/perl

# Author: Antonio Rosado
use strict;
use warnings;

# Subroutine to find the best matching candidates based on agreement score.
sub find_best_candidates {
    my ($voter_answers_ref, $candidates_ref) = @_;	# Retrieve references to voter answers and candidate answers
    my @voter_answers = @$voter_answers_ref;		# Dereference to get the list of voter's answers
    my %candidates = %$candidates_ref;			# Dereference to get the hash of candidates' answers
    my $max_score = 0;					# Variable to store the maximum agreement score found
    my @best_candidates;				# Array to store the names of candidates with the highest score

    # Iterate over each candidate's name to calculate agreement scores
    for my $cand_name (keys %candidates) {		
        my @cand_answers = @{$candidates{$cand_name}};	# Retrieve and dereference the candidate's answers
        my $agreement_score = 0;			# Initialize agreement score for the current candidate

	# Compare each answer from the voter and candidate to calculate the score
        for my $i (0..9) {
            if ($voter_answers[$i] == $cand_answers[$i]) {
                $agreement_score += 10;			# Exact match, highest score increment
            } elsif (($voter_answers[$i] == 1 || $voter_answers[$i] == 2) && ($cand_answers[$i] == 1 || $cand_answers[$i] == 2)) {
                $agreement_score += 5;			# Partial match for answers 1 or 2, lower score increment
            } elsif (($voter_answers[$i] == 3 || $voter_answers[$i] == 4) && ($cand_answers[$i] == 3 || $cand_answers[$i] == 4)) {
                $agreement_score += 5;			# Partial match for answers 3 or 4, lower score increment
            }
        }

	# Update the list of best candidates based on the agreement score
        if ($agreement_score > $max_score) {
            $max_score = $agreement_score;		# Update maximum score found
            @best_candidates = ($cand_name);		# Reset the best candidates list with current candidate
        } elsif ($agreement_score == $max_score) {	# If a tie, add current candidate to the list of best candidates.
            push @best_candidates, $cand_name;
        }
    }

    return @best_candidates;
}

1;  # Ensure the file returns a true value

