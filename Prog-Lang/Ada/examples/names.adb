-- Read a person's name and print a variation of the name
-- Illustrates unbounded strings

-- Import necessary Ada packages for input and output
with Ada.Text_IO, Ada.Integer_Text_IO,
     Ada.Strings.Unbounded, Ada.Text_IO.Unbounded_IO;
use Ada.Text_IO, Ada.Integer_Text_IO,
     Ada.Strings.Unbounded, Ada.Text_IO.Unbounded_IO;

-- Define the main procedure named Names
procedure Names is
   -- Declare unbounded string variables to hold the name and title
   First_Name: Unbounded_String;
   Last_Name: Unbounded_String;
   Title: Unbounded_String;
   -- Declare an integer variable to hold the favorite number
   Favorite_number: Integer;

begin
   -- Prompt the user to enter their first name and read it into the variable
   Put("What is your first name?  ");
   Get_Line(First_Name);
   -- Prompt the user to enter their last name and read it into the variable
   Put("What is your last name?  ");
   Get_Line(Last_Name);
   -- Prompt the user to enter their favorite number and read it into the variable
   Put("What is your favorite number?  ");
   Get(Favorite_number);
   -- Skip the newline character after the number before reading the next string
   Skip_Line;
   -- Prompt the user to enter their title and read it into the variable
   Put("What is your title?  ");
   Get_Line(Title);

   -- Print a greeting message using the entered information
   Put("Hello, ");
   Put(Title);
   Put(" ");
   Put(Last_Name);
   Put("! ");
   Put(Favorite_number, Width => 1);  -- Display the favorite number
   Put_Line(" is a great favorite number.");
end Names;

