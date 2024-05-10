with Ada.Text_IO; use Ada.text_IO;
with Ada.Exceptions; use Ada.Exceptions;
procedure Exceptions is 
	E : exception;
	
	procedure Q is
	begin 
		raise E;
	end Q;
	
	procedure P is
	begin 
		Q;
	exception
		when E =>
			Put_Line ("caught E in P");
			raise Program_Error;
		when X : others =>
			Put_Line ("caught " & Exception_Name (X) & "P");
	end P;
begin
	p;
exception
	when Program_Error =>
		Put_Line ("caught Program_Error in main procedure");
	when X : others
	       	=> Put_Line ("caught " & Exception_Name (X)
		& " in main procedure");
end Exceptions;	
