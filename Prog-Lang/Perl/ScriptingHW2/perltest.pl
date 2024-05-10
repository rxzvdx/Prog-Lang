#!/usr/bin/perl

# Author: Antonio Rosado
# Purpose: TEST CASES FOR BEST_CANDIDATES PROGRAM 
use strict;
use warnings;

require './find_best_candidates.pl';

sub test1 {
    my @voter_answers = (4, 3, 4, 4, 2, 1, 3, 3, 3, 4);
    my %candidates = (
        adams => [3, 3, 3, 3, 3, 3, 3, 3, 3, 3],
        grant => [1, 2, 1, 2, 1, 2, 1, 2, 1, 2],
        ford  => [4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
        hayes => [1, 2, 3, 4, 1, 2, 3, 4, 1, 2],
        taft  => [2, 3, 2, 3, 2, 3, 2, 3, 2, 3],
        polk  => [4, 4, 4, 4, 4, 2, 2, 2, 2, 2],
    );
    return find_best_candidates(\@voter_answers, \%candidates);
}

sub test2 {
    my @voter_answers = (2, 2, 2, 3, 4, 2, 2, 2, 3, 4);
    my %candidates = (
        taylor => [4, 4, 4, 1, 2, 3, 3, 3, 1, 1],
        wilson => [1, 1, 1, 2, 3, 1, 1, 1, 2, 4],
        monroe => [3, 3, 3, 3, 3, 3, 3, 3, 3, 3],
    );
    return find_best_candidates(\@voter_answers, \%candidates);
}

sub test3 {
    my @voter_answers = (2, 2, 2, 3, 4, 2, 2, 2, 3, 4);
    my %candidates = (
        taylor => [4, 4, 4, 1, 2, 3, 3, 3, 1, 1],
        monroe => [3, 3, 3, 3, 3, 3, 3, 3, 3, 3],
        wilson => [1, 1, 1, 2, 3, 1, 1, 1, 2, 4],
    );
    return find_best_candidates(\@voter_answers, \%candidates);
}

sub test4 {
    my @voter_answers = (2, 2, 2, 2, 2, 2, 2, 2, 2, 2);
    my %candidates = (
        harding   => [4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
        buchanan  => [3, 3, 3, 3, 3, 3, 3, 3, 3, 3],
        fillmore  => [3, 4, 3, 4, 3, 4, 3, 4, 3, 4],
    );
    return find_best_candidates(\@voter_answers, \%candidates);
}

my @result1 = test1();
my @result2 = test2();
my @result3 = test3();
my @result4 = test4();
print "Test 1: @result1\n";
print "Test 2: @result2\n";
print "Test 3: @result3\n";
print "Test 4: @result4\n";

