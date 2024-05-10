-- Ada sample program
-- N. L. Tinkham

-- Import necessary Ada packages for input and output
with Ada.Text_IO, Ada.Float_Text_IO, Ada.Numerics.Elementary_Functions;
use Ada.Text_IO, Ada.Float_Text_IO, Ada.Numerics.Elementary_Functions;

-- Define a procedure named Quadratic
procedure Quadratic is
   -- Declare variables
   Discriminant: Float;  -- Store the discriminant of the quadratic equation
   A, B, C: Float;        -- Coefficients of the quadratic equation
begin
   -- Prompt the user to enter the coefficients of the quadratic equation
   Put_Line("Enter the coefficients of A x**2 + B x + C = 0:");
   -- Read the value of coefficient A from the user
   Put("A: ");
   Get(A);
   -- Read the value of coefficient B from the user
   Put("B: ");
   Get(B);
   -- Read the value of coefficient C from the user
   Put("C: ");
   Get(C);

   -- Calculate the discriminant
   Discriminant := B ** 2 - 4.0 * A * C;

   -- Determine the number and nature of roots based on the discriminant
   if Discriminant < 0.0 then
      -- If discriminant is negative, there are no real roots
      Put_Line("There are no real roots.");
   elsif Discriminant = 0.0 then
      -- If discriminant is zero, there is one real root
      Put("The root is ");
      -- Calculate and print the single root
      Put(-B / (2.0 * A), Exp => 0);
      Put(".");
      New_Line;
   else
      -- If discriminant is positive, there are two real roots
      Put("The roots are ");
      -- Calculate and print the first root
      Put((-B + Sqrt(Discriminant)) / (2.0 * A), Exp => 0);
      Put(" and ");
      -- Calculate and print the second root
      Put((-B - Sqrt(Discriminant)) / (2.0 * A), Exp => 0);
      Put(".");
      New_Line;
   end if;
end Quadratic;

