-- Antonio Rosado
-- Sources: Fibonnaci.adb, Quadratic.adb, Geometry.adb by Nancy Tinkham

with Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO;

procedure Harmonic is
    N: Integer;                             							-- Declare N as an Integer variable
    Sum: Float := 0.0;                      							-- Initialize Sum to 0.0
begin
    Put("Enter a positive integer N: ");   							-- Display a prompt
    Get(N);                                 							-- Read an integer from the user

    if N <= 0 then                         							-- Check if N is not positive
        Put_Line("Error: N must be a positive integer."); 					-- Display error message
    else
        for I in 1..N loop                  							-- Loop from 1 to N
            if I mod 2 = 0 then             							-- Check if I is even
                Sum := Sum - 1.0 / Float(I); 							-- Subtract 1/I from Sum
            else
                Sum := Sum + 1.0 / Float(I); 							-- Add 1/I to Sum
            end if;
        end loop;

        Put("The sum of the first ");       							-- Display part of the output message
        Put(N, Width => 0);                	 						-- Display the value of N
        Put(" terms of the alternating harmonic series is: "); 
												-- Display part of the output message
        Put(Sum, Fore => 0, Aft => 5, Exp => 0); 
												-- Display Sum with 5 decimal places
        New_Line;                           							-- Move to the next line
    end if;
end Harmonic;

