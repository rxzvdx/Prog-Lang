-- Find the most common vowel in a line of input
-- Case-insensitive: 'a' and 'A' both count as 'A'
-- Illustrates arrays of records
-- N. L. Tinkham

-- Import necessary Ada packages for input and output
with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

-- Define the main procedure named Count_vowels
procedure Count_vowels is
   -- Define a constant for the number of vowels
   Num_Vowels: constant Integer := 5;
   -- Define a record type to store a vowel and its count
   type Vowel_and_Count is record
      Vowel: Character;
      Count: Integer;
   end record;
   -- Define an array type to store the vowel records
   type VC_List is array (1..Num_Vowels) of Vowel_and_Count;
   -- Declare an array to hold the vowel counts
   VCount: VC_List;
   -- Declare a variable to read each letter from the input
   Letter: Character;
   -- Declare variables to store the most common vowel and its count
   Most_Common_Vowel: Character;
   Most_Common_Count: Integer;

begin
   -- Initialize the vowel counts to 0
   for I in 1..Num_Vowels loop
      VCount(I).Count := 0;
   end loop;
   -- Initialize the vowels and their positions in the array
   VCount(1).Vowel := 'A';
   VCount(2).Vowel := 'E';
   VCount(3).Vowel := 'I';
   VCount(4).Vowel := 'O';
   VCount(5).Vowel := 'U';

   -- Read a line of text and count the vowels
   Put_Line("Enter a line of text:");
   while not End_of_Line loop
      get(Letter);
      -- Convert lowercase vowels to uppercase for counting
      case Letter is
         when 'a' | 'A' =>
            VCount(1).Count := VCount(1).Count + 1;
         when 'e' | 'E' =>
            VCount(2).Count := VCount(2).Count + 1;
         when 'i' | 'I' =>
            VCount(3).Count := VCount(3).Count + 1;
         when 'o' | 'O' =>
            VCount(4).Count := VCount(4).Count + 1;
         when 'u' | 'U' =>
            VCount(5).Count := VCount(5).Count + 1;
         when others => null;  -- Have to handle all cases
      end case;
   end loop;

   -- Find the most commonly occurring vowel(s)
   Most_Common_Vowel := VCount(1).Vowel;
   Most_Common_Count := VCount(1).Count;
   for I in 2..Num_Vowels loop
      if VCount(I).Count > Most_Common_Count then
         Most_Common_Count := VCount(I).Count;
         Most_Common_Vowel := VCount(I).Vowel;
      end if;
   end loop;

   -- Print the most common vowel(s)
   Put_Line("Most common vowel(s):");
   for I in 1..Num_Vowels loop
      if VCount(I).Count = Most_Common_Count then
         Put(VCount(I).Vowel);
         New_Line;
      end if;
   end loop;
end Count_vowels;

