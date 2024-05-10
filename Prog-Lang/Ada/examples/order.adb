-- Ada sample program
-- N. L. Tinkham

-- Import necessary Ada packages for input and output
with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

-- Define a procedure named Order
procedure Order is
   -- Declare a constant for the number of integers to be sorted
   Last_Index: constant Integer := 10;
   -- Define a subtype for array indices
   subtype Numarray_Index is Integer range 1..Last_Index;
   -- Define an array type to store the integers
   type Numarray is array(Numarray_Index) of Integer;
   -- Declare an array to store the integers
   A: Numarray;

   -- Define a procedure to perform selection sort on the array
   procedure Selection_Sort(A: in out Numarray) is
      Index_Biggest: Numarray_Index;  -- Index of the biggest element

      -- Define a procedure to swap two elements in the array
      procedure Swap(A: in out Numarray; Index1, Index2: in Numarray_Index) is
         Temp: Integer;  -- Temporary variable to hold the value being swapped
      begin
         Temp := A(Index1);
         A(Index1) := A(Index2);
         A(Index2) := Temp;
      end Swap;

      -- Define a function to find the index of the largest element in the array
      function Array_Max(A: in Numarray; Highest_Index: in Numarray_Index) return Numarray_Index is
         Loc_Biggest: Numarray_Index;  -- Index of the largest element found so far
      begin
         Loc_Biggest := 1;
         for Current in 2..Highest_Index loop
            if A(Current) > A(Loc_Biggest) then
               Loc_Biggest := Current;
            end if;
         end loop;
         return Loc_Biggest;
      end Array_Max;

   begin -- Selection_Sort
      -- Iterate over the unsorted part of the array
      for Last_Unsorted in reverse 2..A'last loop
         -- Find the index of the largest element in the unsorted part
         Index_Biggest := Array_Max(A, Last_Unsorted);
         -- Swap the largest element with the last unsorted element
         Swap(A, Index_Biggest, Last_Unsorted);
      end loop;
   end Selection_Sort;

   -- Define a procedure to read a valid integer from the user
   procedure Get_Number(Num: out Integer) is
   begin
      Get(Num);
   exception
      -- Handle exceptions for invalid input numbers
      when Data_Error | Constraint_Error =>
         Skip_Line;  -- Skip any remaining characters on the line
         Put("Error: Invalid number. Please re-enter the number.");
         Get_Number(Num);  -- Recursively call to re-read the number
   end Get_Number;

begin
   -- Prompt the user to enter the numbers to be sorted
   Put("Enter ");
   Put(Item => Last_Index, Width => 0);   -- Display the number of items to be entered
   Put(" Numbers: ");
   New_Line;
   -- Read and store the numbers in the array
   for I in Numarray_Index loop
      Get_Number(A(I));
   end loop;
   -- Sort the array using selection sort
   Selection_Sort(A);
   -- Display the sorted list of numbers
   New_Line;
   Put("Sorted list of numbers:");
   New_Line;
   for I in Numarray_Index loop
      Put(A(I));
      New_Line;
   end loop;
end Order;

