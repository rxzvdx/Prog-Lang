-- Ada sample program
-- N. L. Tinkham

-- Import necessary Ada packages for input and output
with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

-- Define a procedure named Fibonacci
procedure Fibonacci is
   -- Declare variables
   Max_Value: Integer;  -- Store the maximum value for the Fibonacci sequence
   Previous: Integer;   -- Store the previous number in the Fibonacci sequence
   Current: Integer;    -- Store the current number in the Fibonacci sequence
   Next: Integer;       -- Store the next number in the Fibonacci sequence
begin
   -- Read a positive integer for Max_Value;
   -- repeat if user enters 0 or a negative number,
   -- until a positive number is entered.
   loop
      -- Prompt the user to enter the ending value for Fibonacci numbers
      Put("Ending value for Fibonacci numbers: ");
      -- Read the value entered by the user into Max_Value
      Get(Max_Value);
      -- Exit the loop if Max_Value is greater than or equal to 1
      exit when Max_Value >= 1;
      -- Print a message asking the user to enter a positive number
      Put_Line("Please enter a positive number.");
   end loop;

   -- Calculate and print Fibonacci sequence values

   -- Initialize Previous and Current to start the sequence
   Previous := 1;
   Current := 1;
   -- Print the first number in the Fibonacci sequence
   Put(Previous);
   New_Line;
   -- Loop to calculate and print Fibonacci numbers until Current exceeds Max_Value
   while Current <= Max_Value loop
      -- Print the current Fibonacci number
      Put(Current);
      New_Line;
      -- Calculate the next Fibonacci number
      Next := Previous + Current;
      -- Update Previous and Current for the next iteration
      Previous := Current;
      Current := Next;
   end loop;
end Fibonacci;

