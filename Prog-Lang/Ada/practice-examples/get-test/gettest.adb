with Ada.Text_IO; use Ada.Text_IO;
procedure Gettest is
	I : Integer := 0;
	C : Character;
begin
	loop
		I := I + 1;
		if End_Of_Line then
			Put_Line("*");
			Skip_Line;
		else
			Get (C);
			Put (C);
		end if;
	end loop;
exception
	when End_Error =>
		Put_Line ("end_error");
end Gettest;
