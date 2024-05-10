-- Program: Candidate Matching
-- Purpose: Compare the opinions of a voter to a group of political candidates and find the candidates who best match the voter's opinions.
-- Input:   Voter's answers to 10 multiple-choice questions, followed by the number of candidates and each candidate's name and answers.
-- Output:  Names of the candidate(s) with the highest agreement score with the voter.
-- Note:    The agreement score is computed based on matching answers and certain answer patterns.
-- SOURCES:
-- names.adb                    by: Prof. Tinkham
-- count_Vowels.adb             by: Prof. Tinkham
-- adacore documentation:       https://learn.adacore.com/courses/Ada_For_The_CPP_Java_Developer/chapters/04_Statements_Declarations_and_Control_Structures.html

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure best_candidates is
    -- Define an array type for storing the voter's answers
    type Numarray is array(1..10) of Integer;
    -- Define a record type for storing candidate information
    type CandRecord is record
        CandName: String(1..80);        -- Candidate's name
        CandAnswers: Numarray;          -- Candidate's answers
        AgreementScore: Integer := 0;   -- Candidate's agreement score
    end record;
    -- Define an array type for storing candidate records
    type CandArray is array(1..50) of CandRecord;

    -- Declare variables to store voter answers, number of candidates, and candidate data
    VoterAnswers: Numarray;
    NumCandidates: Integer;
    Candidates: CandArray;

    -- Procedure to compute the agreement score between voter and candidate answers
    procedure ComputeAgreementScore(VoterAnswers: Numarray; CandidateAnswers: Numarray; Score: out Integer) is
        AgreementScore: Integer := 0;
    begin
        for I in VoterAnswers'Range loop
            -- If voter and candidate gave the same answer, add 10 to the agreement score
            if VoterAnswers(I) = CandidateAnswers(I) then
                AgreementScore := AgreementScore + 10;
            -- If both gave answers in the set {1, 2} or {3, 4}, add 5 to the agreement score
            elsif (VoterAnswers(I) in 1 | 2) and (CandidateAnswers(I) in 1 | 2) then
                AgreementScore := AgreementScore + 5;
            elsif (VoterAnswers(I) in 3 | 4) and (CandidateAnswers(I) in 3 | 4) then
                AgreementScore := AgreementScore + 5;
            end if;
        end loop;
        Score := AgreementScore;
    end ComputeAgreementScore;

    -- Variables to store the maximum agreement score and best candidate(s)
    MaxScore: Integer := 0;
    BestCandidates: CandArray;
    NumBestCandidates: Integer := 0;

begin
    -- Read voter answers
    for I in VoterAnswers'Range loop
        Get(VoterAnswers(I));
    end loop;

    -- Read number of candidates
    Get(NumCandidates);
    Skip_Line; -- Skip the end of line after reading NumCandidates

    -- Read candidate data
    for Cand in 1..NumCandidates loop
        declare
            -- Calculate the last index of the candidate name string
            Last_Index : Natural := Candidates(Cand).CandName'First + Candidates(Cand).CandName'Length - 1;
        begin
            -- Read candidate name
            Get_Line(Candidates(Cand).CandName, Last => Last_Index);
            -- Read candidate answers
            for I in 1..10 loop
                Get(Candidates(Cand).CandAnswers(I));
            end loop;
            -- Move Skip_Line here to skip the newline after reading the candidate's answers
            Skip_Line;
        end;
    end loop;

    -- Compute agreement scores for each candidate
    for Cand in 1..NumCandidates loop
        ComputeAgreementScore(VoterAnswers, Candidates(Cand).CandAnswers, Candidates(Cand).AgreementScore);
        -- Update best candidate(s) if a candidate has a higher agreement score
        if Candidates(Cand).AgreementScore > MaxScore then
            MaxScore := Candidates(Cand).AgreementScore;
            NumBestCandidates := 1;
            BestCandidates(1) := Candidates(Cand);
        -- Add candidate to the list of best candidates if they tie for highest score
        elsif Candidates(Cand).AgreementScore = MaxScore then
            NumBestCandidates := NumBestCandidates + 1;
            BestCandidates(NumBestCandidates) := Candidates(Cand);
        end if;
    end loop;

    -- Output best candidate(s)
    for Cand in 1..NumBestCandidates loop
        Put_Line(BestCandidates(Cand).CandName);
    end loop;
end best_candidates;

