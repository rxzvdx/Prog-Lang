-- Ada sample program
-- N. L. Tinkham

-- Import necessary Ada packages for input and output
with Ada.Text_IO, Ada.Float_Text_IO, Ada.Numerics;
use Ada.Text_IO, Ada.Float_Text_IO, Ada.Numerics;

-- Define a procedure named Geometry
procedure Geometry is
   Option: Character;  -- Store the user's menu option

   -- Define a procedure to calculate the area of a triangle
   procedure Triangle_Area is
      Base, Height: Float;  -- Store the base and height of the triangle
   begin
      -- Prompt the user to enter the base of the triangle
      Put("Base: ");
      Get(Base);
      -- Prompt the user to enter the height of the triangle
      Put("Height: ");
      Get(Height);
      -- Calculate and print the area of the triangle
      Put("Area: ");
      Put(Base * Height / 2.0, Fore => 0, Aft => 1, Exp => 0);
      New_Line;
   exception
      -- Handle exceptions for invalid input numbers
      when Data_Error | Constraint_Error =>
         Skip_Line;  -- Flush any remaining input characters
         Put_Line("Error: Invalid input number");
   end Triangle_Area;

   -- Define a procedure to calculate the area of a rectangle
   procedure Rectangle_Area is
      Length, Width: Float;  -- Store the length and width of the rectangle
   begin
      -- Prompt the user to enter the length of the rectangle
      Put("Length: ");
      Get(Length);
      -- Prompt the user to enter the width of the rectangle
      Put("Width: ");
      Get(Width);
      -- Calculate and print the area of the rectangle
      Put("Area: ");
      Put(Length * Width, Fore => 0, Aft => 1, Exp => 0);
      New_Line;
   exception
      -- Handle exceptions for invalid input numbers
      when Data_Error | Constraint_Error =>
         Skip_Line;  -- Flush any remaining input characters
         Put_Line("Error: Invalid input number");
   end Rectangle_Area;

   -- Define a procedure to calculate the area of a circle
   procedure Circle_Area is
      Radius: Float;  -- Store the radius of the circle
   begin
      -- Prompt the user to enter the radius of the circle
      Put("Radius: ");
      Get(Radius);
      -- Calculate and print the area of the circle
      Put("Area: ");
      Put(Pi * Radius ** 2, Fore => 0, Aft => 1, Exp => 0);
      New_Line;
   exception
      -- Handle exceptions for invalid input numbers
      when Data_Error | Constraint_Error =>
         Skip_Line;  -- Flush any remaining input characters
         Put_Line("Error: Invalid input number");
   end Circle_Area;

begin -- Geometry
   -- Main loop to display menu options and perform calculations
   loop
      -- Display menu options
      Put_Line("T: Triangle Area");
      Put_Line("R: Rectangle Area");
      Put_Line("C: Circle Area");
      Put_Line("Q: Quit");
      Put("Option: ");
      Get(Option);
      Skip_Line;  -- In case the user enters extra characters
      -- Exit loop if the user chooses to quit
      exit when Option = 'Q' or Option = 'q';
      -- Perform actions based on the user's menu choice
      case Option is
         when 'T' | 't' => Triangle_Area;
         when 'R' | 'r' => Rectangle_Area;
         when 'C' | 'c' => Circle_Area;
         when 'Q' | 'q' => null;  -- Do nothing for quit option
         when others => Put_Line("Invalid option");
      end case;
      New_Line;  -- Print extra blank line before redisplaying menu
   end loop;
end Geometry;

