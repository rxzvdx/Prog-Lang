#!/usr/bin/perl

# Author: Antonio Rosado
# This program allows users to match a voter's opinions to the closest candidates based on their responses to multiple-choice questions.

use strict;						# Enforced the declaration of variables before their use, helping to prevent errors.
use warnings;						# Enables warnings to alert the programmer to possible issues.

require './find_best_candidates.pl';			# imports function 'find_best_candidates'.

# Prompt user to choose the mode of operation: manual or test.
print "Enter 'manual' to run the program manually or 'test' to run the test cases: ";
chomp(my $mode = <STDIN>); 				# Read the mode from user input and remove trailing new line

if ($mode eq 'manual') {
    while (1) {						# Continuously loop to process multiple voters in normal mode.
        my @voter_answers;				# Array to store the the voter's answers
        my %candidates;					# Hash to store candidate's names and their answers.
        my @best_candidates;				# Array to store the names of the best matching candidates.

	# Ask for and read voter's answers or an 'exit' command
        print "Enter voter's answers to 10 multiple-choice questions (separated by spaces) or type 'exit' to quit:\n";
        chomp(my $voter_input = <STDIN>);
        last if $voter_input eq 'exit';			# Exit the loop if the user types 'exit'.
        @voter_answers = split /\s+/, $voter_input;	# Split the input string into an array by whitespace

	# Ask for and read the number of candidates
        print "Enter the number of candidates: ";
        chomp(my $num_candidates = <STDIN>);

        for my $cand (1..$num_candidates) {			# Loop through each candidate to get their information
            print "Enter candidate name for candidate $cand: ";
            chomp(my $cand_name = <STDIN>);
            print "Enter candidate's answers to 10 multiple-choice questions (separated by spaces):\n";
            chomp(my $cand_input = <STDIN>);
            my @cand_answers = split /\s+/, $cand_input; 	# Split candidate's answers into an array.
            $candidates{$cand_name} = \@cand_answers;		# Store the candidate's answers in a hash.
        }

        @best_candidates = find_best_candidates(\@voter_answers, \%candidates); # Determine the best candidates.

	# Print the best candidates with the highest agreement score.
        print "Best candidate(s) with the highest agreement score:\n";
        for my $candidate (@best_candidates) {
            print "$candidate\n";
        }
    }
} elsif ($mode eq 'test') {
    require './perltest.pl';  					# Load and exeute test cases if in test mode
} else {
    print "Invalid input. Please enter 'manual' or 'test'.\n";
}

