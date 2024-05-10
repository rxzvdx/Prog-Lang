-- file: math_functions.adb
package body Math_Functions is
	Epsilon : constant := 1.0e-6;

	function Sqrt (X: Float) return Float is
		Result : Float := X / 2.0;
	begin
		while abs (Result * Result - X) > Epsilon loop
			Result := 0.5 * (X / Result + Result);
		end loop;
		return Result;
	end Sqrt;

	function Exp (Base : Float; Exponent : Float) return Float is 
	begin 
		-- need implementation code here
		return 1.0;
	end Exp;

end Math_Functions;
