-- Antonio Rosado
-- Sources: Fibonnaci.adb, Quadratic.adb, Geometry.adb by Nancy Tinkham
with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Number_Score is
   N: Integer;                             	-- Declare N as an Integer variable
   Score: Integer := 0;                    	-- Initialize Score to 0
begin
   Put("Enter an integer: ");             	-- Display a prompt
   Get(N);                                	-- Read an integer from the user

   if N mod 2 = 0 then                    	-- Check if N is even
      Score := Score + 5;                  	-- Add 5 to Score if N is even
   else
      Score := Score + 1;                  	-- Add 1 to Score if N is odd
   end if;

   if N < 0 then                          	-- Check if N is negative
      Score := Score + 2;                  	-- Add 2 to Score if N is negative
   end if;

   if N > 100 then                        	-- Check if N is greater than 100
      Score := Score + 10;                 	-- Add 10 to Score if N is greater than 100
   end if;

   Put_Line("The score for " & Integer'Image(N) & " is: " & Integer'Image(Score)); -- Display the computed score
end Number_Score;

