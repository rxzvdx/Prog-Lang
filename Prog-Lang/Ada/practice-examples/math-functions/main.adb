with Ada.Text_IO; use Ada.Text_IO;
with Math_Functions; use Math_Functions;

procedure Main is
begin
    Put_Line("Square root of 16: " & Float'Image(Sqrt(16.0)));
    Put_Line("Exponent of 2 raised to 3: " & Float'Image(Exp(2.0, 3.0)));
end Main;

